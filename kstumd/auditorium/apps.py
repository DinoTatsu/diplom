from django.apps import AppConfig


class AuditoriumConfig(AppConfig):
    name = 'auditorium'

class AuditoriumAppConfig(AppConfig):
    name = 'auditorium' # Здесь указываем исходное имя приложения
    verbose_name = "Аудитории" # А здесь, имя которое необходимо отобразить в админке