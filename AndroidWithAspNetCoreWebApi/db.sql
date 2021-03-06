USE [master]
GO
/****** Object:  Database [BlogsDb]    Script Date: 4/10/2022 12:17:04 PM ******/
CREATE DATABASE [BlogsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogsDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlogsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlogsDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlogsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlogsDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogsDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlogsDb] SET  MULTI_USER 
GO
ALTER DATABASE [BlogsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlogsDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlogsDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlogsDb] SET QUERY_STORE = OFF
GO
USE [BlogsDb]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 4/10/2022 12:17:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[RssFeed] [nvarchar](255) NULL,
	[TS] [smalldatetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 4/10/2022 12:17:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[BlogsId] [int] NOT NULL,
	[CategoriesId] [int] NOT NULL,
 CONSTRAINT [PK_BlogCategory_1] PRIMARY KEY CLUSTERED 
(
	[BlogsId] ASC,
	[CategoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/10/2022 12:17:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (1, N'Coding Sonata', N'CodingSonata is the best place where you can learn new technical stuff, improve your coding skills and listen to amazing classical music', N'codingsonata.com', N'codingsonata.com/feed', CAST(N'2020-12-31T11:39:00' AS SmallDateTime), 1)
INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (2, N'ASP.NET Blog', N'The official blog for ASP.NET Developers and Community', N'https://devblogs.microsoft.com/aspnet/', N'https://devblogs.microsoft.com/aspnet/feed/', CAST(N'2021-01-17T16:23:00' AS SmallDateTime), 1)
INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (3, N'Android Developers Blog', N'The latest Android and Google Play news for app and game developers.', N'https://android-developers.googleblog.com/', N'https://android-developers.blogspot.com/atom.xml', CAST(N'2020-12-27T08:05:00' AS SmallDateTime), 1)
INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (4, N'Google Developers', N'Engineering and technology articles for developers, written and curated by Googlers. The views expressed are those of the authors and don''t necessarily reflect those of Google.', N'https://medium.com/google-developers', N'', CAST(N'2021-01-26T10:53:00' AS SmallDateTime), 1)
INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (5, N'Microsoft Azure Blog', N'Get the latest Azure news, updates, and announcements from the Azure blog. From product updates to hot topics, hear from the Azure experts.', N'https://azure.microsoft.com/en-us/blog/', N'', CAST(N'2020-12-03T12:13:00' AS SmallDateTime), 1)
INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (6, N'SQL Server Blog', N'Learn how to unleash the power in your data and get the latest Microsoft SQL Server news, updates, and best practices from our Microsoft experts.', N'https://cloudblogs.microsoft.com/sqlserver/', N'', CAST(N'2021-01-27T09:20:00' AS SmallDateTime), 1)
INSERT [dbo].[Blog] ([Id], [Name], [Description], [Url], [RssFeed], [TS], [Active]) VALUES (7, N'Cisco Blogs', N'Insights on Cisco''s Global Search for Innovative Technology Solutions', N'https://blogs.cisco.com/', N'https://blogs.cisco.com/feed', CAST(N'2021-01-31T19:40:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (1, 1)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (1, 2)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (1, 4)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (1, 5)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (2, 1)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (2, 2)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (2, 4)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (2, 5)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (3, 1)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (3, 4)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (4, 1)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (4, 4)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (5, 4)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (5, 5)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (5, 6)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (6, 4)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (6, 5)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (7, 5)
INSERT [dbo].[BlogCategory] ([BlogsId], [CategoriesId]) VALUES (7, 6)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Front End Development')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Back End Development')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Desktop Development')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Databases')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'DevOps and Cloud')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Infrastructure and Networking')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
USE [master]
GO
ALTER DATABASE [BlogsDb] SET  READ_WRITE 
GO
