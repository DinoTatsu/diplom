from django.conf.urls import url, include
from . import views

urlpatterns = [
    #  все группы
    url(r'^$', views.group_list, name="group_list"),

    #  все группы одной кафедры
    url(r'^department/(?P<department_id>[0-9]+)/$', views.group_list, name="department_group_list"),

    #  расписание группы
    url(r'^group/(?P<group_id>[0-9]+)/$', views.group, name="group"),

    #  создать новое расписание
    url(r'^group/(?P<group_id>[0-9]+)/new/$', views.schedule_create, name='schedule_new'),

    #  редактировать расписание
    url(r'^group/(?P<group_id>[0-9]+)/edit/(?P<schedule_id>[0-9]+)$', views.schedule_update, name='schedule_edit'),

    #  удалить расписание
    url(r'^group/(?P<group_id>[0-9]+)/delete/(?P<schedule_id>\d+)$', views.schedule_delete, name='schedule_delete'),
]





