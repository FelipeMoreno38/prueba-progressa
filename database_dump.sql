USE [master]
GO
/****** Object:  Database [prueba_progressa]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE DATABASE [prueba_progressa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba_progressa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\prueba_progressa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_progressa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\prueba_progressa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [prueba_progressa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba_progressa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba_progressa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba_progressa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba_progressa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba_progressa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba_progressa] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba_progressa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prueba_progressa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba_progressa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba_progressa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba_progressa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba_progressa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba_progressa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba_progressa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba_progressa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba_progressa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prueba_progressa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba_progressa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba_progressa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba_progressa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba_progressa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba_progressa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba_progressa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba_progressa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba_progressa] SET  MULTI_USER 
GO
ALTER DATABASE [prueba_progressa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba_progressa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba_progressa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba_progressa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba_progressa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba_progressa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [prueba_progressa] SET QUERY_STORE = ON
GO
ALTER DATABASE [prueba_progressa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [prueba_progressa]
GO
/****** Object:  User [Admin]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Admin]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 20/06/2025 6:59:39 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetimeoffset](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](150) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetimeoffset](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 20/06/2025 6:59:39 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[due_date] [date] NULL,
	[status] [varchar](20) NOT NULL,
	[rick_morty_character_id] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 20/06/2025 6:59:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 2, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 2, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 2, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 2, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 3, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 3, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 3, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 3, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2025-06-20T04:29:18.7865990+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2025-06-20T04:29:18.9106540+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2025-06-20T04:29:18.9500380+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2025-06-20T04:29:18.9697250+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2025-06-20T04:29:18.9938860+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2025-06-20T04:29:19.5697480+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2025-06-20T04:29:19.5832580+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', CAST(N'2025-06-20T04:29:19.5973110+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', CAST(N'2025-06-20T04:29:19.6098720+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', CAST(N'2025-06-20T04:29:20.1081940+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', CAST(N'2025-06-20T04:29:20.1184100+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2025-06-20T04:29:20.1343660+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', CAST(N'2025-06-20T04:29:20.1918190+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2025-06-20T04:29:20.2107300+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', CAST(N'2025-06-20T04:29:20.7228130+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', CAST(N'2025-06-20T04:29:20.7353750+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'auth', N'0012_alter_user_first_name_max_length', CAST(N'2025-06-20T04:29:20.7480260+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'sessions', N'0001_initial', CAST(N'2025-06-20T04:29:20.7605750+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'9k2x9qsrdn2aljjddrl9i3iqpiblbsd1', N'eyJ1c2VyX2lkIjoxfQ:1uSZAJ:mn_vqltXfVtBgN32FWDucn8DytzkD2EI65HgyTdiy4I', CAST(N'2025-07-04T10:40:11.6843420+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[tasks] ON 

INSERT [dbo].[tasks] ([id], [user_id], [title], [description], [due_date], [status], [rick_morty_character_id], [created_at], [updated_at]) VALUES (1, 1, N'Primera Tarea', N'Descripción de prueba de la tarea de prueba.', CAST(N'2025-07-30' AS Date), N'pending', 1, NULL, NULL)
INSERT [dbo].[tasks] ([id], [user_id], [title], [description], [due_date], [status], [rick_morty_character_id], [created_at], [updated_at]) VALUES (4, 1, N'Segunda Tarea', N'Otra prueba de creación de tarea.', CAST(N'2025-06-27' AS Date), N'in_progress', 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [email], [password], [created_at], [updated_at]) VALUES (1, N'admin@mail.com', N'pbkdf2_sha256$600000$RCfqRGsBktXJ4twksneqXu$K0xPleQetyb6ZoNwYmrzl+Vs7T3cBXOcLCrm41LYEII=', CAST(N'2025-06-20T04:49:48.583' AS DateTime), CAST(N'2025-06-20T04:49:48.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 20/06/2025 6:59:39 a. m. ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616405F01151]    Script Date: 20/06/2025 6:59:39 a. m. ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [updated_at]
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
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [fk_user_task] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [fk_user_task]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD CHECK  (([status]='completed' OR [status]='in_progress' OR [status]='pending'))
GO
USE [master]
GO
ALTER DATABASE [prueba_progressa] SET  READ_WRITE 
GO
