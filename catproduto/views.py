from django.views.generic import ListView, TemplateView

from catproduto.models import Categoria, Produto


class IndexView(TemplateView):
    template_name = 'index.html'


class CategoriaListView(ListView):
    model = Categoria
    template_name = 'produtos/categorias.html'
    context_object_name = 'categorias'


class ProdutoListView(ListView):
    model = Produto
    context_object_name = 'produtos'
    template_name = 'produtos/produtos.html'
    queryset = Produto.disponiveis.all()

    def get_queryset(self):
        qs = super().get_queryset()
        slugcat = self.kwargs.get('slug')
        if slugcat:
            cat = Categoria.objects.get(slug=slugcat)
            qs = qs.filter(categoria=cat)
        return qs
