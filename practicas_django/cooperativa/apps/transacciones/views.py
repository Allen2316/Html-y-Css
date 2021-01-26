from django.shortcuts import render
from django.shortcuts import render, redirect
from apps.modelo.models import Cliente, Cuenta
from django.contrib.auth.models import Group, User
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from apps.modelo.models import Cliente, Cuenta, Transaccion
from .forms import FormularioTransaccion


@login_required
def index(request):
    usuario = request.user
    if usuario.groups.filter(name="transacciones").exists():
        listaCuentas = Cuenta.objects.all()
        return render(request, 'cuentas/cuentas_totales.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())


    
@login_required
def getCuentaPorCliente(request, numero):
    usuario = request.user
    if usuario.groups.filter(name="transacciones").exists():
        cuenta = Cuenta.objects.get(numero=numero)
        transacciones = Transaccion.objects.filter(cuenta_id=cuenta.cuenta_id)                

        if cuenta:
            cliente = Cliente.objects.get(cedula=cuenta.cliente)

        return render(request, 'transacciones/cuenta_cliente.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())

    listaClientes = Cliente.objects.all()
    return render(request, '/', locals())


@login_required
def depositar(request, numero):
    usuario = request.user
    if usuario.groups.filter(name="transacciones").exists():
        formulario = FormularioTransaccion()
        cuenta = Cuenta.objects.get(numero=numero)
        if request.method == 'POST':
            transaccion = Transaccion()
            transaccion.tipo = 'deposito'
            transaccion.valor = float(request.POST.get('valor'))
            transaccion.descripcion = request.POST.get('descripcion')
            transaccion.cuenta = cuenta
            transaccion.save()
            valorTotal = float(request.POST.get('valor')) + float(cuenta.saldo)
            cuenta.saldo = valorTotal
            cuenta.save()
            return redirect(index)
        return render(request, 'transacciones/depositar.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())
    listaClientes = Cliente.objects.all()
    return render(request, '/', locals())


@login_required
def retirar(request, numero):
    usuario = request.user
    if usuario.groups.filter(name="transacciones").exists():
        formulario = FormularioTransaccion()
        cuenta = Cuenta.objects.get(numero=numero)
        if request.method == 'POST':
            transaccion = Transaccion()
            transaccion.tipo = 'retiro'
            transaccion.valor = float(request.POST.get('valor'))
            transaccion.descripcion = request.POST.get('descripcion')
            transaccion.cuenta = cuenta
            if(float(cuenta.saldo) >= float(request.POST.get('valor'))):
                valorTotal = float(cuenta.saldo) - \
                    float(request.POST.get('valor'))
                cuenta.saldo = abs(valorTotal)
                transaccion.save()
                cuenta.save()
                return redirect(index)
            else:
                return render(request, 'transacciones/error.html', locals())
        return render(request, 'transacciones/retirar.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())
    listaClientes = Cliente.objects.all()
    return render(request, '/', locals())

