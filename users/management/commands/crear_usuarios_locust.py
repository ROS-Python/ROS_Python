"""
Comando para crear usuarios de prueba de Locust.
Uso: python manage.py crear_usuarios_locust
"""
from django.core.management.base import BaseCommand
from users.infrastructure.models.user_model import User
from users.infrastructure.models.rol_model import RolModel


USUARIOS = [
    {'email': 'admin@test.com',    'nombre': 'Admin',    'apellido': 'Test', 'rol': 'ADMINISTRADOR', 'is_staff': True,  'is_superuser': True},
    {'email': 'empleado@test.com', 'nombre': 'Empleado', 'apellido': 'Test', 'rol': 'EMPLEADO',      'is_staff': False, 'is_superuser': False},
    {'email': 'cliente@test.com',  'nombre': 'Cliente',  'apellido': 'Test', 'rol': 'CLIENTE',       'is_staff': False, 'is_superuser': False},
]

PASSWORD = 'Test1234!'


class Command(BaseCommand):
    help = 'Crea usuarios de prueba para las pruebas de estrés con Locust'

    def handle(self, *args, **options):
        for data in USUARIOS:
            rol_nombre = data['rol']
            # Busca el rol con variantes de nombre
            rol = (
                RolModel.objects.filter(nombre__iexact=rol_nombre).first()
                or RolModel.objects.filter(nombre__iexact='ADMIN').first()
                if rol_nombre in ('ADMINISTRADOR', 'ADMIN')
                else RolModel.objects.filter(nombre__iexact=rol_nombre).first()
            )

            if not rol:
                self.stdout.write(self.style.WARNING(
                    f"  Rol '{rol_nombre}' no encontrado — omitiendo {data['email']}"
                ))
                continue

            user, created = User.objects.get_or_create(
                email=data['email'],
                defaults={
                    'nombre': data['nombre'],
                    'apellido': data['apellido'],
                    'rol': rol,
                    'activo': True,
                    'is_staff': data['is_staff'],
                    'is_superuser': data['is_superuser'],
                },
            )
            # Siempre actualiza la contraseña por si ya existía con otra
            user.set_password(PASSWORD)
            user.activo = True
            user.rol = rol
            user.save()

            estado = 'creado' if created else 'actualizado'
            self.stdout.write(self.style.SUCCESS(f"  [{estado}] {data['email']} — rol: {rol.nombre}"))

        self.stdout.write(self.style.SUCCESS(f'\nContraseña de todos: {PASSWORD}'))
