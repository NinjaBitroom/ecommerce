from django import forms

PRODUTO_QUANTIDADE_CHOICES = [(i, str(i)) for i in range(1, 21)]


class CarrinhoAddProdutoForm(forms.Form):
    quant = forms.TypedChoiceField(choices=PRODUTO_QUANTIDADE_CHOICES, coerce=int)
    alterar = forms.BooleanField(required=False, initial=False, widget=forms.HiddenInput)
