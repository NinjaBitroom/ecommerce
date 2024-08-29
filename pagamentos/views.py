from typing import Any

import braintree
from django.conf import settings
from django.views.generic import FormView, TemplateView

from pagamentos.forms import CheckoutForm
from pedidos.models import Pedido


class ProcessarPaagamentoFormView(FormView):
    braintree_client_token: Any
    form_class = CheckoutForm
    template_name = "pagamento/processar.html"

    def dispatch(self, request, *args, **kwargs):
        braintree_env = braintree.Environment.Sandbox

        # Configurações do BrainTree
        braintree.Configuration.configure(
            braintree_env,
            merchant_id=settings.BRAINTREE_MERCHANT_ID,
            public_key=settings.BRAINTREE_PUBLIC_KEY,
            private_key=settings.BRAINTREE_PRIVATE_KEY,
        )

        # Gerando um token para o cliente, para enviá-lo ao formulário
        # para gerar o payment_nonce
        self.braintree_client_token = braintree.ClientToken.generate({})
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs) -> dict[str, Any]:
        cont = super().get_context_data(**kwargs)
        cont["braintree_client_token"] = self.braintree_client_token
        return cont

    def form_valid(self, form):
        id_pedido = self.request.session.get("id_pedido")
        pedido = Pedido.objects.get(id=id_pedido)
        result = braintree.Transaction.sale(
            {
                "amount": pedido.get_total(),
                "payment_method_nonce": form.cleaned_data["payment_method_nonce"],
                "options": {"submit_for_settlement": True},
            }
        )
        if not result.is_success:
            context = self.get_context_data()
            context["form"] = self.get_form_class()
            context["braintree_error"] = (
                "Pagamento não processado. Por favor, verifique os "
                "dados e tente novamente."
            )
            return self.render_to_response(context)
        transaction_id = result.transaction.id
        pedido.braintree_id = transaction_id
        pedido.pago = True
        pedido.save()
        return super().form_valid(form)

    def get_success_url(self):
        return reversed("pagrealizado")


class PagRealizado(TemplateView):
    template_name = "pagamento/realizado.html"


class PagCancelado(TemplateView):
    template_name = "pagamento/cancelado.html"
