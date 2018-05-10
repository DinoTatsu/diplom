from django.db import models


class Auditorium(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', blank=True, null=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=100, verbose_name="Название")  # Field name made lowercase.
    departmentid = models.ForeignKey('Department', models.DO_NOTHING, db_column='DepartmentId', blank=True, null=True, verbose_name="Кафедра")  # Field name made lowercase.
    seatingcapacity = models.SmallIntegerField(db_column='SeatingCapacity', verbose_name="Вместимость")  # Field name made lowercase.
    auditoriumtypeid = models.ForeignKey('Auditoriumtype', models.DO_NOTHING, db_column='AuditoriumTypeId', blank=True, null=True, verbose_name="Тип аудитории")  # Field name made lowercase.
    buildingid = models.ForeignKey('Building', models.DO_NOTHING, db_column='BuildingId', blank=True, null=True, verbose_name="Корпус")  # Field name made lowercase.
    location = models.BinaryField(db_column='Location', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Auditorium'
        verbose_name = "Аудитория"
        verbose_name_plural = "Аудитории"


class Auditoriumtype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=15, verbose_name="Сокращенное навзание")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=50, verbose_name="Полное название")  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'AuditoriumType'
        verbose_name = "Тип аудитории"
        verbose_name_plural = "Типы аудиторий"


class Building(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100, blank=True, null=True, verbose_name="Название")  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', blank=True, null=True, verbose_name="Номер корпуса")  # Field name made lowercase.
    location = models.BinaryField(db_column='Location', blank=True, null=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=100, blank=True, null=True, verbose_name="Адрес")  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'Building'
        verbose_name = "Корпус"
        verbose_name_plural = "Корпусы"


class Department(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=30, verbose_name="Кратко")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100, verbose_name="Полное название")  # Field name made lowercase.
    facultyid = models.ForeignKey('Faculty', models.DO_NOTHING, db_column='FacultyId', blank=True, null=True, verbose_name="Факультет")  # Field name made lowercase.

    def __str__(self):
        return self.name + "(" + self.fullname + ")"
    class Meta:
        managed = False
        db_table = 'Department'
        verbose_name = "Кафедра"
        verbose_name_plural = "Кафедры"


class Faculty(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=100, verbose_name="Кратко")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100, verbose_name="Полное название")  # Field name made lowercase.

    def __str__(self):
        return self.name + "(" + self.fullname + ")"

    class Meta:
        managed = False
        db_table = 'Faculty'
        verbose_name = "Факультет"
        verbose_name_plural = "Факультеты"

