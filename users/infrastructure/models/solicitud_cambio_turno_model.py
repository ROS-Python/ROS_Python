from django.db import models


class SolicitudCambioTurnoModel(models.Model):
    ESTADO_CHOICES = [
        ('PENDIENTE', 'Pendiente'),
        ('APROBADA', 'Aprobada'),
        ('RECHAZADA', 'Rechazada'),
    ]

    empleado = models.ForeignKey(
        'User', on_delete=models.CASCADE,
        related_name='solicitudes_turno', db_column='empleado_id'
    )
    horario = models.ForeignKey(
        'HorarioModel', on_delete=models.SET_NULL, null=True, blank=True,
        related_name='solicitudes', db_column='horario_id'
    )
    dia_actual = models.CharField(max_length=20)
    hora_inicio_actual = models.CharField(max_length=5)
    hora_fin_actual = models.CharField(max_length=5)
    dia_solicitado = models.CharField(max_length=20)
    hora_inicio_solicitada = models.CharField(max_length=5)
    hora_fin_solicitada = models.CharField(max_length=5)
    motivo = models.TextField(max_length=500)
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES, default='PENDIENTE')
    respuesta_admin = models.TextField(max_length=500, blank=True, default='')
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'solicitudes_cambio_turno'
        app_label = 'users'
        ordering = ['-fecha_creacion']

    def __str__(self):
        return f"{self.empleado} - {self.dia_actual} → {self.dia_solicitado} ({self.estado})"
