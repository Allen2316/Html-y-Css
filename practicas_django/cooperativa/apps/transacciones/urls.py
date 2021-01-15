from django.urls import path
from . import views

urlpatterns = [
    # personas
    path('', views.index, name="transacciones"),

]
