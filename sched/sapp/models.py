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


class Auditoriumtype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=15)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=50)  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'AuditoriumType'


class Building(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100, blank=True, null=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number', blank=True, null=True)  # Field name made lowercase.
    location = models.BinaryField(db_column='Location', blank=True, null=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=100, blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.fullname

    class Meta:
        managed = False
        db_table = 'Building'


class Course(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Course'


class Coursegroup(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='CourseId')  # Field name made lowercase.
    groupid = models.ForeignKey('Group', models.DO_NOTHING, db_column='GroupId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CourseGroup'


class Dayofweek(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=10)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DayOfWeek'


class Department(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=30)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100)  # Field name made lowercase.
    facultyid = models.ForeignKey('Faculty', models.DO_NOTHING, db_column='FacultyId', blank=True, null=True)  # Field name made lowercase.

    def __str__(self):
        return self.name
    class Meta:
        managed = False
        db_table = 'Department'


class Faculty(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=100)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=100)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Faculty'


class Group(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=20)  # Field name made lowercase.
    numberofstudents = models.SmallIntegerField(db_column='NumberOfStudents')  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Group'


class Hour(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    begin = models.CharField(db_column='Begin', max_length=8)  # Field name made lowercase.
    end = models.CharField(db_column='End', max_length=16)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Hour'


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

    class Meta:
        managed = False
        db_table = 'Raschasovka'


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

    class Meta:
        managed = False
        db_table = 'Schedule'


class Subject(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=15)  # Field name made lowercase.
    fullname = models.CharField(db_column='FullName', max_length=50)  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Subject'


class Subjecttype(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=30)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SubjectType'


class Subjectwithtype(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    subjectid = models.ForeignKey(Subject, models.DO_NOTHING, db_column='SubjectId')  # Field name made lowercase.
    subjecttypeid = models.ForeignKey(Subjecttype, models.DO_NOTHING, db_column='SubjectTypeId')  # Field name made lowercase.
    preferauditoriumid = models.ForeignKey(Auditorium, models.DO_NOTHING, db_column='PreferAuditoriumId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SubjectWithType'


class Teacher(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='FirstName', max_length=30)  # Field name made lowercase.
    lastname = models.CharField(db_column='LastName', max_length=30)  # Field name made lowercase.
    departmentid = models.ForeignKey(Department, models.DO_NOTHING, db_column='DepartmentId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Teacher'


class Teacherpersonaltime(models.Model):
    id = models.BigAutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    teacherid = models.ForeignKey(Teacher, models.DO_NOTHING, db_column='TeacherId')  # Field name made lowercase.
    hourid = models.ForeignKey(Hour, models.DO_NOTHING, db_column='HourId')  # Field name made lowercase.
    dayofweekid = models.ForeignKey(Dayofweek, models.DO_NOTHING, db_column='DayOfWeekId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'TeacherPersonalTime'


class Week(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    number = models.SmallIntegerField(db_column='Number')  # Field name made lowercase.
    znamenatel = models.BooleanField(db_column='Znamenatel')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Week'


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
