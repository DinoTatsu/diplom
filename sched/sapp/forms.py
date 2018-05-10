from django import forms
from .models import Auditorium, Auditoriumtype, Building, \
    Course, Coursegroup, Dayofweek, Department, Faculty, Group, \
    Hour, Raschasovka, Schedule, \
    Subjecttype, Subject, Subjectwithtype, \
    Teacher, Teacherpersonaltime, Week

from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.utils.translation import ugettext_lazy as _
from django.views.generic.edit import FormView


class AuditoriumListForm(forms.Form):
    search = forms.CharField(required=False)
    sort_field = forms.ChoiceField(choices=(('id', 'ID'), ('title', 'title'), ('-created_date', 'Дата создания')), required=False)
