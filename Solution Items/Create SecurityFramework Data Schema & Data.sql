USE [master]
GO
/****** Object:  Database [SecurityFramework]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE DATABASE [SecurityFramework]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SecurityFramework', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SecurityFramework.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SecurityFramework_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SecurityFramework_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SecurityFramework] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SecurityFramework].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SecurityFramework] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SecurityFramework] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SecurityFramework] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SecurityFramework] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SecurityFramework] SET ARITHABORT OFF 
GO
ALTER DATABASE [SecurityFramework] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SecurityFramework] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SecurityFramework] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SecurityFramework] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SecurityFramework] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SecurityFramework] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SecurityFramework] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SecurityFramework] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SecurityFramework] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SecurityFramework] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SecurityFramework] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SecurityFramework] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SecurityFramework] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SecurityFramework] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SecurityFramework] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SecurityFramework] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SecurityFramework] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SecurityFramework] SET RECOVERY FULL 
GO
ALTER DATABASE [SecurityFramework] SET  MULTI_USER 
GO
ALTER DATABASE [SecurityFramework] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SecurityFramework] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SecurityFramework] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SecurityFramework] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SecurityFramework] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SecurityFramework', N'ON'
GO
ALTER DATABASE [SecurityFramework] SET QUERY_STORE = OFF
GO
USE [SecurityFramework]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SecurityFramework]
GO
/****** Object:  Schema [Access]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE SCHEMA [Access]
GO
/****** Object:  Table [Access].[Domains]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Domains](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Domains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Access].[Groups]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Groups](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[OrganizationId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Access].[Offices]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Offices](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Access].[Roles]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DomainId] [uniqueidentifier] NULL,
	[OrganizationId] [uniqueidentifier] NULL,
	[GroupId] [uniqueidentifier] NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[ShopId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Access].[Organizations]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Organizations](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[DomainId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Access].[Shops]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Shops](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [Access].[vwAreasAndRoles]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [Access].[vwAreasAndRoles]
AS
/* Domains */
SELECT 1 AS AreaSeq,
       'Domain' AS Area,
       dom.[Name] AS AreaName,
       dom.Id AS AreaId,
       rle.[Name] AS Roles,
       rle.[Sequence] AS Seq,
       'Domain / '+dom.[Name]+' / '+rle.[Name] AS AreaAndRole,
       CASE
           WHEN(dom.[Name] IS NOT NULL)
           THEN dom.[Name]
       END AS BreadCrumb,
       rle.Id AS RoleId,
	  dom.AppId
FROM Access.Roles AS rle
     LEFT OUTER JOIN Access.[Domains] AS dom ON rle.DomainId = dom.Id
WHERE rle.DomainId IS NOT NULL
/*------------------------------------*/
UNION ALL                                           
/* Shops */
SELECT 2 AS AreaSeq,
       'Organization' AS Area,
       org.Name AS AreaName,
       org.Id,
       rle.Name AS Roles,
       rle.Sequence,
       'Organization / '+org.Name+' / '+rle.Name AS AreaAndRole,
       CASE
           WHEN(dom.[Name] IS NOT NULL)
               AND (org.[Name] IS NOT NULL)
           THEN dom.[Name]+' / '+org.[Name]
       END AS BreadCrumb,
       rle.Id AS RoleId,
	  dom.AppId
FROM Access.Organizations AS org
     RIGHT OUTER JOIN Access.[Domains] AS dom ON org.DomainId = dom.Id
     RIGHT OUTER JOIN Access.Roles AS rle ON org.Id = rle.OrganizationId
WHERE(rle.OrganizationId IS NOT NULL)
/*------------------------------------*/
UNION ALL                                           
/* Shops */
SELECT 3 AS AreaSeq,
       'Groups' AS Area,
       grp.Name AS AreaName,
       grp.Id,
       rle.Name AS Roles,
       rle.Sequence AS Seq,
       'Groups / '+grp.Name+' / '+rle.Name AS AreaAndRole,
       CASE
           WHEN(dom.[Name] IS NOT NULL)
               AND (org.[Name] IS NOT NULL)
               AND (grp.[Name] IS NOT NULL)
           THEN dom.[Name]+' / '+org.[Name]+' / '+grp.[Name]
       END AS BreadCrumb,
       rle.Id AS RoleId,
	  dom.AppId
FROM Access.Organizations AS org
     INNER JOIN Access.[Domains] AS dom ON org.DomainId = dom.Id
     LEFT OUTER JOIN Access.Groups AS grp ON org.Id = grp.OrganizationId
     RIGHT OUTER JOIN Access.Roles AS rle ON grp.Id = rle.GroupId
WHERE(rle.GroupId IS NOT NULL)
/*------------------------------------*/
UNION ALL                                           
/* Shops */
SELECT 4 AS AreaSeq,
       'Offices' AS Area,
       [off].Name AS AreaName,
       [off].Id AS AreaId,
       rle.Name AS Roles,
       rle.Sequence AS Seq,
       'Offices / '+[off].Name+' / '+rle.Name AS AreaAndRole,
       CASE
           WHEN(dom.[Name] IS NOT NULL)
               AND (org.[Name] IS NOT NULL)
               AND (grp.[Name] IS NOT NULL)
               AND ([off].[Name] IS NOT NULL)
           THEN dom.[Name]+' / '+org.[Name]+' / '+grp.[Name]+' / '+[off].[Name]
       END AS BreadCrumb,
       rle.Id AS RoleId,
	  dom.AppId
FROM Access.Offices AS [off]
     RIGHT OUTER JOIN Access.Organizations AS org
     INNER JOIN Access.[Domains] AS dom ON org.DomainId = dom.Id
     INNER JOIN Access.Groups AS grp ON org.Id = grp.OrganizationId ON [off].GroupId = grp.Id
     RIGHT OUTER JOIN Access.Roles AS rle ON [off].Id = rle.OfficeId
WHERE(rle.OfficeId IS NOT NULL)
/*------------------------------------*/
UNION ALL                                           
/* Shops */
SELECT 5 AS AreaSeq,
       'Shops' AS Area,
       shp.Name AS AreaName,
       shp.Id AS AreaId,
       rle.Name AS Roles,
       rle.Sequence AS Seq,
       'Shops / '+shp.Name+' / '+rle.Name AS AreaAndRole,
       CASE
           WHEN(dom.[Name] IS NOT NULL)
               AND (org.[Name] IS NOT NULL)
               AND (grp.[Name] IS NOT NULL)
               AND ([off].[Name] IS NOT NULL)
               AND (shp.[Name] IS NOT NULL)
           THEN dom.[Name]+' / '+org.[Name]+' / '+grp.[Name]+' / '+[off].[Name]+' / '+shp.[Name]
       END AS BreadCrumb,
       rle.Id AS RoleId,
	  dom.AppId
FROM Access.Offices AS [off]
     INNER JOIN Access.Groups AS grp ON [off].GroupId = grp.Id
     INNER JOIN Access.Organizations AS org
     INNER JOIN Access.[Domains] AS dom ON org.DomainId = dom.Id ON grp.OrganizationId = org.Id
     LEFT OUTER JOIN Access.Shops AS shp ON [off].Id = shp.OfficeId
     RIGHT OUTER JOIN Access.Roles AS rle ON shp.Id = rle.ShopId
WHERE(rle.ShopId IS NOT NULL);


GO
/****** Object:  View [Access].[vwAreasAndSubAreas]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [Access].[vwAreasAndSubAreas] AS
SELECT     'Dom' AS Area,   Id, AppId, [Name]
FROM            Access.[Domains]
UNION ALL
SELECT     'Org' AS Area,  Id, AppId, [Name]
FROM            Access.Organizations
UNION ALL
SELECT     'Grp' AS Area,    Id, AppId, [Name]
FROM            Access.Groups
UNION ALL
SELECT    'Off' AS Area,     Id, AppId, [Name]
FROM            Access.Offices
UNION ALL
SELECT    'Shp' AS Area,     Id, AppId, [Name]
FROM            Access.Shops

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[SysAdmin] [bit] NOT NULL,
	[FirstName] [nvarchar](256) NULL,
	[LastName] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Access].[RoleUsers]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[RoleUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_RoleUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [Access].[vwAreasAndRolesAndUsers]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreasAndRolesAndUsers]
AS
SELECT        vwaar.AppId, vwaar.AreaId, vwaar.AreaSeq, vwaar.Seq, vwaar.BreadCrumb, vwaar.AreaAndRole, ru.Id, ru.RoleId, ru.UserId, u.LastName + N', ' + u.FirstName AS DisplayName
FROM            Access.vwAreasAndRoles AS vwaar INNER JOIN
                         Access.RoleUsers AS ru ON vwaar.RoleId = ru.RoleId INNER JOIN
                         dbo.AspNetUsers AS u ON ru.UserId = u.Id

GO
/****** Object:  Table [Access].[Routes]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[Routes](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NULL,
	[FilePath] [varchar](500) NULL,
	[FileName] [varchar](100) NULL,
	[AppPath] [varchar](255) NULL,
	[RoutePath] [varchar](200) NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Access].[RoleRoutes]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Access].[RoleRoutes](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RouteId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RoleRoutes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [Access].[vwAreasAndRolesAndRoutes]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Access].[vwAreasAndRolesAndRoutes]
AS
SELECT        vwaar.AreaId, vwaar.AreaSeq, vwaar.Seq, vwaar.BreadCrumb, vwaar.AreaAndRole, rr.Id, rr.RoleId, rr.RouteId, rt.AppId, rt.RoutePath
FROM            Access.RoleRoutes AS rr INNER JOIN
                         Access.vwAreasAndRoles AS vwaar ON rr.RoleId = vwaar.RoleId INNER JOIN
                         Access.[Routes] AS rt ON rr.RouteId = rt.Id


GO
/****** Object:  View [Access].[vwAreaTrees]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreaTrees]
AS
SELECT Id AS [Id],
       NULL AS [ParentId],
       [Name] AS [Area]
FROM Access.[Domains]
UNION ALL
SELECT Id AS [Id],
       DomainId AS [ParentId],
       [Name] AS [Area]
FROM Access.Organizations
UNION ALL
SELECT Id AS [Id],
       OrganizationId AS [ParentId],
       [Name] AS [Area]
FROM Access.Groups
UNION ALL
SELECT Id AS [Id],
       GroupId AS [ParentId],
       [Name] AS [Area]
FROM Access.Offices
UNION ALL
SELECT Id AS [Id],
       OfficeId AS [ParentId],
       [Name] AS [Area]
FROM Access.Shops
GO
/****** Object:  View [Access].[vwIsInRole]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Access].[vwIsInRole] AS
/* Domains */
SELECT a.AppId AS AreaAppId,
       r.DomainId AS AreaId,
       a.[Name] AS Area,
       r.Id AS RoleId,
       r.[Name],
       ru.UserId,
       u.UserName,
       rr.RouteId,
       rt.[RoutePath],
       rt.AppId AS RouteAppId
FROM Access.[Domains] AS a
     LEFT OUTER JOIN Access.Roles AS r ON a.Id = r.DomainId
     INNER JOIN Access.RoleRoutes AS rr ON r.Id = rr.RoleId
     INNER JOIN Access.[Routes] AS rt ON rr.RouteId = rt.Id
     INNER JOIN Access.RoleUsers AS ru ON ru.RoleId = r.Id
     INNER JOIN dbo.AspNetUsers AS u ON ru.UserId = u.Id
WHERE(r.DomainId IS NOT NULL)
UNION ALL
/* Organizations */
SELECT a.AppId AS AreaAppId,
       r.OrganizationId AS AreaId,
       a.[Name] AS Area,
       r.Id AS RoleId,
       r.[Name],
       ru.UserId,
       u.UserName,
       rr.RouteId,
       rt.[RoutePath],
       rt.AppId AS RouteAppId
FROM Access.Organizations AS a
     LEFT OUTER JOIN Access.Roles AS r ON a.Id = r.OrganizationId
     INNER JOIN Access.RoleRoutes AS rr ON r.Id = rr.RoleId
     INNER JOIN Access.[Routes] AS rt ON rr.RouteId = rt.Id
     INNER JOIN Access.RoleUsers AS ru ON ru.RoleId = r.Id
     INNER JOIN dbo.AspNetUsers AS u ON ru.UserId = u.Id
WHERE(r.OrganizationId IS NOT NULL)
UNION ALL
/* Groups */
SELECT a.AppId AS AreaAppId,
       r.GroupId AS AreaId,
       a.[Name] AS Area,
       r.Id AS RoleId,
       r.[Name],
       ru.UserId,
       u.UserName,
       rr.RouteId,
       rt.[RoutePath],
       rt.AppId AS RouteAppId
FROM Access.Groups AS a
     LEFT OUTER JOIN Access.Roles AS r ON a.Id = r.GroupId
     INNER JOIN Access.RoleRoutes AS rr ON r.Id = rr.RoleId
     INNER JOIN Access.[Routes] AS rt ON rr.RouteId = rt.Id
     INNER JOIN Access.RoleUsers AS ru ON ru.RoleId = r.Id
     INNER JOIN dbo.AspNetUsers AS u ON ru.UserId = u.Id
WHERE(r.GroupId IS NOT NULL)
UNION ALL
/* Offices */
SELECT a.AppId AS AreaAppId,
       r.OfficeId AS AreaId,
       a.[Name] AS Area,
       r.Id AS RoleId,
       r.[Name],
       ru.UserId,
       u.UserName,
       rr.RouteId,
       rt.[RoutePath],
       rt.AppId AS RouteAppId
FROM Access.Offices AS a
     LEFT OUTER JOIN Access.Roles AS r ON a.Id = r.OfficeId
     INNER JOIN Access.RoleRoutes AS rr ON r.Id = rr.RoleId
     INNER JOIN Access.[Routes] AS rt ON rr.RouteId = rt.Id
     INNER JOIN Access.RoleUsers AS ru ON ru.RoleId = r.Id
     INNER JOIN dbo.AspNetUsers AS u ON ru.UserId = u.Id
WHERE(r.OfficeId IS NOT NULL)
UNION ALL
/* Shops */
SELECT a.AppId AS AreaAppId,
       r.ShopId AS AreaId,
       a.[Name] AS Area,
       r.Id AS RoleId,
       r.[Name],
       ru.UserId,
       u.UserName,
       rr.RouteId,
       rt.[RoutePath],
       rt.AppId AS RouteAppId
FROM Access.Offices AS a
     LEFT OUTER JOIN Access.Roles AS r ON a.Id = r.ShopId
     INNER JOIN Access.RoleRoutes AS rr ON r.Id = rr.RoleId
     INNER JOIN Access.[Routes] AS rt ON rr.RouteId = rt.Id
     INNER JOIN Access.RoleUsers AS ru ON ru.RoleId = r.Id
     INNER JOIN dbo.AspNetUsers AS u ON ru.UserId = u.Id
WHERE(r.ShopId IS NOT NULL)

GO
/****** Object:  View [Access].[vwRolesUsers]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwRolesUsers]
AS
SELECT        ru.RoleId, ru.UserId, u.Email, u.UserName, u.LastName + N', ' + u.FirstName AS DisplayName
FROM            Access.RoleUsers AS ru INNER JOIN
                         dbo.AspNetUsers AS u ON ru.UserId = u.Id

GO
/****** Object:  View [Access].[vwRolesRoutes]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Access].[vwRolesRoutes]
AS
SELECT        TOP (100) PERCENT rr.RoleId, rt.AppId, rt.FilePath, rt.FileName, rt.AppPath, rt.RoutePath, rr.RouteId
FROM            Access.RoleRoutes AS rr INNER JOIN
                         Access.[Routes] AS rt ON rr.RouteId = rt.Id


GO
/****** Object:  View [Access].[vwBreadCrumb]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [Access].[vwBreadCrumb]
AS
     SELECT 
		  CASE
                WHEN(dom.Id IS NOT NULL)
                    AND (org.Id IS NULL)
                    AND (grp.Id IS NULL)
                    AND ([off].Id IS NULL)
                    AND (shp.Id IS NULL)
                THEN dom.Id
                WHEN(dom.Id IS NOT NULL)
                    AND (org.Id IS NOT NULL)
                    AND (grp.Id IS NULL)
                    AND ([off].Id IS NULL)
                    AND (shp.Id IS NULL)
                THEN org.Id
                WHEN(dom.Id IS NOT NULL)
                    AND (org.Id IS NOT NULL)
                    AND (grp.Id IS NOT NULL)
                    AND ([off].Id IS NULL)
                    AND (shp.Id IS NULL)
                THEN grp.Id
                WHEN(dom.Id IS NOT NULL)
                    AND (org.Id IS NOT NULL)
                    AND (grp.Id IS NOT NULL)
                    AND ([off].Id IS NOT NULL)
                    AND (shp.Id IS NULL)
                THEN [off].Id
                WHEN(dom.Id IS NOT NULL)
                    AND (org.Id IS NOT NULL)
                    AND (grp.Id IS NOT NULL)
                    AND ([off].Id IS NOT NULL)
                    AND (shp.Id IS NOT NULL)
                THEN shp.Id
            END AS AreaId,
		  CASE
                WHEN(dom.[Name] IS NOT NULL)
                    AND (org.[Name] IS NULL)
                    AND (grp.[Name] IS NULL)
                    AND ([off].[Name] IS NULL)
                    AND (shp.[Name] IS NULL)
                THEN dom.[Name]
                WHEN(dom.[Name] IS NOT NULL)
                    AND (org.[Name] IS NOT NULL)
                    AND (grp.[Name] IS NULL)
                    AND ([off].[Name] IS NULL)
                    AND (shp.[Name] IS NULL)
                THEN dom.[Name]+' / '+org.[Name]
                WHEN(dom.[Name] IS NOT NULL)
                    AND (org.[Name] IS NOT NULL)
                    AND (grp.[Name] IS NOT NULL)
                    AND ([off].[Name] IS NULL)
                    AND (shp.[Name] IS NULL)
                THEN dom.[Name]+' / '+org.[Name]+' / '+grp.[Name]
                WHEN(dom.[Name] IS NOT NULL)
                    AND (org.[Name] IS NOT NULL)
                    AND (grp.[Name] IS NOT NULL)
                    AND ([off].[Name] IS NOT NULL)
                    AND (shp.[Name] IS NULL)
                THEN dom.[Name]+' / '+org.[Name]+' / '+grp.[Name]+' / '+[off].[Name]
                WHEN(dom.[Name] IS NOT NULL)
                    AND (org.[Name] IS NOT NULL)
                    AND (grp.[Name] IS NOT NULL)
                    AND ([off].[Name] IS NOT NULL)
                    AND (shp.[Name] IS NOT NULL)
                THEN dom.[Name]+' / '+org.[Name]+' / '+grp.[Name]+' / '+[off].[Name]+' / '+shp.[Name]
            END AS BreadCrumb
     FROM Access.[Domains] AS dom
          LEFT OUTER JOIN Access.Organizations AS org ON dom.Id = org.DomainId
          LEFT OUTER JOIN Access.Groups AS grp ON org.Id = grp.OrganizationId
          LEFT OUTER JOIN Access.Offices AS [off] ON grp.Id = [off].GroupId
          LEFT OUTER JOIN Access.Shops AS shp ON [off].Id = shp.OfficeId;




GO
/****** Object:  View [dbo].[View_1]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        4 AS AreaSeq, 'Offices' AS Area, [off].Name AS AreaName, [off].Id AS AreaId, rle.Name AS Roles, rle.Sequence AS Seq, 'Offices / ' + [off].Name + ' / ' + rle.Name AS AreaAndRole, 
                         CASE WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) AND (grp.[Name] IS NOT NULL) AND ([off].[Name] IS NOT NULL) 
                         THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] + ' / ' + [off].[Name] END AS BreadCrumb, rle.Id AS RoleId, dom.AppId
FROM            Access.Offices AS [off] RIGHT OUTER JOIN
                         Access.Organizations AS org INNER JOIN
                         Access.Domains AS dom ON org.DomainId = dom.Id INNER JOIN
                         Access.Groups AS grp ON org.Id = grp.OrganizationId ON [off].GroupId = grp.Id RIGHT OUTER JOIN
                         Access.Roles AS rle ON [off].Id = rle.OfficeId
WHERE        (rle.OfficeId IS NOT NULL)

GO
/****** Object:  View [Access].[vwRoles]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwRoles]
AS
SELECT        Id, Sequence, Name, CASE WHEN DomainId IS NOT NULL THEN DomainId WHEN OrganizationId IS NOT NULL THEN OrganizationId WHEN GroupId IS NOT NULL THEN GroupId WHEN OfficeId IS NOT NULL 
                         THEN OfficeId WHEN ShopId IS NOT NULL THEN ShopId ELSE Id END AS AreaId
FROM            Access.Roles

GO
/****** Object:  View [Access].[vwAreas]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreas]
AS
SELECT        CASE WHEN (dom.Id IS NOT NULL) AND (org.Id IS NULL) AND (grp.Id IS NULL) AND ([off].Id IS NULL) AND (shp.Id IS NULL) THEN dom.Id WHEN (dom.Id IS NOT NULL) AND (org.Id IS NOT NULL) AND (grp.Id IS NULL)
                          AND ([off].Id IS NULL) AND (shp.Id IS NULL) THEN org.Id WHEN (dom.Id IS NOT NULL) AND (org.Id IS NOT NULL) AND (grp.Id IS NOT NULL) AND ([off].Id IS NULL) AND (shp.Id IS NULL) 
                         THEN grp.Id WHEN (dom.Id IS NOT NULL) AND (org.Id IS NOT NULL) AND (grp.Id IS NOT NULL) AND ([off].Id IS NOT NULL) AND (shp.Id IS NULL) THEN [off].Id WHEN (dom.Id IS NOT NULL) AND (org.Id IS NOT NULL) 
                         AND (grp.Id IS NOT NULL) AND ([off].Id IS NOT NULL) AND (shp.Id IS NOT NULL) THEN shp.Id END AS AreaId, CASE WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NULL) AND (grp.[Name] IS NULL) AND 
                         ([off].[Name] IS NULL) AND (shp.[Name] IS NULL) THEN dom.[Name] WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) AND (grp.[Name] IS NULL) AND ([off].[Name] IS NULL) AND 
                         (shp.[Name] IS NULL) THEN dom.[Name] + ' / ' + org.[Name] WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) AND (grp.[Name] IS NOT NULL) AND ([off].[Name] IS NULL) AND (shp.[Name] IS NULL) 
                         THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) AND (grp.[Name] IS NOT NULL) AND ([off].[Name] IS NOT NULL) AND 
                         (shp.[Name] IS NULL) THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] + ' / ' + [off].[Name] WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) AND (grp.[Name] IS NOT NULL) AND 
                         ([off].[Name] IS NOT NULL) AND (shp.[Name] IS NOT NULL) THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] + ' / ' + [off].[Name] + ' / ' + shp.[Name] END AS BreadCrumb, dom.Id AS DomId, 
                         dom.Name AS Domain, org.Id AS OrgId, org.Name AS Organization, grp.Id AS GrpId, grp.Name AS [Group], [off].Id AS OffId, [off].Name AS Office, shp.Id AS ShpId, shp.Name AS Shop
FROM            Access.Domains AS dom LEFT OUTER JOIN
                         Access.Organizations AS org ON dom.Id = org.DomainId LEFT OUTER JOIN
                         Access.Groups AS grp ON org.Id = grp.OrganizationId LEFT OUTER JOIN
                         Access.Offices AS [off] ON grp.Id = [off].GroupId LEFT OUTER JOIN
                         Access.Shops AS shp ON [off].Id = shp.OfficeId

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Routes_RoutePath]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Routes_RoutePath] ON [Access].[Routes]
(
	[RoutePath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/15/2017 8:56:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Access].[Domains] ADD  CONSTRAINT [DF_Domains_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[Groups] ADD  CONSTRAINT [DF_Groups_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[Offices] ADD  CONSTRAINT [DF_Offices_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[Organizations] ADD  CONSTRAINT [DF_Organizations_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[RoleRoutes] ADD  CONSTRAINT [DF_RoleRoutes_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[Roles] ADD  CONSTRAINT [DF_Roles_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[RoleUsers] ADD  CONSTRAINT [DF_RoleUsers_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[Routes] ADD  CONSTRAINT [DF_Routes_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [Access].[Shops] ADD  CONSTRAINT [DF_Shops_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_SysAdmin]  DEFAULT ((0)) FOR [SysAdmin]
GO
ALTER TABLE [Access].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Organizations] FOREIGN KEY([OrganizationId])
REFERENCES [Access].[Organizations] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[Groups] CHECK CONSTRAINT [FK_Groups_Organizations]
GO
ALTER TABLE [Access].[Offices]  WITH CHECK ADD  CONSTRAINT [FK_Offices_Groups] FOREIGN KEY([GroupId])
REFERENCES [Access].[Groups] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[Offices] CHECK CONSTRAINT [FK_Offices_Groups]
GO
ALTER TABLE [Access].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Domains] FOREIGN KEY([DomainId])
REFERENCES [Access].[Domains] ([Id])
GO
ALTER TABLE [Access].[Organizations] CHECK CONSTRAINT [FK_Organizations_Domains]
GO
ALTER TABLE [Access].[RoleRoutes]  WITH CHECK ADD  CONSTRAINT [FK_RoleRoutes_Roles] FOREIGN KEY([RoleId])
REFERENCES [Access].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[RoleRoutes] CHECK CONSTRAINT [FK_RoleRoutes_Roles]
GO
ALTER TABLE [Access].[RoleRoutes]  WITH CHECK ADD  CONSTRAINT [FK_RoleRoutes_Routes] FOREIGN KEY([RouteId])
REFERENCES [Access].[Routes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[RoleRoutes] CHECK CONSTRAINT [FK_RoleRoutes_Routes]
GO
ALTER TABLE [Access].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Domains] FOREIGN KEY([DomainId])
REFERENCES [Access].[Domains] ([Id])
GO
ALTER TABLE [Access].[Roles] CHECK CONSTRAINT [FK_Roles_Domains]
GO
ALTER TABLE [Access].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Groups] FOREIGN KEY([GroupId])
REFERENCES [Access].[Groups] ([Id])
GO
ALTER TABLE [Access].[Roles] CHECK CONSTRAINT [FK_Roles_Groups]
GO
ALTER TABLE [Access].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Offices] FOREIGN KEY([OfficeId])
REFERENCES [Access].[Offices] ([Id])
GO
ALTER TABLE [Access].[Roles] CHECK CONSTRAINT [FK_Roles_Offices]
GO
ALTER TABLE [Access].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Organizations] FOREIGN KEY([OrganizationId])
REFERENCES [Access].[Organizations] ([Id])
GO
ALTER TABLE [Access].[Roles] CHECK CONSTRAINT [FK_Roles_Organizations]
GO
ALTER TABLE [Access].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Shops] FOREIGN KEY([ShopId])
REFERENCES [Access].[Shops] ([Id])
GO
ALTER TABLE [Access].[Roles] CHECK CONSTRAINT [FK_Roles_Shops]
GO
ALTER TABLE [Access].[RoleUsers]  WITH CHECK ADD  CONSTRAINT [FK_RoleUsers_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[RoleUsers] CHECK CONSTRAINT [FK_RoleUsers_AspNetUsers]
GO
ALTER TABLE [Access].[RoleUsers]  WITH CHECK ADD  CONSTRAINT [FK_RoleUsers_Roles] FOREIGN KEY([RoleId])
REFERENCES [Access].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[RoleUsers] CHECK CONSTRAINT [FK_RoleUsers_Roles]
GO
ALTER TABLE [Access].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Offices] FOREIGN KEY([OfficeId])
REFERENCES [Access].[Offices] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Access].[Shops] CHECK CONSTRAINT [FK_Shops_Offices]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_AspNetUsers]
GO
/****** Object:  StoredProcedure [Access].[spIsInRole]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================
-- Author:  Rick Donalson
-- Create date: 04/19/2017
-- Description: Filters a user's access levels
-- Looks for a link between the user and the app object,
-- So the user and the app object must be a member of the 
-- same group, no matter what level
-- Uses the vwIsInRole 
------------------------------------------------------------
-- Modified On: 04/26/2017   Modified By: Rick Donalson
-- Modifications: Added Application Guid (AppId)
-- The Application Guid is looked at in the Route & Areas
-- (Domain, Organization, etc.) tables.  
-- So the Area and the Route must be from the same 
-- Application.
------------------------------------------------------------
-- Modified On: 05/01/2017   Modified By: Rick Donalson
-- Modifications: Added code for SysAdmin user
------------------------------------------------------------
--- EXEC [Access].[spIsInRole] 
    N'43c705b4-3b3e-4af2-abc5-99d5bce4c505',
    N'e94f0838-9e03-4471-beef-a273db5d44b4',
    N'/Booking/BookingHome' ;
-- ===========================================================*/
CREATE PROCEDURE [Access].[spIsInRole]
    @AppId uniqueidentifier, 
    @UserId VARCHAR(128), 
    @Route VARCHAR(200)
AS 
BEGIN
    SET NOCOUNT ON;
    /* Diagnostic */
    --DECLARE @AppId uniqueidentifier, @UserId VARCHAR(128), @Route VARCHAR(200);
    --SET @AppId = '43c705b4-3b3e-4af2-abc5-99d5bce4c505'
    ----SET @UserId = N'e94f0838-9e03-4471-beef-a273db5d44b4'; 
    --SET @UserId = N'b92e6acb-5bf4-4009-8f1f-c2bb18dd19c6'; --sysadmin@ups.com
    --SET @Route = '/Booking/BookingHome';
    ----SET @Route = N'/Booking/BookingHome/List'

    /* Declarations */
    DECLARE @Count INT, @Result INT

    /* Grab the System Admin Count */
    SELECT @Count = COUNT(*) 
    FROM AspNetUsers
    WHERE (Id = @UserId)
    AND SysAdmin = 1

    /* Diagnostic */
    --SELECT @Count AS [@Count]

    /* If System Admin then access to all */
    IF @COUNT > 0 
	   SET @Result = 1;
    ELSE 
	   /* Otherwise everybody else */
	   BEGIN
		  /* Grab the User Count */
		  SELECT @Count = COUNT(*) 
		  FROM [Access].[vwIsInRole]
		  WHERE (AreaAppId = @AppId)  
		  AND (RouteAppId = @AppId)
		  AND (UserId = @UserId)
		  AND ([RoutePath] = @Route);

		  /* If use has access */
		  IF @COUNT > 0 
			 SET @Result = 1;
		  ELSE 
			 SET @Result = 0;
	   END

    SELECT @Result;
END


GO
/****** Object:  StoredProcedure [Access].[spUserAreas]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================
-- Author:  Rick Donalson
-- Create date: 05/30/2017
-- Description: Provides a list of areas that an Admin has
-- access to.  Intended for SysAdmin & Area Admins.
-- Is used to populate the Areas Treeview in the 
-- Access "Splash Page"
------------------------------------------------------------
-- Modified On:   Modified By:
-- Modifications: 
------------------------------------------------------------
--- EXEC Access.spUserAreas 
    N'5bf83d87-a677-4f84-b265-024180d17747',
    N'08d0a523-1342-4d27-aa6e-4e7bdd3a1311'
-- ===========================================================*/
CREATE PROCEDURE [Access].[spUserAreas]
    @AppId uniqueidentifier, 
    @UserId VARCHAR(128)
AS 
BEGIN
    SET NOCOUNT ON;
    
    /* Diagnostic */
    --DECLARE @AppId UNIQUEIDENTIFIER, @UserId VARCHAR(128);
    --SET @AppId = '5bf83d87-a677-4f84-b265-024180d17747';
    ----SET @UserId = N'b92e6acb-5bf4-4009-8f1f-c2bb18dd19c6';  --sysadmin@ups.com
    --SET @UserId = N'08d0a523-1342-4d27-aa6e-4e7bdd3a1311'; --pjones@ups.com

    /* Declarations */
    DECLARE @Count INT;
    DECLARE @UserAreaIds TABLE (
	   ID INT IDENTITY(1, 1) PRIMARY KEY CLUSTERED NOT NULL,
	   AreaId UNIQUEIDENTIFIER NULL,
	   RoleId UNIQUEIDENTIFIER NULL
    );
    DECLARE @UserAreas TABLE (
	   ID		 INT IDENTITY(1, 1) PRIMARY KEY CLUSTERED NOT NULL,
	   DomId        UNIQUEIDENTIFIER NOT NULL,
	   OrgId        UNIQUEIDENTIFIER NULL,
	   GrpId        UNIQUEIDENTIFIER NULL,
	   OffId        UNIQUEIDENTIFIER NULL,
	   ShpId        UNIQUEIDENTIFIER NULL
    );
    DECLARE @DistinctAreaIds TABLE (
	   ID		 INT IDENTITY(1, 1) PRIMARY KEY CLUSTERED NOT NULL,
	   AreaId       UNIQUEIDENTIFIER NULL
    );
    
    /* Grab the System Admin Count */
    SELECT @Count = COUNT(*) 
    FROM AspNetUsers
    WHERE (Id = @UserId)
    AND SysAdmin = 1

    /* If System Admin then view all */
    IF @COUNT > 0 
	   SELECT * FROM Access.vwAreaTrees;
    ELSE 
	   BEGIN
	   /*-------------------------------------------------------
	   -- Otherwise get the User's associated AreaIds
	   -- Which will represent only their span of control
	   -------------------------------------------------------*/
	   INSERT INTO @UserAreaIds (
		  AreaId
	   )
	   SELECT DISTINCT
		  AreaId        
	   FROM Access.vwIsInRole
	   WHERE(AreaAppId = @AppId)
		  AND (RouteAppId = @AppId)
		  AND (UserId = @UserId);
		  
	   /* Diagnostic */
	   --SELECT DISTINCT
	   --    AreaId, Area, RoleId, [Name]        
	   --FROM Access.vwIsInRole
	   --WHERE(AreaAppId = @AppId)
	   --    AND (RouteAppId = @AppId)
	   --    AND (UserId = @UserId);
    
	   /*-------------------------------------------------------
	   -- In this section capture all the area "tracks" back 
	   -- through to their originating Domain using 
	   -- the User's AreaIds
	   -- For example, the User may only be an Admin in one
	   -- Office that has a couple of Shops, but the 
	   -- "area track" or link back to the parent domain is 
	   -- required for display of the Areas and Sub-areas on 
	   -- the Access "Splash Page".
	   -------------------------------------------------------*/
	   /* Find any Domains */
	   INSERT INTO @UserAreas (  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   )
	   SELECT  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   FROM Access.vwAreas
	   WHERE DomId IN (
		   SELECT AreaId FROM @UserAreaIds
	   )    
	   /* Find any Organizations */
	   INSERT INTO @UserAreas (  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   )
	   SELECT  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   FROM Access.vwAreas
	   WHERE OrgId IN (
		   SELECT AreaId FROM @UserAreaIds
	   )
	   /* Find any Groups */
	   INSERT INTO @UserAreas (  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   )
	   SELECT  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   FROM Access.vwAreas
	   WHERE GrpId IN (
		   SELECT AreaId FROM @UserAreaIds
	   )    
	   /* Find any Offices */
	   INSERT INTO @UserAreas (  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   )
	   SELECT  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   FROM Access.vwAreas
	   WHERE OffId IN (
		   SELECT AreaId FROM @UserAreaIds
	   )        
	   /* Find any Shops */
	   INSERT INTO @UserAreas (  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   )
	   SELECT  
		  [DomId]
		  ,[OrgId]
		  ,[GrpId]
		  ,[OffId]
		  ,[ShpId]
	   FROM Access.vwAreas
	   WHERE ShpId IN (
		   SELECT AreaId FROM @UserAreaIds
	   )
	   /* Diagnostic */
	   --SELECT * FROM @UserAreas;

	   /*-------------------------------------------------------
	   -- From each area section select the distinct list of ids
	   -------------------------------------------------------*/
	   /* Domain Ids */
	   INSERT INTO @DistinctAreaIds
	   SELECT DISTINCT DomId
	   FROM @UserAreas
	   WHERE DomId IS NOT NULL

	   /* Organization Ids */
	   INSERT INTO @DistinctAreaIds
	   SELECT DISTINCT OrgId
	   FROM @UserAreas
	   WHERE OrgId IS NOT NULL

	   /* Group Ids */
	   INSERT INTO @DistinctAreaIds
	   SELECT DISTINCT GrpId
	   FROM @UserAreas
	   WHERE GrpId IS NOT NULL

	   /* Office Ids */
	   INSERT INTO @DistinctAreaIds
	   SELECT DISTINCT OffId
	   FROM @UserAreas
	   WHERE OffId IS NOT NULL

	   /* Shop Ids */
	   INSERT INTO @DistinctAreaIds
	   SELECT DISTINCT ShpId
	   FROM @UserAreas
	   WHERE ShpId IS NOT NULL

	   /* Diagnostic */
	   --SELECT * FROM @DistinctAreaIds;

	   /*-------------------------------------------------------
	   -- Now filter the items from the view "vwAreaTrees"
	   -------------------------------------------------------*/
	   SELECT 
		  vwat.Id, vwat.ParentId, vwat.Area
	   FROM Access.vwAreaTrees AS vwat
	   INNER JOIN @DistinctAreaIds AS ids
	   ON vwat.Id = ids.AreaId;
    END;


END;



GO
/****** Object:  StoredProcedure [Access].[spUserRoles]    Script Date: 6/15/2017 8:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================
-- Author:  Rick Donalson
-- Create date: 06/07/2017
-- Description: Provides a list of Roles that an Admin is
-- member of.  Limits the items that can be viewed by
-- a specific Admin Role and it's "Span of Control"
------------------------------------------------------------
-- Modified On:   Modified By:
-- Modifications: 
------------------------------------------------------------
--- EXEC Access.spUserRoles 
    N'5bf83d87-a677-4f84-b265-024180d17747',
    N'eb56220b-6bd1-470a-8ebc-50d8b5ab29eb'
-- ===========================================================*/
CREATE PROCEDURE [Access].[spUserRoles] 
    @AppId  UNIQUEIDENTIFIER,                                    
    @UserId VARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Diagnostic */
    --DECLARE @AppId UNIQUEIDENTIFIER, @UserId VARCHAR(128);
    --SET @AppId = '5bf83d87-a677-4f84-b265-024180d17747';
    ----SET @UserId = N'b92e6acb-5bf4-4009-8f1f-c2bb18dd19c6'; --sysadmin@ups.com
    --SET @UserId = N'08d0a523-1342-4d27-aa6e-4e7bdd3a1311';   --pjones@ups.com
    ----SET @UserId = N'eb56220b-6bd1-470a-8ebc-50d8b5ab29eb';   --oleary@ups.com

    /* Declarations */
    DECLARE @Count INT;
    
    /* Grab the System Admin Count */
    SELECT @Count = COUNT(*)
    FROM AspNetUsers
    WHERE(Id = @UserId)
    AND SysAdmin = 1;

    /* If System Admin then view all */
    IF @COUNT > 0
         SELECT DISTINCT 
		  vwrr.RoleId 
		  ,r.[Name]
	    FROM Access.vwRolesRoutes AS vwrr
	    INNER JOIN Access.vwRoles AS r
		  ON vwrr.RoleId = r.Id;
    ELSE
        BEGIN	   
		  /*-------------------------------------------------------
		  -- Otherwise get the User's associated AreaIds
		  -- Which will represent only their span of control
		  -------------------------------------------------------*/
		  SELECT DISTINCT
			 vwrr.RoleId
			 ,r.[Name]
		  FROM Access.RoleUsers AS ru
		  INNER JOIN Access.vwRolesRoutes AS vwrr
		  ON ru.RoleId = vwrr.RoleId
		  INNER JOIN Access.vwRoles AS r
		  ON vwrr.RoleId = r.Id
		  WHERE (vwrr.AppId = @AppId)
		  AND (ru.UserId = @UserId);
        END;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "dom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "org"
            Begin Extent = 
               Top = 12
               Left = 279
               Bottom = 142
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "grp"
            Begin Extent = 
               Top = 17
               Left = 531
               Bottom = 147
               Right = 701
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "off"
            Begin Extent = 
               Top = 27
               Left = 797
               Bottom = 157
               Right = 967
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "shp"
            Begin Extent = 
               Top = 55
               Left = 1047
               Bottom = 185
               Right = 1217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 4470
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
    ' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "rr"
            Begin Extent = 
               Top = 17
               Left = 330
               Bottom = 140
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwaar"
            Begin Extent = 
               Top = 18
               Left = 27
               Bottom = 250
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rt"
            Begin Extent = 
               Top = 18
               Left = 597
               Bottom = 232
               Right = 796
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 3330
         Width = 840
         Width = 480
         Width = 3150
         Width = 2325
         Width = 3345
         Width = 2325
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndRoutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndRoutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[38] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vwaar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 280
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ru"
            Begin Extent = 
               Top = 54
               Left = 292
               Bottom = 178
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 24
               Left = 542
               Bottom = 350
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2865
         Alias = 1275
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Roles (Access)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 245
               Right = 306
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 3975
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6045
         Alias = 2970
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[10] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "rr"
            Begin Extent = 
               Top = 35
               Left = 105
               Bottom = 161
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rt"
            Begin Extent = 
               Top = 32
               Left = 353
               Bottom = 249
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1425
         Width = 1515
         Width = 2325
         Width = 3090
         Width = 1500
         Width = 1830
         Width = 3840
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRolesRoutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRolesRoutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ru"
            Begin Extent = 
               Top = 22
               Left = 38
               Bottom = 218
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 23
               Left = 327
               Bottom = 321
               Right = 551
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1275
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRolesUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRolesUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[38] 4[33] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "off"
            Begin Extent = 
               Top = 22
               Left = 270
               Bottom = 152
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "grp"
            Begin Extent = 
               Top = 22
               Left = 556
               Bottom = 152
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "org"
            Begin Extent = 
               Top = 198
               Left = 273
               Bottom = 328
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dom"
            Begin Extent = 
               Top = 200
               Left = 598
               Bottom = 313
               Right = 768
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rle"
            Begin Extent = 
               Top = 15
               Left = 19
               Bottom = 242
               Right = 183
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 840
         Width = 690
         Width = 1035
         Width = 3390
         Width = 660
         Width = 480
         Width = 2280
         Width = 3525
         Width = 3375
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3045
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Alias = 3405
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [SecurityFramework] SET  READ_WRITE 
GO
