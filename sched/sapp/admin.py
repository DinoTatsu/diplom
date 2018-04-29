from django.contrib import admin
from .models import Auditorium, Auditoriumtype, Building, \
    Course, Coursegroup, Dayofweek, Department, Faculty, Group, \
    Hour, Raschasovka, Schedule, \
    Subjecttype, Subject, Subjectwithtype, \
    Teacher, Teacherpersonaltime, Week

admin.site.register(Auditorium)
admin.site.register(Auditoriumtype)
admin.site.register(Building)
admin.site.register(Course)
admin.site.register(Coursegroup)
admin.site.register(Dayofweek)
admin.site.register(Department)
admin.site.register(Faculty)
admin.site.register(Group)
admin.site.register(Hour)
admin.site.register(Raschasovka)
admin.site.register(Schedule)
admin.site.register(Subjecttype)
admin.site.register(Subject)
admin.site.register(Subjectwithtype)
admin.site.register(Teacher)
admin.site.register(Teacherpersonaltime)
admin.site.register(Week)