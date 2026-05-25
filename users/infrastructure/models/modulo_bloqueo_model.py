from django.db import models


class ModuloBloqueoModel(models.Model):
    nombre = models.CharField(max_length=100, unique=True)
    url_patron = models.CharField(max_length=200, help_text='Prefijo de URL a bloquear, ej: /menu/')
    motivo = models.TextField(max_length=500, blank=True, default='')
    bloqueado = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'modulos_bloqueo'
        app_label = 'users'

    def __str__(self):
        return f"{self.nombre} ({'bloqueado' if self.bloqueado else 'activo'})"
