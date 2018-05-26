from django.conf.urls import url, include
from . import views

urlpatterns = [
    #  все кафедры
    url(r'^$', views.department_list, name="department_list"),

    url(r'^test/$', views.index, name="test"),

    #  расчасовка кафедры
    url(r'^department/(?P<department_id>[0-9]+)/$', views.raschasovka_department, name="r_department" ),

    #  создать новую расчасовку
    url(r'^department/(?P<department_id>[0-9]+)/new/$', views.raschasovka_create, name='raschasovka_new'),
    url(r'^department/(?P<department_id>[0-9]+)/(?P<raschasovka_id>\d+)/weeks$', views.week_for_raschasovka, name='week_raschasovka'),

    #  редактировать расчасовку
    url(r'^department/(?P<department_id>[0-9]+)/edit/(?P<raschasovka_id>\d+)$', views.raschasovka_update, name='raschasovka_edit'),

    #  удалить расчасовку
    url(r'^department/(?P<department_id>[0-9]+)/delete/(?P<raschasovka_id>\d+)$', views.raschasovka_delete, name='raschasovka_delete'),
]





