USE [master]
GO
/****** Object:  Database [OnDemandExam]    Script Date: 14-Mar-19 11:17:59 AM ******/
CREATE DATABASE [OnDemandExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnDemandExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnDemandExam.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnDemandExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnDemandExam_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnDemandExam] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnDemandExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnDemandExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnDemandExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnDemandExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnDemandExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnDemandExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnDemandExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnDemandExam] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnDemandExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnDemandExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnDemandExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnDemandExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnDemandExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnDemandExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnDemandExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnDemandExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnDemandExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnDemandExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnDemandExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnDemandExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnDemandExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnDemandExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnDemandExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnDemandExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnDemandExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnDemandExam] SET  MULTI_USER 
GO
ALTER DATABASE [OnDemandExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnDemandExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnDemandExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnDemandExam] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnDemandExam]
GO
/****** Object:  StoredProcedure [dbo].[addCity]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addCity]
@StateName varchar(100)
,@CityName varchar(100)
,@PinCode bigint
AS BEGIN
	insert into CityDetails(StateID,CityName,PinCode, Ts_Created, Ts_update) 
	values(@StateName,@CityName,@PinCode, GETDATE(),GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[addCourse]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[addCourse]
@ProgramName varchar(100),
@CourseName varchar(50)

AS BEGIN
	insert into CourseDeatils(ProgramName, CourseName, Ts_Created, Ts_update) 
	values(@ProgramName, @CourseName, GETDATE(),GETDATE() );
END
GO
/****** Object:  StoredProcedure [dbo].[addProgram]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addProgram]
@ProgramName varchar(100),
@Duration varchar(50)

AS BEGIN
	insert into programDetails(ProgramName, Duration, Ts_Created, Ts_update) 
	values(@ProgramName, @Duration,GETDATE(),GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[addQuestion]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addQuestion]
@Program varchar(50),
@Course varchar(50),
@Question varchar(500), 
@OptionA varchar(150),
@OptionB varchar(150),
@OptionC varchar(150),
@OptionD varchar(150),
@CorrectOption varchar(10)
AS BEGIN
	insert into QuestionDetails(Program,Course, Question, OptionA,OptionB,OptionC,OptionD,CorrectOption, Ts_Created, Ts_update) 
	values(@Program,@Course,@Question, @OptionA, @OptionB, @OptionC,@OptionD,@CorrectOption, GETDATE(),GETDATE() );
END
GO
/****** Object:  StoredProcedure [dbo].[addState]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addState]
@StateName varchar(100)

AS BEGIN
	insert into StateDetails (StateName, Ts_Created, Ts_update) 
	values(@StateName, GETDATE(),GETDATE() );
END
GO
/****** Object:  StoredProcedure [dbo].[AddTeacher]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AddTeacher]
@FirstName varchar(100),
@LastName varchar(50),
@LoginID varchar(50),
@Password varchar(50),
@Email varchar(50),
@Phone bigint,
@Gender varchar(50),
@DOB varchar(50),
@Program varchar(50),
@Address varchar(50),
@StateID varchar(50),
@cityID varchar(50),
@PinCoad bigint

AS BEGIN
	insert into UserDetials(FirstName, LastName, LoginID, Password, Email, Phone, Gender, DOB, Program, Address, 
	StateID, cityID, PinCoad, Ts_Created, ts_update, role) 
	values(@FirstName, @LastName, @LoginID, @Password, @Email, @Phone, @Gender, @DOB, @Program, @Address, 
	@StateID, @cityID, @PinCoad, GETDATE(), GETDATE(), 1);

	insert into TeacherDetails(FirstName, LastName, LoginID, Password, Email, Phone, Gender, DOB, Program, Address, 
	StateID, cityID, PinCoad, Ts_Created, ts_update, role) 
	values(@FirstName, @LastName, @LoginID, @Password, @Email, @Phone, @Gender, @DOB, @Program, @Address, 
	@StateID, @cityID, @PinCoad, GETDATE(), GETDATE(), 1);
END

GO
/****** Object:  StoredProcedure [dbo].[ApplyExam]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApplyExam]
@UserName varchar(50),
@ProgramName varchar(50)
,@CourseName1 varchar(50)
,@CourseName2 varchar(50)
,@CourseName3 varchar(50)

AS BEGIN
	insert into ExamRequestDetails(UserName, ProgramName,CourseName1,CourseName2,CourseName3,flag1,flag2,flag3, Ts_update, Ts_Created) 
							values(@UserName, @ProgramName,@CourseName1, @CourseName2,@CourseName3,0,0,0,GETDATE(),GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[checkCity]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[checkCity]
 @CityName varchar(100)
AS
BEGIN
 SELECT CityName FROM CityDetails where CityName=@CityName;
END
GO
/****** Object:  StoredProcedure [dbo].[checkCourse]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[checkCourse]
 @CourseName varchar(50),
 @ProgramName  varchar(50)
AS
BEGIN
 SELECT CourseName FROM CourseDeatils where CourseName=@CourseName and ProgramName=@ProgramName;
END
GO
/****** Object:  StoredProcedure [dbo].[checkProgram]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkProgram]
 @ProgramName varchar(50)
AS
BEGIN
 SELECT ProgramName FROM programDetails where ProgramName=@ProgramName;
END


GO
/****** Object:  StoredProcedure [dbo].[checkState]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[checkState]
 @StateName varchar(100)
AS
BEGIN
 SELECT StateName FROM StateDetails where StateName=@StateName;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUsername]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUsername]
 @LoginID varchar(50)
AS
BEGIN
 SELECT @LoginID FROM UserDetials where LoginID=@LoginID;
END


GO
/****** Object:  StoredProcedure [dbo].[getExamCourseDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getExamCourseDetails]
@LoginID varchar(50)

AS BEGIN
select RequestID, CourseName1, CourseName2, CourseName3, flag1,flag2,flag3
from ExamRequestDetails where UserName=@LoginID ;
END
GO
/****** Object:  StoredProcedure [dbo].[getResultDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getResultDetails]
@LoginID varchar(50)

AS BEGIN
select top(1) * from ResultDetails rd inner join  UserDetials ud on rd.UserName=ud.LoginID where ud.LoginID=@LoginID
 order by ExamDate desc;

END
GO
/****** Object:  StoredProcedure [dbo].[getUserDeatils]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserDeatils]
@LoginID varchar(50)

AS BEGIN
select FirstName, LastName, LoginID, Email, Phone, Gender, DOB, Program, Address, StateID, cityID, PinCoad
from UserDetials where LoginID=@LoginID ;
END
GO
/****** Object:  StoredProcedure [dbo].[loginCheck]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loginCheck]
 @LoginID varchar(50)
, @Password varchar(50)
AS
BEGIN
 SELECT * FROM UserDetials where LoginID = @LoginID and Password = @Password;
END

GO
/****** Object:  StoredProcedure [dbo].[registration]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registration]
@FirstName varchar(100),
@LastName varchar(50),
@LoginID varchar(50),
@Password varchar(50),
@Email varchar(50),
@Phone bigint,
@Gender varchar(50),
@DOB varchar(50),
@Program varchar(50),
@Address varchar(50),
@StateID varchar(50),
@cityID varchar(50),
@PinCoad bigint

AS BEGIN
	insert into UserDetials(FirstName, LastName, LoginID, Password, Email, Phone, Gender, DOB, Program, Address, 
	StateID, cityID, PinCoad, Ts_Created, ts_update, role) 
	values(@FirstName, @LastName, @LoginID, @Password, @Email, @Phone, @Gender, @DOB, @Program, @Address, 
	@StateID, @cityID, @PinCoad, GETDATE(), GETDATE(), 0);
END

GO
/****** Object:  StoredProcedure [dbo].[ResultSet]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ResultSet]
@UserName varchar(50),
@CourseName varchar(50),
@NoOfQ int,
@Marks int,
@Status varchar(50)


AS BEGIN
	insert into ResultDetails(UserName, CourseName, ExamDate, NoOfQ, Marks, Status, flag) 
	values(@UserName, @CourseName, GETDATE(),@NoOfQ, @Marks, @Status,0);
END

GO
/****** Object:  StoredProcedure [dbo].[updateUserDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserDetails]
@FirstName varchar(100),
@LastName varchar(50),
@LoginID varchar(50),
@Email varchar(50),
@Phone bigint,
@Gender varchar(50),
@DOB varchar(50),
@Program varchar(50),
@Address varchar(50),
@StateID varchar(50),
@cityID varchar(50),
@PinCoad bigint

AS BEGIN
	update  UserDetials set FirstName=@FirstName, LastName=@LastName, Email=@Email, Phone=@Phone, 
	Gender=@Gender, DOB=@DOB, Program=@Program, Address=@Address, StateID=@StateID, cityID=@cityID, PinCoad=@PinCoad, 
	ts_update=GETDATE(), role=0 where LoginID=@LoginID; 

END

GO
/****** Object:  Table [dbo].[CityDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityDetails](
	[CityID] [bigint] IDENTITY(1,1) NOT NULL,
	[StateID] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[PinCode] [bigint] NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_CityDetails] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseDeatils]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseDeatils](
	[CourseID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProgramName] [varchar](50) NULL,
	[CourseName] [varchar](50) NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_CourseDeatils] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamRequestDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExamRequestDetails](
	[RequestID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[CourseName1] [varchar](50) NULL,
	[CourseName2] [varchar](50) NULL,
	[CourseName3] [varchar](50) NULL,
	[ProgramName] [varchar](50) NULL,
	[flag1] [int] NULL,
	[flag2] [int] NULL,
	[flag3] [int] NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_ExamRequestDetails] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamSetting]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSetting](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[TimeLimit] [int] NULL,
	[NoOfQuestion] [int] NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_ExamSetting] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginDetails](
	[LoginID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
	[Ts_Created] [datetime] NULL,
	[ts_update] [datetime] NULL,
 CONSTRAINT [PK_LoginDetails] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[programDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[programDetails](
	[ProgramID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProgramName] [varchar](50) NULL,
	[Duration] [varchar](30) NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_programDetails] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QueryDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QueryDetails](
	[QueryID] [bigint] IDENTITY(1,1) NOT NULL,
	[Query] [varchar](150) NOT NULL,
	[Ts_Created] [datetime] NOT NULL,
	[Ts_update] [datetime] NOT NULL,
 CONSTRAINT [PK_QueryDetails] PRIMARY KEY CLUSTERED 
(
	[QueryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionDetails](
	[QuestionID] [bigint] IDENTITY(1,1) NOT NULL,
	[Program] [varchar](50) NULL,
	[Course] [varchar](50) NULL,
	[Question] [varchar](500) NULL,
	[OptionA] [varchar](150) NULL,
	[OptionB] [varchar](150) NULL,
	[OptionC] [varchar](150) NULL,
	[OptionD] [varchar](150) NULL,
	[CorrectOption] [varchar](10) NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_QuestionDetails] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResultDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResultDetails](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[CourseName] [varchar](50) NULL,
	[ExamDate] [datetime] NULL,
	[NoOfQ] [int] NULL,
	[Marks] [int] NULL,
	[Status] [varchar](50) NULL,
	[flag] [int] NULL,
 CONSTRAINT [PK_ResultDetails] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StateDetails](
	[StateID] [bigint] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_StateDetails] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentAnswer](
	[AnswerID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProgramID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[StudentID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[SelectedOption] [varchar](50) NULL,
	[Ts_Created] [datetime] NULL,
	[Ts_update] [datetime] NULL,
 CONSTRAINT [PK_StudentAnswer] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherDetails]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TeacherDetails](
	[TeacherID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[LoginID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [bigint] NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Program] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[StateID] [varchar](50) NULL,
	[cityID] [varchar](50) NULL,
	[PinCoad] [bigint] NULL,
	[Ts_Created] [datetime] NULL,
	[ts_update] [datetime] NULL,
	[role] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetials]    Script Date: 14-Mar-19 11:17:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetials](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[LoginID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [bigint] NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Program] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[StateID] [varchar](50) NULL,
	[cityID] [varchar](50) NULL,
	[PinCoad] [bigint] NULL,
	[Ts_Created] [datetime] NULL,
	[ts_update] [datetime] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_UserDetials] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CityDetails] ON 

INSERT [dbo].[CityDetails] ([CityID], [StateID], [CityName], [PinCode], [Ts_Created], [Ts_update]) VALUES (1, N'Delhi', N'Laxmi Nagar', 201103, CAST(0x0000A9F400C1D97A AS DateTime), CAST(0x0000A9F400C1D97A AS DateTime))
INSERT [dbo].[CityDetails] ([CityID], [StateID], [CityName], [PinCode], [Ts_Created], [Ts_update]) VALUES (2, N'Delhi', N'Khajoori', 201102, CAST(0x0000A9F400C1EB71 AS DateTime), CAST(0x0000A9F400C1EB71 AS DateTime))
INSERT [dbo].[CityDetails] ([CityID], [StateID], [CityName], [PinCode], [Ts_Created], [Ts_update]) VALUES (3, N'Delhi', N'Nirman Vihar', 110092, CAST(0x0000A9F900C8954F AS DateTime), CAST(0x0000A9F900C8954F AS DateTime))
INSERT [dbo].[CityDetails] ([CityID], [StateID], [CityName], [PinCode], [Ts_Created], [Ts_update]) VALUES (4, N'Uttar Pradesh', N'Loni', 201103, CAST(0x0000A9F900C8E5CA AS DateTime), CAST(0x0000A9F900C8E5CA AS DateTime))
INSERT [dbo].[CityDetails] ([CityID], [StateID], [CityName], [PinCode], [Ts_Created], [Ts_update]) VALUES (10003, N'Uttrakhand', N'Nanital', 234567, CAST(0x0000A9FE0069D067 AS DateTime), CAST(0x0000A9FE0069D067 AS DateTime))
SET IDENTITY_INSERT [dbo].[CityDetails] OFF
SET IDENTITY_INSERT [dbo].[CourseDeatils] ON 

INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (1, N'MCA', N'', CAST(0x0000A9F2014C21FC AS DateTime), CAST(0x0000A9F2014C21FC AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (2, N'MCA', N'BCS-052', CAST(0x0000A9F2014FB371 AS DateTime), CAST(0x0000A9F2014FB371 AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (3, N'MCA', N'BCS-054', CAST(0x0000A9F7013CF738 AS DateTime), CAST(0x0000A9F7013CF738 AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (4, N'BCA', N'', CAST(0x0000A9F900CE5FAC AS DateTime), CAST(0x0000A9F900CE5FAC AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (5, N'BCA', N'ECO-02', CAST(0x0000A9F900CE68D1 AS DateTime), CAST(0x0000A9F900CE68D1 AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (6, N'BCA', N'BCS-014', CAST(0x0000A9F900CE75F3 AS DateTime), CAST(0x0000A9F900CE75F3 AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (10004, N'BCA', N'MCS-023', CAST(0x0000AA0900B4E6E8 AS DateTime), CAST(0x0000AA0900B4E6E8 AS DateTime))
INSERT [dbo].[CourseDeatils] ([CourseID], [ProgramName], [CourseName], [Ts_Created], [Ts_update]) VALUES (10005, N'BCA', N'MCS-024', CAST(0x0000AA0900C2E7F0 AS DateTime), CAST(0x0000AA0900C2E7F0 AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseDeatils] OFF
SET IDENTITY_INSERT [dbo].[ExamRequestDetails] ON 

INSERT [dbo].[ExamRequestDetails] ([RequestID], [UserName], [CourseName1], [CourseName2], [CourseName3], [ProgramName], [flag1], [flag2], [flag3], [Ts_Created], [Ts_update]) VALUES (3, N'gaurav123', N'MCS-023', N'FEG-02', N'FEG-02', N'BCA', 1, 0, 0, CAST(0x0000AA0A0130B384 AS DateTime), CAST(0x0000AA0A0130B46B AS DateTime))
INSERT [dbo].[ExamRequestDetails] ([RequestID], [UserName], [CourseName1], [CourseName2], [CourseName3], [ProgramName], [flag1], [flag2], [flag3], [Ts_Created], [Ts_update]) VALUES (4, N'gaurav123', N'MCS-023', N'', N'', N'BCA', 0, 0, 0, CAST(0x0000AA0A013E29CC AS DateTime), CAST(0x0000AA0A013E29CC AS DateTime))
INSERT [dbo].[ExamRequestDetails] ([RequestID], [UserName], [CourseName1], [CourseName2], [CourseName3], [ProgramName], [flag1], [flag2], [flag3], [Ts_Created], [Ts_update]) VALUES (5, N'megha123', N'MCS-023', N'MCS-024', N'BCS-014', N'BCA', 0, 1, 0, CAST(0x0000AA0D00BA7E30 AS DateTime), CAST(0x0000AA0D00BA7F2E AS DateTime))
SET IDENTITY_INSERT [dbo].[ExamRequestDetails] OFF
SET IDENTITY_INSERT [dbo].[ExamSetting] ON 

INSERT [dbo].[ExamSetting] ([ExamId], [TimeLimit], [NoOfQuestion], [Ts_Created], [Ts_update]) VALUES (1, 1, 6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ExamSetting] OFF
SET IDENTITY_INSERT [dbo].[programDetails] ON 

INSERT [dbo].[programDetails] ([ProgramID], [ProgramName], [Duration], [Ts_Created], [Ts_update]) VALUES (1, N'BCA', N'3 Years', NULL, NULL)
INSERT [dbo].[programDetails] ([ProgramID], [ProgramName], [Duration], [Ts_Created], [Ts_update]) VALUES (2, N'MCA', N'3 Years', NULL, NULL)
SET IDENTITY_INSERT [dbo].[programDetails] OFF
SET IDENTITY_INSERT [dbo].[QuestionDetails] ON 

INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (63, N'BCA', N'ECO-02', N'what is accountancy?', N'h', N'c', N'b', N'd', N'B', CAST(0x0000AA0300F67D9E AS DateTime), CAST(0x0000AA0300F67D9E AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (84, NULL, N'ECO-02', N'The DBMS acts as an interface between what two components of an enterprise-class database system?', N'Database application and the database', N'Data and the database', N'The user and the database application', N'Database application and SQL', N'D', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (85, NULL, N'ECO-02', N'Which of the following products was an early implementation of the relational model developed by E.F. Codd of IBM?', N'IDMS', N'DB2', N'dBase-II', N'R:base', N'B', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (86, NULL, N'ECO-02', N'The following are components of a database except ________ ', N'user data', N'metadata', N'reports', N'indexes', N'C', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (87, NULL, N'ECO-02', N'An application where only one user accesses the database at a given time is an example of a(n) ________', N'single-user database application', N'multiuser database application', N'e-commerce database application', N'd-com ', N'A', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (88, NULL, N'ECO-02', N'An on-line commercial site such as Amazon.com is an example of a(n) ________ .', N'single-user database application', N'multiuser database application', N'e-commerce database application', N'mining database application ', N'C', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (89, NULL, N'ECO-02', N'Every time attribute A appears, it is matched with the same value of attribute B, but not the same value of attribute C. Therefore, it is true that', N'A ? B', N'A ? C', N'A ? (B,C)', N'(B,C) ? A', N'A', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (90, NULL, N'ECO-02', N'The different classes of relations created by the technique for preventing modification anomalies are called:', N'normal forms.', N'referential integrity constraints.', N'functional dependencies.', N'None of the above is correct.', N'A', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (93, NULL, N'ECO-02', N'Row is synonymous with the term:', N'record.', N'relation.', N'column. ', N'field.', N'A', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (94, NULL, N'ECO-02', N'The primary key is selected from the:', N'composite keys.', N'determinants.', N'candidate keys.', N'foreign keys.', N'C', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (95, NULL, N'ECO-02', N'The SQL command to create a table is:', N'MAKE TABLE.', N'ALTER TABLE.', N'DEFINE TABLE.', N'CREATE TABLE.', N'D', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (96, NULL, N'ECO-02', N'A ________ is a stored program that is attached to a table or a view.', N'pseudofile', N'embedded SELECT statement', N'trigger', N'None of the above is correct.', N'C', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (97, NULL, N'ECO-02', N'SQL views can be used to hide:', N'columns and rows only.', N'complicated SQL syntax only.', N'both of the above can be hidden by an SQL view.', N'None of the above is correct.', N'C', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (98, NULL, N'ECO-02', N'The SQL statement to create a view is-', N'CREATE VIEW.', N'MAKE VIEW.', N'SELECT VIEW.', N'INSERT VIEW.', N'A', CAST(0x0000AA0300F67D9E AS DateTime), NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (99, NULL, N'ECO-02', N'With which type of SQL Server recovery model are all database changes logged except those that cause large log entries?', N'Differential recovery', N'Full recovery', N'Simple recovery', N'Bulk-logged recovery', N'D', NULL, NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (100, NULL, N'ECO-02', N'Using SQL Server 2000, which of the following symbols is used to indicate parameters in stored procedures?', N'#', N'%', N'&', N'@', N'D', NULL, NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (101, NULL, N'ECO-02', N'What mode of authentication does SQL Server NOT provide?', N'Windows-only security', N'Both SQL Server and Windows-only security', N'Mixed security', N'SQL Server only security', N'D', NULL, NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (102, NULL, N'ECO-02', N'The strictest transaction isolation level provided by SQL Server is called:', N'REPEATABLE READ.', N'SERIALIZABLE.', N'READ COMMITTED', N'READ UNCOMMITTED.', N'B', NULL, NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (103, NULL, N'ECO-02', N'SQL Server program code that is executed instead of an SQL command that needs to be processed is called a(n):', N'INSTEAD OF trigger.', N'BEFORE trigger.', N'AFTER trigger.', N'BEGIN trigger.', N'A', NULL, NULL)
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (104, N'BCA', N'BCS-014', N'SRS stends for?', N'System Requirements Specification', N'System Requirement Solution', N'Serial Requirement Solution', N'System Role Specification', N'A', CAST(0x0000AA0400775245 AS DateTime), CAST(0x0000AA0400775245 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (105, N'BCA', N'BCS-014', N'SRS stends for?', N'System Requirements Specification', N'System Requirement Solution', N'Serial Requirement Solution', N'System Role Specification', N'A', CAST(0x0000AA0400775EDD AS DateTime), CAST(0x0000AA0400775EDD AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (106, N'BCA', N'BCS-014', N'0 level DFD is also known as_______', N'1st level DFD', N'Context Diagram', N'fdgf', N'asfda', N'B', CAST(0x0000AA04007D4BBB AS DateTime), CAST(0x0000AA04007D4BBB AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (107, N'BCA', N'MCS-023', N'A relation database consists of a collection of:', N'Tables', N'Fields', N'Records', N'Keys', N'A', CAST(0x0000AA0900B8D576 AS DateTime), CAST(0x0000AA0900B8D576 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (108, N'BCA', N'MCS-023', N'A _______ in a table represents a relationship among a set of values.', N'Column', N'Key', N'Row', N'Entry', N'C', CAST(0x0000AA0900B95609 AS DateTime), CAST(0x0000AA0900B95609 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (109, N'BCA', N'MCS-023', N'The term ______ is used to refer to a row.', N'Attribute', N'Tuple', N'Field', N'instance', N'B', CAST(0x0000AA0900B9B39F AS DateTime), CAST(0x0000AA0900B9B39F AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (110, N'BCA', N'MCS-023', N'The term attribute refers to a ________ of a table.', N'Record', N'Column', N'Tuple', N'Key', N'B', CAST(0x0000AA0900BA317B AS DateTime), CAST(0x0000AA0900BA317B AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (111, N'BCA', N'MCS-023', N'For each attribute of a relation, there is a set of permitted values, called the _______ of that attribute.', N'Domain', N'Relation', N'Set', N'Schema', N'A', CAST(0x0000AA0900BA98C9 AS DateTime), CAST(0x0000AA0900BA98C9 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (112, N'BCA', N'MCS-023', N'Database _______ which is the logical design of the database, and the database ________ which is a snapshot of the data in the database at a given instant in time.', N'Instance, Schema', N'Relation,Schema', N'Relation,Domain', N'Schema, Instance', N'D', CAST(0x0000AA0900BB5A3A AS DateTime), CAST(0x0000AA0900BB5A3A AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (113, N'BCA', N'MCS-023', N'Course (course_id, sec_id, semester) Here the course_id, sec_id and semester are _______ and course is a _____', N'Relations, Attribute', N'Attributes, Relation', N'Tuple, Relation', N'Tuple, Attributes', N'B', CAST(0x0000AA0900BC271D AS DateTime), CAST(0x0000AA0900BC271D AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (114, N'BCA', N'MCS-023', N'Department(dept name, building, budget) and Employee (employee_id, name, salary) Here the dept_name attribute appears in both the relations. Here using common attributes in relation schema is one way of relating _____ relations.', N'Attributes of common ', N'Tuple of common', N'Tuple of distinct', N'', N'B', CAST(0x0000AA0900BD287E AS DateTime), CAST(0x0000AA0900BD287E AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (115, N'BCA', N'MCS-023', N'Department(dept name, building, budget) and Employee (employee_id, name, salary) Here the dept_name attribute appears in both the relations. Here using common attributes in relation schema is one way of relating _____ relations.', N'Attributes of common ', N'Tuple of common', N'Tuple of distinct', N'', N'B', CAST(0x0000AA0900BD3BE1 AS DateTime), CAST(0x0000AA0900BD3BE1 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (117, N'BCA', N'MCS-023', N'The tuples of the relations can be of ______ order.', N'Any', N'Same', N'Sorted', N'Constant', N'A', CAST(0x0000AA0900BE13D0 AS DateTime), CAST(0x0000AA0900BE13D0 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (118, N'BCA', N'MCS-023', N'What type of statement is this?', N'DML', N'DDL', N'View', N'Integrity constraint', N'A', CAST(0x0000AA0900BEFA9F AS DateTime), CAST(0x0000AA0900BEFA9F AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (119, N'BCA', N'MCS-023', N'The basic data type char(n) is a _____ length character string and varchar(n) is ______ length character.', N'Fixed, Equal', N'Equal, Variable', N'Fixed, Variable', N'Variable,Equal', N'C', CAST(0x0000AA0900BFA144 AS DateTime), CAST(0x0000AA0900BFA144 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (120, N'BCA', N'MCS-023', N'To remove a relation from an SQL database, we use the ________ command.', N'Delete', N'Purge', N'Remove', N'Drop table', N'D', CAST(0x0000AA0900C01B82 AS DateTime), CAST(0x0000AA0900C01B82 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (121, N'BCA', N'MCS-023', N'This command performs which of the following action?', N'Remove relation', N'Clear relation entries', N'Delete fields', N'Delete rows', N'B', CAST(0x0000AA0900C081E6 AS DateTime), CAST(0x0000AA0900C081E6 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (122, N'BCA', N'MCS-023', N'What type of statement is this?', N'Query', N'DML', N'Relational', N'DDL', N'B', CAST(0x0000AA0900C0CD5B AS DateTime), CAST(0x0000AA0900C0CD5B AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (123, N'BCA', N'MCS-023', N'Updates that violate ______ are disallowed.', N'Integrity constraints', N'Transaction control', N'Authorization', N'DDL constraints', N'A', CAST(0x0000AA0900C14119 AS DateTime), CAST(0x0000AA0900C14119 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (124, N'BCA', N'MCS-024', N'What is the range of short data type in java?', N'-128 to 127', N'-32768 to 32767', N'-2147483648 to 2147483647', N'None of the mentioned', N'B', CAST(0x0000AA0900C3DCBE AS DateTime), CAST(0x0000AA0900C3DCBE AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (125, N'BCA', N'MCS-024', N'An expression involving byte, int, and literal numbers is promoted to which of these?', N'int', N'long', N'byte', N'float', N'B', CAST(0x0000AA0900C46BA5 AS DateTime), CAST(0x0000AA0900C46BA5 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (126, N'BCA', N'MCS-024', N'Which data type value is returned by all transcendental math functions?', N'int', N'float', N'double', N'long', N'C', CAST(0x0000AA0900C50036 AS DateTime), CAST(0x0000AA0900C50036 AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (127, N'BCA', N'MCS-024', N'Which of these operators is used to allocate memory to array variable in java?', N'malloc', N'alloc', N'new', N'new malloc', N'C', CAST(0x0000AA0900C616EA AS DateTime), CAST(0x0000AA0900C616EA AS DateTime))
INSERT [dbo].[QuestionDetails] ([QuestionID], [Program], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption], [Ts_Created], [Ts_update]) VALUES (128, N'BCA', N'MCS-024', N'Which of these is necessary to specify at time of array initialization?', N'Row', N'Column', N'Both row and column', N'None of the mentioned', N'A', CAST(0x0000AA0900C68924 AS DateTime), CAST(0x0000AA0900C68924 AS DateTime))
SET IDENTITY_INSERT [dbo].[QuestionDetails] OFF
SET IDENTITY_INSERT [dbo].[ResultDetails] ON 

INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (1, N'gaurav123', N'ECO-02', CAST(0x0000AA0300E6CCC4 AS DateTime), 20, 5, N'fail', 1)
INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (2, N'gaurav123', N'ECO-02', CAST(0x0000AA0300E6CDF0 AS DateTime), 20, 5, N'fail', 1)
INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (3, N'gaurav123', N'ECO-02', CAST(0x0000AA0300E6CE75 AS DateTime), 20, 5, N'fail', 0)
INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (4, N'gaurav123', N'ECO-02', CAST(0x0000AA0300E6CE16 AS DateTime), 20, 60, N'pass', 0)
INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (101, N'gaurav123', N'MCS-023', CAST(0x0000AA0D00AF14E7 AS DateTime), 6, 0, N'fail', 0)
INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (102, N'gaurav123', N'MCS-023', CAST(0x0000AA0D00AFE5CA AS DateTime), 6, 16, N'fail', 0)
INSERT [dbo].[ResultDetails] ([ResultID], [UserName], [CourseName], [ExamDate], [NoOfQ], [Marks], [Status], [flag]) VALUES (103, N'megha123', N'MCS-023', CAST(0x0000AA0D00BAF48C AS DateTime), 6, 0, N'fail', 1)
SET IDENTITY_INSERT [dbo].[ResultDetails] OFF
SET IDENTITY_INSERT [dbo].[StateDetails] ON 

INSERT [dbo].[StateDetails] ([StateID], [StateName], [Ts_Created], [Ts_update]) VALUES (1, N'Delhi', CAST(0x0000A9F300A32819 AS DateTime), CAST(0x0000A9F300A32819 AS DateTime))
INSERT [dbo].[StateDetails] ([StateID], [StateName], [Ts_Created], [Ts_update]) VALUES (2, N'Uttar Pradesh', CAST(0x0000A9F300A3361A AS DateTime), CAST(0x0000A9F300A3361A AS DateTime))
INSERT [dbo].[StateDetails] ([StateID], [StateName], [Ts_Created], [Ts_update]) VALUES (3, N'Panjab', CAST(0x0000A9F300AFDE59 AS DateTime), CAST(0x0000A9F300AFDE59 AS DateTime))
INSERT [dbo].[StateDetails] ([StateID], [StateName], [Ts_Created], [Ts_update]) VALUES (4, N'Goa', CAST(0x0000A9F300AFE8AB AS DateTime), CAST(0x0000A9F300AFE8AB AS DateTime))
INSERT [dbo].[StateDetails] ([StateID], [StateName], [Ts_Created], [Ts_update]) VALUES (5, N'Uttrakhand', CAST(0x0000A9F400C0609E AS DateTime), CAST(0x0000A9F400C0609E AS DateTime))
INSERT [dbo].[StateDetails] ([StateID], [StateName], [Ts_Created], [Ts_update]) VALUES (6, N'Kolkata', CAST(0x0000A9F900C8B94A AS DateTime), CAST(0x0000A9F900C8B94A AS DateTime))
SET IDENTITY_INSERT [dbo].[StateDetails] OFF
SET IDENTITY_INSERT [dbo].[TeacherDetails] ON 

INSERT [dbo].[TeacherDetails] ([TeacherID], [FirstName], [LastName], [LoginID], [Password], [Email], [Phone], [Gender], [DOB], [Program], [Address], [StateID], [cityID], [PinCoad], [Ts_Created], [ts_update], [role]) VALUES (1, N'Satyam', N'patel', N'saytam1234', N'1234', N'satyam@g.com', 1234567890, N'Male', N'12/23/2000', N'BCA', N'ghandhi nagar', N'Delhi', N'Laxmi Nagar', 123456, CAST(0x0000AA1000B0F455 AS DateTime), CAST(0x0000AA1000B0F455 AS DateTime), 1)
INSERT [dbo].[TeacherDetails] ([TeacherID], [FirstName], [LastName], [LoginID], [Password], [Email], [Phone], [Gender], [DOB], [Program], [Address], [StateID], [cityID], [PinCoad], [Ts_Created], [ts_update], [role]) VALUES (2, N'Satyam', N'patel', N'saytam12345', N'1234', N'satyam@g.com', 1234567890, N'Male', N'12/23/2000', N'BCA', N'erer', N'Delhi', N'Laxmi Nagar', 123456, CAST(0x0000AA1000B38578 AS DateTime), CAST(0x0000AA1000B38578 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TeacherDetails] OFF
SET IDENTITY_INSERT [dbo].[UserDetials] ON 

INSERT [dbo].[UserDetials] ([UserID], [FirstName], [LastName], [LoginID], [Password], [Email], [Phone], [Gender], [DOB], [Program], [Address], [StateID], [cityID], [PinCoad], [Ts_Created], [ts_update], [role]) VALUES (1, N'vikram', N'kumar', N'vikram123', N'1234', N'vikramjijio@gmail.com', 8750284362, N'Male', N'25/09/1999', N'BCA', N'G-835 Rampark', N'Delhi', N'Laxmi Nagar', 110054, CAST(0x0000A9D700C9CE1C AS DateTime), CAST(0x0000A9D700C9CE1C AS DateTime), 1)
INSERT [dbo].[UserDetials] ([UserID], [FirstName], [LastName], [LoginID], [Password], [Email], [Phone], [Gender], [DOB], [Program], [Address], [StateID], [cityID], [PinCoad], [Ts_Created], [ts_update], [role]) VALUES (10027, N'Satyam', N'patel', N'saytam12345', N'1234', N'satyam@g.com', 1234567890, N'Male', N'12/23/2000', N'BCA', N'erer', N'Delhi', N'Laxmi Nagar', 123456, CAST(0x0000AA1000B3855B AS DateTime), CAST(0x0000AA1000B3855B AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserDetials] OFF
USE [master]
GO
ALTER DATABASE [OnDemandExam] SET  READ_WRITE 
GO
