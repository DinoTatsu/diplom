from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .forms import DepartmentSearchForm, RaschasovkaForm
from .models import Raschasovka, Teacher, Department
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage


def raschasovka_create(request):
    form = RaschasovkaForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('department_list')
    return render(request, 'raschasovka_form.html', {'form': form})


def raschasovka_update(request, raschasovka_id):
    raschasovka = get_object_or_404(Raschasovka, id=raschasovka_id)
    form = RaschasovkaForm(request.POST or None, instance=raschasovka)
    if form.is_valid():
        form.save()
        return redirect('department_list')
    return render(request, 'raschasovka_form.html', {'form': form})


def raschasovka_delete(request, raschasovka_id):
    raschasovka = get_object_or_404(Raschasovka, id=raschasovka_id)
    if request.method == 'POST':
        raschasovka.delete()
        return redirect('department_list')
    return render(request, 'raschasovka_confirm_delete.html', {'raschasovka': raschasovka})


def raschasovka(request, department_id=1):
    department = Department.objects.get(id=department_id)
    raschasovka_department = Raschasovka.objects.all().filter(departmentid=department_id)

    form = RaschasovkaForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('department_list')

    context = {
        'department': department,
        'raschas': raschasovka_department,
        'form': 'form',
    }
    return render(request, 'department.html', context)


def raschas_list(request):
    departments = Department.objects.all()

    form = DepartmentSearchForm(request.GET)  # создать форму для поиска кафедры
    form.is_valid()
    if form.cleaned_data.get('search'):
        departments = departments.filter(name__icontains=form.cleaned_data['search'])  # найденные кафедры
    #
    paginator = Paginator(departments, 20)  # 20 кафедр на страницу
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
        'form': form,
    }
    return render(request, "departmentList.html", context)