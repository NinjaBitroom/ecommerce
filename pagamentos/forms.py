from typing import Any

from django import forms


class CheckoutForm(forms.Form):
    cleaned_data: dict[Any, Any]
    payment_method_nonce = forms.CharField(
        max_length=1500, widget=forms.HiddenInput(), required=False
    )

    def clean(self) -> dict[Any, Any]:
        self.cleaned_data = super().clean()
        if not self.cleaned_data.get("payment_method_nonce"):
            raise forms.ValidationError(
                "Por favor, preencha o formulário de pagamento."
            )
        return self.cleaned_data
