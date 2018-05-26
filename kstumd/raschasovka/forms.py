from django.forms import ModelForm, Form, CharField, inlineformset_factory, formset_factory
from django import forms
from django.core.urlresolvers import reverse_lazy as _
from .models import Raschasovka, Raschasovkaweeks, Group, \
    Department, Teacherdepartment, Subjectdepartment, Teacher, Subject, Week, amount_of_weeks


RaschasovkaWeekFormSet = inlineformset_factory(parent_model=Raschasovka,
                                               model=Raschasovkaweeks,
                                               fk_name='raschasovkaid',
                                               fields=('raschasovkaid', 'weekid', 'hoursforweek',),
                                               extra=amount_of_weeks)


class RaschasovkaForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super(RaschasovkaForm, self).__init__(*args, **kwargs)
        try:
            department_id = self.instance.departmentid
        except:
            department_id = self.initial['departmentid']
        self.fields['teacherid'].queryset = Teacher.objects.all().filter(teacherdepartment__departmentid=department_id)
        self.fields['groupid'].queryset = Group.objects.all()
        self.fields['subjectid'].queryset = Subject.objects.filter(subjectdepartment__departmentid=department_id)

    class Meta:
        model = Raschasovka
        fields = [
            'potok', 'courseid', 'teacherid', 'totalhoursforsemestr',
            'auditoriumid', 'subjectid', 'subjecttypeid', 'groupid',
            'departmentid', 'semesterid', 'numberofstudents', 'subjectclassid'
        ]

        widgets = {
            'potok': forms.NumberInput(attrs={'class': 'form-control'}),
            'courseid': forms.Select(attrs={'class': 'form-control'}),
            'groupid': forms.Select(attrs={'class': 'form-control'}),
            'numberofstudents': forms.NumberInput( attrs={'class': 'form-control'}),
            'teacherid': forms.Select(attrs={'class': 'form-control'} ),
            'subjectid': forms.Select(attrs={'class': 'form-control'}),
            'subjecttypeid': forms.Select(attrs={'class': 'form-control'}),
            'totalhoursforsemestr': forms.NumberInput(attrs={'class': 'form-control'}),
            'auditoriumid': forms.Select(attrs={'class': 'form-control'}),
            'semesterid': forms.Select(attrs={'class': 'form-control'}),
            'subjectclassid': forms.Select(attrs={'class': 'form-control'}),
            'departmentid': forms.HiddenInput(),
        }

    def save(self, commit=True):
        raschasovka = super(RaschasovkaForm, self).save(commit=False)
        raschasovka.save()
        return raschasovka


class DepartmentSearchForm(Form):
    search = CharField(required=False)
    search.widget.attrs['class'] ="form-control"
    search.widget.attrs['id'] = "departSearch"