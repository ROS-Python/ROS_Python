import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0008_solicitud_cambio_turno'),
    ]

    operations = [
        migrations.CreateModel(
            name='NotificacionModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mensaje', models.TextField(max_length=500)),
                ('leida', models.BooleanField(default=False)),
                ('fecha', models.DateTimeField(auto_now_add=True)),
                ('usuario', models.ForeignKey(
                    db_column='usuario_id',
                    on_delete=django.db.models.deletion.CASCADE,
                    related_name='notificaciones',
                    to=settings.AUTH_USER_MODEL,
                )),
            ],
            options={
                'db_table': 'notificaciones',
                'ordering': ['-fecha'],
            },
        ),
    ]
