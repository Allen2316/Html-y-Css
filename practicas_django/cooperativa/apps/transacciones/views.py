from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group, User
from apps.modelo.models import Cliente, Cuenta, Transaccion
from django.db.models import Q


@login_required
def index(request):

    usuario = request.user
    if usuario.groups.filter(name="transacciones").exists():
        listaClientes = Cuenta.objects.all()
        #busqueda = request.POST.get("busqueda")
        """ if busqueda:
            listaClientes = Cliente.objects.filter(
                Q(nombres__icontains=busqueda) |
                Q(apellidos__icontains=busqueda) |
                Q(cedula=busqueda)
            ).distinct() """

        return render(request, 'cuentas/index_transacciones.html', locals())
    else:
        return render(request, "login/forbidden.html", locals())
