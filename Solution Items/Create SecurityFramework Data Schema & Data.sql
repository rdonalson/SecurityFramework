USE [SecurityFramework]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleRoutes'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleRoutes'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndUsers'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndUsers'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndRoutes'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreasAndRolesAndRoutes'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreas'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreas'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwAreas'

GO
/****** Object:  StoredProcedure [Access].[spIsInRole]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP PROCEDURE [Access].[spIsInRole]
GO
ALTER TABLE [dbo].[AspNetUsers] DROP CONSTRAINT [FK_AspNetUsers_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [Access].[Shops] DROP CONSTRAINT [FK_Shops_Offices]
GO
ALTER TABLE [Access].[RoleUsers] DROP CONSTRAINT [FK_RoleUsers_Roles]
GO
ALTER TABLE [Access].[RoleUsers] DROP CONSTRAINT [FK_RoleUsers_AspNetUsers]
GO
ALTER TABLE [Access].[Roles] DROP CONSTRAINT [FK_Roles_Shops]
GO
ALTER TABLE [Access].[Roles] DROP CONSTRAINT [FK_Roles_Organizations]
GO
ALTER TABLE [Access].[Roles] DROP CONSTRAINT [FK_Roles_Offices]
GO
ALTER TABLE [Access].[Roles] DROP CONSTRAINT [FK_Roles_Groups]
GO
ALTER TABLE [Access].[Roles] DROP CONSTRAINT [FK_Roles_Domains]
GO
ALTER TABLE [Access].[RoleRoutes] DROP CONSTRAINT [FK_RoleRoutes_Routes]
GO
ALTER TABLE [Access].[RoleRoutes] DROP CONSTRAINT [FK_RoleRoutes_Roles]
GO
ALTER TABLE [Access].[Organizations] DROP CONSTRAINT [FK_Organizations_Domains]
GO
ALTER TABLE [Access].[Offices] DROP CONSTRAINT [FK_Offices_Groups]
GO
ALTER TABLE [Access].[Groups] DROP CONSTRAINT [FK_Groups_Organizations]
GO
ALTER TABLE [dbo].[AspNetUsers] DROP CONSTRAINT [DF_AspNetUsers_SysAdmin]
GO
ALTER TABLE [Access].[Shops] DROP CONSTRAINT [DF_Shops_Id]
GO
ALTER TABLE [Access].[Routes] DROP CONSTRAINT [DF_Routes_Id]
GO
ALTER TABLE [Access].[RoleUsers] DROP CONSTRAINT [DF_RoleUsers_Id]
GO
ALTER TABLE [Access].[Roles] DROP CONSTRAINT [DF_Roles_Id]
GO
ALTER TABLE [Access].[RoleRoutes] DROP CONSTRAINT [DF_RoleRoutes_Id]
GO
ALTER TABLE [Access].[Organizations] DROP CONSTRAINT [DF_Organizations_Id]
GO
ALTER TABLE [Access].[Offices] DROP CONSTRAINT [DF_Offices_Id]
GO
ALTER TABLE [Access].[Groups] DROP CONSTRAINT [DF_Groups_Id]
GO
ALTER TABLE [Access].[Domains] DROP CONSTRAINT [DF_Domains_Id]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Index [IX_Routes_RoutePath]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP INDEX [IX_Routes_RoutePath] ON [Access].[Routes]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  View [Access].[vwAreas]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwAreas]
GO
/****** Object:  View [Access].[vwRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwRoles]
GO
/****** Object:  View [Access].[vwRoleRoutes]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwRoleRoutes]
GO
/****** Object:  View [Access].[vwRoleUser]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwRoleUser]
GO
/****** Object:  View [Access].[vwIsInRole]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwIsInRole]
GO
/****** Object:  View [Access].[vwAreaTrees]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwAreaTrees]
GO
/****** Object:  View [Access].[vwAreasAndRolesAndRoutes]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwAreasAndRolesAndRoutes]
GO
/****** Object:  Table [Access].[RoleRoutes]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[RoleRoutes]
GO
/****** Object:  Table [Access].[Routes]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Routes]
GO
/****** Object:  View [Access].[vwAreasAndRolesAndUsers]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwAreasAndRolesAndUsers]
GO
/****** Object:  Table [Access].[RoleUsers]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[RoleUsers]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  View [Access].[vwAreasAndRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP VIEW [Access].[vwAreasAndRoles]
GO
/****** Object:  Table [Access].[Shops]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Shops]
GO
/****** Object:  Table [Access].[Organizations]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Organizations]
GO
/****** Object:  Table [Access].[Roles]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Roles]
GO
/****** Object:  Table [Access].[Offices]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Offices]
GO
/****** Object:  Table [Access].[Groups]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Groups]
GO
/****** Object:  Table [Access].[Domains]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP TABLE [Access].[Domains]
GO
/****** Object:  Schema [Security]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP SCHEMA [Security]
GO
/****** Object:  Schema [Access]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP SCHEMA [Access]
GO
USE [master]
GO
/****** Object:  Database [SecurityFramework]    Script Date: 5/19/2017 3:25:49 PM ******/
DROP DATABASE [SecurityFramework]
GO
/****** Object:  Database [SecurityFramework]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Schema [Access]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE SCHEMA [Access]
GO
/****** Object:  Schema [Security]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE SCHEMA [Security]
GO
/****** Object:  Table [Access].[Domains]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [Access].[Groups]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [Access].[Offices]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [Access].[Roles]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [Access].[Organizations]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [Access].[Shops]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  View [Access].[vwAreasAndRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
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
       rle.[Name] AS Roles,
       rle.[Sequence] AS Seq,
       'Domain / '+dom.[Name]+' / '+rle.[Name] AS AreaAndRole,
       rle.Id AS RoleId
FROM Access.Roles AS rle
     LEFT OUTER JOIN Access.[Domains] AS dom ON rle.DomainId = dom.Id
WHERE rle.DomainId IS NOT NULL
                                           
/*------------------------------------*/

UNION ALL
                                           
/* Organizations*/

SELECT 2 AS AreaSeq,
       'Organization' AS Area,
       org.[Name] AS AreaName,
       rle.[Name] AS Roles,
       rle.[Sequence],
       'Organization / ' + org.[Name] + ' / ' + rle.[Name] AS AreaAndRole,
       rle.Id AS RoleId
FROM Access.Roles AS rle
     LEFT OUTER JOIN Access.Organizations AS org ON rle.OrganizationId = org.Id
WHERE rle.OrganizationId IS NOT NULL
                                           
/*------------------------------------*/

UNION ALL
                                           
/* Groups*/

SELECT 3 AS AreaSeq,
       'Groups' AS Area,
       grp.[Name] AS AreaName,
       rle.[Name] AS Roles,
       rle.[Sequence] AS Seq,
       'Groups / '+grp.[Name]+' / '+rle.[Name] AS AreaAndRole,
       rle.Id AS RoleId
FROM Access.Roles AS rle
     LEFT OUTER JOIN Access.Groups AS grp ON rle.GroupId = grp.Id
WHERE rle.GroupId IS NOT NULL
                                           
/*------------------------------------*/

UNION ALL
                                           
/* Offices*/

SELECT 4 AS AreaSeq,
       'Offices' AS Area,
       [off].[Name] AS AreaName,
       rle.[Name] AS Roles,
       rle.[Sequence] AS Seq,
       'Offices / '+[off].[Name]+' / '+rle.[Name] AS AreaAndRole,
       rle.Id AS RoleId
FROM Access.Roles AS rle
     LEFT OUTER JOIN Access.Offices AS [off] ON rle.OfficeId = [off].Id
WHERE rle.OfficeId IS NOT NULL
                                           
/*------------------------------------*/

UNION ALL
                                           
/* Shops */

SELECT 5 AS AreaSeq,
       'Shops' AS Area,
       shp.[Name] AS AreaName,
       rle.[Name] AS Roles,
       rle.[Sequence] AS Seq,
       'Shops / '+shp.[Name]+' / '+rle.[Name] AS AreaAndRole,
       rle.Id AS RoleId
FROM Access.Roles AS rle
     LEFT OUTER JOIN Access.Shops AS shp ON rle.ShopId = shp.Id
WHERE rle.ShopId IS NOT NULL;






GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/19/2017 3:25:49 PM ******/
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Access].[RoleUsers]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  View [Access].[vwAreasAndRolesAndUsers]    Script Date: 5/19/2017 3:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreasAndRolesAndUsers]
AS
SELECT        aar.AreaSeq, aar.Seq, aar.AreaAndRole, u.Email, ru.Id, ru.RoleId, ru.UserId
FROM            Access.vwAreasAndRoles AS aar INNER JOIN
                         Access.RoleUsers AS ru ON aar.RoleId = ru.RoleId INNER JOIN
                         dbo.AspNetUsers AS u ON ru.UserId = u.Id

GO
/****** Object:  Table [Access].[Routes]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [Access].[RoleRoutes]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  View [Access].[vwAreasAndRolesAndRoutes]    Script Date: 5/19/2017 3:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreasAndRolesAndRoutes]
AS
SELECT        vwaar.AreaSeq, vwaar.Seq, vwaar.AreaAndRole, rr.Id, rr.RoleId, rr.RouteId, rt.RoutePath
FROM            Access.RoleRoutes AS rr INNER JOIN
                         Access.vwAreasAndRoles AS vwaar ON rr.RoleId = vwaar.RoleId INNER JOIN
                         Access.Routes AS rt ON rr.RouteId = rt.Id

GO
/****** Object:  View [Access].[vwAreaTrees]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  View [Access].[vwIsInRole]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  View [Access].[vwRoleUser]    Script Date: 5/19/2017 3:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create VIEW [Access].[vwRoleUser]
AS
SELECT        ru.RoleId, ru.UserId, u.Email, u.UserName
FROM            Access.RoleUsers AS ru INNER JOIN
                         dbo.AspNetUsers AS u ON ru.UserId = u.Id


GO
/****** Object:  View [Access].[vwRoleRoutes]    Script Date: 5/19/2017 3:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwRoleRoutes]
AS
SELECT        rr.RoleId, rr.RouteId, rt.AppId, rt.FilePath, rt.FileName, rt.AppPath, rt.RoutePath
FROM            Access.RoleRoutes AS rr INNER JOIN
                         Access.Routes AS rt ON rr.RouteId = rt.Id

GO
/****** Object:  View [Access].[vwRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [Access].[vwRoles] AS
SELECT Id,
       [Sequence],
       [Name],
       CASE
           WHEN DomainId IS NOT NULL
           THEN DomainId
           WHEN OrganizationId IS NOT NULL
           THEN OrganizationId
           WHEN GroupId IS NOT NULL
           THEN GroupId
           WHEN OfficeId IS NOT NULL
           THEN OfficeId
           WHEN ShopId IS NOT NULL
           THEN ShopId
		 ELSE Id
       END AS AreaId
FROM Access.Roles;
GO
/****** Object:  View [Access].[vwAreas]    Script Date: 5/19/2017 3:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreas]
AS
SELECT        CASE WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NULL) AND (grp.[Name] IS NULL) AND ([off].[Name] IS NULL) AND (shp.[Name] IS NULL) THEN dom.[Name] WHEN (dom.[Name] IS NOT NULL) AND 
                         (org.[Name] IS NOT NULL) AND (grp.[Name] IS NULL) AND ([off].[Name] IS NULL) AND (shp.[Name] IS NULL) THEN dom.[Name] + ' / ' + org.[Name] WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) 
                         AND (grp.[Name] IS NOT NULL) AND ([off].[Name] IS NULL) AND (shp.[Name] IS NULL) THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] WHEN (dom.[Name] IS NOT NULL) AND (org.[Name] IS NOT NULL) 
                         AND (grp.[Name] IS NOT NULL) AND ([off].[Name] IS NOT NULL) AND (shp.[Name] IS NULL) THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] + ' / ' + [off].[Name] WHEN (dom.[Name] IS NOT NULL) AND 
                         (org.[Name] IS NOT NULL) AND (grp.[Name] IS NOT NULL) AND ([off].[Name] IS NOT NULL) AND (shp.[Name] IS NOT NULL) 
                         THEN dom.[Name] + ' / ' + org.[Name] + ' / ' + grp.[Name] + ' / ' + [off].[Name] + ' / ' + shp.[Name] END AS BreadcrubTrail, dom.Id AS DomId, dom.Name AS Domain, org.Id AS OrgId, org.Name AS Organization, 
                         grp.Id AS GrpId, grp.Name AS [Group], [off].Id AS OffId, [off].Name AS Office, shp.Id AS ShpId, shp.Name AS Shop
FROM            Access.Domains AS dom LEFT OUTER JOIN
                         Access.Organizations AS org ON dom.Id = org.DomainId LEFT OUTER JOIN
                         Access.Groups AS grp ON org.Id = grp.OrganizationId LEFT OUTER JOIN
                         Access.Offices AS [off] ON grp.Id = [off].GroupId LEFT OUTER JOIN
                         Access.Shops AS shp ON [off].Id = shp.OfficeId

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/19/2017 3:25:49 PM ******/
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
INSERT [Access].[Domains] ([Id], [AppId], [Name]) VALUES (N'66fcc626-5283-4f09-b6fe-42a55716c6ea', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'Domain - B')
INSERT [Access].[Domains] ([Id], [AppId], [Name]) VALUES (N'f5110e60-e92a-49c8-b905-8b83b1c4adaf', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'Alpharetta Moris Road')
INSERT [Access].[Domains] ([Id], [AppId], [Name]) VALUES (N'95b827e7-d02e-4b46-8905-a641789ca292', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'Domain - A')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'939789cc-885a-47cc-865d-385794bfcfc1', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'6df86eef-b5c1-4400-99f5-989517d406c2', N'Group - B')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'55336104-ea79-4d96-b2fc-d372c01a1772', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'6df86eef-b5c1-4400-99f5-989517d406c2', N'Group - A')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'd43297b9-fa79-47ca-84f0-d69bb0ca521c', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'6c0bdd40-6c19-49db-801a-27f95e6ef7d2', N'Opportunity')
INSERT [Access].[Offices] ([Id], [AppId], [GroupId], [Name]) VALUES (N'60587c15-2c33-475f-8166-303bbf6b28a3', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'939789cc-885a-47cc-865d-385794bfcfc1', N'Office - B')
INSERT [Access].[Offices] ([Id], [AppId], [GroupId], [Name]) VALUES (N'2de4fe56-cb43-40b0-8bc2-908e70aa7f34', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'939789cc-885a-47cc-865d-385794bfcfc1', N'Office - A')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'6c0bdd40-6c19-49db-801a-27f95e6ef7d2', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'f5110e60-e92a-49c8-b905-8b83b1c4adaf', N'Confluence')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'6df86eef-b5c1-4400-99f5-989517d406c2', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'66fcc626-5283-4f09-b6fe-42a55716c6ea', N'Org - A')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'aa85b625-b953-4674-ad3b-abe379266c7f', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'66fcc626-5283-4f09-b6fe-42a55716c6ea', N'Org - B')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'866c3410-97e0-4921-aadb-ced2d98dd24b', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'95b827e7-d02e-4b46-8905-a641789ca292', N'Org - A')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'c01ad5a5-957f-4816-99dd-12e3532f2038', N'5d7e9333-d9c3-4fbe-a092-861daa8db40d', N'23946405-a26b-452f-b422-3567aaee5673')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ae60b1c0-cda2-4274-9ddf-1d5eba58f300', N'aa24fa58-4b83-4833-bdac-2a6cbb2f84f9', N'adf9b600-b90c-4e7d-869b-82cef9f79bac')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'427e6683-8046-440f-a059-23667e785064', N'2742d6d7-4024-41cc-999b-e8bce27e88a3', N'528cb1ba-3611-4dcf-b414-7cd56abe29f3')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'349f3a21-a33b-428b-9047-2d090da279ec', N'aa24fa58-4b83-4833-bdac-2a6cbb2f84f9', N'a25a9e2d-75a8-42db-b911-cf1f2a486af9')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ce32598f-1f5c-43bd-a12d-4277e32563a6', N'cc2c9db9-02f3-4390-912c-5d101487255a', N'23946405-a26b-452f-b422-3567aaee5673')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'8d0eacc3-abb0-4bf1-bc7c-51fb98edb4a9', N'aa24fa58-4b83-4833-bdac-2a6cbb2f84f9', N'528cb1ba-3611-4dcf-b414-7cd56abe29f3')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'8e7a56a0-30b8-4c95-abcf-88b63949eda3', N'2742d6d7-4024-41cc-999b-e8bce27e88a3', N'adf9b600-b90c-4e7d-869b-82cef9f79bac')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'b06a765b-5018-4a7c-93da-a529a6f06ef9', N'5d7e9333-d9c3-4fbe-a092-861daa8db40d', N'528cb1ba-3611-4dcf-b414-7cd56abe29f3')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'e816a532-0ec9-48d7-af35-c02166b0a7c3', N'cc2c9db9-02f3-4390-912c-5d101487255a', N'528cb1ba-3611-4dcf-b414-7cd56abe29f3')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'4891b419-ccf2-4266-8765-e2531dbbe94b', N'aa24fa58-4b83-4833-bdac-2a6cbb2f84f9', N'23946405-a26b-452f-b422-3567aaee5673')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'8071f31f-c5fd-4d6b-8558-efbb2e4129e6', N'5d7e9333-d9c3-4fbe-a092-861daa8db40d', N'adf9b600-b90c-4e7d-869b-82cef9f79bac')
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'1a07a305-147d-4933-9869-1170a9a892e1', 5, N'sdfsdf', NULL, N'6df86eef-b5c1-4400-99f5-989517d406c2', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'5e6061db-9c2e-e711-8920-185e0f81ca6d', 0, N'System Admin', NULL, NULL, NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'aa24fa58-4b83-4833-bdac-2a6cbb2f84f9', 0, N'Admin', NULL, NULL, N'd43297b9-fa79-47ca-84f0-d69bb0ca521c', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'cc2c9db9-02f3-4390-912c-5d101487255a', 3, N'Axial', NULL, NULL, N'd43297b9-fa79-47ca-84f0-d69bb0ca521c', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'ea0f37ac-bc35-4d13-bfa6-6a17dfa25484', 0, N'Admin', NULL, NULL, NULL, NULL, N'a3b6a47f-a9c5-4f05-939f-0291a2202f0d')
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'4f1e5c3e-6e7f-4b66-82ce-792a4209ce48', 0, N'Admins', N'95b827e7-d02e-4b46-8905-a641789ca292', NULL, NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'5d7e9333-d9c3-4fbe-a092-861daa8db40d', 1, N'Managers', NULL, NULL, N'd43297b9-fa79-47ca-84f0-d69bb0ca521c', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'50450e82-0f4e-4c06-9c4d-985fbaf52038', 0, N'Admin', NULL, NULL, N'55336104-ea79-4d96-b2fc-d372c01a1772', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'523d7435-284d-484d-b26e-9fbdfd3dfa06', 2, N'Operators', NULL, NULL, NULL, NULL, N'a3b6a47f-a9c5-4f05-939f-0291a2202f0d')
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'6c4d4c17-d6f4-458b-89e2-a4f555af514a', 0, N'Admin', NULL, NULL, NULL, N'60587c15-2c33-475f-8166-303bbf6b28a3', NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'f9d887ee-baec-4807-b2a6-b003c6f1f846', 2, N'Directors', NULL, N'6df86eef-b5c1-4400-99f5-989517d406c2', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'43986cfa-8b1f-476b-9bd0-b7856b6c7346', 1, N'Vice Presidents', NULL, N'6df86eef-b5c1-4400-99f5-989517d406c2', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'b1d60618-8987-4d84-a060-cb799b21d712', 0, N'Admin', NULL, N'6df86eef-b5c1-4400-99f5-989517d406c2', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'7704aa22-745a-4411-9670-d2cf88577193', 1, N'Managers', NULL, NULL, NULL, NULL, N'a3b6a47f-a9c5-4f05-939f-0291a2202f0d')
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'2742d6d7-4024-41cc-999b-e8bce27e88a3', 2, N'Millennium', NULL, NULL, N'd43297b9-fa79-47ca-84f0-d69bb0ca521c', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'ec5b1101-4c8a-4cdb-b3f9-ec74ca0c8f81', 0, N'Admin', NULL, N'6c0bdd40-6c19-49db-801a-27f95e6ef7d2', NULL, NULL, NULL)
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'448eb5b8-e1bf-4655-90a1-10b3274bfac4', N'2742d6d7-4024-41cc-999b-e8bce27e88a3', N'cfec0704-5844-4bf9-86ff-b951875a0226')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'60a476c4-e20d-4a6d-aa75-48601d922ed2', N'2742d6d7-4024-41cc-999b-e8bce27e88a3', N'856ca37c-f04a-4706-aac3-fe116b401e1a')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'0de8b908-1527-405f-aaed-55f804373eff', N'aa24fa58-4b83-4833-bdac-2a6cbb2f84f9', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'4e9c06a8-a9cf-4064-9efe-62cd1b297b6a', N'7704aa22-745a-4411-9670-d2cf88577193', N'cfec0704-5844-4bf9-86ff-b951875a0226')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'43de4959-2909-45f1-b5b2-64e1c009899b', N'5d7e9333-d9c3-4fbe-a092-861daa8db40d', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'93ddc955-fa2d-4610-a8ce-95dc059b50af', N'523d7435-284d-484d-b26e-9fbdfd3dfa06', N'9d895693-3d1c-4df7-a140-006a578171eb')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'f356858b-6caf-4cce-8e82-a8b417b90095', N'5d7e9333-d9c3-4fbe-a092-861daa8db40d', N'cfec0704-5844-4bf9-86ff-b951875a0226')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'f6973fad-7bda-47b1-8eb0-b37f1b152688', N'523d7435-284d-484d-b26e-9fbdfd3dfa06', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'ff1eba1c-2f4e-4486-8e98-c5f16e59b398', N'cc2c9db9-02f3-4390-912c-5d101487255a', N'9d895693-3d1c-4df7-a140-006a578171eb')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'04baa68e-daf4-4ea5-be8c-cc940678349a', N'cc2c9db9-02f3-4390-912c-5d101487255a', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'56b46278-bc4f-4724-a26d-d865588bcd74', N'ea0f37ac-bc35-4d13-bfa6-6a17dfa25484', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'0edff7c7-8b10-478f-808e-e82753531854', N'ec5b1101-4c8a-4cdb-b3f9-ec74ca0c8f81', N'6da57735-e01a-44f8-920b-cf702940f211')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'b92eb176-862f-4147-b7e4-eafae962d2f3', N'2742d6d7-4024-41cc-999b-e8bce27e88a3', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'62bc7a8d-17e1-4330-ba7c-ecb38db8c230', N'cc2c9db9-02f3-4390-912c-5d101487255a', N'cfec0704-5844-4bf9-86ff-b951875a0226')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'384acf6f-1583-44ea-9e44-f25a21989cf6', N'523d7435-284d-484d-b26e-9fbdfd3dfa06', N'856ca37c-f04a-4706-aac3-fe116b401e1a')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'5bbae2d3-76c3-4178-aa4d-f97708c946ee', N'523d7435-284d-484d-b26e-9fbdfd3dfa06', N'cfec0704-5844-4bf9-86ff-b951875a0226')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'879e732e-53c2-49e3-bac7-fca62261d913', N'7704aa22-745a-4411-9670-d2cf88577193', N'2ba5304a-4986-4cbe-9501-6edd930c5779')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8fccdaac-d498-4dfd-8407-02689c478ac4', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Roles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Roles/Delete.cshtml', N'/Access/Roles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd1ffd062-9a97-4bf4-a42e-07a3cc1b4e1b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OrganizationRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Create.cshtml', N'/Access/OrganizationRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'04d0262d-28ae-4edb-ae10-1242f6270e33', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Offices\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Offices/Edit.cshtml', N'/Access/Offices/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'556591ac-30fe-4547-a1a4-13af66cad2a5', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Domains\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Domains/Delete.cshtml', N'/Access/Domains/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7c09b216-6886-4e67-8951-18890e56bdf5', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OfficeRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/OfficeRoles/Edit.cshtml', N'/Access/OfficeRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'b68d2f03-b4aa-44ef-a5d9-1923f7474f2f', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\DomainRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/DomainRoles/Delete.cshtml', N'/Access/DomainRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a065de47-de10-45a0-9646-198f7c2443d8', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Shops\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Shops/Edit.cshtml', N'/Access/Shops/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'10a5af8e-8643-422e-a01b-1be159083f62', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\SystemAdmin\AccessDenied.aspx', N'AccessDenied.aspx', N'~/SystemAdmin/AccessDenied.aspx', N'/SystemAdmin/AccessDenied')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ad4b6475-6b05-47f6-9c00-1c75e5a514ee', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\SystemAdmin\ApplicationError.aspx', N'ApplicationError.aspx', N'~/SystemAdmin/ApplicationError.aspx', N'/SystemAdmin/ApplicationError')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'f103dae5-0737-4de2-8f54-1d76a0f7c04d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/RoleUsers/Create.cshtml', N'/Access/RoleUsers/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'f05f1914-759c-4737-9290-208a07789149', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Organizations\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Organizations/Index.cshtml', N'/Access/Organizations')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ee350bc2-ad05-455c-8e91-221478b20bf0', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Offices\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Offices/Delete.cshtml', N'/Access/Offices/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'695a3023-fa83-4dbb-8a73-2c60b9b856af', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\ShopRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/ShopRoles/Create.cshtml', N'/Access/ShopRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'54852bb3-09fa-4ab4-a232-2d12cbc48f3d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Groups\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Groups/Delete.cshtml', N'/Access/Groups/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c1c49d38-51b2-4d10-8bbb-2e416d349c22', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Domains\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Domains/Edit.cshtml', N'/Access/Domains/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'3dbb34d7-1af3-40b3-8788-31903a6b64fb', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Booking\Views\BookingHome\Index.cshtml', N'Index.cshtml', N'~/Areas/Booking/Views/BookingHome/Index.cshtml', N'/Booking/BookingHome')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'54501c29-9ee5-420a-bc66-31aaf6ab0ad8', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Offices\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Offices/Create.cshtml', N'/Access/Offices/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'4210412f-43c0-49e8-9c60-3350d134d063', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\GroupRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/GroupRoles/Edit.cshtml', N'/Access/GroupRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'343d2d97-81dc-40a5-bc79-337741ffa5eb', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\SystemAdmin\SystemAdmin.aspx', N'SystemAdmin.aspx', N'~/SystemAdmin/SystemAdmin.aspx', N'/SystemAdmin/SystemAdmin')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8077da0e-9069-43dc-a7a2-355a30f8e9ce', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OrganizationRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Edit.cshtml', N'/Access/OrganizationRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'23946405-a26b-452f-b422-3567aaee5673', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Opportunity\Axial.aspx', N'Axial.aspx', N'~/Opportunity/Axial.aspx', N'/Opportunity/Axial')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'09b7b033-7f6a-4bd9-aec0-39f1d876fb5c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\GroupRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/GroupRoles/Delete.cshtml', N'/Access/GroupRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e7a72ccd-3e80-4cfa-abeb-3b07b179e165', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Organizations\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Organizations/Edit.cshtml', N'/Access/Organizations/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'340cd898-fe85-495d-b2f2-3ce6a95fbb01', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleRoutes\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/RoleRoutes/Details.cshtml', N'/Access/RoleRoutes/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'02b0fc5a-2b3b-4173-a2af-455d83aaae85', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Organizations\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Organizations/Details.cshtml', N'/Access/Organizations/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ab43eeb8-5970-4b53-8d26-46ec92d26489', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\AccessHome\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/AccessHome/Index.cshtml', N'/Access/AccessHome')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'f09f4852-6353-4a9b-8604-484597906e56', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Contact.aspx', N'Contact.aspx', N'~/Contact.aspx', N'/Contact')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'59c00197-c102-4cd3-b9d7-4d49c3059dfc', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OrganizationRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Details.cshtml', N'/Access/OrganizationRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'51a59cf1-cf04-49ea-989b-4f5ef8013b6f', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleRoutes\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/RoleRoutes/Edit.cshtml', N'/Access/RoleRoutes/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ac2f0eb7-981b-4b73-ba9e-542ede907db2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\SystemAdmin\PageNotFound.aspx', N'PageNotFound.aspx', N'~/SystemAdmin/PageNotFound.aspx', N'/SystemAdmin/PageNotFound')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'9def52c9-fa35-4cf3-8283-5765260a0c1b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Organizations\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Organizations/Delete.cshtml', N'/Access/Organizations/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'87f7bc88-2569-4862-a41d-5aa7c3fcc5a7', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Routes\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Routes/Details.cshtml', N'/Access/Routes/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'9a1e0036-3cea-4dbc-8f2a-5d99517f5352', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Groups\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Groups/Edit.cshtml', N'/Access/Groups/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'0ca2987a-c9f3-4f36-b1cd-5da58fb10e42', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Roles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Roles/Index.cshtml', N'/Access/Roles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'bf0e4717-e3b4-4d90-bd8a-611fa3adf392', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleRoutes\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/RoleRoutes/Create.cshtml', N'/Access/RoleRoutes/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'bd75dd46-4897-4933-ba64-6513780aa306', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OrganizationRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Delete.cshtml', N'/Access/OrganizationRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'30f7de00-099f-4c41-8c8a-669692feecf1', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\ShopRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/ShopRoles/Details.cshtml', N'/Access/ShopRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'cc17ed87-45dd-4be0-958b-69d7c4762c5f', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Roles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Roles/Create.cshtml', N'/Access/Roles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'cef38c29-419a-4f01-a13c-6c310b5643a8', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Domains\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Domains/Create.cshtml', N'/Access/Domains/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'aaa18669-0d6c-4284-aa24-6c589176980e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Domains\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Domains/Details.cshtml', N'/Access/Domains/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'526546c9-360a-4d3b-a034-6f02ea44fda9', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\GroupRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/GroupRoles/Index.cshtml', N'/Access/GroupRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'efbfe4cc-a2d5-4116-8c16-6fa228cf6462', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Offices\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Offices/Details.cshtml', N'/Access/Offices/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'30417662-4e81-476e-bb39-703a6e20773e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Groups\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Groups/Create.cshtml', N'/Access/Groups/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'61a926a6-18b0-4ada-a2cd-70771e528d25', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OfficeRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/OfficeRoles/Create.cshtml', N'/Access/OfficeRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a1645c27-190b-40af-8c38-74d08f1e8255', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OfficeRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/OfficeRoles/Delete.cshtml', N'/Access/OfficeRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'9fe140c3-0f25-4862-b9dc-7cb29c798d8e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\ShopRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/ShopRoles/Edit.cshtml', N'/Access/ShopRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'528cb1ba-3611-4dcf-b414-7cd56abe29f3', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Opportunity\Home.aspx', N'Home.aspx', N'~/Opportunity/Home.aspx', N'/Opportunity/Home')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'68b7ecfb-3625-4505-8800-7e1789c9826f', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Organizations\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Organizations/Create.cshtml', N'/Access/Organizations/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'adf9b600-b90c-4e7d-869b-82cef9f79bac', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Opportunity\Millennium.aspx', N'Millennium.aspx', N'~/Opportunity/Millennium.aspx', N'/Opportunity/Millennium')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'63590d06-63e0-4a07-ac45-88df73c9491e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\DomainRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/DomainRoles/Index.cshtml', N'/Access/DomainRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'17d9c48d-f0cd-47ce-ab1a-8adfd128d35c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\GroupRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/GroupRoles/Details.cshtml', N'/Access/GroupRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e5f7b4e7-87cc-4840-9edd-8bd855033af2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\DomainRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/DomainRoles/Edit.cshtml', N'/Access/DomainRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'38722aae-23da-4e7a-988b-8c20811ffe46', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/RoleUsers/Details.cshtml', N'/Access/RoleUsers/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e41905d5-6d2b-4e29-8f9f-8ec1499cd8e6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Routes\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Routes/Index.cshtml', N'/Access/Routes')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'f6b7de63-061b-48b4-b299-8ffdb34c9477', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OfficeRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/OfficeRoles/Details.cshtml', N'/Access/OfficeRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'4fef411e-c447-4f64-baf2-98a1f6ba015c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Roles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Roles/Edit.cshtml', N'/Access/Roles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7343e809-f839-4e59-8c7e-9c0b249632ef', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Default.aspx', N'Default.aspx', N'~/Default.aspx', N'/Default')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'238feb16-ccfd-43bf-a71d-9d9962104135', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Shops\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Shops/Index.cshtml', N'/Access/Shops')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7f3ea3a9-7199-47b7-bc52-9e4c7d1be75f', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleRoutes\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/RoleRoutes/Delete.cshtml', N'/Access/RoleRoutes/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'bfb2597b-15ae-4c21-be9b-a0ed20f3a0b8', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Routes\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Routes/Delete.cshtml', N'/Access/Routes/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a90311d3-21c5-488c-89ad-a33fd4b55b28', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\About.aspx', N'About.aspx', N'~/About.aspx', N'/About')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'fe4c2ecd-dc11-4b92-b1e5-a3df9209fd55', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Routes\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Routes/Edit.cshtml', N'/Access/Routes/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'5e29c4e8-cd90-4e61-a591-a505b8a38cf4', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Routes\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Routes/Create.cshtml', N'/Access/Routes/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'3f3cd754-3fff-404d-b55f-a5790e1824c6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OrganizationRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Index.cshtml', N'/Access/OrganizationRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7d0bf2ac-9dda-4fff-a07e-a9b121de328e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\GroupRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/GroupRoles/Create.cshtml', N'/Access/GroupRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a361396a-58a4-4f67-bb78-b152a2e1cbe3', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\DomainRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/DomainRoles/Details.cshtml', N'/Access/DomainRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'92d11aa6-3fc0-4e43-869d-b5157df6ad2c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Validation\Views\ValidationHome\Index.cshtml', N'Index.cshtml', N'~/Areas/Validation/Views/ValidationHome/Index.cshtml', N'/Validation/ValidationHome')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd27fcd17-4b66-4b4e-96f4-b76d76a440c6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Domains\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Domains/Index.cshtml', N'/Access/Domains')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'19d7080b-c5fe-4ee5-ac46-bcf47b5480f7', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/RoleUsers/Edit.cshtml', N'/Access/RoleUsers/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7fc19871-dea7-4b85-9deb-c22bcede2ef0', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleRoutes\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/RoleRoutes/Index.cshtml', N'/Access/RoleRoutes')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7b59d025-560a-45bc-886a-c6a4028a55a5', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/RoleUsers/Delete.cshtml', N'/Access/RoleUsers/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'642cd57a-cf39-44e6-bfdd-c82b5052449d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/RoleUsers/Index.cshtml', N'/Access/RoleUsers')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a25a9e2d-75a8-42db-b911-cf1f2a486af9', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Opportunity\Manage.aspx', N'Manage.aspx', N'~/Opportunity/Manage.aspx', N'/Opportunity/Manage')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'3c8af6f8-1215-4a7e-9e12-cff0d32bace0', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Groups\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Groups/Index.cshtml', N'/Access/Groups')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c720a3b8-18a4-4753-b8ea-d6b5cbf145ca', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Operator\Views\OperatorHome\Index.cshtml', N'Index.cshtml', N'~/Areas/Operator/Views/OperatorHome/Index.cshtml', N'/Operator/OperatorHome')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'f4134947-9423-419a-a13c-de2998b38797', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Shops\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Shops/Details.cshtml', N'/Access/Shops/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'32a16d29-4874-4a4b-89fc-de29e9583682', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Shops\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Shops/Delete.cshtml', N'/Access/Shops/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'eb71525d-78b4-4dfe-aa8e-e13b97d780aa', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Groups\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Groups/Details.cshtml', N'/Access/Groups/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'6947fb52-ffef-4804-a9c0-e2e207b9f207', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\ListBox.cshtml', N'ListBox.cshtml', N'~/Areas/Access/Views/RoleUsers/ListBox.cshtml', N'/Access/RoleUsers/ListBox')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2218ac88-63a2-467d-8cc3-e360860a1d09', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\ShopRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/ShopRoles/Index.cshtml', N'/Access/ShopRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2edeed45-2fd6-409b-852a-e5fe7847eef2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Offices\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Offices/Index.cshtml', N'/Access/Offices')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'b7c389db-6cd5-472e-93eb-e603d25dbcf0', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Shops\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Shops/Create.cshtml', N'/Access/Shops/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7538604e-a842-4a71-a16c-ea04fc07c481', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\ShopRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/ShopRoles/Delete.cshtml', N'/Access/ShopRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8dc98f2b-d2b3-4fc3-a31a-f4e2e8ecc97a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\Roles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Roles/Details.cshtml', N'/Access/Roles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ff030280-6654-4da8-889c-fab4864b52e4', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\DomainRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/DomainRoles/Create.cshtml', N'/Access/DomainRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'16311b66-8174-4135-858a-fe0be2dec573', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Source\Repos\SecurityFramework\SecurityFramework\Areas\Access\Views\OfficeRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/OfficeRoles/Index.cshtml', N'/Access/OfficeRoles')
INSERT [Access].[Shops] ([Id], [AppId], [OfficeId], [Name]) VALUES (N'a3b6a47f-a9c5-4f05-939f-0291a2202f0d', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'60587c15-2c33-475f-8166-303bbf6b28a3', N'Shop - B')
INSERT [Access].[Shops] ([Id], [AppId], [OfficeId], [Name]) VALUES (N'78b57c95-3153-4245-b398-476dd20c6fa9', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'60587c15-2c33-475f-8166-303bbf6b28a3', N'Shop - A')
INSERT [Access].[Shops] ([Id], [AppId], [OfficeId], [Name]) VALUES (N'f0ac1841-2821-40aa-8a3f-640d904d063e', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'60587c15-2c33-475f-8166-303bbf6b28a3', N'Shop - C')
INSERT [Access].[Shops] ([Id], [AppId], [OfficeId], [Name]) VALUES (N'4a814b3d-2b8d-405b-853d-7f5cee67cbf8', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'2de4fe56-cb43-40b0-8bc2-908e70aa7f34', N'Shop - A')
INSERT [Access].[Shops] ([Id], [AppId], [OfficeId], [Name]) VALUES (N'25d08e7f-9b71-4413-8d44-a82e2c3bda8a', N'43c705b4-3b3e-4af2-abc5-99d5bce4c505', N'60587c15-2c33-475f-8166-303bbf6b28a3', N'Shop - D')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201703111457506_InitialCreate', N'SecurityFramework.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDB36147E1FB0FF20E8691B522B97B5E802BB45EA245BB0E6823A2DF656D012ED1095284DA2D204C37ED91EF693F617464AD485375D6CC5768A0245441E7EE7F0F0903C3C3CF47FFFFC3B7EFB10F8D63D8C1314E2897D30DAB72D88DDD0437839B153B278F1DA7EFBE6FBEFC6675EF0607D2AE88E181D6D8993897D474874EC38897B0703908C02E4C661122EC8C80D030778A173B8BFFF8B7370E0400A61532CCB1A7F48314101CC3EE8E734C42E8C480AFCCBD0837EC2CB69CD2C43B5AE40009308B87062CFA09BC6883C9EC7B4EC6B187F19E56D6CEBC447206104FEC2B600C62101844A7BFC318133128778398B6801F06F1F2348E916C04F20EFC57145DEB543FB87AC434ED5B08072D38484414FC08323AE21476EBE929EED528354876754D7E491F53AD3E3C4BEF06056F421F4A9026486C7533F66C413FBB26471924457908C8A86A31CB21A823AE29ED5B9DD5E695187A37DF66FCF9AA63E496338C1302531F0F7AC9B74EE23F777F8781B7E81787274305F1CBD7EF90A7847AF7E86472FEB3DA57DA57442012DBA89C308C65436B828FB6F5B8ED8CE911B96CD6A6D72AD505BA293C3B62EC1C37B8897E48E4E9BC3D7B6758E1EA0579470E3FA88119D4BB4118953FA7995FA3E98FBB0AC771A79B2FF1BB81EBE7C3508D72B708F96D9D04BFCE9C489E9BCFA00FDAC36B943513EBD84F1FECCC9CEE33060DFA27DE5B59F67611ABBAC33A191E416C44B4844E9C64E65BC9D4C9A410D6FD605EAEE9B369354356F2D29EBD02A33A160B1E9D950C8FBB47C3B5BDC4914D1C1CB4C8B69A4C9E04C5BD648C2D8B314CACA8C0EBA9A11A6DDFB9657C5B300207F8065B10317EA972C501CC0B297EF426A8400F796F90624091D4EEF3790DC35884EFF1C40F4C288660404D19373BBB90B31BC4A83399B039BE335D8D0DC7E0DCF814BC2F80CB3566BE3BD0FDD2F614ACEB0770A08FC48DC02907DDEA2A03BC020E29CB82E4C92736ACCD09B86D4ED2E002F30393AEC0DC796A96DBB25531FA040EF97480BEAE782B4F24DF4148A7F6220D3F9284DA2BE0F97087713B520358B9A53B48ACAC9FA8ACAC0BA49CA29CD826604AD72E65483797DD9080DEFF665B0BBEFF7ADB7799BD6829A1A67748584BF420C63BA8C7937801018E36A04BAAC1BDB7016B2E1634C9F7C6FCA387D027E3A34AB956643B6080C3F1B32D8DD9F0D9998B4F81E79CC2BE970182A88297C277AFD39AB7DCE49926D7A3A08DDDC34F3CDAC01A6E9729224A18BB259A00983F12086283FF5E1ACF688063FE2495111DA316AE8886D79B484F6CD968DEA1A9F421F12689DB87998700A121778AA1A6987BC1E82153BAA46B02A3A220AF793C2935A3A8C5923C00E41099DA90813755A20ECA208F8AD5A925A76DCC258DF4B1E72CD298C20660C5B35D185B93E18C20428F94883D2A6A1B153B3B866433478ADA6316F7361AB715762141BB1C916DFD96097DC7F7B12C36CD6D8068CB359255D043006F6B661A0FCACD2D500E483CBAE19A8746232182877A93662A0A2C6B660A0A24A9E9D81E647D4AEE32F9D5777CD3CC583F2E6B7F546756DC136057DEC9869E6BE276D43680B18ABE6793A6795F081680E67544E7E3E4BB8AB2B9B08039F4122866C2A7F57EB873ACD20B21135015686D602CAAF0415206542F510AE88E5354AC7BD881EB045DCAD1196AFFD126CCD0654ECFAD5688DD07C812A1B67A7D347D9B3D21A1423EF7458A8E1680C425EBCC48E77508A292EAB2AA68B2FDCC71BAE758C0F4683825A3C5783928ACE0CAEA5C234DBB5A473C8FAB8646B6949729F0C5A2A3A33B896B88DB62B49E314F4700BD65291B8850F34D98A4847B9DB94756327CF9BE20563C7906035BE045184F0B29670C54BAC599E6D357D31EB9F8014E4188E9B68F2904A694B4E248CC1124AB5943595F41CC509390504CC018BF34CBD4021D3EEAD86E5BF6059DF3ED5412CF681829AFD2DDEAC2A17F9C28EABBA241C89365B06CCAFC982E91A2BD037B7581A1CF041AC89DF4F433F0DB0D9CD32B7CE6FF1EAEDF3121561EC48F22B6E94A233C5D91507A0D3F0A85363D0A12A7D99D587CB0C61527AE189D6D56EF24ECD2845B0AA8E620A606D6DF84C4ECD0A43267B8DFD47AC15E169E6184F55A903F0A29E18B56C0705AC56D71D554C48A9638A35DD11A5AC933AA454D543CA7A6E892064BD62253C8346F514DD39A8D9247574B5B63BB226AFA40EADA95E015B23B35CD71D55937A5207D65477C7AEF250E4A574877731E35966CD6D2C3FF4AEB78F19309E665D1C661BACDDEDD7816AC53DB1F8EDBD02C6CB77D2A68C27BF356D2A8F78AC6753060CF32A24DC8D8B8B50E385BE1953B8F01616FAA60B7F335E3FCB7D52FB508E7F3249C9BD3C064AC7BD313F7AB53FBA51CE6239896D156AA456F59810188C18C168F6A73FF511644B7A417009305AC084E4491EF6E1FEC1A1F46267775ECF3849E2F99AA3ABE9098D38661BC8D7C2F72076EF40AC664FACF1C2A4025502D317D8830F13FBAFACD57116E3607F65C57BD645F211A33F535A711BA7D0FA5BCD061D26E3BEF9D8B5A3EF23BA6BF5E28FCF79D33DEB3AA633E6D8DA9774B9CA088BAF267A4993375D439A95DF523CDF09253C4ED0A24A1362F5B70873440679875048F943001E7EEC2B9AF6ADC15A889AF70443E10DA242D37B8155B08C6F053CFA49B2B702FD3AAB7F3BB08A68C6770308F707935F0D745F868A965BDC6A3427A34D2C49999E5BB3AED74AC1DCF6DEA42467AF35D1D504EC1E706B2459AF6019CF2C3F79B0DD51937E3C18F6364DFBC9738E7725CDB84A00D96E76F126138A1B2E8ABEA93CE21DC87CD364F26C3F5B78D3B6668AE6EE78CA65BF9CE01D33369EDFB5FDCCDF4D1B9B29CCBBE3C6D62BBF77C76C6D5BFBE7962DADF316BAF56C5D35F1C8702BA38B05B765E3E681737AC29F87D408728F327F44A94FFF6A4A5D6D61589198999AF3CE64C6CAC451F82A14CD6CFBF5956FF88D9DE534CD6C0DD99A4DBCF9FADFC89BD334F336E4406E238F589B85A8CBED6E59C79AD2A29E53DEB0D0939634F5369FB5F18AFD39A5090FA21461F618EE889F4F56F0202A1972EAF4C80256AF7BE9DE59FB2546BA7F27685941B0DF65C4D01576CD92E6022FC262F396242A48A408CD2524C0A35BEA494CD002B88456B31873F60A3C8BDBB19B8E39F42EF0754AA294D02EC360EE0B012FE60434F1CF529D4599C7D751F683264374818A89586CFE1ABF4B91EF95729F6B62420608E65DF0882E1B4BC222BBCBC712E92AC41D81B8FA4AA7E81606914FC1926B3C03F77015D9A8F9BD874BE03E5611401348FB40886A1F9F22B08C4190708CAA3DFDA436EC050F6FFE07B282926790540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin]) VALUES (N'2ba5304a-4986-4cbe-9501-6edd930c5779', N'opportunityAdmin@ups.com', 0, N'AHBnJhGqrvsmduQl9H/MCQSh821GLeYwkVuNPfGxBM+HxC1zAS6ThxIQG6Ho5gOR6A==', N'8f9d4ce0-a2ff-45c3-a6c9-c5d2f4e0a15e', NULL, 0, 0, NULL, 1, 0, N'opportunityAdmin@ups.com', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin]) VALUES (N'6da57735-e01a-44f8-920b-cf702940f211', N'bookingadmin@ups.com', 0, N'AHc1LBOAAefDZHHKsU7Rm2FJYobt37+xW8LNulhLRauZwfWLAi6PzIubz3ErFPsPBQ==', N'2057a0b2-a826-4edd-9852-7aabed709d79', NULL, 0, 0, NULL, 1, 0, N'bookingadmin@ups.com', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin]) VALUES (N'856ca37c-f04a-4706-aac3-fe116b401e1a', N'opportunityMillennium@ups.com', 0, N'ADkessOfc8TSQOnGHMHI+gAMKTwjMrOMNg4l5dNfwh/otmltIMXKxTGuuHi1P9873g==', N'2d391a19-7195-466d-886f-3a05bf8ccae8', NULL, 0, 0, NULL, 1, 0, N'opportunityMillennium@ups.com', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin]) VALUES (N'9d895693-3d1c-4df7-a140-006a578171eb', N'opportunityAxial@ups.com', 0, N'AFiF4+3ZCCvPaOCqgVnuhiN5JUHgZRf8Z4kR1hrerJtmkHMhTHgdl+0JtkWDnNWKcw==', N'21d880a9-0a9f-4cfa-927a-c4d9392d1116', NULL, 0, 0, NULL, 1, 0, N'opportunityAxial@ups.com', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin]) VALUES (N'b92e6acb-5bf4-4009-8f1f-c2bb18dd19c6', N'sysadmin@ups.com', 0, N'AEj/3IIQjpILrf1w2hUWsBB7y1QYxI+Zz4muuq/yMU+PItiW/Ddyqo/XnHSZsQM9Bw==', N'078edbcf-9141-44b4-826c-76bcfc4c4fec', NULL, 0, 0, NULL, 1, 0, N'sysadmin@ups.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin]) VALUES (N'cfec0704-5844-4bf9-86ff-b951875a0226', N'opportunityManager@ups.com', 0, N'ADuw7osz2FiRl3Z8s/dTXVfG6KNkVphWIy5EAVCQcN/TXipSOPMUZJVZxhLqCwx47g==', N'95675426-fa38-4fb6-803d-e44ccbd74474', NULL, 0, 0, NULL, 1, 0, N'opportunityManager@ups.com', 0)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Routes_RoutePath]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Routes_RoutePath] ON [Access].[Routes]
(
	[RoutePath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/19/2017 3:25:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/19/2017 3:25:49 PM ******/
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
/****** Object:  StoredProcedure [Access].[spIsInRole]    Script Date: 5/19/2017 3:25:49 PM ******/
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
               Top = 20
               Left = 767
               Bottom = 150
               Right = 937
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "shp"
            Begin Extent = 
               Top = 61
               Left = 1023
               Bottom = 191
               Right = 1193
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
         Width = 840
         Width = 480
         Width = 2910
         Width = 3405
         Width = 3315
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
         Begin Table = "aar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 200
               Right = 208
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
               Bottom = 290
               Right = 766
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
         Width = 3375
         Width = 3345
         Width = 2325
         Width = 12720
         Width = 1500
         Width = 4560
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleRoutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleRoutes'
GO
USE [master]
GO
ALTER DATABASE [SecurityFramework] SET  READ_WRITE 
GO
