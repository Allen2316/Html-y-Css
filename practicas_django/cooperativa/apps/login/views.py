from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.http import HttpResponseRedirect
from django.urls import reverse
from .forms import FormularioLogin

# Create your views here.


def autenticar(request):
    if request.method == 'POST':
        formulario = FormularioLogin(request.POST)
        if formulario.is_valid():
            usuario = request.POST['username']
            clave = request.POST['password']
            # auntheticate veririfca si el usuario existe o no
            user = authenticate(username=usuario, password=clave)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse('clientes'))
                else:                    
                    return render(request, 'login/desactive.html')
            else:                
                return render(request, 'login/forbidden.html')
    else:
        formulario = FormularioLogin()
    context = {
        'formulario': formulario
    }
    return render(request, 'login/login.html', context)

#luis123
#cL8xuGW@h@UA@tn

def desautenticar(request):
    return redirect(request, '/')


def welcome(request):
    return redirect(request, 'login/welcome.html')


def forbidden(request):
    return redirect(request, 'login/forbidden.html')


def desactivado(request):
    return redirect(request, 'login/desactive.html')
