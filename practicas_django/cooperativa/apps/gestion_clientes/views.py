from django.shortcuts import render, redirect
from apps.modelo.models import Cliente, Cuenta
from .forms import FormularioCliente, FormularioCuenta


def index(request):
    listaClientes = Cliente.objects.all()
    return render(request, 'clientes/index.html', locals())


def crearCliente(request):
    formulario_cliente = FormularioCliente(request.POST)
    if request.method == 'POST':
        cliente = Cliente()
        datos_cliente = formulario_cliente.cleaned_data
        cliente.cedula = datos_cliente.get('cedula')
        # ORM
        cliente.save
        return redirect(index)
    return render(request, 'clientes/crearClientes.html', locals())


def modificarCliente(request):
    return render(request, 'hola principal')


def eliminarCliente(request):
    return render(request, 'hola principal')


def crearCuenta(request):
    return render(request, 'hola principal')


def modificarCuenta(request):
    return render(request, 'hola principal')


def eliminarCuenta(request):
    return render(request, 'hola principal')
