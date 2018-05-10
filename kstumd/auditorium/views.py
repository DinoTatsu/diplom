from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render, redirect, get_object_or_404
from .models import Auditorium, Building
from .forms import AuditoriumForm, AuditoriumSearchForm


def auditorium_create(request):
    form = AuditoriumForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('auditorium_list')
    return render(request, 'auditorium_form.html', {'form': form})


def auditorium_update(request, auditorium_id):
    auditorium = get_object_or_404(Auditorium, id=auditorium_id)
    form = AuditoriumForm(request.POST or None, instance=auditorium)
    if form.is_valid():
        form.save()
        return redirect('auditorium_list')
    return render(request, 'auditorium_form.html', {'form': form})


def auditorium_delete(request, auditorium_id):
    auditorium = get_object_or_404(Auditorium, id=auditorium_id)
    if request.method == 'POST':
        auditorium.delete()
        return redirect('auditorium_list')
    return render(request, 'auditorium_confirm_delete.html', {'auditorium': auditorium})


# url="auditorium", все аудитории
# url="auditorium/building/<int>", аудитории корпуса
def auditorium_list(request, building_id=None):

    buildings = Building.objects.all()  # все корпуса(для навигации)

    auditoriums = Auditorium.objects.all().order_by('buildingid')  # все аудитории
    # auditoriums = auditoriums.exclude(seatingcapacity__lte=1)  # исключить аудитории с вместимостью <= 1
    if building_id:
        auditoriums = auditoriums.filter(buildingid=building_id).order_by( 'name' )  # аудитории одного корпуса

    form = AuditoriumSearchForm(request.GET)  # создать форму для поиска аудитории
    form.is_valid()
    if form.cleaned_data.get('search'):
        auditoriums = auditoriums.filter(name__icontains=form.cleaned_data['search'])  # найденные аудитории

    paginator = Paginator(auditoriums, 50)  # 50 аудиторий на страницу
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
        'buildings': buildings,
        'auditoriums': auditoriums,
        'form': form,
    }
    return render(request, "auditoriumList.html", context)


# url="auditorium/<int>", конкретная аудитория
def auditorium(request, auditorium_id):
    auditorium = Auditorium.objects.get(id=auditorium_id)  # аудитория, соответствующая auditorium_id
    buildings = Building.objects.all()  # все корпуса(для навигации)
    context = {
        'auditorium': auditorium,
        'buildings': buildings,
    }
    return render(request, "auditorium.html", context)

