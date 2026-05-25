"""
Pruebas de estrés - Olla y Sazón
Ejecutar: locust -f locustfile.py --host=http://127.0.0.1:8000
"""
from datetime import date, timedelta
from locust import HttpUser, TaskSet, task, between


def _login(client, email, password, label):
    """Hace login manejando CSRF correctamente. Suprime el 400 esperado si las credenciales fallan."""
    # 1. GET para obtener cookie csrftoken
    client.get("/login/", name="[csrf] login")
    csrf = client.cookies.get("csrftoken", "")

    # 2. POST con el token — catch_response=True para no contar 400 como fallo
    with client.post(
        "/login/",
        data={
            "email": email,
            "password": password,
            "csrfmiddlewaretoken": csrf,
        },
        headers={"Referer": "http://127.0.0.1:8000/login/"},
        name=label,
        catch_response=True,
        allow_redirects=True,
    ) as resp:
        # 200/302 = éxito, 400 = credenciales incorrectas (respuesta válida del servidor)
        # Solo falla si hay error de servidor (5xx) o de red
        if resp.status_code < 500:
            resp.success()
        else:
            resp.failure(f"Error de servidor: {resp.status_code}")


def _fecha_hora_disponible():
    """Devuelve fecha de mañana y hora fija para la API de mesas."""
    manana = (date.today() + timedelta(days=1)).strftime("%Y-%m-%d")
    return manana, "12:00"


# ---------------------------------------------------------------------------
# Usuarios públicos (sin sesión)
# ---------------------------------------------------------------------------
class PublicoTasks(TaskSet):

    @task(5)
    def index(self):
        self.client.get("/", name="Inicio")

    @task(4)
    def menu(self):
        self.client.get("/menu/", name="Menú")

    @task(3)
    def noticias(self):
        self.client.get("/noticias/", name="Noticias")

    @task(2)
    def reserva_form(self):
        self.client.get("/reserva/", name="Reserva (form)")

    @task(2)
    def api_mesas(self):
        fecha, hora = _fecha_hora_disponible()
        self.client.get(
            f"/api/mesas/disponibilidad/?fecha={fecha}&hora={hora}",
            name="API mesas",
        )

    @task(1)
    def carrito(self):
        self.client.get("/carrito/", name="Carrito")


class UsuarioPublico(HttpUser):
    tasks = [PublicoTasks]
    wait_time = between(1, 3)
    weight = 5


# ---------------------------------------------------------------------------
# Cliente registrado
# ---------------------------------------------------------------------------
class ClienteTasks(TaskSet):

    def on_start(self):
        _login(self.client, "cliente@test.com", "Test1234!", "[auth] Login cliente")

    def on_stop(self):
        self.client.get("/logout/", name="[auth] Logout")

    @task(5)
    def mi_perfil(self):
        self.client.get("/mi-perfil/", name="Cliente: Mi perfil")

    @task(3)
    def menu(self):
        self.client.get("/menu/", name="Cliente: Menú")

    @task(2)
    def reserva_form(self):
        self.client.get("/reserva/", name="Cliente: Reserva (form)")

    @task(2)
    def carrito(self):
        self.client.get("/carrito/", name="Cliente: Carrito")

    @task(1)
    def noticias(self):
        self.client.get("/noticias/", name="Cliente: Noticias")


class UsuarioCliente(HttpUser):
    tasks = [ClienteTasks]
    wait_time = between(1, 4)
    weight = 3


# ---------------------------------------------------------------------------
# Empleado (mesero)
# ---------------------------------------------------------------------------
class EmpleadoTasks(TaskSet):

    def on_start(self):
        _login(self.client, "empleado@test.com", "Test1234!", "[auth] Login empleado")

    def on_stop(self):
        self.client.get("/logout/", name="[auth] Logout")

    @task(4)
    def mi_horario(self):
        self.client.get("/mi-horario/", name="Empleado: Mi horario")

    @task(4)
    def pedidos_asignados(self):
        self.client.get("/pedidos-asignados/", name="Empleado: Pedidos asignados")

    @task(3)
    def reservas_hoy(self):
        self.client.get("/reservas-hoy/", name="Empleado: Reservas hoy")

    @task(2)
    def mis_solicitudes(self):
        self.client.get("/mis-solicitudes-turno/", name="Empleado: Mis solicitudes turno")

    @task(1)
    def solicitud_form(self):
        self.client.get("/mi-solicitud-turno/", name="Empleado: Form solicitud turno")


class UsuarioEmpleado(HttpUser):
    tasks = [EmpleadoTasks]
    wait_time = between(1, 3)
    weight = 2


# ---------------------------------------------------------------------------
# Administrador
# ---------------------------------------------------------------------------
class AdminTasks(TaskSet):

    def on_start(self):
        _login(self.client, "admin@test.com", "Test1234!", "[auth] Login admin")

    def on_stop(self):
        self.client.get("/logout/", name="[auth] Logout")

    @task(5)
    def dashboard(self):
        self.client.get("/dashboard/", name="Admin: Dashboard")

    @task(3)
    def pedidos(self):
        self.client.get("/pedidos/", name="Admin: Pedidos")

    @task(3)
    def reservas(self):
        self.client.get("/reservas/", name="Admin: Reservas")

    @task(2)
    def horarios(self):
        self.client.get("/horarios/", name="Admin: Horarios")

    @task(2)
    def solicitudes_turno(self):
        self.client.get("/solicitudes-turno/", name="Admin: Solicitudes turno")

    @task(2)
    def pagos(self):
        self.client.get("/pagos/", name="Admin: Pagos")

    @task(1)
    def usuarios(self):
        self.client.get("/users/", name="Admin: Usuarios")

    @task(1)
    def productos(self):
        self.client.get("/productos/", name="Admin: Productos")

    @task(1)
    def reportes(self):
        self.client.get("/reportes/", name="Admin: Reportes")


class UsuarioAdmin(HttpUser):
    tasks = [AdminTasks]
    wait_time = between(2, 5)
    weight = 1
