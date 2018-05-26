from django.forms import inlineformset_factory
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy, reverse
from django.views.generic import CreateView

from .forms import DepartmentSearchForm, RaschasovkaForm, RaschasovkaWeekFormSet
from .models import Raschasovka, Teacher, Department, Group, Teacherdepartment, Week, Raschasovkaweeks, amount_of_weeks
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage


def index(request):
    raschasovka = Raschasovka.objects.first()
    formset = RaschasovkaWeekFormSet(instance=raschasovka)
    if formset.is_valid():
        formset.save()
        return redirect( department_list )
    return render( request, 'index.html', {'formset': formset} )


def raschasovka_create(request, department_id):
    form = RaschasovkaForm(request.POST or None, initial={'departmentid': department_id})
    if form.is_valid():
        raschasovka = form.save()
        return HttpResponseRedirect(reverse('week_raschasovka', args=(department_id, raschasovka.id)))
    return render(request, 'raschasovka_form.html', {'form': form})

def week_for_raschasovka(request, department_id, raschasovka_id):
    raschasovka = Raschasovka.objects.get(id=raschasovka_id)
    weeks_form = RaschasovkaWeekFormSet()
    if weeks_form.is_valid():
        weeks_form.save()
        return HttpResponseRedirect(reverse( 'r_department', args=(department_id,) ))
    return render( request, 'index.html', {'formset': weeks_form} )

def raschasovka_update(request, raschasovka_id, department_id):
    raschasovka = get_object_or_404( Raschasovka, id=raschasovka_id )
    form = RaschasovkaForm( request.POST or None, instance=raschasovka,
                            initial={'departmentid': raschasovka.departmentid} )
    context = {
        'form': form,
        'raschasovka': raschasovka,
        'department_id': department_id,
    }
    if form.is_valid():
        form.save()
        return HttpResponseRedirect( reverse( 'r_department', args=(department_id,) ) )
    return render( request, 'raschasovka_form.html', context )


def raschasovka_delete(request, raschasovka_id, department_id):
    raschasovka = get_object_or_404( Raschasovka, id=raschasovka_id )
    if request.method == 'POST':
        raschasovka.delete()
        return redirect( 'department_list' )
    return render( request, 'raschasovka_confirm_delete.html', {'raschasovka': raschasovka} )


def raschasovka_department(request, department_id=1):
    department = Department.objects.get( id=department_id )
    raschasovka_department = Raschasovka.objects.all().filter( departmentid=department_id )
    context = {
        'department': department,
        'raschas': raschasovka_department
    }
    return render( request, 'department.html', context )


def department_list(request):
    departments = Department.objects.all() # .order_by('name')
    for department in departments:
        if not department.teacherdepartment_set.first():
            departments.exclude(id=department.id)

    form = DepartmentSearchForm( request.GET )  # создать форму для поиска кафедры
    form.is_valid()
    if form.cleaned_data.get( 'search' ):
        departments = departments.filter( name__icontains=form.cleaned_data['search'] )  # найденные кафедры

    paginator = Paginator( departments, 20 )  # 20 кафедр на страницу
    page = request.GET.get( 'page' )
    try:
        departments = paginator.page( page )
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        departments = paginator.page( 1 )
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        departments = paginator.page( paginator.num_pages )

    context = {
        'departments': departments,
        'form': form,
    }
    return render( request, "departmentList.html", context )
