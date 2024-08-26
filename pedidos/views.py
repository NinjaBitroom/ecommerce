from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect
from django.views.generic import CreateView, DetailView, ListView, UpdateView

from carrinho.carrinho import Carrinho
from pedidos.forms import PedidoModelForm
from pedidos.models import ItemPedido, Pedido


class PedidoCreateView(LoginRequiredMixin, CreateView):
    form_class = PedidoModelForm
    template_name = 'pedido/formpedido.html'

    def form_valid(self, form):
        car = Carrinho(self.request)
        pedido = form.save(commit=False)
        usuario = self.request.user
        pedido.cliente = usuario
        pedido.save()
        for item in car:
            ItemPedido.objects.create(
                pedido=pedido, produto=item['produto'], preco=item['preco'],
                quantidade=item['quantidade']
            )
        car.limpar()
        return redirect('resumopedido', pk=pedido.id)


class ResumoPedidoTemplateView(LoginRequiredMixin, DetailView):
    template_name = 'pedido/resumopedido.html'
    model = Pedido
    context_object_name = 'pedido'


class ListarPedidosListView(LoginRequiredMixin, ListView):
    model = Pedido
    template_name = 'pedido/listarpedidos.html'
    context_object_name = 'pedidos'

    def get_queryset(self):
        return Pedido.objects.filter(cliente=self.request.user)


class EfetuarPagamentoView(LoginRequiredMixin, UpdateView):
    def post(self, request, *args, **kwargs):
        pedido = Pedido.objects.get(pk=kwargs['pk'])
        pedido.pago = True
        pedido.save()
        return redirect('listarpedidos')
