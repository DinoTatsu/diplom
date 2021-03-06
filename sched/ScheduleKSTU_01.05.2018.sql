USE [ScheduleKSTU]
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[AuditoriumType]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[auth_group]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime] NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[CourseGroup]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime] NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[django_session]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[NumberOfStudents] [tinyint] NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hour]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[Raschasovka]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raschasovka](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Potok] [int] NOT NULL,
	[CourseId] [tinyint] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[SubjectWithTypeId] [bigint] NOT NULL,
	[TotalHoursForSemestr] [smallint] NOT NULL,
	[TotalHoursForWeek] [tinyint] NOT NULL,
	[WeekId] [tinyint] NOT NULL,
	[AuditoriumId] [smallint] NULL,
 CONSTRAINT [PK_Raschasovka] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 01.05.2018 23:36:50 ******/
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
	[SubjectWithTypeId] [bigint] NOT NULL,
	[AuditoriumId] [smallint] NOT NULL,
	[WeekId] [tinyint] NOT NULL,
	[LastChange] [smalldatetime] NULL,
	[IsFinal] [bit] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectType]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_SubjectType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectWithType]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectWithType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectId] [bigint] NOT NULL,
	[SubjectTypeId] [tinyint] NOT NULL,
	[PreferAuditoriumId] [smallint] NULL,
 CONSTRAINT [PK_SubjectWithType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 01.05.2018 23:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[DepartmentId] [smallint] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherPersonalTime]    Script Date: 01.05.2018 23:36:50 ******/
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
/****** Object:  Table [dbo].[Week]    Script Date: 01.05.2018 23:36:50 ******/
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
SET IDENTITY_INSERT [dbo].[Auditorium] ON 

INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (1, NULL, N'1/167', 70, 28, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (2, NULL, N'1/169', 70, 5, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (3, NULL, N'2/325', 69, 60, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (4, NULL, N'2/410', 36, 8, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (5, NULL, N'1/171', 70, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (6, NULL, N'1/172', 70, 48, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (7, NULL, N'1/323', 70, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (8, NULL, N'1/324а', 41, 7, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (9, NULL, N'3/109', 44, 12, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (10, NULL, N'3/118', 44, 2, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (11, NULL, N'3/119', 44, 20, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (12, NULL, N'3/121', 107, 20, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (13, NULL, N'3/121а', 107, 12, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (14, NULL, N'3/207', 44, 42, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (15, NULL, N'3/208', 44, 6, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (16, NULL, N'3/209', 44, 16, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (17, NULL, N'3/209а', 44, 2, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (18, NULL, N'4/101', 42, 24, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (19, NULL, N'2/416', 36, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (20, NULL, N'2/418', 36, 3, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (21, NULL, N'2/419', 36, 20, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (22, NULL, N'2/419а', 36, 0, 7, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (23, NULL, N'2/422', 36, 18, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (24, NULL, N'2/427', 36, 19, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (25, NULL, N'1/103', 91, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (26, NULL, N'1/261', 69, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (27, NULL, N'1/262', NULL, 9, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (28, NULL, N'1/263', NULL, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (29, NULL, N'1/264', NULL, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (30, NULL, N'1/267', NULL, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (31, NULL, N'2/320', 69, 5, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (32, NULL, N'2/322', 69, 3, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (33, NULL, N'2/323', 69, 3, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (34, NULL, N'2/324', 69, 3, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (35, NULL, N'3/203а', 60, 7, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (36, NULL, N'5/101', 54, 6, 10, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (37, NULL, N'5/203в', 59, 28, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (38, NULL, N'1/210', 51, 10, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (39, NULL, N'2/421', NULL, 15, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (40, NULL, N'2/510', 102, 104, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (41, NULL, N'2/514', 102, 52, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (42, NULL, N'2/522', 69, 224, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (43, NULL, N'2/606', 69, 68, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (44, NULL, N'2/519', 73, 25, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (45, NULL, N'2/603', 69, 36, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (46, NULL, N'2/604', 73, 30, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (47, NULL, N'2/610а', 73, 8, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (48, NULL, N'2/616', 73, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (49, NULL, N'2/502б', 38, 0, 7, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (50, NULL, N'2/516', 38, 10, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (51, NULL, N'2/516а', 38, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (52, NULL, N'2/602', 38, 16, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (53, NULL, N'2/619', 38, 10, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (54, NULL, N'2/624', 38, 14, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (55, NULL, N'1/211', 94, 20, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (56, NULL, N'1/212', 69, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (57, NULL, N'1/215', 47, 50, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (58, NULL, N'1/216', 47, 50, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (59, NULL, N'1/217', 47, 0, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (60, NULL, N'1/218', 80, 3, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (61, NULL, N'1/219', 47, 60, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (62, NULL, N'1/220', 47, 13, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (63, NULL, N'1/222', 47, 24, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (64, NULL, N'2/319', 69, 4, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (65, NULL, N'1/353', 69, 5, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (66, NULL, N'1/354', 69, 3, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (67, NULL, N'1/354а', 69, 2, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (68, NULL, N'1/352', 69, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (69, NULL, N'2/605', 34, 18, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (70, NULL, N'2/608', 34, 20, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (71, NULL, N'3/206', 46, 32, 4, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (72, NULL, N'1/201', 69, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (73, NULL, N'1/259', NULL, 30, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (74, NULL, N'1/276', 69, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (75, NULL, N'1/314', 69, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (76, NULL, N'3/113', 69, 0, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (77, NULL, N'4/109', 69, 0, 8, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (78, NULL, N'4/110', 69, 0, 8, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (79, NULL, N'4/206', 42, 12, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (80, NULL, N'2/303', 79, 11, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (81, NULL, N'2/404', 79, 24, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (82, NULL, N'2/501', 79, 36, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (83, NULL, N'2/501а', 79, 0, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (84, NULL, N'2/511', 102, 48, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (85, NULL, N'2/521', 89, 80, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (86, NULL, N'2/400', NULL, 4, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (87, NULL, N'2/401', NULL, 30, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (88, NULL, N'2/420', 90, 12, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (89, NULL, N'2/432', NULL, 0, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (90, NULL, N'2/434', NULL, 24, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (91, NULL, N'2/505', 96, 17, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (92, NULL, N'1/401', 89, 6, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (93, NULL, N'2/425', 89, 15, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (94, NULL, N'2/106', NULL, 16, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (95, NULL, N'2/107', NULL, 18, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (96, NULL, N'2/118', NULL, 24, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (97, NULL, N'2/119', NULL, 14, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (98, NULL, N'2/121', NULL, 16, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (99, NULL, N'2/122', NULL, 18, 3, 2, NULL)
GO
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (100, NULL, N'2/203', NULL, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (101, NULL, N'2/204', NULL, 5, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (102, NULL, N'2/206', NULL, 12, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (103, NULL, N'2/223', 49, 10, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (104, NULL, N'2/502', 64, 9, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (105, NULL, N'2/502а', 64, 11, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (106, NULL, N'3/200', 71, 1, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (107, NULL, N'3/205', 71, 7, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (108, NULL, N'1/104', 94, 32, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (109, NULL, N'1/107', 94, 3, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (110, NULL, N'1/158', 94, 40, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (111, NULL, N'1/158а', 94, 10, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (112, NULL, N'1/225', 94, 15, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (113, NULL, N'3/216', 94, 6, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (114, NULL, N'3/201', 107, 42, 2, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (115, NULL, N'3/202', 71, 30, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (116, NULL, N'3/204', 71, 26, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (117, NULL, N'1/405', 69, 20, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (118, NULL, N'3/110', 107, 6, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (119, NULL, N'3/111', 69, 3, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (120, NULL, N'3/114', 107, 4, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (121, NULL, N'3/120', 107, 12, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (122, NULL, N'3/120а', 107, 15, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (123, NULL, N'4/201а', 50, 28, 2, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (124, NULL, N'4/202', 107, 8, 4, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (125, NULL, N'4/204', 107, 40, 2, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (126, NULL, N'1/202', 91, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (127, NULL, N'1/203', 91, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (128, NULL, N'3/112', 94, 16, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (129, NULL, N'3/203', 71, 60, 2, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (130, NULL, N'3/213а', 94, 2, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (131, NULL, N'3/215', 94, 4, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (132, NULL, N'3/219', 94, 24, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (133, NULL, N'3/220', 71, 4, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (134, NULL, N'1/151', 81, 15, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (135, NULL, N'1/154', 80, 48, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (136, NULL, N'1/453а', 58, 0, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (137, NULL, N'1/454', 58, 36, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (138, NULL, N'1/455', 58, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (139, NULL, N'1/456', 58, 12, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (140, NULL, N'1/458', 58, 34, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (141, NULL, N'1/459', 58, 38, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (142, NULL, N'1/460', 58, 36, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (143, NULL, N'1/461', 58, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (144, NULL, N'1/462', 58, 4, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (145, NULL, N'1/464', 58, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (146, NULL, N'1/466', 58, 104, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (147, NULL, N'2/318', 102, 12, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (148, NULL, N'2/506а', 102, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (149, NULL, N'2/515', 102, 12, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (150, NULL, N'2/620', 102, 13, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (151, NULL, N'1/152', 41, 15, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (152, NULL, N'1/152а', 41, 15, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (153, NULL, N'1/304', 41, 15, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (154, NULL, N'1/305', 41, 100, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (155, NULL, N'1/320', 41, 100, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (156, NULL, N'1/321', 41, 3, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (157, NULL, N'1/351', 41, 15, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (158, NULL, N'1/421', 58, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (159, NULL, N'1/451', 58, 25, 4, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (160, NULL, N'1/452', 58, 144, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (161, NULL, N'1/453', 58, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (162, NULL, N'1/457', 58, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (163, NULL, N'1/468', 58, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (164, NULL, N'2/101', 69, 20, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (165, NULL, N'2/408', 88, 12, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (166, NULL, N'2/409', 36, 16, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (167, NULL, N'2/411', 39, 16, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (168, NULL, N'2/417', 75, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (169, NULL, N'2/503', 96, 12, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (170, NULL, N'2/506', 69, 32, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (171, NULL, N'2/518а', 75, 3, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (172, NULL, N'2/329 ', 90, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (173, NULL, N'2/329а', 90, 6, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (174, NULL, N'2/102', 57, 8, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (175, NULL, N'2/103', 57, 24, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (176, NULL, N'2/124', 57, 9, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (177, NULL, N'2/127', 57, 24, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (178, NULL, N'2/224', 57, 10, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (179, NULL, N'2/225', 57, 32, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (180, NULL, N'2/504', 57, 28, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (181, NULL, N'2/520', 57, 28, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (182, NULL, N'1/307', 69, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (183, NULL, N'2/210', 52, 15, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (184, NULL, N'2/211', 52, 0, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (185, NULL, N'2/214', 52, 12, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (186, NULL, N'2/215', 52, 14, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (187, NULL, N'2/216', 52, 20, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (188, NULL, N'2/221', 52, 20, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (189, NULL, N'2/309', 52, 12, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (190, NULL, N'2/310', 52, 22, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (191, NULL, N'2/312', 52, 3, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (192, NULL, N'2/313', 52, 5, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (193, NULL, N'2/327', 52, 18, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (194, NULL, N'2/423', 52, 20, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (195, NULL, N'2/424', 81, 15, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (196, NULL, N'2/104', 50, 15, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (197, NULL, N'3/101', 74, 23, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (198, NULL, N'3/102', 74, 16, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (199, NULL, N'3/106', 74, 32, 2, 3, NULL)
GO
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (200, NULL, N'2/105', 50, 12, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (201, NULL, N'2/109', 50, 16, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (202, NULL, N'2/110', 50, 16, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (203, NULL, N'2/205', 50, 35, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (204, NULL, N'2/207', 50, 12, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (205, NULL, N'2/208', 50, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (206, NULL, N'2/209', 50, 0, 7, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (207, NULL, N'2/222', 50, 6, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (208, NULL, N'2/202', 52, 92, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (209, NULL, N'1/153', 42, 6, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (210, NULL, N'1/159', 42, 28, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (211, NULL, N'2/610', 69, 72, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (212, NULL, N'2/607', 69, 36, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (213, NULL, N'2/609', 69, 32, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (214, NULL, N'2/611', NULL, 64, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (215, NULL, N'2/612', 62, 100, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (216, NULL, N'2/613', 69, 136, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (217, NULL, N'2/615', NULL, 72, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (218, NULL, N'2/617', NULL, 60, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (219, NULL, N'2/618', 34, 18, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (220, NULL, N'2/621', NULL, 60, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (221, NULL, N'2/622', NULL, 52, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (222, NULL, N'2/330', 114, 18, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (223, NULL, N'1/315', 51, 10, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (224, NULL, N'1/316', 51, 2, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (225, NULL, N'2/228', NULL, 23, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (226, NULL, N'2/111', 35, 0, 7, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (227, NULL, N'2/302', 90, 12, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (228, NULL, N'2/507', NULL, 36, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (229, NULL, N'2/508', NULL, 76, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (230, NULL, N'2/509', 102, 20, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (231, NULL, N'2/518', 69, 32, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (232, NULL, N'5/308', 55, 30, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (233, NULL, N'5/102', 55, 14, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (234, NULL, N'5/303', 55, 1, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (235, NULL, N'5/304', 55, 20, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (236, NULL, N'5/306', 55, 8, 10, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (237, NULL, N'5/307', 55, 16, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (238, NULL, N'5/309', 55, 14, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (239, NULL, N'5/310', 55, 14, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (240, NULL, N'5/205', 59, 10, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (241, NULL, N'5/201', 59, 80, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (242, NULL, N'5/202', 59, 10, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (243, NULL, N'5/203а', 59, 25, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (244, NULL, N'5/203б', 59, 20, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (245, NULL, N'5/203г', 59, 3, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (246, NULL, N'5/204', 59, 10, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (247, NULL, N'2/321', 117, 8, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (248, NULL, N'1/370', NULL, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (249, NULL, N'5/01', 54, 16, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (250, NULL, N'5/02б', 54, 36, 4, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (251, NULL, N'5/04', 54, 20, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (252, NULL, N'5/06', 54, 10, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (253, NULL, N'5/103 ', 54, 0, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (254, NULL, N'5/104', 54, 24, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (255, NULL, N'5/105', 54, 80, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (256, NULL, N'5/106', 54, 15, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (257, NULL, N'5/302а', 54, 40, 4, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (258, NULL, N'5/302б', 54, 13, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (259, NULL, N'1/160', 42, 20, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (260, NULL, N'1/161', 42, 8, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (261, NULL, N'1/162', 42, 16, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (262, NULL, N'1/163', 42, 2, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (263, NULL, N'1/358', 56, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (264, NULL, N'2/304', 69, 30, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (265, NULL, N'2/614', 69, 120, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (266, NULL, N'4/102', 42, 1, 6, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (267, NULL, N'4/103', 42, 15, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (268, NULL, N'4/104', 42, 6, 6, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (269, NULL, N'4/108', 42, 12, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (270, NULL, N'4/203', 107, 4, 6, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (271, NULL, N'4/205', 107, 8, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (272, NULL, N'1/359а', 56, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (273, NULL, N'1/360', 56, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (274, NULL, N'1/361', 56, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (275, NULL, N'1/363', 56, 24, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (276, NULL, N'1/366', 56, 6, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (277, NULL, N'1/373', 56, 30, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (278, NULL, N'1/359', 56, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (279, NULL, N'1/365', 56, 7, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (280, NULL, N'5/21', 88, 20, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (281, NULL, N'5/22', 88, 12, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (282, NULL, N'5/23', NULL, 0, 7, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (283, NULL, N'5/31', NULL, 40, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (284, NULL, N'5/32', 39, 10, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (285, NULL, N'2/328', 117, 15, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (286, NULL, N'2/226', 69, 20, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (287, NULL, N'2/314', 117, 10, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (288, NULL, N'2/308а', 65, 24, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (289, NULL, N'1/102', 94, 28, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (290, NULL, N'1/112', 80, 28, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (291, NULL, N'1/114', 80, 18, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (292, NULL, N'1/221', 80, 11, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (293, NULL, N'1/308', 51, 2, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (294, NULL, N'1/413', 80, 28, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (295, NULL, N'1/226', 94, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (296, NULL, N'1/309', 51, 8, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (297, NULL, N'1/310', 51, 10, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (298, NULL, N'1/313', 51, 10, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (299, NULL, N'1/317', 51, 1, 6, 1, NULL)
GO
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (300, NULL, N'1/318', 51, 5, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (301, NULL, N'1/402', 53, 12, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (302, NULL, N'1/403', 53, 2, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (303, NULL, N'1/404', 53, 16, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (304, NULL, N'1/406', 53, 16, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (305, NULL, N'1/407', 53, 5, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (306, NULL, N'1/409', 53, 16, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (307, NULL, N'1/410', 53, 2, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (308, NULL, N'1/411', 53, 16, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (309, NULL, N'1/411а', 53, 4, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (310, NULL, N'1/412', 53, 108, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (311, NULL, N'1/414', 53, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (312, NULL, N'1/415', 53, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (313, NULL, N'1/416', 53, 20, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (314, NULL, N'1/417', 53, 2, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (315, NULL, N'1/418', 53, 15, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (316, NULL, N'1/419', 53, 2, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (317, NULL, N'1/420', 53, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (318, NULL, N'1/109', 94, 0, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (319, NULL, N'1/204', NULL, 3, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (320, NULL, N'2/120', 81, 12, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (321, NULL, N'2/201', 81, 15, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (322, NULL, N'2/316', 81, 15, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (323, NULL, N'2/317', 81, 19, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (324, NULL, N'2/301', 117, 25, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (325, NULL, N'2/406', 81, 10, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (326, NULL, N'2/227', NULL, 0, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (327, NULL, N'1/369', 56, 100, 2, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (328, NULL, N'1/303', 33, 0, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (329, NULL, N'1/467', 58, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (330, NULL, N'1/302', 33, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (331, NULL, N'1/408', 51, 10, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (332, NULL, N'1/319а', 51, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (333, NULL, N'1/172а', 70, 25, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (334, NULL, N'1/168', 70, 8, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (335, NULL, N'1/213а,б,в', 47, 10, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (336, NULL, N'1/156', NULL, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (337, NULL, N'1/270', NULL, 3, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (338, NULL, N'1/268', NULL, 9, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (339, NULL, N'1/269', NULL, 2, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (340, NULL, N'1/269а', NULL, 4, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (341, NULL, N'1/276а', NULL, 30, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (342, NULL, N'2/108', NULL, 12, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (343, NULL, N'2/308б', 65, 24, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (344, NULL, N'2/601', 38, 15, 3, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (345, NULL, N'1/155', 80, 20, 3, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (346, NULL, N'2/326', NULL, 30, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (347, NULL, N'1/304a', 41, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (348, NULL, N'1/406а', 53, 3, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (349, NULL, N'1/465', NULL, 2, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (350, NULL, N'2/307', 62, 15, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (351, NULL, N'2/428', 81, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (352, NULL, N'2/308в', 65, 24, 4, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (353, NULL, N'2/301а', 117, 25, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (354, NULL, N'1/227', 69, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (355, NULL, N'2/311', NULL, 7, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (356, NULL, N'2/315', 84, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (357, NULL, N'2/405', 62, 16, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (358, NULL, N'2/407', 62, 7, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (359, NULL, N'2/429', 62, 11, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (360, NULL, N'2/430', 62, 13, 5, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (361, NULL, N'2/415а', 62, 2, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (362, NULL, N'2/414', 116, 11, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (363, NULL, N'2/414а', 116, 1, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (364, NULL, N'2/426', NULL, 0, 6, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (365, NULL, N'1/273а', NULL, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (366, NULL, N'1/271', NULL, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (367, NULL, N'1/273', NULL, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (368, NULL, N'1/362', NULL, 180, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (369, NULL, N'1/272', NULL, 1, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (370, NULL, N'3/04', 60, 68, 2, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (371, NULL, N'3/04в', 60, 10, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (372, NULL, N'3/04б', 60, 30, 3, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (373, NULL, N'3/112а', 94, 4, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (374, NULL, N'3/122', 60, 2, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (375, NULL, N'1/211а', 94, 0, 7, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (376, NULL, N'2/331', 79, 168, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (377, NULL, N'3/105', 74, 5, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (378, NULL, N'3/210', 44, 1, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (379, NULL, N'3/201а', 71, 2, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (380, NULL, N'3/107 ', 74, 1, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (381, NULL, N'3/107а', 69, 10, 7, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (382, NULL, N'4/201', 42, 28, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (383, NULL, N'4/205а', 42, 1, 6, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (384, NULL, N'4/а 1-этаж', 44, 12, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (385, NULL, N'4/б 2-этаж', 44, 12, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (386, NULL, N'4/в 2-этаж', 44, 24, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (387, NULL, N'4/г 2-этаж', 44, 38, 4, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (388, NULL, N'4/106, 4/107', 42, 6, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (389, NULL, N'4/105', 42, 6, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (390, NULL, N'4/207', 42, 8, 5, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (391, NULL, N'5/02а', 54, 64, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (392, NULL, N'5/02в', 54, 16, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (393, NULL, N'5/02-2', 54, 24, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (394, NULL, N'5/302', 54, 2, 7, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (395, NULL, N'5/25', NULL, 2, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (396, NULL, N'5/14а', 39, 9, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (397, NULL, N'5/14б', 39, 9, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (398, NULL, N'5/11а', 68, 20, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (399, NULL, N'5/11б', 68, 20, 3, 5, NULL)
GO
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (400, NULL, N'5/11в', 68, 20, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (401, NULL, N'5/12', 39, 6, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (402, NULL, N'5/01 иэт', NULL, 0, 7, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (403, NULL, N'5/03иэт', 88, 2, 7, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (404, NULL, N'5/05иэт', NULL, 2, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (405, NULL, N'2/303а', NULL, 2, 7, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (406, NULL, N'2/01', NULL, 0, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (407, NULL, N'2/02', NULL, 25, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (408, NULL, N'2/03', NULL, 0, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (409, NULL, N'2/04', NULL, 10, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (410, NULL, N'2/05', NULL, 22, 14, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (411, NULL, N'2/06', NULL, 0, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (412, NULL, N'2/07', NULL, 3, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (413, NULL, N'2/08', NULL, 3, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (414, NULL, N'3/05', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (415, NULL, N'3/06', NULL, 40, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (416, NULL, N'3/07', NULL, 24, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (417, NULL, N'4/01', NULL, 0, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (418, NULL, N'4/02', NULL, 40, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (419, NULL, N'4/03', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (420, NULL, N'4/04', NULL, 60, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (421, NULL, N'4/05', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (422, NULL, N'4/06', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (423, NULL, N'4/07', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (424, NULL, N'4/09', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (425, NULL, N'4/08', NULL, 40, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (426, NULL, N'2/413', 108, 100, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (427, NULL, N'2/512', 102, 12, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (428, NULL, N'1/324', 70, 6, 10, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (429, NULL, N'2/128', 110, 112, 2, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (430, NULL, N'5/14 в', 39, 6, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (431, NULL, N'2/229', 90, 3, 10, 2, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (432, NULL, N'3/102а', 74, 5, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (433, NULL, N'УХЛ "Сайма"', 81, 15, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (434, NULL, N'5/07', 59, 14, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (435, NULL, N'УПМ №1', 52, 12, 4, 10, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (436, NULL, N'УПМ №2', 52, 10, 3, 10, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (437, NULL, N'УПМ №3', 52, 1, 6, 10, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (438, NULL, N'УПМ №4', 52, 12, 4, 10, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (439, NULL, N'УПМ №5', 52, 12, 3, 10, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (440, NULL, N'УПМ №6', 52, 20, 3, 10, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (441, NULL, N'7/01', 60, 10, 3, 9, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (442, NULL, N'7/02', 60, 10, 3, 9, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (443, NULL, N'7/03', 60, 10, 3, 9, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (444, NULL, N'1/352', NULL, 10, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (445, NULL, N'1/352', NULL, 4, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (446, NULL, N'1/352', 69, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (447, NULL, N'1/352', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (448, NULL, N'1/352', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (449, NULL, N'1/279', NULL, 1, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (450, NULL, N'1/279', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (451, NULL, N'1/279', NULL, 2, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (452, NULL, N'4/888', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (453, NULL, N'htfgh', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (454, NULL, N'htfgh', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (455, NULL, N'5/33', 39, 25, 10, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (456, NULL, N'5/34', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (457, NULL, N'5/34', 88, 10, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (458, NULL, N'5/40', 39, 7, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (459, NULL, N'5/36', 88, 10, 5, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (460, NULL, N'5/39', NULL, 40, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (461, NULL, N'5/13', NULL, 80, 2, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (462, NULL, N'2/334', 85, 30, 5, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (463, NULL, N'Стадион', NULL, 1, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (464, NULL, N'5/02-1', 54, 0, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (465, NULL, N'5/02иэт', NULL, 2, 7, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (466, NULL, N'5/04 иэт', NULL, 4, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (467, NULL, N'1/355', 41, 15, 5, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (468, NULL, N'3/214-1', 46, 1, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (469, NULL, N'3/214-2', 46, 8, 10, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (470, NULL, N'3/214-3', 46, 7, 5, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (471, NULL, N'3/105а', 74, 2, 10, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (472, NULL, N'1/01', NULL, 10, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (473, NULL, N'1/02', NULL, 9, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (474, NULL, N'1/03', NULL, 20, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (475, NULL, N'1/04', NULL, 20, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (476, NULL, N'1/05', NULL, 0, 7, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (477, NULL, N'1/06', NULL, 25, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (478, NULL, N'1/07', NULL, 25, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (479, NULL, N'2/09', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (480, NULL, N'3/01', NULL, 0, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (481, NULL, N'3/02', NULL, 40, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (482, NULL, N'3/03', NULL, 25, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (483, NULL, N'3/04', NULL, 60, 2, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (484, NULL, N'2/608а', 73, 1, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (485, NULL, N'1/108', 94, 3, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (486, NULL, N'1/108а', 94, 3, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (487, NULL, N'1/322', 94, 1, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (488, NULL, N'3/217', 94, 6, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (489, NULL, N'2/222а', 50, 0, 7, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (490, NULL, N'4/202а', 42, 1, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (491, NULL, N'4/203а', NULL, 8, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (492, NULL, N'4/204а', 42, 1, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (493, NULL, N'5/02 иэт', 69, 4, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (494, NULL, N'5/04 иэт', NULL, 4, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (495, NULL, N'4/02/св', 107, 52, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (496, NULL, N'1/251', 69, 3, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (497, NULL, N'1/254', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (498, NULL, N'1/278', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (499, NULL, N'1/277', NULL, 2, 6, NULL, NULL)
GO
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (500, NULL, N'1/257а', NULL, 2, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (501, NULL, N'1/257', NULL, 6, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (502, NULL, N'1/258', NULL, 3, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (503, NULL, N'5/38', 68, 10, 10, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (504, NULL, N'5/37', 88, 10, 10, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (505, NULL, N'5/02иэт', 69, 4, 7, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (506, NULL, N'3/213', 60, 6, 10, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (507, NULL, N'5/04иэт', NULL, 4, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (508, NULL, N'5/24', 68, 10, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (509, NULL, N'3/213', 60, 6, 10, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (510, NULL, N'4/02/св', 107, 52, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (511, NULL, N'5/24', 68, 10, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (512, NULL, N'5/24', 68, 10, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (513, NULL, N'УПЦ ', 50, 0, 2, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (514, NULL, N'УПЦ', 50, 0, 2, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (515, NULL, N'УПЦ', 50, 0, 2, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (516, NULL, N'УПЦ', 50, 0, 2, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (517, NULL, N'4/УПЦ', 50, 0, 2, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (518, NULL, N'1/01', 59, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (519, NULL, N'1/355', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (520, NULL, N'1/355', 41, 15, 5, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (521, NULL, N'1/355', 41, 15, 5, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (522, NULL, N'1/355', 41, 15, 5, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (523, NULL, N'4/сухомлинова', 107, 40, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (524, NULL, N'5/24', NULL, 0, 6, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (525, NULL, N'1/355', 41, 16, 5, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (526, NULL, N'3/0', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (527, NULL, N'3/01', NULL, 0, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (528, NULL, N'3/02', NULL, 40, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (529, NULL, N'3/01', NULL, 0, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (530, NULL, N'3/02', NULL, 0, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (531, NULL, N'1/01', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (532, NULL, N'1/01', NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (533, NULL, N'1/01', NULL, 0, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (534, NULL, N'1/02', NULL, 0, 6, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (535, NULL, N'1/02', NULL, 0, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (536, NULL, N'1/03', NULL, 20, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (537, NULL, N'1/04', NULL, 20, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (538, NULL, N'1/04', NULL, 20, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (539, NULL, N'1/04', NULL, 20, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (540, NULL, N'1/04', NULL, 20, 4, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (541, NULL, N'1/04', NULL, 20, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (542, NULL, N'1/05', NULL, 0, 7, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (543, NULL, N'1/06', NULL, 25, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (544, NULL, N'1/07', NULL, 25, 3, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (545, NULL, N'1/10', NULL, 30, 4, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (546, NULL, N'3/01', NULL, 0, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (547, NULL, N'3/02', NULL, 40, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (548, NULL, N'3/03', NULL, 25, 6, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (549, NULL, N'3/04', NULL, 60, 2, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (550, NULL, N'4/св 2-этаж', 107, 50, 3, NULL, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (551, NULL, N'3/214-3', 46, 7, 5, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (552, NULL, N'3/214-2', 46, 6, 10, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (553, NULL, N'3/214-1', 46, 1, 6, 3, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (554, NULL, N'УПЦ', 50, 25, 2, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (555, NULL, N' УПЦ (ТППП)', 51, 20, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (556, NULL, N'Мед академия ', 94, 0, 6, 1, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (557, NULL, N'УЦ"Северэлектро"', NULL, 0, NULL, 6, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (558, NULL, N'5/15', 39, 12, 3, 5, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (559, NULL, N'УПЦ ', 50, 20, 3, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (560, NULL, N'4/05 св', 107, 50, 2, 4, NULL)
INSERT [dbo].[Auditorium] ([Id], [Number], [Name], [DepartmentId], [SeatingCapacity], [AuditoriumTypeId], [BuildingId], [Location]) VALUES (561, NULL, N'КЭДИС/309', 41, 40, 3, 1, NULL)
SET IDENTITY_INSERT [dbo].[Auditorium] OFF
SET IDENTITY_INSERT [dbo].[AuditoriumType] ON 

INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (1, N'---       ', N'----------')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (2, N'Лек.      ', N'Лекционная')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (3, N'Лаб.      ', N'Лабораторная')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (4, N'Прак.     ', N'Практическая')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (5, N'Комп.класс', N'Компьютерная')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (6, N'Каб.      ', N'Кабинет')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (7, N'Пом.      ', N'Помещение')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (8, N'под проект', N'Под проект')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (9, N'учеб.     ', N'Учебная')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (10, N'Каф.      ', N'Кафедра')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (11, N'Стенды    ', N'Стенды')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (12, N'_         ', N'"Теория поля"')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (13, N'Спорт зал ', N'Спорт зал')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (14, N'Конф.зал  ', N'Конференц зал')
INSERT [dbo].[AuditoriumType] ([Id], [Name], [FullName]) VALUES (15, N'_         ', N'Корейский центр')
SET IDENTITY_INSERT [dbo].[AuditoriumType] OFF
SET IDENTITY_INSERT [dbo].[auth_group] ON 

INSERT [dbo].[auth_group] ([id], [name]) VALUES (1, N'odmin')
SET IDENTITY_INSERT [dbo].[auth_group] OFF
SET IDENTITY_INSERT [dbo].[auth_group_permissions] ON 

INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (1, 1, 1)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (2, 1, 2)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (3, 1, 3)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (4, 1, 13)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (5, 1, 14)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (6, 1, 15)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (7, 1, 16)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (8, 1, 17)
INSERT [dbo].[auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (9, 1, 18)
SET IDENTITY_INSERT [dbo].[auth_group_permissions] OFF
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can add permission', 2, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can change permission', 2, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can delete permission', 2, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can add group', 3, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can change group', 3, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can delete group', 3, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can delete session', 6, N'delete_session')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
SET IDENTITY_INSERT [dbo].[auth_user] ON 

INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (1, N'pbkdf2_sha256$36000$2PNK0phktS7S$8kMZxhnFBuwqDimDQdLVZc0xx4YcBivJxA+zc2/R9DE=', CAST(N'2018-04-29 19:41:07.000' AS DateTime), 1, N'admin', N'', N'', N'', 1, 1, CAST(N'2018-04-29 15:20:33.000' AS DateTime))
INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (2, N'pbkdf2_sha256$36000$GecUmRJYpoHf$5oAO77oL4lFS5SBfK3gZqiGFy++y2no68kFlkiWUcMo=', CAST(N'2018-04-29 19:36:21.000' AS DateTime), 0, N'user', N'', N'', N'', 1, 1, CAST(N'2018-04-29 15:49:39.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[auth_user] OFF
SET IDENTITY_INSERT [dbo].[auth_user_groups] ON 

INSERT [dbo].[auth_user_groups] ([id], [user_id], [group_id]) VALUES (1, 2, 1)
SET IDENTITY_INSERT [dbo].[auth_user_groups] OFF
SET IDENTITY_INSERT [dbo].[auth_user_user_permissions] ON 

INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (7, 2, 1)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (8, 2, 2)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (9, 2, 3)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (10, 2, 4)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (11, 2, 5)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (12, 2, 6)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (13, 2, 7)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (14, 2, 8)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (15, 2, 9)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (16, 2, 10)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (17, 2, 11)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (18, 2, 12)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (1, 2, 13)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (2, 2, 14)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (3, 2, 15)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (4, 2, 16)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (5, 2, 17)
INSERT [dbo].[auth_user_user_permissions] ([id], [user_id], [permission_id]) VALUES (6, 2, 18)
SET IDENTITY_INSERT [dbo].[auth_user_user_permissions] OFF
SET IDENTITY_INSERT [dbo].[Building] ON 

INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (1, N'1-корпус', 0, NULL, N'пр. Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (2, N'2-корпус', 0, NULL, N'пр. Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (3, N'3-корпус', 0, NULL, N'пр. Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (4, N'4-корпус', 0, NULL, N'пр. Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (5, N'5-корпус', 0, NULL, N'пр. Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (6, N'общ.1 №1', 0, NULL, N'пр.Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (7, N'общ.2 №2', 0, NULL, N'пр. Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (8, N'6-корпус', 0, NULL, N'пр.Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (9, N'7-корпус', 0, NULL, N'пр.Мира 66')
INSERT [dbo].[Building] ([Id], [FullName], [Number], [Location], [Address]) VALUES (10, N'общ. 3 №3', 0, NULL, N'пр. Мира 66')
SET IDENTITY_INSERT [dbo].[Building] OFF
SET IDENTITY_INSERT [dbo].[DayOfWeek] ON 

INSERT [dbo].[DayOfWeek] ([Id], [Number], [Name], [FullName]) VALUES (6, 1, N'Пн', N'Понедельник')
INSERT [dbo].[DayOfWeek] ([Id], [Number], [Name], [FullName]) VALUES (7, 2, N'Вт', N'Вторник')
INSERT [dbo].[DayOfWeek] ([Id], [Number], [Name], [FullName]) VALUES (8, 3, N'Ср', N'Среда')
INSERT [dbo].[DayOfWeek] ([Id], [Number], [Name], [FullName]) VALUES (9, 4, N'Чт', N'Четверг')
INSERT [dbo].[DayOfWeek] ([Id], [Number], [Name], [FullName]) VALUES (10, 5, N'Пт', N'Пятница')
INSERT [dbo].[DayOfWeek] ([Id], [Number], [Name], [FullName]) VALUES (11, 6, N'Сб', N'Суббота')
SET IDENTITY_INSERT [dbo].[DayOfWeek] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (1, N'1', N'2', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (33, N'ФиСН', N'Философия и социальные науки', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (34, N'ИЯ', N'Иностранные  языки', 2)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (35, N'ФВ', N'Физическое воспитание', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (36, N'АУ', N'Автоматическое управление', 4)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (37, N'ПФ', N'Прикладная физика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (38, N'ИВТ', N'Информатика и вычислительная техника', 4)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (39, N'РЭ', N'Радиоэлектроника', 8)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (40, N'ПМ', N'Прикладная математика', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (41, N'ПОКС', N'Программное обеспечение компьютерных систем', 4)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (42, N'ТМ', N'Технология машиностроения', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (43, N'Мех', N'Механика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (44, N'АТ', N'Автомобильный транспорт', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (45, N'ОКМ', N'Основы конструирования машин', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (46, N'ИП', N'Инженерная педагогика', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (47, N'ИГ', N'Инженерная графика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (48, N'МТ', N'Менеджмент на транспорте', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (49, N'МАПП', N'Машины и аппараты пищевых производств', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (50, N'ТК', N'Технология консервирования', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (51, N'ТППП', N'Технология производства продуктов питания', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (52, N'ТИЛП', N'Технология изделий легкой промышленности', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (53, N'ХиХТ', N'Химия и химические технологии', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (54, N'ЭЭ', N'Электроэнергетика', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (55, N'ЭМ', N'Электромеханика', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (56, N'ТОЭ', N'Теоретические основы электротехники и обшей электротехники', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (57, N'БЖД', N'Теплотехника и БЖД', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (58, N'ОФ', N'Общая физика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (59, N'ЭС', N'Электроснабжение', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (60, N'ВИЭ', N'Возобновляемые источники энергии', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (61, N'ВМ', N'Высшая математика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (62, N'ИСЭ', N'Информационные системы в экономике', 1)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (63, N'ЭиБ', N'Экономика и бизнес', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (64, N'МЕН', N'Менеджмент', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (65, N'ЭЖиР', N'Экономическая журналистика и реклама', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (66, N'УиФ', N'Учет и финансы', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (67, N'ЭТ', N'Экономическая теория', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (68, N'ТКМ', N'Телекоммуникация', 8)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (69, N'---', N'---', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (70, N'АиР', N'Автоматизация и робототехника', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (71, N'МиС', N'Метрология и стандартизация', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (72, N'ВоенКаф', N'Военная кафедра', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (73, N'ЗЧСиЭ', N'Защита в чрезвычайных ситуациях и экология', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (74, N'Полиграфия', N'Полиграфия', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (75, N'РусЯз', N'Русский язык', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (76, N'Политехнический колледж', N'Политехнический колледж', 9)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (77, N'Гум.наук', N'Гуманитарных наук', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (78, N'Гос.яз.', N'Государственный язык', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (79, N'КГТИ', N'КГТИ', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (80, N'Сек.ТПОП', N'Технология продуктов общественного питания', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (81, N'ХПИ', N'Художественное проектирование изделий', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (82, N'КГТУ ЭиБ', N'КГТУ ЭиБ', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (83, N'КГТФ (кр.техн.)', N'КГТФ (кредит. техн.)', 2)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (84, N'ИУиБ БШ', N'ИУиБ БШ', 12)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (85, N'ККСОЦДО', N'ККСОЦДО', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (86, N'ФИЗ', N'Физика111', 6)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (87, N'ФК ИУиБ', N'Филиал кафедры ИУиБ при КГТУ', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (88, N'ИСиТТ', N'Информационные системы и технологии в телекоммуникации', 8)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (89, N'Лог', N'Логистика', 2)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (90, N'Тел', N'Телематика', 2)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (91, N'БГТУ', N'БГТУ', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (92, N'ПК', N'Повышения квалификации', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (93, N'ОХРОС', N'Охрана окружающей среды ИГДиГТ', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (94, N'МПИ', N'Механика и промышленная инженерия', 2)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (95, N'ЛСиП', N'Лаборатория соединений и покрытий', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (96, N'КыргТил', N'Кыргыз тили', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (97, N'РусЯз', N'Русского языка', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (98, N'(ИГДиГТ)', N'(ИГДиГТ)', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (99, N'(ККТИ)', N'(ККТИ)', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (100, N'ИКГ', N'Инженерная и компьютерная графика', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (101, N'ИТиММ ИГДиГТ', N'ИТиММ ИГДиГТ', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (102, N'ПМИ', N'Прикладная математика и информатика ФИТ', 4)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (103, N'ДИС', N'ДИС', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (104, N'ДИС...', N'ДИС...', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (105, N'ФИЗ', N'Физика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (106, N'ПМИ', N'Прикладная математика и информатика', 18)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (107, N'ОПиБД', N'Организация перевозок и безопасность движения', 5)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (108, N'ФКиС', N'Физическая культура и спорт', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (109, N'-', N'Инновационная инженерия', 23)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (110, N'ИСОП', N'ИСОП', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (111, N'-', N'ИЭТ', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (112, N'-', N'Пищевая инженерия', 3)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (113, N'-', N'Инновационная инженерия', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (114, N'ЭиФ', N'Экономика и финансы', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (115, N'ПМ', N'Производственный менеджмент', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (116, N'ЭП', N'Экономика промышленности', 38)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (117, N'ПиК', N'Предпринимательство и коммерция', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (118, N'-', N'Экономика и финансы', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (119, N'-', N'Экономика и финансы', NULL)
INSERT [dbo].[Department] ([Id], [Name], [FullName], [FacultyId]) VALUES (120, N'ЦНЯ', N'Центр немецкого языка', NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[django_admin_log] ON 

INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (1, CAST(N'2018-04-29 15:49:40.000' AS DateTime), N'2', N'user', 1, N'[{"added": {}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (2, CAST(N'2018-04-29 15:51:16.000' AS DateTime), N'2', N'user', 2, N'[{"changed": {"fields": ["is_staff", "user_permissions"]}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (3, CAST(N'2018-04-29 16:05:10.000' AS DateTime), N'2', N'user', 2, N'[{"changed": {"fields": ["user_permissions"]}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (4, CAST(N'2018-04-29 18:12:31.000' AS DateTime), N'1', N'odmin', 1, N'[{"added": {}}]', 3, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (5, CAST(N'2018-04-29 18:16:40.000' AS DateTime), N'2', N'user', 2, N'[{"changed": {"fields": ["groups"]}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (6, CAST(N'2018-04-29 18:17:12.000' AS DateTime), N'2', N'user', 2, N'[{"changed": {"fields": ["user_permissions"]}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (7, CAST(N'2018-04-29 19:35:22.000' AS DateTime), N'2', N'user', 2, N'[{"changed": {"fields": ["user_permissions"]}}]', 4, 1)
SET IDENTITY_INSERT [dbo].[django_admin_log] OFF
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'sapp', N'auditorium')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'sapp', N'department')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2018-04-29 15:18:49.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2018-04-29 15:18:58.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2018-04-29 15:19:00.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2018-04-29 15:19:01.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2018-04-29 15:19:05.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2018-04-29 15:19:06.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0003_alter_user_email_max_length', CAST(N'2018-04-29 15:19:07.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0004_alter_user_username_opts', CAST(N'2018-04-29 15:19:08.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0005_alter_user_last_login_null', CAST(N'2018-04-29 15:19:09.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0006_require_contenttypes_0002', CAST(N'2018-04-29 15:19:11.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2018-04-29 15:19:12.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0008_alter_user_username_max_length', CAST(N'2018-04-29 15:19:17.000' AS DateTime))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'sessions', N'0001_initial', CAST(N'2018-04-29 15:19:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'fwjvjqrf0wugfl7t4ly34sjtkxo28fo6', N'NWM0ZmVkZGJmOWMxN2RhMmRiOGQ4YjY3ZjA1N2E2MjU2ZTc4NGY3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmODJmZjYyN2EyODQ3ZWZiYzVhYWUyM2QzNzIwNDM0ODg3NGIyNmQzIn0=', CAST(N'2018-05-13 18:20:25.000' AS DateTime))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'p5dht33qub6svxkjdcktkydr6sxqhmsj', N'NWM0ZmVkZGJmOWMxN2RhMmRiOGQ4YjY3ZjA1N2E2MjU2ZTc4NGY3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmODJmZjYyN2EyODQ3ZWZiYzVhYWUyM2QzNzIwNDM0ODg3NGIyNmQzIn0=', CAST(N'2018-05-13 19:41:08.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (1, N'ИУиБ', N'Институт управления и бизнеса ')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (2, N'КГТИ', N'Кыргызско-Германский Технический Институт')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (3, N'ТФ', N'Технологический факультет')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (4, N'ФИТ', N'Факультет информационных технологий')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (5, N'ФТиМ', N'Факультет транспорта и машиностроения')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (6, N'ЭФ', N'Энергетический факультет')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (7, N' ИДОиПК', N'Институт дистанционного обучения и повышения квалификации')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (8, N'ИЭТ', N'Институт электроники и телекоммуникаций')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (9, N'Колледж КГТУ', N'Политехнический колледж Кыргызского Государственного Технического Университета')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (10, N'Лицей', N'Лицей')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (11, N'ККСОЦДО', N'Кыргызско-Казахский совместный образовательный центр дистанционного обучения')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (12, N'ИУиБ', N'ИУиБ Бизнес школа')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (13, N'ИУиБ', N'Институт управления и бизнеса (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (14, N'ИЭТ', N'Институт электроники и телекоммуникаций (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (15, N'ЭЭФ-ИГДиГТ', N'Эколого-Экономический факультет (ИГДиГТ)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (16, N'ГМФ-ИГДиГТ', N'Горно-металлургический факультет (ИГДиГТ)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (17, N'ГФ-ИГДиГТ', N'Геологоразведочный факультет (ИГДиГТ)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (18, N'КГТУ', N'Кыргызский государственный технически университет (льготники)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (19, N'Курсы', N'Курсы русского языка')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (20, N'Политехнический колледж КГТУ- 9', N'Политехнический колледж Кыргызского Государственного Технического Университета (после 9 кл)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (21, N'АДиМ', N'Аспирантура, докторантура и магистратура')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (22, N'ПК', N'Повышения квалификации')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (23, N'ИСОП', N'Институт совместных образовательных программ ')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (24, N'ЦЯП', N'Центр языковой подготовки')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (25, N'ЦИТОиПКК', N'Центр инновационных технологий обучения и повышения квалификации кадров (ИГДиГТ)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (26, N'Д-ККТИ', N'Дистанционный (ККТИ)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (27, N'ДИС', N'Деканат по работе с иностранными студентами')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (28, N'ИГДиГТ', N'Институт горного дела и горных технологии')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (29, N'Удалить___Деканат  ИС', N'Удалить___Деканат по работе с иностраннымим студентами')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (30, N'2014-2015....', N'Слушатель 10.07.2015')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (31, N'ИУиБ (без статуса ю/л)', N'Институт Управления и бизнеса( без  статуса ю/л)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (32, N'_', N'ИДОиПК (без сстатуса ю/л)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (33, N'ФИТ', N'Факультет информационных технологии (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (34, N'ТФ', N'Технологический факультет (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (35, N'ФТиМ', N'Факультет транспорта и машиностроения (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (36, N'ЭФ', N'Энергетический факультет (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (37, N'КГТИ', N'Кыргызско-Германский Технический Институт( заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (38, N'ИЭФ', N'Инженерно-Экономический факультет')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (39, N'ИЭФ', N'Инженерно-Экономический факультет (заочное)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (40, N'АДиМ(ИЭТ)', N'Аспирантура, докторантура и магистратура(ИЭТ)')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (41, N'_', N'Неизвестный')
INSERT [dbo].[Faculty] ([Id], [Name], [FullName]) VALUES (42, N'АДиМ ', N'Аспирантура')
SET IDENTITY_INSERT [dbo].[Faculty] OFF
SET IDENTITY_INSERT [dbo].[Hour] ON 

INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (2, CAST(N'08:00:00' AS Time), CAST(N'09:20:00' AS Time), 1)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (3, CAST(N'09:30:00' AS Time), CAST(N'10:50:00' AS Time), 2)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (4, CAST(N'11:00:00' AS Time), CAST(N'12:20:00' AS Time), 3)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (5, CAST(N'13:00:00' AS Time), CAST(N'14:20:00' AS Time), 4)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (6, CAST(N'14:30:00' AS Time), CAST(N'15:50:00' AS Time), 5)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (7, CAST(N'16:00:00' AS Time), CAST(N'17:20:00' AS Time), 6)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (8, CAST(N'17:30:00' AS Time), CAST(N'18:50:00' AS Time), 7)
INSERT [dbo].[Hour] ([Id], [Begin], [End], [Number]) VALUES (9, CAST(N'19:00:00' AS Time), CAST(N'20:20:00' AS Time), 8)
SET IDENTITY_INSERT [dbo].[Hour] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__auth_gro__72E12F1BF7B58137]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[auth_group] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[auth_group_permissions] ADD  CONSTRAINT [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] UNIQUE NONCLUSTERED 
(
	[group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[auth_permission] ADD  CONSTRAINT [auth_permission_content_type_id_codename_01ab375a_uniq] UNIQUE NONCLUSTERED 
(
	[content_type_id] ASC,
	[codename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[auth_user_groups] ADD  CONSTRAINT [auth_user_groups_user_id_group_id_94350c0c_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[auth_user_user_permissions] ADD  CONSTRAINT [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 01.05.2018 23:37:00 ******/
ALTER TABLE [dbo].[django_content_type] ADD  CONSTRAINT [django_content_type_app_label_model_76bd3d3b_uniq] UNIQUE NONCLUSTERED 
(
	[app_label] ASC,
	[model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
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
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk]
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
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_SubjectWithType] FOREIGN KEY([SubjectWithTypeId])
REFERENCES [dbo].[SubjectWithType] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_SubjectWithType]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Teacher]
GO
ALTER TABLE [dbo].[Raschasovka]  WITH CHECK ADD  CONSTRAINT [FK_Raschasovka_Week] FOREIGN KEY([WeekId])
REFERENCES [dbo].[Week] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Raschasovka] CHECK CONSTRAINT [FK_Raschasovka_Week]
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
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_SubjectWithType] FOREIGN KEY([SubjectWithTypeId])
REFERENCES [dbo].[SubjectWithType] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_SubjectWithType]
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
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Department]
GO
ALTER TABLE [dbo].[SubjectWithType]  WITH CHECK ADD  CONSTRAINT [FK_SubjectWithType_Auditorium] FOREIGN KEY([PreferAuditoriumId])
REFERENCES [dbo].[Auditorium] ([Id])
GO
ALTER TABLE [dbo].[SubjectWithType] CHECK CONSTRAINT [FK_SubjectWithType_Auditorium]
GO
ALTER TABLE [dbo].[SubjectWithType]  WITH CHECK ADD  CONSTRAINT [FK_SubjectWithType_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectWithType] CHECK CONSTRAINT [FK_SubjectWithType_Subject]
GO
ALTER TABLE [dbo].[SubjectWithType]  WITH CHECK ADD  CONSTRAINT [FK_SubjectWithType_SubjectType] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([Id])
GO
ALTER TABLE [dbo].[SubjectWithType] CHECK CONSTRAINT [FK_SubjectWithType_SubjectType]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
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
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
