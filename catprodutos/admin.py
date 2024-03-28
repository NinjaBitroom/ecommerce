from django.contrib import admin
from . import models


@admin.register(models.Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nome', 'slug')
    prepopulated_fields = {'slug': ('nome',)}


@admin.register(models.Produto)
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ('nome', 'slug', 'preco', 'disponivel', 'criado', 'atualizado')
    list_filter = ('disponivel', 'criado', 'atualizado')
    prepopulated_fields = {'slug': ('nome',)}
    list_editable = ('preco', 'disponivel')
