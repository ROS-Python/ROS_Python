"""Variables globales de plantilla (carrito en sesión)."""

SESSION_CARRITO_KEY = 'public_carrito'


def carrito_publico(request):
    items = request.session.get(SESSION_CARRITO_KEY, [])
    count = sum(int(i.get('cantidad', 0)) for i in items)
    return {'carrito_count': count, 'carrito_items': items}


def notificaciones_no_leidas(request):
    if request.user.is_authenticated:
        try:
            from users.infrastructure.models.notificacion_model import NotificacionModel
            count = NotificacionModel.objects.filter(usuario=request.user, leida=False).count()
        except Exception:
            count = 0
        return {'notif_no_leidas': count}
    return {'notif_no_leidas': 0}
