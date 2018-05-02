from django.shortcuts import render
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from .forms import AuditoriumListForm
from sapp.models import Auditorium, Auditoriumtype, Building, \
    Course, Coursegroup, Dayofweek, Department, Faculty, Group, \
    Hour, Raschasovka, Schedule, \
    Subjecttype, Subject, Subjectwithtype, \
    Teacher, Teacherpersonaltime, Week


# url="index", главная страница
def index(request):
    return render(request, "index.html")


# url="teachertime", список преподавателей
# url="teachertime/department/teacher_id", преподаватели одной кафедры
def teacher_time_list(request, department_id=None):
    departments = Department.objects.all()
    teachers = Teacher.objects.all().order_by('departmentid')
    if department_id:
        teachers = teachers.filter(departmentid=department_id)
    context = {
        'departments': departments,
        'teachers': teachers,
    }
    return render(request, "teachers_time_list.html", context)


# url="teachertime/teacher_id", преподаватель
def teacher_time(request, teacher_id=None):
    departments = Department.objects.all()
    teacher = Teacher.objects.get(id=teacher_id)

    context = {
        'departments': departments,
        'teacher': teacher,
    }
    return render(request, "teacher.html", context)


# url="auditorium", все аудитории
# url="auditorium/building/<int>", аудитории корпуса
def auditorium_list(request, building_id=None):
    buildings = Building.objects.all()  # все корпуса(для навигации)
    auditoriums = Auditorium.objects.all().order_by('buildingid') # все аудитории
    auditoriums = auditoriums.exclude(seatingcapacity__lte=1) # исключить аудитории с вместимостью <= 1
    if building_id:
        auditoriums = auditoriums.filter(buildingid=building_id).order_by('name')  # аудитории одного корпуса
    context = {
        'buildings': buildings,
        'auditoriums': auditoriums,
    }
    return render(request, "auditorium_list.html", context)



# url="auditorium/<int>", конкретная аудитория
def auditorium(request, auditorium_id):
    auditorium = Auditorium.objects.get(id=auditorium_id)  # аудитория, соответствующая auditorium_id
    buildings = Building.objects.all()  # все корпуса(для навигации)
    context = {
        'auditorium': auditorium,
        'buildings': buildings,
    }
    return render(request, "auditorium.html", context)








def auditorium2(request):
    departments = Department.objects.all()
    auditorium_types = Auditoriumtype.objects.all()
    buildings = Building.objects.all()

    auditorium_list = Auditorium.objects.all()

    auditorium_building = {}
    for building in buildings:
        x = Auditorium.objects.filter(buildingid=building.id)
        if building not in auditorium_building:
            auditorium_building[str(building.id)] = x
        else:
            auditorium_building[str(building.id)].append(x)

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
    return render(request, "auditorium2.html", context)