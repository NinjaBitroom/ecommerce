from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views.generic import FormView, TemplateView, View

from carrinho.carrinho import Carrinho
from carrinho.forms import CarrinhoAddProdutoForm
from catproduto.models import Produto


class CarrinhoAddFormView(FormView):
    form_class = CarrinhoAddProdutoForm
    success_url = reverse_lazy('carrinhodetalhe')
    produto: Produto

    def post(self, request, *args, **kwargs):
        self.produto = Produto.objects.get(id=self.kwargs['idprod'])
        return super().post(request, *args, **kwargs)

    def form_valid(self, form):
        cd = form.cleaned_data
        carrinho = Carrinho(self.request)
        carrinho.add_produto(
            produto=self.produto, quantidade=cd['quant'],
            atualiza_quantidade=cd['alterar']
        )
        return super().form_valid(form)

    def form_invalid(self, form):
        return super().form_invalid(form)


class CarrinhoRemoveView(View):
    produto: Produto

    def post(self, request, *args, **kwargs):
        self.produto = Produto.objects.get(id=self.kwargs['idprod'])
        carrinho = Carrinho(request)
        carrinho.remover_produto(self.produto)
        return redirect('carrinhodetalhe')


class CarrinhoDetalheTemplateView(TemplateView):
    template_name = 'carrinho/detalhe.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        carrinho = Carrinho(self.request)
        for item in carrinho:
            item['alterar'] = CarrinhoAddProdutoForm(
                initial={'quant': item['quantidade'], 'alterar': True}
            )
        context['carrinho'] = carrinho
        return context
