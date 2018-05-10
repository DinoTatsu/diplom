from django.apps import AppConfig


class ScheduleConfig(AppConfig):
    name = 'schedule'

class ScheduleAppConfig(AppConfig):
    name = 'schedule' # Здесь указываем исходное имя приложения
    verbose_name = "Расписание" # А здесь, имя которое необходимо отобразить в админке