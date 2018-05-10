from django.conf.urls import url, include
from . import views

urlpatterns = [

    #  все аудитории
    url(r'^$', views.raschas_list, name="raschas_list"),

    #  аудитории, принадлежащие конкретному корпусу
    url(r'^department/(?P<department_id>[0-9]+)/$', views.raschas_list, name="teacher_department"),

    #  одна аудитория
    url(r'^(?P<auditorium_id>[0-9]+)/$', views.auditorium, name="auditorium"),
]





