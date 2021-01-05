from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name="clientes"),
    path('crearClientes', views.crearCliente, name="crearClientes"),
    path('modificar_clientes/<int:cedula>/', views.modificarCliente, name="modificar_clientes"),
    path('cuentas/<int:cedula>/', views.listarCuentas, name="cuentas"),
    path('crear_cuentas', views.crearCuenta, name="crear_cuentas"),
]
