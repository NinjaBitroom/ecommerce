from django.urls import path

from catproduto import views

urlpatterns = [
    path('', views.IndexView.as_view(), name='home'),
    path('produtos/', views.ProdutoListView.as_view(), name='listartodosprodutos'),
    path('produtos/<slug:slug>', views.ProdutoListView.as_view(), name='listarprodutos'),
]
