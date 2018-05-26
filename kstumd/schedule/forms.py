from django.forms import ModelForm, Form, CharField
from django import forms
from django.core.urlresolvers import reverse_lazy as _
from .models import Raschasovka, Raschasovkaweeks, Group, \
    Department, Teacherdepartment, Subjectdepartment, Teacher, Subject, Schedule, Week, Subjecttype


class ScheduleForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super(ScheduleForm, self).__init__(*args, **kwargs)
        try:
            group_id = self.instance.groupid
        except:
            group_id = self.initial['groupid']
        Teachers = Teacher.objects.all().filter(raschasovka__groupid=group_id).order_by('firstname').distinct()
        self.fields['teacherid'].queryset = Teachers
        self.fields['subjectid'].queryset = Subject.objects.all().filter(raschasovka__groupid=group_id).order_by('fullname').distinct()
        self.fields['subjecttypeid'].queryset = Subjecttype.objects.all().filter(raschasovka__groupid=group_id).order_by('fullname').distinct()

    class Meta:
        model = Schedule
        fields = [
            'hourid', 'dayofweekid', 'groupid', 'teacherid', 'auditoriumid',
            'subjectid', 'subjecttypeid', 'semesterid', 'lastchange', 'isfinal'
        ]

        widgets = {
            'isfinal': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
            'hourid': forms.Select(attrs={'class': 'form-control'}),
            'dayofweekid': forms.Select(attrs={'class': 'form-control'}),
            'teacherid': forms.Select(attrs={'class': 'form-control'}),
            'auditoriumid': forms.Select(attrs={'class': 'form-control'}),
            'subjectid': forms.Select(attrs={'class': 'form-control'} ),
            'subjecttypeid': forms.Select(attrs={'class': 'form-control'}),
            'semesterid': forms.Select(attrs={'class': 'form-control'}),
            # 'weekid': forms.Select( attrs={'class': 'form-control'} ),
            'groupid': forms.HiddenInput(),
            'lastchange': forms.HiddenInput(),
        }


class ScheduleCreateByRForm( ScheduleForm ):

    def __init__(self, *args, **kwargs):
        super( ScheduleForm, self ).__init__( *args, **kwargs )
        try:
            group_id = self.instance.groupid
        except:
            group_id = self.initial['groupid']
        if not self.initial['teacherid']:
            self.fields['teacherid'].queryset = Teacher.objects.all().filter( raschasovka__groupid=group_id )
        if not self.initial['subjectid']:
            self.fields['subjectid'].queryset = Subject.objects.all().filter( raschasovka__groupid=group_id )
        if not self.initial['subjecttypeid']:
            self.fields['subjecttypeid'].queryset = Subjecttype.objects.all().filter( raschasovka__groupid=group_id )


class GroupSearchForm(Form):
    search = CharField(required=False)
    search.widget.attrs['class'] ="form-control"
    search.widget.attrs['id'] = "groupSearch"