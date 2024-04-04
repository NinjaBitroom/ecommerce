from django.views.generic import ListView, TemplateView, DetailView

from catproduto.models import Categoria, Produto


class IndexView(TemplateView):
    template_name = 'index.html'


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

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        categorias = Categoria.objects.all()
        context['categorias'] = categorias
        return context


class ProdutoDetailView(DetailView):
    model = Produto
    context_object_name = 'produto'
    template_name = 'produtos/produto.html'
