USE [master]
GO
/****** Object:  Database [Du_Class]    Script Date: 2020/6/9 10:21:08 ******/
CREATE DATABASE [Du_Class]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Du_Class', FILENAME = N'G:\大二下学期\个人文件\毕业设计项目资料\项目源码和数据库\Du_Class.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Du_Class_log', FILENAME = N'G:\大二下学期\个人文件\毕业设计项目资料\项目源码和数据库\Du_Class_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Du_Class] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Du_Class].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Du_Class] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Du_Class] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Du_Class] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Du_Class] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Du_Class] SET ARITHABORT OFF 
GO
ALTER DATABASE [Du_Class] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Du_Class] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Du_Class] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Du_Class] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Du_Class] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Du_Class] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Du_Class] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Du_Class] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Du_Class] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Du_Class] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Du_Class] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Du_Class] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Du_Class] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Du_Class] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Du_Class] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Du_Class] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Du_Class] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Du_Class] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Du_Class] SET RECOVERY FULL 
GO
ALTER DATABASE [Du_Class] SET  MULTI_USER 
GO
ALTER DATABASE [Du_Class] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Du_Class] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Du_Class] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Du_Class] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Du_Class]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2020/6/9 10:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 2020/6/9 10:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[Tea_Name] [nvarchar](50) NULL,
	[ClassRoom] [nvarchar](50) NULL,
	[SchoolTime] [date] NULL,
	[TeacherID] [int] NOT NULL,
	[NewTime] [time](7) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2020/6/9 10:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[Stu_Score] [float] NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2020/6/9 10:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[News_content] [nvarchar](1000) NULL,
	[Publish_time] [datetime] NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2020/6/9 10:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Stu_Namber] [nvarchar](20) NULL,
	[Stu_Name] [nvarchar](50) NULL,
	[Stu_Sex] [char](10) NULL,
	[Stu_Photo] [nvarchar](50) NULL,
	[Stu_Password] [nvarchar](50) NULL,
	[IDCard] [nvarchar](18) NULL,
	[Nation] [nvarchar](50) NULL,
	[NativePlace] [nvarchar](50) NULL,
	[PoliticsStatus] [nvarchar](20) NULL,
	[Phone] [nvarchar](11) NULL,
	[EnrollmentYear] [nvarchar](50) NOT NULL,
	[SchoolRoll] [nvarchar](20) NULL,
	[Class_ID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2020/6/9 10:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](50) NULL,
	[TeacherPassword] [nvarchar](50) NULL,
	[TeacherPhone] [nvarchar](11) NULL,
	[Tea_Sex] [char](10) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Teacher]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Course]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Teacher]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
USE [master]
GO
ALTER DATABASE [Du_Class] SET  READ_WRITE 
GO
