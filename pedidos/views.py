from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView, TemplateView

from carrinho.carrinho import Carrinho
from pedidos.forms import PedidoModelForm
from pedidos.models import ItemPedido, Pedido


class PedidoCreateView(CreateView):
    form_class = PedidoModelForm
    success_url = reverse_lazy('resumopedido')
    template_name = 'pedido/formpedido.html'

    def form_valid(self, form):
        car = Carrinho(self.request)
        pedido = form.save()
        for item in car:
            ItemPedido.objects.create(
                pedido=pedido, produto=item['produto'], preco=item['preco'],
                quantidade=item['quantidade']
            )
        car.limpar()
        self.request.session['id_pedido'] = pedido.id
        return redirect('resumopedido')


class ResumoPedidoTemplateView(TemplateView):
    template_name = 'pedido/resumopedido.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        id_pedido = self.request.session.get('id_pedido')
        context['pedido'] = Pedido.objects.get(id=id_pedido)
        return context
