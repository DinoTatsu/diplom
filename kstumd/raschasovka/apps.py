from django.apps import AppConfig

class RaschasovkaConfig(AppConfig):
    name = 'raschasovka'

class RaschasovkaAppConfig(AppConfig):
    name = 'raschasovka' # Здесь указываем исходное имя приложения
    verbose_name = "Расчасовка" # А здесь, имя которое необходимо отобразить в админке