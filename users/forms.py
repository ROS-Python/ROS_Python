import re
from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import PasswordResetForm, SetPasswordForm
from django.core.exceptions import ValidationError

from users.infrastructure.models.solicitud_cambio_turno_model import SolicitudCambioTurnoModel
from users.infrastructure.models.horario_model import HorarioModel


DIAS_SEMANA_CHOICES = [
    ('', '— Selecciona un día —'),
    ('Lunes', 'Lunes'), ('Martes', 'Martes'), ('Miércoles', 'Miércoles'),
    ('Jueves', 'Jueves'), ('Viernes', 'Viernes'), ('Sábado', 'Sábado'), ('Domingo', 'Domingo'),
]


class SolicitudCambioTurnoForm(forms.ModelForm):
    dia_actual = forms.ChoiceField(choices=DIAS_SEMANA_CHOICES, label='Día actual')
    dia_solicitado = forms.ChoiceField(choices=DIAS_SEMANA_CHOICES, label='Día solicitado')

    class Meta:
        model = SolicitudCambioTurnoModel
        fields = [
            'horario', 'dia_actual', 'hora_inicio_actual', 'hora_fin_actual',
            'dia_solicitado', 'hora_inicio_solicitada', 'hora_fin_solicitada', 'motivo',
        ]
        widgets = {
            'hora_inicio_actual': forms.TimeInput(attrs={'type': 'time'}),
            'hora_fin_actual': forms.TimeInput(attrs={'type': 'time'}),
            'hora_inicio_solicitada': forms.TimeInput(attrs={'type': 'time'}),
            'hora_fin_solicitada': forms.TimeInput(attrs={'type': 'time'}),
            'motivo': forms.Textarea(attrs={'rows': 3}),
        }
        labels = {
            'horario': 'Turno de referencia (opcional)',
            'hora_inicio_actual': 'Hora inicio actual',
            'hora_fin_actual': 'Hora fin actual',
            'hora_inicio_solicitada': 'Hora inicio solicitada',
            'hora_fin_solicitada': 'Hora fin solicitada',
            'motivo': 'Motivo del cambio',
        }

    def __init__(self, *args, empleado=None, **kwargs):
        super().__init__(*args, **kwargs)
        if empleado:
            self.fields['horario'].queryset = HorarioModel.objects.filter(user=empleado)
        self.fields['horario'].required = False
        for field in self.fields.values():
            field.widget.attrs.setdefault('class', 'form-control')


class EmailPasswordResetForm(PasswordResetForm):
    email = forms.EmailField(
        label='Correo electrónico',
        max_length=254,
        widget=forms.EmailInput(
            attrs={
                'class': 'form-control',
                'autocomplete': 'email',
                'placeholder': 'tu@correo.com',
            }
        ),
    )

    def get_users(self, email):
        """El modelo `User` usa el campo `activo`, no `is_active`, en la base de datos."""
        UserModel = get_user_model()
        email_field = UserModel.get_email_field_name()
        if not hasattr(UserModel, 'activo'):
            return super().get_users(email)
        active_users = UserModel._default_manager.filter(
            **{f'{email_field}__iexact': email},
            activo=True,
        )
        return (u for u in active_users.iterator() if u.has_usable_password())


def _validar_contrasena(value):
    errores = []
    if len(value) < 8:
        errores.append('Debe tener al menos 8 caracteres.')
    if not re.search(r'[A-Z]', value):
        errores.append('Debe contener al menos una letra mayúscula.')
    if not re.search(r'[a-z]', value):
        errores.append('Debe contener al menos una letra minúscula.')
    if not re.search(r'[!@#$%^&*(),.?":{}|<>\-_=+\[\]\\/;\'\'`~]', value):
        errores.append('Debe contener al menos un carácter especial (!@#$%...).')
    if errores:
        raise ValidationError(errores)


class StyledSetPasswordForm(SetPasswordForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['new_password1'].label = 'Nueva contraseña'
        self.fields['new_password2'].label = 'Confirmar contraseña'
        self.fields['new_password1'].help_text = ''
        for name in ('new_password1', 'new_password2'):
            if name in self.fields:
                self.fields[name].widget.attrs.update(
                    {
                        'class': 'form-control',
                        'autocomplete': 'new-password',
                    }
                )

    def clean_new_password1(self):
        password = self.cleaned_data.get('new_password1', '')
        _validar_contrasena(password)
        return password

    def clean_new_password2(self):
        p1 = self.cleaned_data.get('new_password1', '')
        p2 = self.cleaned_data.get('new_password2', '')
        if p1 and p2 and p1 != p2:
            raise ValidationError('Las contraseñas no coinciden.')
        return p2
