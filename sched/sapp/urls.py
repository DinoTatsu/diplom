from django.conf.urls import url
from django.contrib import admin
from . import views

urlpatterns = [
    # main page with navigation
    url(r'^$', views.index, name="index"),
    # list of auditoriums
    url(r'^auditorium/$', views.auditorium, name="auditorium"),
    # auditorium by id
    # url(r'^$', views.index, name="index"),

    # url(r'^$', views.index, name="index"),
    # url(r'^$', views.index, name="index"),
]