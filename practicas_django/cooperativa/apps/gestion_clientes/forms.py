from django import forms
from apps.modelo.models import Cliente, Cuenta


class FormularioCliente(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ["cedula", "apellidos", "nombres",
                  "genero", "estadoCivil", "correo", "telefono"]

class FormularioCuenta(forms.ModelForm):

    class Meta:
        model = Cuenta
        fields = ["numero", "tipoCuenta", "saldo"]
