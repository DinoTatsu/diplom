from django.forms import ModelForm, Form, CharField
from django.core.urlresolvers import reverse_lazy as _

from .models import Raschasovka

class RaschasovkaForm(ModelForm):
    class Meta:
        model = Raschasovka
        fields = [
            'potok',
            'courseid',
            'teacherid',
            'subjectwithtypeid',
            'totalhoursforsemestr',
            'totalhoursforweek',
            'auditoriumid'
        ]
        labels = {
            'potok': _('Поток'),
            'courseid': _('Курс'),
            'teacherid': _('Преподаватель'),
            # 'subjectwithtypeid': _(''),
            # 'totalhoursforsemestr': _(''),
            # 'totalhoursforweek': _(''),
            # 'auditoriumid': _('')
        }
        help_texts = {
            'potok': _('Введите поток'),
            # 'courseid': _(''),
            # 'teacherid': _(''),
            # 'totalhoursforsemestr': _(''),
            # 'totalhoursforweek': _(''),
            # 'auditoriumid': _('')
        }
