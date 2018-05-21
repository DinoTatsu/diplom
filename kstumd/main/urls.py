from django.conf.urls import url, include
from django.views.generic import TemplateView

from . import views

urlpatterns = [
    url(r'', TemplateView.as_view(template_name="main.html")),
]




