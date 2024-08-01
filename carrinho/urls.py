from django.urls import path

from carrinho import views

urlpatterns = [
    path('', views.CarrinhoDetalheTemplateView.as_view(), name='carrinhodetalhe'),
    path('add/<str:idprod>', views.CarrinhoAddFormView.as_view(), name='carrinhoadd'),
    path('remove', views.CarrinhoRemoveView.as_view(), name='carrinhoremove'),
]
