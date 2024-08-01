from __future__ import annotations

from collections.abc import Iterator
from decimal import Decimal
from typing import Any

from django.conf import settings

from catproduto.models import Produto


class Carrinho:
    def __init__(self, request) -> None:
        """Inicializa o carrinho de compras."""
        self.session = request.session
        carrinho = self.session.get(settings.CART_SESSION_ID)
        if not carrinho:
            # Salva um carrinho vazio na sessão
            carrinho = self.session[settings.CART_SESSION_ID] = {}
        self.carrinho = carrinho

    def add_produto(self, produto: Produto, quantidade: int = 1, atualiza_quantidade: bool = False) -> None:
        """Adiciona um produto ao carrinho e atualiza.

        :param produto: O produto a ser adicionado ao carrinho
        :param quantidade: A quantidade do produto a ser adicionada
        :param atualiza_quantidade: Se True, a quantidade do produto será atualizada
        :return: None
        """

        id_produto = str(produto.id)
        if id_produto not in self.carrinho:
            self.carrinho[id_produto] = {'quantidade': 0, 'preco': str(produto.preco)}
        if atualiza_quantidade:
            self.carrinho[id_produto]['quantidade'] = quantidade
        else:
            self.carrinho[id_produto]['quantidade'] += quantidade
        self._salvar()

    def _salvar(self) -> None:
        self.session.modified = True

    def remover_produto(self, produto: Produto) -> None:
        """Remove um produto do carrinho.

        :param produto: O produto a ser removido do carrinho
        :return: None
        """
        id_produto = str(produto.id)
        if id_produto in self.carrinho:
            del self.carrinho[id_produto]
            self._salvar()

    def __iter__(self) -> Iterator[Any]:
        """Itera sobre os itens do carrinho e obtém os produtos do banco de dados.

        :return: None
        """
        ids_produtos = self.carrinho.keys()
        produtos = Produto.objects.filter(id__in=ids_produtos)
        carrinho = self.carrinho.copy()
        for produto in produtos:
            carrinho[str(produto.id)]['produto'] = produto
        for item in carrinho.values():
            item['preco'] = Decimal(item['preco'])
            item['preco_total'] = item['preco'] * item['quantidade']
            yield item

    def __len__(self) -> int:
        """Retorna a quantidade de itens no carrinho.

        :return: quantidade de itens no carrinho
        """
        return sum(item['quantidade'] for item in self.carrinho.values())

    def get_preco_total(self) -> float:
        """Retorna o preço total do carrinho.

        :return: preço total do carrinho
        """
        return sum(Decimal(item['preco']) * item['quantidade'] for item in self.carrinho.values())

    def limpar(self) -> None:
        """Remove todos os itens do carrinho.

        :return: None
        """
        del self.session[settings.CART_SESSION_ID]
        self._salvar()
