from django.forms import ModelForm, Form, CharField, forms
from django import forms
from django.urls import reverse_lazy as _
from .models import Auditorium


class AuditoriumForm(ModelForm):
    class Meta:
        model = Auditorium
        fields = [
            'name', 'auditoriumtypeid', 'seatingcapacity', 'departmentid', 'buildingid'
        ]
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'auditoriumtypeid': forms.Select(attrs={'class': 'form-control'}),
            'seatingcapacity': forms.NumberInput(attrs={'class': 'form-control'}),
            'departmentid': forms.Select(attrs={'class': 'form-control'}),
        }

    def save(self, commit=True):
        auditorium = super(AuditoriumForm, self).save(commit=False)

        # магия
        commit = True
        if commit:
            auditorium.save()
        return auditorium

class AuditoriumSearchForm(Form):
    search = CharField(required=False)
    search.widget.attrs['class'] ="form-control"
    search.widget.attrs['id'] = "audSearch"

