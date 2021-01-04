from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.index, name="clientes"),
    path('crearClientes', views.crearCliente, name="crearClientes"),

]
