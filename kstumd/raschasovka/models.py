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

    class Meta:
        managed = False
        db_table = 'Building'
        verbose_name = "Корпус"
        verbose_name_plural = "Корпусы"


class Course(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер курса")  # Field name made lowercase.

    def __str__(self):
        return str(self.number)

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
        verbose_name = "Курс группы"
        verbose_name_plural = "Курс группы"


class Dayofweek(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер")  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10, verbose_name="Кратко")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=20, verbose_name="Полное навзание")  # Field name made lowercase.

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
        return self.name
    class Meta:
        managed = False
        db_table = 'Department'
        verbose_name = "Кафедра"
        verbose_name_plural = "Кафедры"


class Faculty(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=100, verbose_name="Кратко")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100, verbose_name="Полное название")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Faculty'
        verbose_name = "Факультет"
        verbose_name_plural = "Факультеты"


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
    totalhoursforsemestr = models.SmallIntegerField(db_column='TotalHoursForSemestr', verbose_name="Всего часов за семестр")  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', blank=True, null=True, verbose_name="Аудитория")  # Field name made lowercase.
    groupid = models.ForeignKey(Group, models.DO_NOTHING, db_column='GroupId', verbose_name="Группа")  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId', verbose_name="Кафедра")  # Field name made lowercase.
    semesterid = models.ForeignKey('Semesters', models.DO_NOTHING, db_column='SemesterId', verbose_name="Семестр")  # Field name made lowercase.
    subjectid = models.ForeignKey('Subject', models.DO_NOTHING, db_column='SubjectId', verbose_name="Предмет")  # Field name made lowercase.
    subjecttypeid = models.ForeignKey('Subjecttype', models.DO_NOTHING, db_column='SubjectTypeId', verbose_name="Тип предмета")  # Field name made lowercase.
    numberofstudents = models.SmallIntegerField(db_column='NumberOfStudents', verbose_name="Количество студентов")

    def __str__(self):
        return self.departmentid.name
    class Meta:
        managed = False
        db_table = 'Raschasovka'
        verbose_name = "Расчасовка"
        verbose_name_plural = "Расчасовка"


class Raschasovkaweeks(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    raschasovkaid = models.ForeignKey(Raschasovka, models.DO_NOTHING, db_column='RaschasovkaId', verbose_name="Расчасовка")  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId', verbose_name="Номер недели")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'RaschasovkaWeeks'
        verbose_name = "Неделя для расчасовка"
        verbose_name_plural = "Недели для расчасовки"


class Schedule(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId', verbose_name="Номер пары")  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId', verbose_name="День недели")  # Field name made lowercase.
    groupid = models.ForeignKey(Group, models.DO_NOTHING, db_column='GroupId', verbose_name="Группа")  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватель")  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', verbose_name="Аудитория")  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId', verbose_name="Номер недели")  # Field name made lowercase.
    lastchange = models.DateTimeField(db_column='LastChange', blank=True, null=True)  # Field name made lowercase.
    isfinal = models.NullBooleanField(db_column='IsFinal')  # Field name made lowercase.
    subjectid = models.ForeignKey('Subject', models.DO_NOTHING, db_column='SubjectId', verbose_name="Предмет")  # Field name made lowercase.
    subjecttypeid = models.ForeignKey('Subjecttype', models.DO_NOTHING, db_column='SubjectTypeId', verbose_name="Тип предмета")  # Field name made lowercase.
    semesterid = models.ForeignKey('Semesters', models.DO_NOTHING, db_column='SemesterId', verbose_name="Семестр")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Schedule'
        verbose_name = "Расписание"
        verbose_name_plural = "Расписание"


class Scheduleyears(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId', verbose_name="Номер пары")  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId', verbose_name="День недели")  # Field name made lowercase.
    groupid = models.ForeignKey(Group, models.DO_NOTHING, db_column='GroupId', verbose_name="Группа")  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватель")  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', verbose_name="Аудитория")  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId', verbose_name="Номер недели")  # Field name made lowercase.
    lastchange = models.DateTimeField(db_column='LastChange', blank=True, null=True)  # Field name made lowercase.
    isfinal = models.NullBooleanField(db_column='IsFinal')  # Field name made lowercase.
    subjectid = models.ForeignKey('Subject', models.DO_NOTHING, db_column='SubjectId', verbose_name="Предмет")  # Field name made lowercase.
    subjecttypeid = models.ForeignKey('Subjecttype', models.DO_NOTHING, db_column='SubjectTypeId', verbose_name="Тип предмета")  # Field name made lowercase.
    semesterid = models.ForeignKey('Semesters', models.DO_NOTHING, db_column='SemesterId', verbose_name="Семестр")  # Field name made lowercase.
    yearid = models.ForeignKey('Years', models.DO_NOTHING, db_column='YearId', verbose_name="Год")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ScheduleYears'
        verbose_name = "Расписание и год"
        verbose_name_plural = "Расписание и год"


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
    name = models.CharField(db_column='Name', max_length=15, verbose_name="Сокращенное название")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=50, verbose_name="Название предмета")  # Field name made lowercase.

    def __str__(self):
        if not self.fullname:
            return str(self.name)
        return str(self.fullname)

    class Meta:
        managed = False
        db_table = 'Subject'
        verbose_name = "Предмет"
        verbose_name_plural = "Предметы"


class Subjectdepartment(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    subjectid = models.ForeignKey(Subject, models.DO_NOTHING, db_column='SubjectId', verbose_name="Предмет")  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId', blank=True, null=True, verbose_name="Кафедра")  # Field name made lowercase.

    def __str__(self):
        return self.subjectid.name + ", " + self.departmentid.name

    class Meta:
        managed = False
        db_table = 'SubjectDepartment'
        verbose_name = "Предмет, кафедра"
        verbose_name_plural = "Предмет, кафедра"


class Subjecttype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10, blank=True, null=True, verbose_name="Сокращенное название")  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=40, blank=True, null=True, verbose_name="Тип предмета")  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'SubjectType'
        verbose_name = "Тип учебного занятия"
        verbose_name_plural = "Типы учебных занятий"


class Teacher(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='FirstName', max_length=30, blank=True, null=True, verbose_name="Фамилия")  # Field name made lowercase.
    lastname = models.CharField(db_column='LastName', max_length=30, blank=True, null=True, verbose_name="Имя")  # Field name made lowercase.

    def __str__(self):
        return self.firstname + " " + self.lastname

    class Meta:
        managed = False
        db_table = 'Teacher'
        verbose_name = "Преподаватель"
        verbose_name_plural = "Преподаватели"


class Teacherdepartment(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    teacherid = models.ForeignKey(Teacher, models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватель")  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId', verbose_name="Кафедра")  # Field name made lowercase.

    def __str__(self):
        return self.teacherid.lastname+" " + self.teacherid.firstname + " ("+self.departmentid.name+")"

    class Meta:
        managed = False
        db_table = 'TeacherDepartment'
        verbose_name = "Преподаватель, кафедра"
        verbose_name_plural = "Преподаватель, кафедра"


class Teacherpersonaltime(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    teacherid = models.ForeignKey(Teacher, models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватель")  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId', verbose_name="Пара")  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId', verbose_name="День недели")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'TeacherPersonalTime'
        verbose_name = "Зарезервированное время преподавателя"
        verbose_name_plural = "Зарезервированное время преподавателя"


class Week(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', verbose_name="Номер недели")  # Field name made lowercase.
    znamenatel = models.BooleanField(db_column='Znamenatel', verbose_name="Знаменатель?")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Week'
        verbose_name = "Неделя"
        verbose_name_plural = "Недели"


class Years(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10, verbose_name="Год")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Years'
        verbose_name = "Год"
        verbose_name_plural="Год"
