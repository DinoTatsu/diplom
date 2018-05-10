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
            'totalhoursforsemestr',
            'auditoriumid',
            'subjectid',
            'subjecttypeid',
            'groupid',
            'departmentid',
            'semesterid'
        ]


class DepartmentSearchForm(Form):
    search = CharField(required=False)
    search.widget.attrs['class'] ="form-control"
    search.widget.attrs['id'] = "departSearch"