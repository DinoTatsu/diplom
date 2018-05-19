from django.forms import ModelForm, Form, CharField
from django import forms
from django.core.urlresolvers import reverse_lazy as _
from .models import Raschasovka, Raschasovkaweeks, Group, \
    Department, Teacherdepartment, Subjectdepartment, Teacher, Subject, Schedule, Week


class ScheduleForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super(ScheduleForm, self).__init__(*args, **kwargs)
        try:
            group_id = self.instance.groupid
        except:
            group_id = self.initial['groupid']
        self.initial['weekid'] = Week.objects.first()
        self.fields['teacherid'].queryset = Teacher.objects.all().filter(raschasovka__groupid=group_id)
        self.fields['subjectid'].queryset = Subject.objects.all().filter(raschasovka__groupid=group_id)

    class Meta:
        model = Schedule
        fields = [
            'hourid', 'dayofweekid', 'groupid', 'teacherid', 'auditoriumid',
            'weekid', 'subjectid', 'subjecttypeid', 'semesterid', 'lastchange', 'isfinal'
        ]

        widgets = {
            'isfinal': forms.CheckboxInput(attrs={'class': 'form-control'}),
            'hourid': forms.Select(attrs={'class': 'form-control'}),
            'dayofweekid': forms.Select(attrs={'class': 'form-control'}),
            'teacherid': forms.Select(attrs={'class': 'form-control'}),
            'auditoriumid': forms.Select(attrs={'class': 'form-control'}),
            'weekid': forms.Select(attrs={'class': 'form-control'}),
            'subjectid': forms.Select(attrs={'class': 'form-control'} ),
            'subjecttypeid': forms.Select(attrs={'class': 'form-control'}),
            'semesterid': forms.Select(attrs={'class': 'form-control'}),
            'groupid': forms.HiddenInput(),
            'lastchange': forms.HiddenInput(),
        }

    def save(self, commit=True):
        schedule = super(ScheduleForm, self).save(commit=False)
        # magic
        commit = True
        if commit:
            schedule.save()
        return schedule


class GroupSearchForm(Form):
    search = CharField(required=False)
    search.widget.attrs['class'] ="form-control"
    search.widget.attrs['id'] = "groupSearch"