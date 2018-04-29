from django.shortcuts import render
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.views.generic import ListView

from sapp.models import Auditorium, Auditoriumtype, Building, \
    Course, Coursegroup, Dayofweek, Department, Faculty, Group, \
    Hour, Raschasovka, Schedule, \
    Subjecttype, Subject, Subjectwithtype, \
    Teacher, Teacherpersonaltime, Week


# url="index", main page with navigation
def index(request):
    return render(request, "index.html")


def auditorium(request):
    departments = Department.objects.all()
    auditorium_types = Auditoriumtype.objects.all()
    buildings = Building.objects.all()

    auditorium_list = Auditorium.objects.order_by('-auditoriumtypeid')

    paginator = Paginator(auditorium_list, 25) # Show 25 auditoriums per page
    page = request.GET.get('page')
    try:
        auditoriums = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        auditoriums = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        auditoriums = paginator.page(paginator.num_pages)

    context = {
        "auditoriums": auditoriums,
        "departments": departments,
        "types": auditorium_types,
        "building": buildings,
    }
    return render(request, "auditorium.html", context)