from django.urls import path

from usuarios import views

urlpatterns = [
    path('cadastro/', views.UsuarioCreateView.as_view(), name='cadusuario'),
]
