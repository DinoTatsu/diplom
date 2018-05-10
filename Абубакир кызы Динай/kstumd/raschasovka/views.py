from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy

from .models import Raschasovka, Teacher, Department


def raschas_list(request):
    departments = Department.objects.all.order_by('name')

    # form

    paginator = Paginator(departments, 20)  # 50 преподавателей на страницу
    page = request.GET.get('page')
    try:
        departments = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        departments = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        departments = paginator.page(paginator.num_pages)

    context = {
        'departments': departments,
    }
    return render(request, context, "departmentList.html")