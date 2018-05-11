from django.conf.urls import url, include
from . import views

urlpatterns = [

    #  все аудитории
    url(r'^$', views.auditorium_list, name="auditorium_list"),

    #  аудитории, принадлежащие конкретному корпусу
    url(r'^building/(?P<building_id>[0-9]+)/$', views.auditorium_list, name="aud_build"),

    #  одна аудитория
    url(r'^(?P<auditorium_id>[0-9]+)/$', views.auditorium, name="auditorium"),

    #  создать новую аудиторию
    # url(r'^new/$', views.auditorium_create, name='auditorium_new'),

    #  редактировать аудиторию
    url(r'^edit/(?P<auditorium_id>\d+)$', views.auditorium_update, name='auditorium_edit'),

    #  удалить аудиторию
    url(r'^delete/(?P<auditorium_id>\d+)$', views.auditorium_delete, name='auditorium_delete'),
]




