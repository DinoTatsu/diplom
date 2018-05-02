from django.conf.urls import url
from django.contrib import admin
from . import views

urlpatterns = [
    # главная страница
    url(r'^$', views.index, name="index"),

    #  все аудитории
    url(r'^auditorium/$', views.auditorium_list, name="auditorium_list"),
    # аудитории, принадлежащие конкретному корпусу
    url(r'^auditorium/building/(?P<building_id>[0-9]+)/$', views.auditorium_list, name="aud_build"),
    #  одна аудитория
    url(r'^auditorium/(?P<auditorium_id>[0-9]+)/$', views.auditorium, name="auditorium"),

    url(r'^teachertime/$', views.teachertime, name="teachertime"),

    # url(r'^$', views.index, name="index"),
]