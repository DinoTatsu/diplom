# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

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


class Course(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер курса")  # Field name made lowercase.

    def __str__(self):
        return str(self.number) + "-й курс"
    class Meta:
        managed = False
        db_table = 'Course'
        verbose_name = "Курс"
        verbose_name_plural = "Курс"


class Coursegroup(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='CourseId')  # Field name made lowercase.
    groupid = models.ForeignKey('Group', models.DO_NOTHING, db_column='GroupId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CourseGroup'


class Dayofweek(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер")  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10, verbose_name="Кратко")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=20, verbose_name="Полное навзание")  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'DayOfWeek'
        verbose_name = "День недели"
        verbose_name_plural = "День недели"


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
        verbose_name_plural = "Факультет"


class Group(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=20, verbose_name="Навзание")  # Field name made lowercase.
    numberofstudents = models.SmallIntegerField(db_column='NumberOfStudents', verbose_name="Количество студентов")  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId', verbose_name="Кафедра")  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Group'
        verbose_name = "Группа"
        verbose_name_plural = "Группы"


class Hour(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    begin = models.CharField(db_column='Begin', max_length=8, verbose_name="Начало")  # Field name made lowercase.
    end = models.CharField(db_column='End', max_length=8, verbose_name="Конец")  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер")  # Field name made lowercase.

    def __str__(self):
        return "Пара "+str(self.number)+": "+str(self.begin)+" - "+str(self.end)

    class Meta:
        managed = False
        db_table = 'Hour'
        verbose_name = "Пара"
        verbose_name_plural = "Пары"


class Raschasovka(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    potok = models.IntegerField(db_column='Potok', verbose_name="Поток")  # Field name made lowercase.
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='CourseId', verbose_name="Курс")  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватель")  # Field name made lowercase.
    subjectwithtypeid = models.ForeignKey('Subjectwithtype', models.DO_NOTHING, db_column='SubjectWithTypeId', verbose_name="Предмет и тип")  # Field name made lowercase.
    totalhoursforsemestr = models.SmallIntegerField(db_column='TotalHoursForSemestr', verbose_name="Всего часов в семестре")  # Field name made lowercase.
    totalhoursforweek = models.SmallIntegerField(db_column='TotalHoursForWeek', verbose_name="Часов в неделю")  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', blank=True, null=True, verbose_name="Аудитория")  # Field name made lowercase.
    groupid = models.ForeignKey( Group, models.DO_NOTHING, db_column='GroupId', verbose_name="Группа" )  # Field name made lowercase.
    departmentid = models.ForeignKey( Department, models.DO_NOTHING,
                                      db_column='DepartmentId', verbose_name="Кафедра" )  # Field name made lowercase.
    semesterid = models.ForeignKey( 'Semesters', models.DO_NOTHING,
                                    db_column='SemesterId', verbose_name="Семестр")  # Field name made lowercase.
    yearid = models.ForeignKey( 'Years', models.DO_NOTHING, db_column='YearId', verbose_name="Год")  # Field name made lowercase.

    def __str__(self):
        return self.teacherid + self.subjectwithtypeid
    class Meta:
        managed = False
        db_table = 'Raschasovka'
        verbose_name = "Расчасовка"
        verbose_name_plural = "Расчасовка"


class Raschasovkaweeks(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    raschasovkaid = models.ForeignKey(Raschasovka, models.DO_NOTHING, db_column='RaschasovkaId', verbose_name="Расчасовка")  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId', verbose_name="Номер недели")  # Field name made lowercase.

    def __str__(self):
        return self.raschasovkaid + "  " + self.weekid

    class Meta:
        managed = False
        db_table = 'RaschasovkaWeeks'
        verbose_name = "Неделя для расчасовка"
        verbose_name_plural = "Недели для расчасовки"


class Schedule(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId', verbose_name="Пара")  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId', verbose_name="День недели")  # Field name made lowercase.
    groupid = models.ForeignKey(Group, models.DO_NOTHING, db_column='GroupId', verbose_name="Группа")  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватедь")  # Field name made lowercase.
    subjectwithtypeid = models.ForeignKey('Subjectwithtype', models.DO_NOTHING, db_column='SubjectWithTypeId', verbose_name="Предмет и тип")  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', verbose_name="Аудитория")  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId', verbose_name="Неделя")  # Field name made lowercase.
    lastchange = models.DateTimeField(db_column='LastChange', blank=True, null=True, verbose_name="Последнее изменение")  # Field name made lowercase.
    isfinal = models.NullBooleanField(db_column='IsFinal', verbose_name="Финальное")  # Field name made lowercase.

    def __str__(self):
        return self.hourid + self.weekid + self.groupid

    class Meta:
        managed = False
        db_table = 'Schedule'
        verbose_name = "Расписание"
        verbose_name_plural = "Расписание"

class Semesters(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10, verbose_name="Название семестра")  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Semesters'
        verbose_name = "Семестр"
        verbose_name_plural = "Семестр"


class Subject(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=15, verbose_name="Кратко")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=50, verbose_name="Название")  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId', verbose_name="Кафедра")  # Field name made lowercase.

    def __str__(self):
        return self.name + "(" + self.fullname + ")"

    class Meta:
        managed = False
        db_table = 'Subject'
        verbose_name = "Предмет"
        verbose_name_plural = "Предметы"


class Subjecttype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=30, verbose_name="Название")  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'SubjectType'
        verbose_name = "Тип учебного занятия"
        verbose_name_plural = "Типы учебных занятий"


class Subjectwithtype(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    subjectid = models.ForeignKey(Subject, models.DO_NOTHING, db_column='SubjectId', verbose_name="Предмет")  # Field name made lowercase.
    subjecttypeid = models.ForeignKey(Subjecttype, models.DO_NOTHING, db_column='SubjectTypeId', verbose_name="Тип занятий")  # Field name made lowercase.
    preferauditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='PreferAuditoriumId', blank=True, null=True, verbose_name="Предпочтительная аудитория")  # Field name made lowercase.

    def __str__(self):
        return self.subjectid +", "+ self.subjecttypeid
    class Meta:
        managed = False
        db_table = 'SubjectWithType'
        verbose_name = "Предмет и тип занятий"
        verbose_name_plural = "Предметы и типы занятий"


class Teacher(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='FirstName', max_length=30, blank=True, null=True, verbose_name="Фамилия")  # Field name made lowercase.
    lastname = models.CharField(db_column='LastName', max_length=30, blank=True, null=True, verbose_name="Имя")  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId', blank=True, null=True, verbose_name="Кафедра")  # Field name made lowercase.

    def __str__(self):
        return self.firstname + " " + self.lastname
    class Meta:
        managed = False
        db_table = 'Teacher'
        verbose_name = "Преподаватель"
        verbose_name_plural = "Преподаватели"


class Teacherpersonaltime(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    teacherid = models.ForeignKey(Teacher, models.DO_NOTHING, db_column='TeacherId', verbose_name="")  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId', verbose_name="")  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId', verbose_name="")  # Field name made lowercase.

    def __str__(self):
        return self.teacherid + ": " + self.dayofweekid + ", " + self.hourid

    class Meta:
        managed = False
        db_table = 'TeacherPersonalTime'
        verbose_name = "Зарезервированное время преподавателя"
        verbose_name_plural = "Зарезервированное время преподавателя"


class Week(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер недели")  # Field name made lowercase.
    znamenatel = models.BooleanField(db_column='Znamenatel', verbose_name="Знаменатель?")  # Field name made lowercase.

    def __str__(self):
        return "Неделя " + str(self.number)

    class Meta:
        managed = False
        db_table = 'Week'
        verbose_name = "Неделя"
        verbose_name_plural = "Недели"


class Years(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10, verbose_name="Год")  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Years'
        verbose_name = "Год"
        verbose_name_plural="Год"

class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = \
            False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
