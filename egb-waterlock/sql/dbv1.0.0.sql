USE [master]
GO
/****** Object:  Database [water_lock]    Script Date: 2019/9/4 8:39:24 ******/
CREATE DATABASE [water_lock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'water_lock', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\water_lock.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'water_lock_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\water_lock_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [water_lock] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [water_lock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [water_lock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [water_lock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [water_lock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [water_lock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [water_lock] SET ARITHABORT OFF 
GO
ALTER DATABASE [water_lock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [water_lock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [water_lock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [water_lock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [water_lock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [water_lock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [water_lock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [water_lock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [water_lock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [water_lock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [water_lock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [water_lock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [water_lock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [water_lock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [water_lock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [water_lock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [water_lock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [water_lock] SET RECOVERY FULL 
GO
ALTER DATABASE [water_lock] SET  MULTI_USER 
GO
ALTER DATABASE [water_lock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [water_lock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [water_lock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [water_lock] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [water_lock] SET DELAYED_DURABILITY = DISABLED 
GO
USE [water_lock]
GO
/****** Object:  Table [dbo].[sys_log]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[business_type] [char](1) NULL,
	[operator_type] [char](1) NULL,
	[oper_name] [varchar](50) NULL,
	[dept_name] [varchar](50) NULL,
	[oper_url] [varchar](50) NULL,
	[oper_ip] [varchar](50) NULL,
	[status] [char](1) NULL,
	[method] [varchar](50) NULL,
	[error_msg] [varchar](2000) NULL,
	[oper_time] [datetime] NULL,
 CONSTRAINT [PK_sys_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_resource]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_resource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[parent_id] [int] NULL,
	[sort] [int] NULL,
	[url] [varchar](150) NULL,
	[type] [char](1) NULL,
	[visible] [char](1) NULL,
	[perms] [varchar](150) NULL,
	[icon] [varchar](150) NULL,
 CONSTRAINT [PK_sys_resources] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_role]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nchar](10) NULL,
	[role_key] [nchar](10) NULL,
	[role_sort] [nchar](10) NULL,
	[status] [nchar](10) NULL,
	[data_scope] [nchar](10) NULL,
	[del_flag] [nchar](10) NULL,
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_user_resource]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_resource](
	[resource_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_user_role]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_role](
	[user_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_userinfo]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_userinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login_name] [varchar](50) NULL,
	[password] [varchar](150) NULL,
	[username] [varchar](150) NULL,
	[status] [char](1) NULL,
	[egb_user_key] [varchar](150) NULL,
	[iot_user_key] [varchar](150) NULL,
	[avatar] [varchar](100) NULL,
	[tele] [varchar](20) NULL,
	[salt] [varchar](20) NULL,
	[del_flag] [char](1) NULL,
 CONSTRAINT [PK_sys_userinfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wl_canton]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wl_canton](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[pid] [int] NULL,
	[type] [char](1) NULL,
 CONSTRAINT [PK_wl_caton] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wl_device]    Script Date: 2019/9/4 8:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wl_device](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dev_id] [varchar](50) NULL,
	[dev_name] [varchar](500) NULL,
	[status] [char](1) NULL,
	[create_time] [datetime] NULL,
	[update_time] [datetime] NULL,
	[lon] [float] NULL,
	[lati] [float] NULL,
 CONSTRAINT [PK_device] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [water_lock] SET  READ_WRITE 
GO
