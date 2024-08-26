from django.urls import path

from pedidos import views

urlpatterns = [
    path(
        'listar/', views.ListarPedidosListView.as_view(), name='listarpedidos'
    ),
    path('add/', views.PedidoCreateView.as_view(), name='addpedido'),
    path(
        'resumo/<int:pk>', views.ResumoPedidoTemplateView.as_view(),
        name='resumopedido'
    ),
    path(
        'pagar/<int:pk>', views.EfetuarPagamentoView.as_view(),
        name='pagarpedido'
    ),
]
