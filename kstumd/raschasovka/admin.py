from django.contrib import admin
from .models import Raschasovka, Group, Subject, Teacherdepartment, Teacher, Raschasovkaweeks


class RaschasovkaWeeksinline( admin.StackedInline ):
    model = Raschasovkaweeks
    extra = 1

    def get_max_num(self, request, obj=None, **kwargs):
        return 18


class RaschasovkaAdmin( admin.ModelAdmin ):
    inlines = (RaschasovkaWeeksinline,)


admin.site.register( Raschasovka, RaschasovkaAdmin )
admin.site.register( Raschasovkaweeks )
admin.site.register( Group )
admin.site.register( Subject )
admin.site.register( Teacherdepartment )
admin.site.register( Teacher )
