USE [SecurityFramework]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleUser'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleUser'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoles'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoles'

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
/****** Object:  StoredProcedure [Access].[spUserRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP PROCEDURE [Access].[spUserRoles]
GO
/****** Object:  StoredProcedure [Access].[spUserAreas]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP PROCEDURE [Access].[spUserAreas]
GO
/****** Object:  StoredProcedure [Access].[spIsInRole]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Index [UserNameIndex]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Index [IX_Routes_RoutePath]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP INDEX [IX_Routes_RoutePath] ON [Access].[Routes]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  View [Access].[vwAreas]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwAreas]
GO
/****** Object:  View [Access].[vwRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwRoles]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [dbo].[View_1]
GO
/****** Object:  View [Access].[vwBreadCrumb]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwBreadCrumb]
GO
/****** Object:  View [Access].[vwRoleRoutes]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwRoleRoutes]
GO
/****** Object:  View [Access].[vwRoleUser]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwRoleUser]
GO
/****** Object:  View [Access].[vwIsInRole]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwIsInRole]
GO
/****** Object:  View [Access].[vwAreaTrees]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwAreaTrees]
GO
/****** Object:  View [Access].[vwAreasAndRolesAndRoutes]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwAreasAndRolesAndRoutes]
GO
/****** Object:  Table [Access].[RoleRoutes]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[RoleRoutes]
GO
/****** Object:  Table [Access].[Routes]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Routes]
GO
/****** Object:  View [Access].[vwAreasAndRolesAndUsers]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwAreasAndRolesAndUsers]
GO
/****** Object:  Table [Access].[RoleUsers]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[RoleUsers]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  View [Access].[vwAreasAndSubAreas]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwAreasAndSubAreas]
GO
/****** Object:  View [Access].[vwAreasAndRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP VIEW [Access].[vwAreasAndRoles]
GO
/****** Object:  Table [Access].[Shops]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Shops]
GO
/****** Object:  Table [Access].[Organizations]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Organizations]
GO
/****** Object:  Table [Access].[Roles]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Roles]
GO
/****** Object:  Table [Access].[Offices]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Offices]
GO
/****** Object:  Table [Access].[Groups]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Groups]
GO
/****** Object:  Table [Access].[Domains]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP TABLE [Access].[Domains]
GO
/****** Object:  Schema [Security]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP SCHEMA [Security]
GO
/****** Object:  Schema [Access]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP SCHEMA [Access]
GO
USE [master]
GO
/****** Object:  Database [SecurityFramework]    Script Date: 6/12/2017 7:54:44 PM ******/
DROP DATABASE [SecurityFramework]
GO
/****** Object:  Database [SecurityFramework]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Schema [Access]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE SCHEMA [Access]
GO
/****** Object:  Schema [Security]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE SCHEMA [Security]
GO
/****** Object:  Table [Access].[Domains]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[Groups]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[Offices]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[Roles]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[Organizations]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[Shops]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwAreasAndRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwAreasAndSubAreas]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[RoleUsers]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwAreasAndRolesAndUsers]    Script Date: 6/12/2017 7:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreasAndRolesAndUsers]
AS
SELECT        aar.AreaId, aar.AreaSeq, aar.Seq, aar.AreaAndRole, u.Email, ru.Id, ru.RoleId, ru.UserId
FROM            Access.vwAreasAndRoles AS aar INNER JOIN
                         Access.RoleUsers AS ru ON aar.RoleId = ru.RoleId INNER JOIN
                         dbo.AspNetUsers AS u ON ru.UserId = u.Id

GO
/****** Object:  Table [Access].[Routes]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [Access].[RoleRoutes]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwAreasAndRolesAndRoutes]    Script Date: 6/12/2017 7:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwAreasAndRolesAndRoutes]
AS
SELECT        vwaar.AreaId, vwaar.AreaSeq, vwaar.Seq, vwaar.BreadCrumb, vwaar.AreaAndRole, rr.Id, rr.RoleId, rr.RouteId, rt.AppId, rt.RoutePath
FROM            Access.RoleRoutes AS rr INNER JOIN
                         Access.vwAreasAndRoles AS vwaar ON rr.RoleId = vwaar.RoleId INNER JOIN
                         Access.Routes AS rt ON rr.RouteId = rt.Id

GO
/****** Object:  View [Access].[vwAreaTrees]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwIsInRole]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwRoleUser]    Script Date: 6/12/2017 7:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwRoleUser]
AS
SELECT        ru.RoleId, ru.UserId, u.Email, u.UserName
FROM            Access.RoleUsers AS ru INNER JOIN
                         dbo.AspNetUsers AS u ON ru.UserId = u.Id

GO
/****** Object:  View [Access].[vwRoleRoutes]    Script Date: 6/12/2017 7:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Access].[vwRoleRoutes]
AS
SELECT        TOP (100) PERCENT rr.RoleId, rt.AppId, rt.FilePath, rt.FileName, rt.AppPath, rt.RoutePath, rr.RouteId
FROM            Access.RoleRoutes AS rr INNER JOIN
                         Access.Routes AS rt ON rr.RouteId = rt.Id

GO
/****** Object:  View [Access].[vwBreadCrumb]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [dbo].[View_1]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  View [Access].[vwAreas]    Script Date: 6/12/2017 7:54:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Access].[vwAreas]
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
            END AS BreadCrumb,
            dom.Id AS DomId,
            dom.[Name] AS Domain,
            org.Id AS OrgId,
            org.[Name] AS Organization,
            grp.Id AS GrpId,
            grp.[Name] AS [Group],
            [off].Id AS OffId,
            [off].[Name] AS Office,
            shp.Id AS ShpId,
            shp.[Name] AS Shop
     FROM Access.[Domains] AS dom
          LEFT OUTER JOIN Access.Organizations AS org ON dom.Id = org.DomainId
          LEFT OUTER JOIN Access.Groups AS grp ON org.Id = grp.OrganizationId
          LEFT OUTER JOIN Access.Offices AS [off] ON grp.Id = [off].GroupId
          LEFT OUTER JOIN Access.Shops AS shp ON [off].Id = shp.OfficeId;



GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
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
INSERT [Access].[Domains] ([Id], [AppId], [Name]) VALUES (N'6d1a4a0c-6bb7-4fe6-9699-63fe38ea97a5', N'5bf83d87-a677-4f84-b265-024180d17747', N'GA')
INSERT [Access].[Domains] ([Id], [AppId], [Name]) VALUES (N'7e6878d3-8dfb-42e2-b96e-ee0a1bfe9e40', N'5bf83d87-a677-4f84-b265-024180d17747', N'KY')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'cbd5d5b8-536e-4485-8036-0962b453c2b7', N'5bf83d87-a677-4f84-b265-024180d17747', N'eb0d1812-c228-40cc-8885-da548bbbdee9', N'Customer Solutions')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'4e285335-ff7f-4684-be60-19e8a69facf8', N'5bf83d87-a677-4f84-b265-024180d17747', N'd17af442-4855-407e-842b-f43873bc1129', N'Maintenance')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'b1790bb3-79c9-4aab-a693-40617510f396', N'5bf83d87-a677-4f84-b265-024180d17747', N'eb0d1812-c228-40cc-8885-da548bbbdee9', N'Operations')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'ca952da2-814d-4385-8d60-52d669e96a00', N'5bf83d87-a677-4f84-b265-024180d17747', N'd17af442-4855-407e-842b-f43873bc1129', N'Scheduling')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'f6231805-12e5-48e4-ba10-670f7abe7943', N'5bf83d87-a677-4f84-b265-024180d17747', N'3638cd2f-9a8a-4e17-a4d9-126c38b0817f', N'Corporate')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'3620b61f-d3a9-4638-9c13-8aa7fdcd8f3b', N'5bf83d87-a677-4f84-b265-024180d17747', N'd17af442-4855-407e-842b-f43873bc1129', N'Freight')
INSERT [Access].[Groups] ([Id], [AppId], [OrganizationId], [Name]) VALUES (N'3d560561-324a-46b8-94af-cd41f144ad09', N'5bf83d87-a677-4f84-b265-024180d17747', N'3638cd2f-9a8a-4e17-a4d9-126c38b0817f', N'Shipping')
INSERT [Access].[Offices] ([Id], [AppId], [GroupId], [Name]) VALUES (N'b4e3f3e5-3f19-4511-aabd-2f32d9dc7786', N'5bf83d87-a677-4f84-b265-024180d17747', N'3d560561-324a-46b8-94af-cd41f144ad09', N'Air')
INSERT [Access].[Offices] ([Id], [AppId], [GroupId], [Name]) VALUES (N'9b5a71c5-91a2-4f8d-8f03-3b9c39cf8f5d', N'5bf83d87-a677-4f84-b265-024180d17747', N'f6231805-12e5-48e4-ba10-670f7abe7943', N'HR')
INSERT [Access].[Offices] ([Id], [AppId], [GroupId], [Name]) VALUES (N'191bcec1-1c06-4c22-bdb8-a29b5a15988b', N'5bf83d87-a677-4f84-b265-024180d17747', N'3d560561-324a-46b8-94af-cd41f144ad09', N'Ground')
INSERT [Access].[Offices] ([Id], [AppId], [GroupId], [Name]) VALUES (N'e3c64860-c850-4188-abed-c3c0928e3f0c', N'5bf83d87-a677-4f84-b265-024180d17747', N'f6231805-12e5-48e4-ba10-670f7abe7943', N'Executive')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'3638cd2f-9a8a-4e17-a4d9-126c38b0817f', N'5bf83d87-a677-4f84-b265-024180d17747', N'6d1a4a0c-6bb7-4fe6-9699-63fe38ea97a5', N'Glenlake Pkwy')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'eb0d1812-c228-40cc-8885-da548bbbdee9', N'5bf83d87-a677-4f84-b265-024180d17747', N'6d1a4a0c-6bb7-4fe6-9699-63fe38ea97a5', N'Morris Rd')
INSERT [Access].[Organizations] ([Id], [AppId], [DomainId], [Name]) VALUES (N'd17af442-4855-407e-842b-f43873bc1129', N'5bf83d87-a677-4f84-b265-024180d17747', N'7e6878d3-8dfb-42e2-b96e-ee0a1bfe9e40', N'Louisville')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'cf761557-dfd7-4f36-8bd4-0221b11caf4f', N'3698a729-8896-40c6-b657-962a898c49ee', N'25770ce1-3977-473d-9e38-08ea50cf0b59')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'91b02f31-5997-4ec7-a760-02651d2408e2', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'b41a73b0-c8a1-49d4-9ba0-4ba05eab8ec1')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'437ccbf6-a863-47e1-90bd-02d96f00015c', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'4a2e3a4c-c630-44f0-bb06-30910dc27e4a')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'f14dc4f9-ae5f-48e7-b36c-06ef12786056', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'077e53a4-058f-4e2b-b7a0-effdfce9eee9')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'1b0e023c-b799-4f13-aaa4-076852344401', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'c47f24ce-75e5-48c9-9f0a-e7fd7300a7bc')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'51a9a7f3-84c3-498d-9be6-0e046b4d6b07', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'6a61e1d1-44ac-4c90-9ffc-f8551e8a00b8')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'11ce3c97-1900-4cca-b300-0e093f2569d1', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'0fe5e39a-ba47-4dc5-bcb7-bee0fb4054b6')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'c74b7a0d-4bc2-4c87-bd56-0ef87a3595c1', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'811605e2-c478-4eae-a962-83c664de1847')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'0f1436c5-4ed7-4904-a35d-0f6267e8b19b', N'3698a729-8896-40c6-b657-962a898c49ee', N'a11e48d2-7abb-458a-9cf6-8aec8f054dda')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'c44c064d-93e6-4f8e-81c0-17096ab70865', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'c5e82552-b32c-4a02-bef6-d363ea0b281b')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'f4fa134a-e610-4eb9-b501-1bedad2bd290', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'bb143a4a-d88c-4ef7-814e-7a584ec87d0c')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'6c772cd5-4e2a-4216-a515-24b9e831495e', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'8e997102-bbf1-4922-96b9-fb2918cf9ad3')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'd7e7418b-e71a-4d28-8ab4-3a497494fb60', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'092eab34-ae43-48bc-970d-cec1abff2376')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'40c78830-8058-46d6-9b08-3fddeeb944d2', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'16d96942-29bf-473f-b542-350dcc739fa3')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'da9d6f41-0a36-483a-9d3d-427ee6abbee0', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'c71ec422-a5a4-4063-93d3-ed02ecd60ec5')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'd4bbfe0d-8e01-4448-87ff-470b17adc952', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'09e750e6-2d7b-4fbf-b6b6-1f96a1fb25cd')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'fd6df73c-442d-472d-9412-4a0625909c50', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'8df8b5de-b7e0-4c0b-9130-e2344ff1a9a2')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'223b7f61-40ac-4638-86be-4f496c4a0c69', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'9b9f0ee0-9300-47cf-ab25-3723a4f433ca')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'0385ab76-ce95-4a2a-a4f8-512051becd34', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'fa727beb-bc42-4545-891b-2031bcb65e11')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'b6b990cb-29a5-4074-af69-51e2c7231b66', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'18a83a0b-93aa-4dd9-bf90-84608f388af1')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'7b9ece36-4964-4ced-9a43-5545c2f62421', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'13397b4d-9a79-4fdc-a280-e97fd7545bf0')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'd92b8e81-07fe-4488-8365-56c9a0f26f64', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'bcdc1d6b-2093-4b10-a5c2-72e1c561505a')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'0e004722-4ed2-4680-9264-6b4acd571a2f', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'35651214-daf2-4609-866f-594011242b4e')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ecc4809b-c667-4da3-8be7-6b7a11c23624', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'9be9ccc6-97b4-43e7-a750-32aff115aaef')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ebbbe245-0554-4825-a20b-6bc001d9c675', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'e3ed45ff-91a1-4ae9-881c-169fcf1c717b')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'cfd3420f-bdc8-4350-ab43-6d45f9b6e609', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'd34e9e9c-8669-4ef9-b1ac-c6853a1f4144')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'14ed7af1-6254-46bc-aa24-71aec05dcd2e', N'3698a729-8896-40c6-b657-962a898c49ee', N'831e76da-1fb0-4906-8e67-ae2aa288579a')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'15f32771-230f-4e13-a048-74180d51967a', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'13141ebc-7992-4481-9e54-a78f683f6849')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'14370f05-aeec-43b7-a0db-75c1dfc2c603', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'a07f21d7-f483-4951-b1d7-26b9cf8f4932')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'852ff4a4-553c-4b92-b0e0-76562b94816a', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'8db6034e-02b9-43b3-8d69-b5964fc15c83')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'6aafef87-59ae-4435-839e-7ef158675cd8', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'0d64d2bb-508e-42b2-acca-d7ca4375bbd2')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'98391fd4-fe67-487c-b817-8451277b8d93', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'db4010b6-377a-49ba-842f-1ff0cf47b371')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'c7a74cc9-af2a-44e5-bfd1-87364d4d771d', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'd69d5fac-4444-4a9c-9504-48cc7e9466a2')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'c7158699-d94f-46bc-acd4-9070276fada2', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'0d440f45-cf31-4069-8a73-830bb0612809')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'a6858acd-d480-465f-ac59-91c2ea97aa20', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'73b74824-6c51-42d5-b8a6-516c4235015a')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'798d7a31-f3c8-44ea-aec4-929132320151', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'1ca4d118-59ac-4dcd-84da-80a8578e16df')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'b9155bd8-0134-4405-bda9-9ea43c412b5a', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'030c26a8-5bd8-4044-a659-4e2318035239')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'05d72ee9-7512-4656-848a-a12ce86927bb', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'10d3bdd8-9efb-40a7-ab6d-448e825cda2a')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'68830504-3fc2-4e05-8f09-a1e90cc53324', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'6a61e1d1-44ac-4c90-9ffc-f8551e8a00b8')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'32723f6f-b942-45c6-a97b-a624adc46f01', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'2d0c6215-e5ec-453b-9563-a8b186a3817c')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'e494ac52-d8b5-40b1-81e0-ac51cd401e4b', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'2f9def29-9a84-44fa-89ff-f9c830c5fe45')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'532143e9-e387-48f4-bf31-af48c5815f40', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'9d5efb96-051e-4f0f-a4cf-bd2b66df7029')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'4cafbd31-b4c8-4bdd-89c2-b28558c2124b', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'baf02a19-8903-46d1-90d9-4005f66aa60d')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'b7de6a5e-0c0e-431b-9983-b9e56785018f', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'd7323f85-fce7-4279-b5c5-d7780f01e311')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'36d16a36-15d7-40fb-904e-bf3e4f9aeb69', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'4f03990e-a74d-4a4c-927b-6992355f870b')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'24627b92-a142-44ba-b49b-c1a50c8598fd', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'29756007-fe33-4c47-ae2c-b722a81f3303')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'1546deed-3c32-4faa-8481-d2c58be50257', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'1840cb01-2c3e-4648-ba03-ad086de383ff')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ec212ac5-45b1-41bd-b57e-d2cc94ba430a', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'db9b4c3d-1f01-4a1e-9c8c-aa935cf91020')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'e0269d1f-f65a-4cae-968e-d3239325299a', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'02d0a6cf-b59c-4bd8-8782-0b0baa9b6e8b')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'e646b430-8c44-4d6c-b644-d54bd7015bea', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'1ec7d80e-cb29-4d5c-89db-c3a375ed3d43')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'70c708b5-3aee-4c2d-a9ca-d5de96cab75b', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'65c8c6c4-8a52-4d07-8882-32d53ec5059a')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ee0429ef-9ca7-4590-b992-dd199a488364', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'e30fa801-1ba2-45cb-9bfd-ef276d28e784')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'ff287aa8-c434-470b-b683-e80d1a598926', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'53e2c6af-e0de-4c82-88a5-ab8b1628753b')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'e8d82c8c-0990-40a8-82a1-e82b29d3b70a', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'65b3dbc1-9676-4cc1-9589-0b78cc530abd')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'875e2a8c-3368-4e72-b413-e9134b46ea32', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'e3efbca7-4d8a-4f8c-a61c-6e2a27f85b2d')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'6fdb9c22-1678-4cba-b8b7-ebdcd20eb3ef', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'23c2ac5d-5b58-4904-bb4d-694a8394f1f9')
INSERT [Access].[RoleRoutes] ([Id], [RoleId], [RouteId]) VALUES (N'd977ec6d-613b-4f89-a14a-f7203e250cc0', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'4962241e-9e37-4056-9825-821c4e70493e')
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'1450f5e1-8ef3-4f53-baec-16b5df70667d', 0, N'Admin', NULL, NULL, N'f6231805-12e5-48e4-ba10-670f7abe7943', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'308158f6-64d7-41b6-b80a-25e00658546b', 1, N'VP', NULL, NULL, NULL, N'e3c64860-c850-4188-abed-c3c0928e3f0c', NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'cf7bf8e1-7fbf-4af6-854f-4be71fd03396', 1, N'Executive', NULL, N'eb0d1812-c228-40cc-8885-da548bbbdee9', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'129fd7aa-59bb-4f6e-92e2-5aa4d23e3b02', 0, N'Admin', NULL, NULL, NULL, N'e3c64860-c850-4188-abed-c3c0928e3f0c', NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'e94a8f15-a53f-4846-8cb2-647e06ab0c02', 0, N'Admin', NULL, N'eb0d1812-c228-40cc-8885-da548bbbdee9', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'8dbf7620-7198-4314-bdb5-702ee18d3b93', 0, N'Admin', NULL, NULL, N'3d560561-324a-46b8-94af-cd41f144ad09', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'28c58630-988c-48ec-b7a9-7341dc238f94', 0, N'Admin', NULL, NULL, NULL, N'b4e3f3e5-3f19-4511-aabd-2f32d9dc7786', NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'3698a729-8896-40c6-b657-962a898c49ee', 0, N'Admin', NULL, NULL, N'b1790bb3-79c9-4aab-a693-40617510f396', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', 0, N'Admin', NULL, N'3638cd2f-9a8a-4e17-a4d9-126c38b0817f', NULL, NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'f28f9624-3337-4f64-abb4-b560082557fb', 0, N'Admin', NULL, NULL, NULL, N'191bcec1-1c06-4c22-bdb8-a29b5a15988b', NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'8c3ada9c-a7d1-40e3-b5cc-bdb2344c3005', 0, N'Admin', NULL, NULL, N'cbd5d5b8-536e-4485-8036-0962b453c2b7', NULL, NULL)
INSERT [Access].[Roles] ([Id], [Sequence], [Name], [DomainId], [OrganizationId], [GroupId], [OfficeId], [ShopId]) VALUES (N'6ee96e26-35da-46e8-8ecc-c2c7dbb6294b', 0, N'Admin', NULL, NULL, NULL, N'9b5a71c5-91a2-4f8d-8f03-3b9c39cf8f5d', NULL)
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'3dac937b-d1c8-4a0a-9d0f-4afa948ff8ee', N'5b7b8fc7-d18e-4010-a6d5-a7ceca86eb13', N'08d0a523-1342-4d27-aa6e-4e7bdd3a1311')
INSERT [Access].[RoleUsers] ([Id], [RoleId], [UserId]) VALUES (N'6452db2d-74c5-401c-8364-f26f9b35b3f4', N'3698a729-8896-40c6-b657-962a898c49ee', N'eb56220b-6bd1-470a-8ebc-50d8b5ab29eb')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'25770ce1-3977-473d-9e38-08ea50cf0b59', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\Home.aspx', N'Home.aspx', N'~/MorrisRoad/Home.aspx', N'/MorrisRoad/Home')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'02d0a6cf-b59c-4bd8-8782-0b0baa9b6e8b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OfficeRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/OfficeRoles/Edit.cshtml', N'/Access/OfficeRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'65b3dbc1-9676-4cc1-9589-0b78cc530abd', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Shipping\Views\Shipping\Ground.cshtml', N'Ground.cshtml', N'~/Areas/Shipping/Views/Shipping/Ground.cshtml', N'/Shipping/Shipping/Ground')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2b545ffd-457e-43f3-a6ad-1191313e9e0a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Organizations\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Organizations/Index.cshtml', N'/Access/Organizations')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8908b50f-87c4-4037-84d7-12f8472083e2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Desktop\New Development\SecurityFramework\SecurityFramework\SystemAdmin\ApplicationError.aspx', N'ApplicationError.aspx', N'~/SystemAdmin/ApplicationError.aspx', N'/SystemAdmin/ApplicationError')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'dd65b131-8f74-4724-beb1-13ff47fb8442', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Louisville\Views\Louisville\Index.cshtml', N'Index.cshtml', N'~/Areas/Louisville/Views/Louisville/Index.cshtml', N'/Louisville/Louisville')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e3ed45ff-91a1-4ae9-881c-169fcf1c717b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Shops\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Shops/Edit.cshtml', N'/Access/Shops/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'919c215d-2d49-47e7-b995-170830b99a46', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Axial.aspx', N'Axial.aspx', N'~/Opportunity/Axial.aspx', N'/Opportunity/Axial')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ada3c437-9fa7-44a6-bf20-17494233d0f1', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Routes\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Routes/Create.cshtml', N'/Access/Routes/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'441bce9e-34e2-40e6-ae0c-19ebaea965d6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Desktop\New Development\SecurityFramework\SecurityFramework\Opportunity\Arial\Manage.aspx', N'Manage.aspx', N'~/Opportunity/Arial/Manage.aspx', N'/Opportunity/Arial/Manage')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'09e750e6-2d7b-4fbf-b6b6-1f96a1fb25cd', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Offices\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Offices/Details.cshtml', N'/Access/Offices/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'db4010b6-377a-49ba-842f-1ff0cf47b371', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Groups\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Groups/Create.cshtml', N'/Access/Groups/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'fa727beb-bc42-4545-891b-2031bcb65e11', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OfficeRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/OfficeRoles/Create.cshtml', N'/Access/OfficeRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd2841432-9bda-4feb-97ec-2054a1c907aa', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\About.aspx', N'About.aspx', N'~/About.aspx', N'/About')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a07f21d7-f483-4951-b1d7-26b9cf8f4932', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\GroupRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/GroupRoles/Details.cshtml', N'/Access/GroupRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'618eb9db-856c-4d6b-ac1e-2f533d917229', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Routes\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Routes/Delete.cshtml', N'/Access/Routes/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'4a2e3a4c-c630-44f0-bb06-30910dc27e4a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Offices\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Offices/Create.cshtml', N'/Access/Offices/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'9be9ccc6-97b4-43e7-a750-32aff115aaef', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\GroupRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/GroupRoles/Delete.cshtml', N'/Access/GroupRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'65c8c6c4-8a52-4d07-8882-32d53ec5059a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleRoutes\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/RoleRoutes/Create.cshtml', N'/Access/RoleRoutes/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'cc8b4442-2475-4d20-a835-32e49fa773e4', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Arial\Home.aspx', N'Home.aspx', N'~/Opportunity/Arial/Home.aspx', N'/Opportunity/Arial/Home')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'40e24694-2017-4a6a-9cf8-32effb2de03e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Domains\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Domains/Delete.cshtml', N'/Access/Domains/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'16d96942-29bf-473f-b542-350dcc739fa3', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OrganizationRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Delete.cshtml', N'/Access/OrganizationRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'9b9f0ee0-9300-47cf-ab25-3723a4f433ca', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OfficeRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/OfficeRoles/Index.cshtml', N'/Access/OfficeRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'7bb23922-0ac3-40c7-a2a4-37d74e3e203f', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\CustomerSolutions\Home.aspx', N'Home.aspx', N'~/MorrisRoad/CustomerSolutions/Home.aspx', N'/MorrisRoad/CustomerSolutions/Home')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c9d0462e-84e6-488e-b425-37e288a771f3', N'5bf83d87-a677-4f84-b265-024180d17747', N'D:\P01A\CS-CTG\WebDev\Prototype\SecurityFramework\SecurityFramework\Areas\Access\Views\RoleUsers\ListBox.cshtml', N'ListBox.cshtml', N'~/Areas/Access/Views/RoleUsers/ListBox.cshtml', N'/Access/RoleUsers/ListBox')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'baf02a19-8903-46d1-90d9-4005f66aa60d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OrganizationRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Index.cshtml', N'/Access/OrganizationRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2dce2609-de88-402e-9f1a-409672d442e7', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Domains\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Domains/Details.cshtml', N'/Access/Domains/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'10d3bdd8-9efb-40a7-ab6d-448e825cda2a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\ShopRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/ShopRoles/Index.cshtml', N'/Access/ShopRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'90f49694-dfb7-498b-9943-44edb47273b5', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Contact.aspx', N'Contact.aspx', N'~/Contact.aspx', N'/Contact')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'94d63257-3660-423f-85cd-457c073f4d4e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Louisville\Views\Louisville\Scheduling.cshtml', N'Scheduling.cshtml', N'~/Areas/Louisville/Views/Louisville/Scheduling.cshtml', N'/Louisville/Louisville/Scheduling')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd69d5fac-4444-4a9c-9504-48cc7e9466a2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\GroupRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/GroupRoles/Create.cshtml', N'/Access/GroupRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'b41a73b0-c8a1-49d4-9ba0-4ba05eab8ec1', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\ShopRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/ShopRoles/Edit.cshtml', N'/Access/ShopRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e865d1c2-0714-450f-8723-4cfe6d44e779', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\CustomerSolutions\Engagement.aspx', N'Engagement.aspx', N'~/MorrisRoad/CustomerSolutions/Engagement.aspx', N'/MorrisRoad/CustomerSolutions/Engagement')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'aca9baeb-d9eb-4a5a-a8ca-4e0f44cdb2c7', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Millennium.aspx', N'Millennium.aspx', N'~/Opportunity/Millennium.aspx', N'/Opportunity/Millennium')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'030c26a8-5bd8-4044-a659-4e2318035239', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleUsers\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/RoleUsers/Index.cshtml', N'/Access/RoleUsers')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'73b74824-6c51-42d5-b8a6-516c4235015a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Corporate\Views\Corporate\Executive.cshtml', N'Executive.cshtml', N'~/Areas/Corporate/Views/Corporate/Executive.cshtml', N'/Corporate/Corporate/Executive')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'35651214-daf2-4609-866f-594011242b4e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\GroupRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/GroupRoles/Edit.cshtml', N'/Access/GroupRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2327ce24-f08a-4a39-adf5-5cbea972c7d6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Organizations\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Organizations/Edit.cshtml', N'/Access/Organizations/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'23c2ac5d-5b58-4904-bb4d-694a8394f1f9', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Offices\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Offices/Delete.cshtml', N'/Access/Offices/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'4f03990e-a74d-4a4c-927b-6992355f870b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OfficeRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/OfficeRoles/Details.cshtml', N'/Access/OfficeRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ddae5c32-830d-455b-ba56-6cfcc671e91c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\CustomerSolutions\Management.aspx', N'Management.aspx', N'~/MorrisRoad/CustomerSolutions/Management.aspx', N'/MorrisRoad/CustomerSolutions/Management')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e3efbca7-4d8a-4f8c-a61c-6e2a27f85b2d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleUsers\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/RoleUsers/Create.cshtml', N'/Access/RoleUsers/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'bcdc1d6b-2093-4b10-a5c2-72e1c561505a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleRoutes\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/RoleRoutes/Details.cshtml', N'/Access/RoleRoutes/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c364c0d1-c931-4c36-b13c-739a01222a7c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Desktop\New Development\SecurityFramework\SecurityFramework\SystemAdmin\AccessDenied.aspx', N'AccessDenied.aspx', N'~/SystemAdmin/AccessDenied.aspx', N'/SystemAdmin/AccessDenied')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'bb143a4a-d88c-4ef7-814e-7a584ec87d0c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\ShopRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/ShopRoles/Delete.cshtml', N'/Access/ShopRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'0277e1c7-9b72-4fcd-954c-7e6a7b5d9260', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Louisville\Views\Louisville\Freight.cshtml', N'Freight.cshtml', N'~/Areas/Louisville/Views/Louisville/Freight.cshtml', N'/Louisville/Louisville/Freight')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'1ca4d118-59ac-4dcd-84da-80a8578e16df', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OrganizationRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Details.cshtml', N'/Access/OrganizationRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'620efd84-8968-4432-b1df-80eb60de790b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Routes\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Routes/Edit.cshtml', N'/Access/Routes/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'4962241e-9e37-4056-9825-821c4e70493e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Shops\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Shops/Delete.cshtml', N'/Access/Shops/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'0d440f45-cf31-4069-8a73-830bb0612809', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\GlenlakePkwy\Views\Glenlake\Index.cshtml', N'Index.cshtml', N'~/Areas/GlenlakePkwy/Views/Glenlake/Index.cshtml', N'/GlenlakePkwy/Glenlake')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'811605e2-c478-4eae-a962-83c664de1847', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleRoutes\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/RoleRoutes/Delete.cshtml', N'/Access/RoleRoutes/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'18a83a0b-93aa-4dd9-bf90-84608f388af1', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\AccessHome\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/AccessHome/Index.cshtml', N'/Access/AccessHome')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'73baa0ec-707b-46ea-ac55-852334ea7dbf', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Arial\Management.aspx', N'Management.aspx', N'~/Opportunity/Arial/Management.aspx', N'/Opportunity/Arial/Management')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'cf5ad59a-329d-4dd5-9763-89b5c3e6d72d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Organizations\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Organizations/Create.cshtml', N'/Access/Organizations/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a11e48d2-7abb-458a-9cf6-8aec8f054dda', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\Operations\Home.aspx', N'Home.aspx', N'~/MorrisRoad/Operations/Home.aspx', N'/MorrisRoad/Operations/Home')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'1da27d48-2f13-4c8f-863c-8ddf3e8b5888', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Home.aspx', N'Home.aspx', N'~/Opportunity/Home.aspx', N'/Opportunity/Home')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'5a0f14c2-0cd5-4934-898c-95282c4e2c50', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Organizations\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Organizations/Delete.cshtml', N'/Access/Organizations/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'40f2311a-f77f-4739-afa2-9657f59fc1c2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Routes\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Routes/Index.cshtml', N'/Access/Routes')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'df745599-ef94-4f9c-9841-967490b0b2c7', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\CustomerSolutions\PMD.aspx', N'PMD.aspx', N'~/MorrisRoad/CustomerSolutions/PMD.aspx', N'/MorrisRoad/CustomerSolutions/PMD')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'79843865-b101-49f6-ba3a-9b7160817e29', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Arial\Assessment.aspx', N'Assessment.aspx', N'~/Opportunity/Arial/Assessment.aspx', N'/Opportunity/Arial/Assessment')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8f14d181-68f0-4182-bd68-9f55840badbf', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\DomainRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/DomainRoles/Edit.cshtml', N'/Access/DomainRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'fb01fd73-f7c2-4691-9a59-a35d0f1db7e3', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Default.aspx', N'Default.aspx', N'~/Default.aspx', N'/Default')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'13141ebc-7992-4481-9e54-a78f683f6849', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Shipping\Views\Shipping\Index.cshtml', N'Index.cshtml', N'~/Areas/Shipping/Views/Shipping/Index.cshtml', N'/Shipping/Shipping')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2d0c6215-e5ec-453b-9563-a8b186a3817c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleUsers\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/RoleUsers/Edit.cshtml', N'/Access/RoleUsers/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'db9b4c3d-1f01-4a1e-9c8c-aa935cf91020', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Shops\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Shops/Details.cshtml', N'/Access/Shops/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'f8ca1617-f9b6-477c-a1e4-ab5e9a2c6b4c', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\DomainRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/DomainRoles/Delete.cshtml', N'/Access/DomainRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'53e2c6af-e0de-4c82-88a5-ab8b1628753b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Offices\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Offices/Index.cshtml', N'/Access/Offices')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'1840cb01-2c3e-4648-ba03-ad086de383ff', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OfficeRoles\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/OfficeRoles/Delete.cshtml', N'/Access/OfficeRoles/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'831e76da-1fb0-4906-8e67-ae2aa288579a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\MorrisRoad\Operations\Management.aspx', N'Management.aspx', N'~/MorrisRoad/Operations/Management.aspx', N'/MorrisRoad/Operations/Management')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'36188914-81e7-49cc-b4ee-b2269770f415', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Domains\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Domains/Edit.cshtml', N'/Access/Domains/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'1e2a8a7e-965a-4f51-b3b8-b36b00d2f2f6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Domains\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Domains/Create.cshtml', N'/Access/Domains/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8db6034e-02b9-43b3-8d69-b5964fc15c83', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Shops\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/Shops/Create.cshtml', N'/Access/Shops/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'29756007-fe33-4c47-ae2c-b722a81f3303', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Groups\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Groups/Index.cshtml', N'/Access/Groups')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'65bcb79c-cbf0-4195-aa3b-bb6bee46e405', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Louisville\Views\Louisville\Maintenance.cshtml', N'Maintenance.cshtml', N'~/Areas/Louisville/Views/Louisville/Maintenance.cshtml', N'/Louisville/Louisville/Maintenance')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'9d5efb96-051e-4f0f-a4cf-bd2b66df7029', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleUsers\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/RoleUsers/Delete.cshtml', N'/Access/RoleUsers/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'0fe5e39a-ba47-4dc5-bcb7-bee0fb4054b6', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\ShopRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/ShopRoles/Details.cshtml', N'/Access/ShopRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'34860ebe-fe1d-4b3a-a359-c2ba4ab3d82d', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Domains\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Domains/Index.cshtml', N'/Access/Domains')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'1ec7d80e-cb29-4d5c-89db-c3a375ed3d43', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Shipping\Views\Shipping\Air.cshtml', N'Air.cshtml', N'~/Areas/Shipping/Views/Shipping/Air.cshtml', N'/Shipping/Shipping/Air')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd34e9e9c-8669-4ef9-b1ac-c6853a1f4144', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Groups\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Groups/Edit.cshtml', N'/Access/Groups/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'ff0fb90a-b8fe-413a-a74e-ca42219eb20e', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Organizations\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Organizations/Details.cshtml', N'/Access/Organizations/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'660bb115-b0d5-41d3-8ec3-cc584bb35421', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\DomainRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/DomainRoles/Create.cshtml', N'/Access/DomainRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'092eab34-ae43-48bc-970d-cec1abff2376', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Groups\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Groups/Details.cshtml', N'/Access/Groups/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8d079ed4-c477-495a-b23d-d11110a9049b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\DomainRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/DomainRoles/Index.cshtml', N'/Access/DomainRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e0911478-914e-492a-868a-d188484c9186', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Management.aspx', N'Management.aspx', N'~/Opportunity/Management.aspx', N'/Opportunity/Management')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c5e82552-b32c-4a02-bef6-d363ea0b281b', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleRoutes\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/RoleRoutes/Index.cshtml', N'/Access/RoleRoutes')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd7323f85-fce7-4279-b5c5-d7780f01e311', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Offices\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/Offices/Edit.cshtml', N'/Access/Offices/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'0d64d2bb-508e-42b2-acca-d7ca4375bbd2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Corporate\Views\Corporate\HR.cshtml', N'HR.cshtml', N'~/Areas/Corporate/Views/Corporate/HR.cshtml', N'/Corporate/Corporate/HR')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8fe7725d-df22-4fb4-b574-d82901162ce8', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Opportunity\Arial\Qualification.aspx', N'Qualification.aspx', N'~/Opportunity/Arial/Qualification.aspx', N'/Opportunity/Arial/Qualification')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'5164549a-a102-4c8d-a90b-dcf134d5ce11', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Desktop\New Development\SecurityFramework\SecurityFramework\Opportunity\Manage.aspx', N'Manage.aspx', N'~/Opportunity/Manage.aspx', N'/Opportunity/Manage')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'967b1c4b-13b9-48a8-9b8b-dd37b228efc2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Routes\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/Routes/Details.cshtml', N'/Access/Routes/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8df8b5de-b7e0-4c0b-9130-e2344ff1a9a2', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OrganizationRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Create.cshtml', N'/Access/OrganizationRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'6ffaaa4b-482d-415b-ba70-e589c6acb28a', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\DomainRoles\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/DomainRoles/Details.cshtml', N'/Access/DomainRoles/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c47f24ce-75e5-48c9-9f0a-e7fd7300a7bc', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\GroupRoles\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/GroupRoles/Index.cshtml', N'/Access/GroupRoles')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'13397b4d-9a79-4fdc-a280-e97fd7545bf0', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleUsers\Details.cshtml', N'Details.cshtml', N'~/Areas/Access/Views/RoleUsers/Details.cshtml', N'/Access/RoleUsers/Details')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'c71ec422-a5a4-4063-93d3-ed02ecd60ec5', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\RoleRoutes\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/RoleRoutes/Edit.cshtml', N'/Access/RoleRoutes/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'e30fa801-1ba2-45cb-9bfd-ef276d28e784', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Groups\Delete.cshtml', N'Delete.cshtml', N'~/Areas/Access/Views/Groups/Delete.cshtml', N'/Access/Groups/Delete')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'077e53a4-058f-4e2b-b7a0-effdfce9eee9', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\ShopRoles\Create.cshtml', N'Create.cshtml', N'~/Areas/Access/Views/ShopRoles/Create.cshtml', N'/Access/ShopRoles/Create')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'a00eb0f1-f69b-4a99-8306-f7eb0c419691', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Desktop\New Development\SecurityFramework\SecurityFramework\SystemAdmin\SystemAdmin.aspx', N'SystemAdmin.aspx', N'~/SystemAdmin/SystemAdmin.aspx', N'/SystemAdmin/SystemAdmin')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'6a61e1d1-44ac-4c90-9ffc-f8551e8a00b8', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Corporate\Views\Corporate\Index.cshtml', N'Index.cshtml', N'~/Areas/Corporate/Views/Corporate/Index.cshtml', N'/Corporate/Corporate')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'2f9def29-9a84-44fa-89ff-f9c830c5fe45', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\Shops\Index.cshtml', N'Index.cshtml', N'~/Areas/Access/Views/Shops/Index.cshtml', N'/Access/Shops')
GO
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'8e997102-bbf1-4922-96b9-fb2918cf9ad3', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\inetpub\SecurityFramework\Areas\Access\Views\OrganizationRoles\Edit.cshtml', N'Edit.cshtml', N'~/Areas/Access/Views/OrganizationRoles/Edit.cshtml', N'/Access/OrganizationRoles/Edit')
INSERT [Access].[Routes] ([Id], [AppId], [FilePath], [FileName], [AppPath], [RoutePath]) VALUES (N'd0a484d2-1e79-45a9-a070-fb8ace9c0d19', N'5bf83d87-a677-4f84-b265-024180d17747', N'C:\Users\cnf4kkr\Desktop\New Development\SecurityFramework\SecurityFramework\SystemAdmin\PageNotFound.aspx', N'PageNotFound.aspx', N'~/SystemAdmin/PageNotFound.aspx', N'/SystemAdmin/PageNotFound')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201703111457506_InitialCreate', N'SecurityFramework.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDB36147E1FB0FF20E8691B522B97B5E802BB45EA245BB0E6823A2DF656D012ED1095284DA2D204C37ED91EF693F617464AD485375D6CC5768A0245441E7EE7F0F0903C3C3CF47FFFFC3B7EFB10F8D63D8C1314E2897D30DAB72D88DDD0437839B153B278F1DA7EFBE6FBEFC6675EF0607D2AE88E181D6D8993897D474874EC38897B0703908C02E4C661122EC8C80D030778A173B8BFFF8B7370E0400A61532CCB1A7F48314101CC3EE8E734C42E8C480AFCCBD0837EC2CB69CD2C43B5AE40009308B87062CFA09BC6883C9EC7B4EC6B187F19E56D6CEBC447206104FEC2B600C62101844A7BFC318133128778398B6801F06F1F2348E916C04F20EFC57145DEB543FB87AC434ED5B08072D38484414FC08323AE21476EBE929EED528354876754D7E491F53AD3E3C4BEF06056F421F4A9026486C7533F66C413FBB26471924457908C8A86A31CB21A823AE29ED5B9DD5E695187A37DF66FCF9AA63E496338C1302531F0F7AC9B74EE23F777F8781B7E81787274305F1CBD7EF90A7847AF7E86472FEB3DA57DA57442012DBA89C308C65436B828FB6F5B8ED8CE911B96CD6A6D72AD505BA293C3B62EC1C37B8897E48E4E9BC3D7B6758E1EA0579470E3FA88119D4BB4118953FA7995FA3E98FBB0AC771A79B2FF1BB81EBE7C3508D72B708F96D9D04BFCE9C489E9BCFA00FDAC36B943513EBD84F1FECCC9CEE33060DFA27DE5B59F67611ABBAC33A191E416C44B4844E9C64E65BC9D4C9A410D6FD605EAEE9B369354356F2D29EBD02A33A160B1E9D950C8FBB47C3B5BDC4914D1C1CB4C8B69A4C9E04C5BD648C2D8B314CACA8C0EBA9A11A6DDFB9657C5B300207F8065B10317EA972C501CC0B297EF426A8400F796F90624091D4EEF3790DC35884EFF1C40F4C288660404D19373BBB90B31BC4A83399B039BE335D8D0DC7E0DCF814BC2F80CB3566BE3BD0FDD2F614ACEB0770A08FC48DC02907DDEA2A03BC020E29CB82E4C92736ACCD09B86D4ED2E002F30393AEC0DC796A96DBB25531FA040EF97480BEAE782B4F24DF4148A7F6220D3F9284DA2BE0F97087713B520358B9A53B48ACAC9FA8ACAC0BA49CA29CD826604AD72E65483797DD9080DEFF665B0BBEFF7ADB7799BD6829A1A67748584BF420C63BA8C7937801018E36A04BAAC1BDB7016B2E1634C9F7C6FCA387D027E3A34AB956643B6080C3F1B32D8DD9F0D9998B4F81E79CC2BE970182A88297C277AFD39AB7DCE49926D7A3A08DDDC34F3CDAC01A6E9729224A18BB259A00983F12086283FF5E1ACF688063FE2495111DA316AE8886D79B484F6CD968DEA1A9F421F12689DB87998700A121778AA1A6987BC1E82153BAA46B02A3A220AF793C2935A3A8C5923C00E41099DA90813755A20ECA208F8AD5A925A76DCC258DF4B1E72CD298C20660C5B35D185B93E18C20428F94883D2A6A1B153B3B866433478ADA6316F7361AB715762141BB1C916DFD96097DC7F7B12C36CD6D8068CB359255D043006F6B661A0FCACD2D500E483CBAE19A8746232182877A93662A0A2C6B660A0A24A9E9D81E647D4AEE32F9D5777CD3CC583F2E6B7F546756DC136057DEC9869E6BE276D43680B18ABE6793A6795F081680E67544E7E3E4BB8AB2B9B08039F4122866C2A7F57EB873ACD20B21135015686D602CAAF0415206542F510AE88E5354AC7BD881EB045DCAD1196AFFD126CCD0654ECFAD5688DD07C812A1B67A7D347D9B3D21A1423EF7458A8E1680C425EBCC48E77508A292EAB2AA68B2FDCC71BAE758C0F4683825A3C5783928ACE0CAEA5C234DBB5A473C8FAB8646B6949729F0C5A2A3A33B896B88DB62B49E314F4700BD65291B8850F34D98A4847B9DB94756327CF9BE20563C7906035BE045184F0B29670C54BAC599E6D357D31EB9F8014E4188E9B68F2904A694B4E248CC1124AB5943595F41CC509390504CC018BF34CBD4021D3EEAD86E5BF6059DF3ED5412CF681829AFD2DDEAC2A17F9C28EABBA241C89365B06CCAFC982E91A2BD037B7581A1CF041AC89DF4F433F0DB0D9CD32B7CE6FF1EAEDF3121561EC48F22B6E94A233C5D91507A0D3F0A85363D0A12A7D99D587CB0C61527AE189D6D56EF24ECD2845B0AA8E620A606D6DF84C4ECD0A43267B8DFD47AC15E169E6184F55A903F0A29E18B56C0705AC56D71D554C48A9638A35DD11A5AC933AA454D543CA7A6E892064BD62253C8346F514DD39A8D9247574B5B63BB226AFA40EADA95E015B23B35CD71D55937A5207D65477C7AEF250E4A574877731E35966CD6D2C3FF4AEB78F19309E665D1C661BACDDEDD7816AC53DB1F8EDBD02C6CB77D2A68C27BF356D2A8F78AC6753060CF32A24DC8D8B8B50E385BE1953B8F01616FAA60B7F335E3FCB7D52FB508E7F3249C9BD3C064AC7BD313F7AB53FBA51CE6239896D156AA456F59810188C18C168F6A73FF511644B7A417009305AC084E4491EF6E1FEC1A1F46267775ECF3849E2F99AA3ABE9098D38661BC8D7C2F72076EF40AC664FACF1C2A4025502D317D8830F13FBAFACD57116E3607F65C57BD645F211A33F535A711BA7D0FA5BCD061D26E3BEF9D8B5A3EF23BA6BF5E28FCF79D33DEB3AA633E6D8DA9774B9CA088BAF267A4993375D439A95DF523CDF09253C4ED0A24A1362F5B70873440679875048F943001E7EEC2B9AF6ADC15A889AF70443E10DA242D37B8155B08C6F053CFA49B2B702FD3AAB7F3BB08A68C6770308F707935F0D745F868A965BDC6A3427A34D2C49999E5BB3AED74AC1DCF6DEA42467AF35D1D504EC1E706B2459AF6019CF2C3F79B0DD51937E3C18F6364DFBC9738E7725CDB84A00D96E76F126138A1B2E8ABEA93CE21DC87CD364F26C3F5B78D3B6668AE6EE78CA65BF9CE01D33369EDFB5FDCCDF4D1B9B29CCBBE3C6D62BBF77C76C6D5BFBE7962DADF316BAF56C5D35F1C8702BA38B05B765E3E681737AC29F87D408728F327F44A94FFF6A4A5D6D61589198999AF3CE64C6CAC451F82A14CD6CFBF5956FF88D9DE534CD6C0DD99A4DBCF9FADFC89BD334F336E4406E238F589B85A8CBED6E59C79AD2A29E53DEB0D0939634F5369FB5F18AFD39A5090FA21461F618EE889F4F56F0202A1972EAF4C80256AF7BE9DE59FB2546BA7F27685941B0DF65C4D01576CD92E6022FC262F396242A48A408CD2524C0A35BEA494CD002B88456B31873F60A3C8BDBB19B8E39F42EF0754AA294D02EC360EE0B012FE60434F1CF529D4599C7D751F683264374818A89586CFE1ABF4B91EF95729F6B62420608E65DF0882E1B4BC222BBCBC712E92AC41D81B8FA4AA7E81606914FC1926B3C03F77015D9A8F9BD874BE03E5611401348FB40886A1F9F22B08C4190708CAA3DFDA436EC050F6FFE07B282926790540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin], [FirstName], [LastName]) VALUES (N'08d0a523-1342-4d27-aa6e-4e7bdd3a1311', N'pjones@ups.com', 0, N'AE1onNLCiVCKXxSFGUQJM8Nsn9V5bvG9nC66l5w7CypCPuGy+S0GxMF5ZO8iMwrgig==', N'b6789d01-85f3-4b15-a9f3-9eabeb2a4ae0', NULL, 0, 0, NULL, 1, 0, N'pjones@ups.com', 0, N'Paul ', N'Jones')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin], [FirstName], [LastName]) VALUES (N'b92e6acb-5bf4-4009-8f1f-c2bb18dd19c6', N'sysadmin@ups.com', 0, N'AEj/3IIQjpILrf1w2hUWsBB7y1QYxI+Zz4muuq/yMU+PItiW/Ddyqo/XnHSZsQM9Bw==', N'078edbcf-9141-44b4-826c-76bcfc4c4fec', NULL, 0, 0, NULL, 1, 0, N'sysadmin@ups.com', 1, N'System', N'Admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [SysAdmin], [FirstName], [LastName]) VALUES (N'eb56220b-6bd1-470a-8ebc-50d8b5ab29eb', N'soleary@ups.com', 0, N'AN69bOX7wh8Iw++0U6F8ilkZl92g9ZdqgzSUU6QJsbprkSoI59XkmYjNi3GOcs2Cqw==', N'139f3ccd-bd42-410a-b1c2-dfd2d067e4e3', NULL, 0, 0, NULL, 1, 0, N'soleary@ups.com', 0, N'Sam ', N'O''Leary')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Routes_RoutePath]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Routes_RoutePath] ON [Access].[Routes]
(
	[RoutePath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 6/12/2017 7:54:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  StoredProcedure [Access].[spIsInRole]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  StoredProcedure [Access].[spUserAreas]    Script Date: 6/12/2017 7:54:44 PM ******/
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
/****** Object:  StoredProcedure [Access].[spUserRoles]    Script Date: 6/12/2017 7:54:44 PM ******/
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
	    FROM Access.vwRoleRoutes AS vwrr
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
		  INNER JOIN Access.vwRoleRoutes AS vwrr
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
               Top = 22
               Left = 794
               Bottom = 152
               Right = 964
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
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleRoutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleRoutes'
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
               Bottom = 155
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 23
               Left = 327
               Bottom = 233
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
' , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Access', @level1type=N'VIEW',@level1name=N'vwRoleUser'
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
