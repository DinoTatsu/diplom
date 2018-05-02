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
    # все преподаватели
    url(r'^teachertime/$', views.teacher_time_list, name="teacher_time_list"),
    # преподаватели одной кафедры
    url(r'^teachertime/department/(?P<department_id>[0-9]+)/$', views.teacher_time_list, name="teacher_time_department"),
    # расчасовка преподавателя
    url(r'^teachertime/(?P<teacher_id>[0-9]+)/$', views.teacher_time, name="teacher_time"),


    # url(r'^$', views.index, name="index"),
]