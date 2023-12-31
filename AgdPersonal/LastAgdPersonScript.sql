USE [master]
GO
/****** Object:  Database [AgdPersonDb]    Script Date: 9/21/2023 11:04:26 PM ******/
CREATE DATABASE [AgdPersonDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgdPersonDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AgdPersonDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AgdPersonDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AgdPersonDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AgdPersonDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgdPersonDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgdPersonDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgdPersonDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgdPersonDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgdPersonDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgdPersonDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgdPersonDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AgdPersonDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgdPersonDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgdPersonDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgdPersonDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgdPersonDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgdPersonDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgdPersonDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgdPersonDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgdPersonDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AgdPersonDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgdPersonDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgdPersonDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgdPersonDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgdPersonDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgdPersonDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgdPersonDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgdPersonDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgdPersonDb] SET  MULTI_USER 
GO
ALTER DATABASE [AgdPersonDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgdPersonDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgdPersonDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgdPersonDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AgdPersonDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AgdPersonDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AgdPersonDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [AgdPersonDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AgdPersonDb]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 9/21/2023 11:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](400) NULL,
	[JobTitle] [nvarchar](400) NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 9/21/2023 11:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 9/21/2023 11:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slogans]    Script Date: 9/21/2023 11:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slogans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sectionname] [nvarchar](250) NULL,
	[Title] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([Id], [Fullname], [JobTitle], [Description], [ImagePath]) VALUES (1, N'Ozan Ağdepe', N'Software Developer', N'Araştırma yapmayı sever, siber güvenlik alanında araştırmalar yapar, web sayfası geliştirir...

', N'/theme/assets/images/oa.jpeg')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Title], [Rate]) VALUES (1, N'cSarp', 70)
INSERT [dbo].[Skills] ([Id], [Title], [Rate]) VALUES (2, N'React', 90)
INSERT [dbo].[Skills] ([Id], [Title], [Rate]) VALUES (3, N'Java', 60)
INSERT [dbo].[Skills] ([Id], [Title], [Rate]) VALUES (4, N'CSS', 80)
INSERT [dbo].[Skills] ([Id], [Title], [Rate]) VALUES (5, N'Python', 90)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Slogans] ON 

INSERT [dbo].[Slogans] ([Id], [Sectionname], [Title], [Description]) VALUES (1, N'Services', N'Hizmetler', N'  Profesyonel olarak websitenizi tasarlayabilirim. Sistemleriniz ve domainleriniz için pentest hizmeti verebilirim.
                        Ayrıca Siber güvenlik ve web alanında danışmanlık hizmeti sağlayabilirim..')
INSERT [dbo].[Slogans] ([Id], [Sectionname], [Title], [Description]) VALUES (2, N'Skills', N'Yetenekler', N'Çok Yetenekliyimdir')
SET IDENTITY_INSERT [dbo].[Slogans] OFF
GO
/****** Object:  StoredProcedure [dbo].[ap_ListSkill]    Script Date: 9/21/2023 11:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ap_ListSkill]
as
begin
select * from Skills
end
GO
/****** Object:  StoredProcedure [dbo].[ap_ListSlogan]    Script Date: 9/21/2023 11:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ap_ListSlogan]
@sectionName nvarchar(120)
as
begin
select * from Slogans where Sectionname =@sectionName
end
GO
USE [master]
GO
ALTER DATABASE [AgdPersonDb] SET  READ_WRITE 
GO
