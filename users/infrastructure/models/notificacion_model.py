from django.conf import settings
from django.db import models


class NotificacionModel(models.Model):
    usuario = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='notificaciones',
        db_column='usuario_id',
    )
    mensaje = models.TextField(max_length=500)
    leida = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'notificaciones'
        ordering = ['-fecha']
