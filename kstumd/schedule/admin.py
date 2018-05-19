from django.contrib import admin
from .models import Schedule, Teacher, Subject, Teacherdepartment, Subjectdepartment, Group, Scheduleyears

admin.site.register(Schedule)
admin.site.register(Teacher)
admin.site.register(Subject)
admin.site.register(Teacherdepartment)
admin.site.register(Subjectdepartment)
admin.site.register(Group)
