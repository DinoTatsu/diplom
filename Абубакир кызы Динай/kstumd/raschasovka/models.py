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


class Raschasovka(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    potok = models.IntegerField(db_column='Potok', verbose_name="Поток")  # Field name made lowercase.
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='CourseId', verbose_name="Курс")  # Field name made lowercase.
    teacherid = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='TeacherId', verbose_name="Преподаватель")  # Field name made lowercase.
    subjectwithtypeid = models.ForeignKey('Subjectwithtype', models.DO_NOTHING, db_column='SubjectWithTypeId', verbose_name="Предмет и тип")  # Field name made lowercase.
    totalhoursforsemestr = models.SmallIntegerField(db_column='TotalHoursForSemestr', verbose_name="Всего часов в семестре")  # Field name made lowercase.
    totalhoursforweek = models.SmallIntegerField(db_column='TotalHoursForWeek', verbose_name="Часов в неделю")  # Field name made lowercase.
    weekid = models.ForeignKey('Week', models.DO_NOTHING, db_column='WeekId', verbose_name="Неделя")  # Field name made lowercase.
    auditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='AuditoriumId', blank=True, null=True, verbose_name="Аудитория")  # Field name made lowercase.

    def __str__(self):
        return self.teacherid + self.subjectwithtypeid
    class Meta:
        managed = False
        db_table = 'Raschasovka'
        verbose_name = "Расчасовка"
        verbose_name_plural = "Расчасовка"


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
