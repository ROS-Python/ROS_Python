"""Evita que el navegador guarde en caché páginas del panel; así, al cerrar sesión y usar «Atrás», se vuelve a validar con el servidor."""


class NoCacheAuthenticatedMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        user = getattr(request, 'user', None)
        if user is not None and user.is_authenticated:
            response['Cache-Control'] = 'no-store, no-cache, must-revalidate, private, max-age=0'
            response['Pragma'] = 'no-cache'
            response['Expires'] = '0'
            response['Vary'] = 'Cookie'
        return response


class ModuloBloqueoMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        from users.infrastructure.models.modulo_bloqueo_model import ModuloBloqueoModel
        from django.shortcuts import render

        user = getattr(request, 'user', None)
        # El administrador nunca es bloqueado
        if user and user.is_authenticated:
            rol = getattr(getattr(user, 'rol', None), 'nombre', '')
            if (rol or '').strip().upper() in ('ADMINISTRADOR', 'ADMIN'):
                return self.get_response(request)

        path = request.path
        bloqueados = ModuloBloqueoModel.objects.filter(bloqueado=True)
        for modulo in bloqueados:
            if path.startswith(modulo.url_patron):
                return render(request, 'public/modulo_bloqueado.html', {'modulo': modulo}, status=503)

        return self.get_response(request)
