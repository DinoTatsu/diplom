from django import forms
from .models import Auditorium, Auditoriumtype, Building, \
    Course, Coursegroup, Dayofweek, Department, Faculty, Group, \
    Hour, Raschasovka, Schedule, \
    Subjecttype, Subject, Subjectwithtype, \
    Teacher, Teacherpersonaltime, Week

from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.utils.translation import ugettext_lazy as _
from django.views.generic.edit import FormView


class BootstrapAuthenticationForm(AuthenticationForm):
    """Authentication form which uses boostrap CSS."""
    username = forms.CharField(max_length=254,
                               widget=forms.TextInput({'class': 'form-control', 'placeholder': 'User name'}))
    password = forms.CharField(label=_("Password"),
                               widget=forms.PasswordInput({'class': 'form-control', 'placeholder': 'Password'}))


class AuditoriumForm(forms.ModelForm):
    """Form for adding auditorium"""
    class Meta:
        model = Auditorium
        # fields = []

class QuestionForm(forms.Form):
    title = forms.CharField(max_length=255)
    text = forms.CharField(widget=forms.Textarea)


class PostForm(forms.ModelForm):
    myfile = forms.FileField(required=False)
    class Meta:
        model = Post
        fields = [
            "title",
            "text"
        ]


class CommentForm(forms.Form):
    author = forms.CharField(widget=forms.TextInput({'size': 50}), max_length=20)
    author.label = "Автор"
    text = forms.CharField(widget=forms.Textarea({'maxlength': 125, 'cols': '52', 'rows': '3'}))
    text.label = "Комментарий"
