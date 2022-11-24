from django.db import models
#contrib → contributions
#auth_user se encuentra en la aplicacion auth
#AbstractBaseUser → me permite control total en la tabla 'auth_user'
#AbstractUser → me permite control solamente en las columnas de nombre,apellido,correo y password de la tabla 'auth_user'
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
# Create your models here.
class PlatoModel(models.Model):
    id = models.AutoField(primary_key=True , null =False , unique = True)
    nombre = models.CharField(max_length= 50, null= False)
    precio = models.DecimalField(max_digits=5, decimal_places =1 ,null = False)
    disponibilidad = models.BooleanField(default = True)
    #auto_now_add → indica se guarde la hora y fecha actual del servidor cuando se cree un nuevo registro → https://docs.djangoproject.com/en/4.1/ref/models/fields/#datefield
    fechaCreacion = models.DateTimeField(auto_now_add=True, db_column='fecha_creacion')
    
    class Meta:
        db_table = 'platos'
        # ordenar por el precio descendiente
        ordering = ['-precio']

class UsuarioModel(AbstractBaseUser, PermissionsMixin):
    #PermissionsMixin → me sirve para poder modificar los permisos que tendra este usuario al momento de crearse los comandos
    id = models.AutoField(primary_key= True, unique= True)
    nombre = models.CharField(max_length=50, null= False)
    apellido = models.CharField(max_length=50, null= False)
    # EmailField → espera el formatp ****@****.*** 
    correo= models.EmailField(max_length=80, unique=True, null=False)
    password= models.TextField(null=False)

    tipoUsuario = models.CharField(max_length=50, choices =[
        ('ADMIN','ADMINISTRADOR'),
        ('USER','USUARIO')
        ], db_column= 'tipo_usuario')
