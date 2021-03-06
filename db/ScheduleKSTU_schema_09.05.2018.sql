USE [ScheduleKSTU]
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 09.05.2018 23:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditorium](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Number] [smallint] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DepartmentId] [smallint] NULL,
	[SeatingCapacity] [smallint] NOT NULL,
	[AuditoriumTypeId] [tinyint] NULL,
	[BuildingId] [tinyint] NULL,
	[Location] [geography] NULL,
 CONSTRAINT [PK_Auditorium] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditoriumType]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriumType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AuditoriumType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Number] [tinyint] NULL,
	[Location] [geography] NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Number] [tinyint] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseGroup]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGroup](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CourseId] [tinyint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
 CONSTRAINT [PK_CourseGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayOfWeek](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[FullName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DayOfWeek] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[FacultyId] [smallint] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[NumberOfStudents] [tinyint] NULL,
	[DepartmentId] [smallint] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hour]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hour](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Begin] [time](0) NOT NULL,
	[End] [time](7) NOT NULL,
	[Number] [tinyint] NOT NULL,
 CONSTRAINT [PK_Hour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Raschasovka]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raschasovka](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Potok] [int] NOT NULL,
	[CourseId] [tinyint] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[TotalHoursForSemestr] [smallint] NOT NULL,
	[AuditoriumId] [smallint] NULL,
	[GroupId] [bigint] NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
	[SemesterId] [tinyint] NOT NULL,
	[SubjectId] [bigint] NOT NULL,
	[SubjectTypeId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Raschasovka] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RaschasovkaWeeks]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaschasovkaWeeks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RaschasovkaId] [int] NOT NULL,
	[WeekId] [tinyint] NOT NULL,
 CONSTRAINT [PK_RaschasovkaWeeksId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RaschasovkaYears]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaschasovkaYears](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Potok] [int] NOT NULL,
	[CourseId] [tinyint] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[TotalHoursForSemestr] [smallint] NOT NULL,
	[AuditoriumId] [smallint] NULL,
	[GroupId] [bigint] NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
	[SemesterId] [tinyint] NOT NULL,
	[SubjectId] [bigint] NOT NULL,
	[SubjectTypeId] [tinyint] NOT NULL,
	[YearId] [tinyint] NOT NULL,
 CONSTRAINT [RaschasovkaYearsId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HourId] [tinyint] NOT NULL,
	[DayOfWeekId] [tinyint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[AuditoriumId] [smallint] NOT NULL,
	[WeekId] [tinyint] NOT NULL,
	[LastChange] [smalldatetime] NULL,
	[IsFinal] [bit] NULL,
	[SubjectId] [bigint] NOT NULL,
	[SubjectTypeId] [tinyint] NOT NULL,
	[SemesterId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduleYears]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleYears](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HourId] [tinyint] NOT NULL,
	[DayOfWeekId] [tinyint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[AuditoriumId] [smallint] NOT NULL,
	[WeekId] [tinyint] NOT NULL,
	[LastChange] [smalldatetime] NULL,
	[IsFinal] [bit] NULL,
	[SubjectId] [bigint] NOT NULL,
	[SubjectTypeId] [tinyint] NOT NULL,
	[SemesterId] [tinyint] NOT NULL,
	[YearId] [tinyint] NOT NULL,
 CONSTRAINT [PK_ScheduleYearsId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SemestersId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectDepartment]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectDepartment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectId] [bigint] NOT NULL,
	[DepartmentId] [smallint] NULL,
 CONSTRAINT [PK_SubjectDepartmentId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectType]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[FullName] [nchar](40) NULL,
 CONSTRAINT [PK_SubjectType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NULL,
	[LastName] [nvarchar](40) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherDepartment]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
 CONSTRAINT [PK_TeacherDepartmentId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherPersonalTime]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherPersonalTime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[HourId] [tinyint] NOT NULL,
	[DayOfWeekId] [tinyint] NOT NULL,
 CONSTRAINT [PK_TeacherPersonalTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Week]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Week](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Znamenatel] [bit] NOT NULL,
 CONSTRAINT [PK_Week] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Years]    Script Date: 09.05.2018 23:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Years](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_YearsId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Auditorium]  WITH CHECK ADD  CONSTRAINT [FK_Auditorium_AuditoriumType] FOREIGN KEY([AuditoriumTypeId])
REFERENCES [dbo].[AuditoriumType] ([Id])
GO
ALTER TABLE [dbo].[Auditorium] CHECK CONSTRAINT [FK_Auditorium_AuditoriumType]
GO
ALTER TABLE [dbo].[Auditorium]  WITH CHECK ADD  CONSTRAINT [FK_Auditorium_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([Id])
GO
ALTER TABLE [dbo].[Auditorium] CHECK CONSTRAINT [FK_Auditorium_Building]
GO
ALTER TABLE [dbo].[Auditorium]  WITH CHECK ADD  CONSTRAINT [FK_Auditorium_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Auditorium] CHECK CONSTRAINT [FK_Auditorium_Department]
GO
ALTER TABLE [dbo].[CourseGroup]  WITH CHECK ADD  CONSTRAINT [FK_CourseGroup_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CourseGroup] CHECK CONSTRAINT [FK_CourseGroup_Course]
GO
ALTER TABLE [dbo].[CourseGroup]  WITH CHECK ADD  CONSTRAINT [FK_CourseGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CourseGroup] CHECK CONSTRAINT [FK_CourseGroup_Group]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Faculty]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Department]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Auditorium] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditorium] ([Id])
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Auditorium]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Course]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Department]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Group]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Semesters] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([Id])
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Semesters]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Subject]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_SubjectType] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([Id])
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_SubjectType]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Teacher]
GO
ALTER TABLE [dbo].[RaschasovkaWeeks]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaWeeks_Raschasovka] FOREIGN KEY([RaschasovkaId])
REFERENCES [dbo].[Raschasovka] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaWeeks] CHECK CONSTRAINT [FK_RaschasovkaWeeks_Raschasovka]
GO
ALTER TABLE [dbo].[RaschasovkaWeeks]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaWeeks_Week] FOREIGN KEY([WeekId])
REFERENCES [dbo].[Week] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaWeeks] CHECK CONSTRAINT [FK_RaschasovkaWeeks_Week]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Auditorium] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditorium] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Auditorium]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Course]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Department]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Group]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Semesters] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Semesters]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Subject]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_SubjectType] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_SubjectType]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Teacher]
GO
ALTER TABLE [dbo].[RaschasovkaYears]  WITH CHECK ADD  CONSTRAINT [FK_RaschasovkaYears_Year] FOREIGN KEY([YearId])
REFERENCES [dbo].[Years] ([Id])
GO
ALTER TABLE [dbo].[RaschasovkaYears] CHECK CONSTRAINT [FK_RaschasovkaYears_Year]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Auditorium] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditorium] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Auditorium]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_DayOfWeek] FOREIGN KEY([DayOfWeekId])
REFERENCES [dbo].[DayOfWeek] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_DayOfWeek]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Group]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Hour] FOREIGN KEY([HourId])
REFERENCES [dbo].[Hour] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Hour]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_SemesterId] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_SemesterId]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Subject]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_SubjectType] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_SubjectType]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Teacher]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Week] FOREIGN KEY([WeekId])
REFERENCES [dbo].[Week] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Week]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Auditorium] FOREIGN KEY([AuditoriumId])
REFERENCES [dbo].[Auditorium] ([Id])
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Auditorium]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_DayOfWeek] FOREIGN KEY([DayOfWeekId])
REFERENCES [dbo].[DayOfWeek] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_DayOfWeek]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Group]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Hour] FOREIGN KEY([HourId])
REFERENCES [dbo].[Hour] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Hour]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_SemesterId] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([Id])
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_SemesterId]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Subject]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_SubjectType] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([Id])
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_SubjectType]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Teacher]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Week] FOREIGN KEY([WeekId])
REFERENCES [dbo].[Week] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Week]
GO
ALTER TABLE [dbo].[ScheduleYears]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleYears_Year] FOREIGN KEY([YearId])
REFERENCES [dbo].[Years] ([Id])
GO
ALTER TABLE [dbo].[ScheduleYears] CHECK CONSTRAINT [FK_ScheduleYears_Year]
GO
ALTER TABLE [dbo].[SubjectDepartment]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDepartment_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[SubjectDepartment] CHECK CONSTRAINT [FK_SubjectDepartment_Department]
GO
ALTER TABLE [dbo].[SubjectDepartment]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDepartment_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectDepartment] CHECK CONSTRAINT [FK_SubjectDepartment_Subject]
GO
ALTER TABLE [dbo].[TeacherDepartment]  WITH CHECK ADD  CONSTRAINT [FK_TeacherDepartment_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[TeacherDepartment] CHECK CONSTRAINT [FK_TeacherDepartment_Department]
GO
ALTER TABLE [dbo].[TeacherDepartment]  WITH CHECK ADD  CONSTRAINT [FK_TeacherDepartment_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[TeacherDepartment] CHECK CONSTRAINT [FK_TeacherDepartment_Teacher]
GO
ALTER TABLE [dbo].[TeacherPersonalTime]  WITH CHECK ADD  CONSTRAINT [FK_TeacherPersonalTime_DayOfWeek] FOREIGN KEY([DayOfWeekId])
REFERENCES [dbo].[DayOfWeek] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TeacherPersonalTime] CHECK CONSTRAINT [FK_TeacherPersonalTime_DayOfWeek]
GO
ALTER TABLE [dbo].[TeacherPersonalTime]  WITH CHECK ADD  CONSTRAINT [FK_TeacherPersonalTime_Hour] FOREIGN KEY([HourId])
REFERENCES [dbo].[Hour] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TeacherPersonalTime] CHECK CONSTRAINT [FK_TeacherPersonalTime_Hour]
GO
ALTER TABLE [dbo].[TeacherPersonalTime]  WITH CHECK ADD  CONSTRAINT [FK_TeacherPersonalTime_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TeacherPersonalTime] CHECK CONSTRAINT [FK_TeacherPersonalTime_Teacher]
GO
