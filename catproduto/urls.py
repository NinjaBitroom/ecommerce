from django.urls import path

from catproduto import views

urlpatterns = [
    path('', views.IndexView.as_view(), name='home'),
    path('categorias/', views.CategoriaListView.as_view(), name='categorias'),
    path('<slug:slug>/produtos', views.ProdutoListView.as_view(), name='listarprodutos'),
]
