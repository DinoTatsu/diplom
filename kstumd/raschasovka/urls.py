from django.conf.urls import url, include
from . import views

urlpatterns = [

    #  все кафедры
    url(r'^$', views.raschas_list, name="department_list"),

    #  расчасовка кафедры
    url(r'^department/(?P<department_id>[0-9]+)/$', views.raschasovka, name="r_department"),

]





