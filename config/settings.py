import os
import dj_database_url
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent


def _load_dotenv():
    path = BASE_DIR / '.env'
    if not path.is_file():
        return
    for line in path.read_text(encoding='utf-8').splitlines():
        line = line.strip()
        if not line or line.startswith('#') or '=' not in line:
            continue
        key, _, value = line.partition('=')
        key = key.strip()
        value = value.strip().strip('\'"')
        if key and key not in os.environ:
            os.environ[key] = value


_load_dotenv()

# ── Seguridad ──────────────────────────────────────────────────────────────
SECRET_KEY = (
    os.environ.get('SECRET_KEY')
    or os.environ.get('DJANGO_SECRET_KEY')
    or 'django-insecure-dev-only'
)

DEBUG = os.environ.get('DEBUG', 'True').lower() in ('1', 'true', 'yes')

ALLOWED_HOSTS = ['127.0.0.1', 'localhost', 'testserver']
_extra_hosts = os.environ.get('ALLOWED_HOSTS', '')
if _extra_hosts:
    ALLOWED_HOSTS += [h.strip() for h in _extra_hosts.split(',') if h.strip()]
_railway_domain = os.environ.get('RAILWAY_PUBLIC_DOMAIN', '')
if _railway_domain and _railway_domain not in ALLOWED_HOSTS:
    ALLOWED_HOSTS.append(_railway_domain)

CSRF_TRUSTED_ORIGINS = ['http://127.0.0.1', 'http://localhost'] + [
    f'https://{h}' for h in ALLOWED_HOSTS
    if h not in ('127.0.0.1', 'localhost', 'testserver')
]

# ── Apps ───────────────────────────────────────────────────────────────────
INSTALLED_APPS = [
    'users',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

# ── Middleware ─────────────────────────────────────────────────────────────
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'users.middleware.NoCacheAuthenticatedMiddleware',
    'users.middleware.ModuloBloqueoMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'config.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'template'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'users.context_processors.carrito_publico',
                'users.context_processors.notificaciones_no_leidas',
            ],
            'builtins': ['users.templatetags.money_filters'],
        },
    },
]

WSGI_APPLICATION = 'config.wsgi.application'

# ── Base de datos ──────────────────────────────────────────────────────────
# Railway inyecta DATABASE_URL automáticamente.
# En local el fallback usa tu PostgreSQL de desarrollo.
DATABASES = {
    'default': dj_database_url.config(
        default=os.environ.get(
            'DATABASE_URL',
            'postgresql://postgres:101606@127.0.0.1:5432/ROS_db'
        ),
        conn_max_age=600,
        ssl_require=not DEBUG,
    )
}

# ── Validación de contraseñas ──────────────────────────────────────────────
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

# ── Internacionalización ───────────────────────────────────────────────────
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_THOUSAND_SEPARATOR = True
USE_TZ = True

# ── Archivos estáticos ─────────────────────────────────────────────────────
STATIC_URL = '/static/'
STATICFILES_DIRS = [BASE_DIR / 'static']
STATIC_ROOT = BASE_DIR / 'staticfiles'
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

# ── Auth ───────────────────────────────────────────────────────────────────
LOGIN_URL = '/login/'
LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/login/'
AUTH_USER_MODEL = 'users.User'
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# ── Email ──────────────────────────────────────────────────────────────────
EMAIL_BACKEND = os.environ.get('EMAIL_BACKEND') or 'django.core.mail.backends.smtp.EmailBackend'

if EMAIL_BACKEND == 'django.core.mail.backends.smtp.EmailBackend':
    EMAIL_HOST = os.environ.get('SMTP_HOST', 'smtp.gmail.com')
    EMAIL_PORT = int(os.environ.get('SMTP_PORT', '587'))
    EMAIL_HOST_USER = os.environ.get('SMTP_USER', 'jeisonpinilla14@gmail.com')
    EMAIL_HOST_PASSWORD = os.environ.get('SMTP_PASSWORD', 'welk kamo aise qrsf')
    EMAIL_USE_TLS = os.environ.get('SMTP_USE_TLS', 'true').lower() in ('1', 'true', 'yes')
    EMAIL_USE_SSL = os.environ.get('SMTP_USE_SSL', 'false').lower() in ('1', 'true', 'yes')
else:
    EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

DEFAULT_FROM_EMAIL = os.environ.get('EMAIL_FROM', f'Olla y Sazón <{os.environ.get("SMTP_USER", "jeisonpinilla14@gmail.com")}>')
SERVER_EMAIL = DEFAULT_FROM_EMAIL
PASSWORD_RESET_TIMEOUT = 180

# ── SendPulse ──────────────────────────────────────────────────────────────
SENDPULSE_CLIENT_ID = os.environ.get('SENDPULSE_CLIENT_ID', '')
SENDPULSE_CLIENT_SECRET = os.environ.get('SENDPULSE_CLIENT_SECRET', '')
SENDPULSE_FROM_EMAIL = os.environ.get('SENDPULSE_FROM_EMAIL', 'OllaSazon@gmail.com')
SENDPULSE_FROM_NAME = os.environ.get('SENDPULSE_FROM_NAME', 'Olla y Sazón')
SENDPULSE_LIST_ID = int(os.environ.get('SENDPULSE_LIST_ID', '633081'))
