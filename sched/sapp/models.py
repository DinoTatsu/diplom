# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Auditorium(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=50, blank=True, null=True)  # Field name made lowercase.
    departmentid = models.ForeignKey('Department', models.DO_NOTHING, db_column='DepartmentId', blank=True, null=True)  # Field name made lowercase.
    seatingcapacity = models.SmallIntegerField(db_column='SeatingCapacity')  # Field name made lowercase.
    auditoriumtypeid = models.ForeignKey('Auditoriumtype', models.DO_NOTHING, db_column='AuditoriumTypeId')  # Field name made lowercase.
    buildingid = models.ForeignKey('Building', models.DO_NOTHING, db_column='BuildingId')  # Field name made lowercase.
    location = models.BinaryField(db_column='Location', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Auditorium'
        verbose_name="Аудитория"
        verbose_name_plural = "Аудитории"


class Auditoriumtype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=50)  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'AuditoriumType'
        verbose_name = "Тип аудитории"
        verbose_name_plural = "Типы аудиторий"


class Building(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=60, blank=True, null=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.
    location = models.BinaryField(db_column='Location')  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=100, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'Building'
        verbose_name = "Корпус"
        verbose_name_plural = "Корпуса"


class Course(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.

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

    # TODO
    def __str__(self):
        return str(self.courseid.verbose_name) + self.groupid.verbose_name

    class Meta:
        managed = False
        db_table = 'CourseGroup'
        verbose_name = "Связь курса и группы"
        verbose_name_plural = "Связи курса и группы"


class Dayofweek(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=20)  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'DayOfWeek'
        verbose_name = "День недели"
        verbose_name_plural = "Дни недели"


class Department(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=80)  # Field name made lowercase.
    facultyid = models.ForeignKey('Faculty', models.DO_NOTHING, db_column='FacultyId')  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Department'
        verbose_name = "Кафедра"
        verbose_name_plural = "Кафедры"


class Faculty(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=60)  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Faculty'
        verbose_name = "Факультет"
        verbose_name_plural = "Факультеты"


class Group(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=20)  # Field name made lowercase.
    numberofstudents = models.SmallIntegerField(db_column='NumberOfStudents')  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId')  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Group'
        verbose_name = "Группа"
        verbose_name_plural = "Группы"


class Hour(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    begin = models.CharField(db_column='Begin', max_length=8)  # Field name made lowercase.
    end = models.CharField(db_column='End', max_length=16)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.

    def __str__(self):
        return str(self.number) + "-я пара"

    class Meta:
        managed = False
        db_table = 'Hour'
        verbose_name = "Пара"
        verbose_name_plural = "Пары"


class Raschasovka(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    potok = models.IntegerField(db_column='Potok')  # Field name made lowercase.
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='CourseId')  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId')  # Field name made lowercase.
    subjectwithtypeid = models.ForeignKey('Subjectwithtype', models.DO_NOTHING, db_column='SubjectWithTypeId')  # Field name made lowercase.
    totalhoursforsemestr = models.SmallIntegerField(db_column='TotalHoursForSemestr')  # Field name made lowercase.
    totalhoursforweek = models.SmallIntegerField(db_column='TotalHoursForWeek')  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId')  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.id

    class Meta:
        managed = False
        db_table = 'Raschasovka'
        verbose_name = "Расчасовка"
        verbose_name_plural = "Расчасовка"


class Schedule(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId')  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId')  # Field name made lowercase.
    groupid = models.ForeignKey(Group, models.DO_NOTHING, db_column='GroupId')  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId')  # Field name made lowercase.
    subjectwithtypeid = models.ForeignKey('Subjectwithtype', models.DO_NOTHING, db_column='SubjectWithTypeId')  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId')  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId')  # Field name made lowercase.
    lastchange = models.DateTimeField(db_column='LastChange', blank=True, null=True)  # Field name made lowercase.
    isfinal = models.NullBooleanField(db_column='IsFinal')  # Field name made lowercase.

    def __str__(self):
        return self.id

    class Meta:
        managed = False
        db_table = 'Schedule'
        verbose_name = "Расписание"
        verbose_name_plural = "Расписание"


class Subject(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=15)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=50)  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId')  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'Subject'
        verbose_name = "Предмет"
        verbose_name_plural = "Предметы"


class Subjecttype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=30)  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'SubjectType'
        verbose_name = "Тип занятия"
        verbose_name_plural = "Тип занятий"


class Subjectwithtype(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    subjectid = models.ForeignKey(Subject, models.DO_NOTHING, db_column='SubjectId')  # Field name made lowercase.
    subjecttypeid = models.ForeignKey(Subjecttype, models.DO_NOTHING, db_column='SubjectTypeId')  # Field name made lowercase.
    preferauditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='PreferAuditoriumId', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return str(self.subjectid.name) + str(self.subjecttypeid.name)

    class Meta:
        managed = False
        db_table = 'SubjectWithType'
        verbose_name = "Тип занятий, предмет"
        verbose_name_plural = "Тип занятий, предмет"


class Teacher(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='FirstName', max_length=30)  # Field name made lowercase.
    lastname = models.CharField(db_column='LastName', max_length=30)  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId')  # Field name made lowercase.

    def __str__(self):
        return str(self.firstname) + str(self.lastname)

    class Meta:
        managed = False
        db_table = 'Teacher'
        verbose_name = "Преподаватель"
        verbose_name_plural = "Преподаватели"


class Teacherpersonaltime(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    teacherid = models.ForeignKey(Teacher, models.DO_NOTHING, db_column='TeacherId')  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId')  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId')  # Field name made lowercase.

    def __str__(self):
        return self.id

    class Meta:
        managed = False
        db_table = 'TeacherPersonalTime'
        verbose_name = "Зарезервированнное время преподавателя"
        verbose_name_plural = "Зарезервированное время преподавателя"


class Week(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.
    znamenatel = models.BooleanField(db_column='Znamenatel')  # Field name made lowercase.

    def __str__(self):
        return str(self.number) + "-я неделя"

    class Meta:
        managed = False
        db_table = 'Week'
        verbose_name = "Неделя"
        verbose_name_plural = "Недели"


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
        managed = False
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


class Sysdiagrams(models.Model):
    name = models.CharField(max_length=128)
    principal_id = models.IntegerField()
    diagram_id = models.AutoField(primary_key=True)
    version = models.IntegerField(blank=True, null=True)
    definition = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sysdiagrams'
        unique_together = (('principal_id', 'name'),)
