from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy, reverse
from .forms import GroupSearchForm, ScheduleForm
from .models import Raschasovka, Teacher, Department, Group, Teacherdepartment, Schedule, Subject, Subjecttype, Faculty, Hour, Week, Dayofweek
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage


def schedule_create(request, group_id):
    initial = {
        'groupid': group_id,
        'weekid': Week.objects.get(number=1),
    }
    form = ScheduleForm(request.POST or None, initial=initial)
    # print(form.as_p())
    if form.is_valid():
        print( form.as_p() )
        form.save()
        for field in form.fields:
            print(field)
        return HttpResponseRedirect( reverse( 'group', args=(group_id,) ) )
    else:
        print(form.errors)
    context = {
        'form': form,
        'group': Group.objects.get(id=group_id)
    }
    return render(request, 'schedule_form.html', context)


def schedule_update(request, schedule_id, group_id):
    schedule = get_object_or_404(Schedule, id=schedule_id)
    form = ScheduleForm(request.POST or None, instance=schedule, initial={'groupid': schedule.groupid})
    if form.is_valid():
        form.save()
        return HttpResponseRedirect(reverse('group', args=(group_id,)))
    context = {
        'form': form,
        'group': Group.objects.get(id=group_id),
        'schedule': schedule,
    }
    return render(request, 'schedule_form.html', context)


def schedule_delete(request, schedule_id, group_id):
    schedule = get_object_or_404(Schedule, id=schedule_id)
    if request.method == 'POST':
        schedule.delete()
        return HttpResponseRedirect( reverse( 'group', args=(group_id,) ) )
    context = {
        'group': Group.objects.get(id=group_id),
        'schedule': schedule,
    }
    return render(request, 'schedule_confirm_delete.html', context)


#  расписание группы
def group(request, group_id):
    group = Group.objects.get(id=group_id)
    schedule_list = Schedule.objects.all().filter(groupid=group_id)
    hours = Hour.objects.all()
    days_of_week = Dayofweek.objects.all()

    schedule_table = {}  ## dict for show schedule as table
    for hour in hours:
        schedule_table[hour] = {}
        schedule_table[hour]['n'] = hour.begin
    for day in days_of_week:
        schedule_for_day = schedule_list.filter(dayofweekid=day.id)
        for hour in hours:
            schedule_table[hour][day] = []
            if schedule_for_day.filter(hourid=hour.id):
                schedule = schedule_for_day.get(hourid=hour.id)  ## schedule for hour, day of week
                schedule_table[hour][day] = schedule
            else:
                schedule_table[hour][day] = ""
    context = {
        'group': group,
        'schedule_list': schedule_list,
        'hours': hours,
        'days_of_week': days_of_week,
        'schedule_table': schedule_table,
    }
    return render(request, 'group_schedule.html', context)


# список всех групп
def group_list(request, department_id=None):
    departments = Department.objects.all().exclude(group=None)
    groups = Group.objects.all()

    if department_id:
        groups = Group.objects.filter(departmentid=department_id)

    form = GroupSearchForm(request.GET)  # создать форму для поиска группы
    form.is_valid()
    if form.cleaned_data.get('search'):
        groups = groups.filter(name__icontains=form.cleaned_data['search'])  # найденные группы
    #
    paginator = Paginator(groups, 50)  # 50 групп на страницу
    page = request.GET.get('page')
    try:
        groups = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        groups = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        groups = paginator.page(paginator.num_pages)

    context = {
        'departments': departments,
        'groups': groups,
        'form': form,
    }
    return render(request, "groupList.html", context)