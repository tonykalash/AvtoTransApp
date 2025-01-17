USE [master]
GO
/****** Object:  Database [AvtoTrans]    Script Date: 24.06.2024 0:31:48 ******/
CREATE DATABASE [AvtoTrans]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AvtoTrans', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AvtoTrans.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AvtoTrans_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AvtoTrans_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AvtoTrans] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AvtoTrans].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AvtoTrans] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AvtoTrans] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AvtoTrans] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AvtoTrans] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AvtoTrans] SET ARITHABORT OFF 
GO
ALTER DATABASE [AvtoTrans] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AvtoTrans] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AvtoTrans] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AvtoTrans] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AvtoTrans] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AvtoTrans] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AvtoTrans] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AvtoTrans] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AvtoTrans] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AvtoTrans] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AvtoTrans] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AvtoTrans] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AvtoTrans] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AvtoTrans] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AvtoTrans] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AvtoTrans] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AvtoTrans] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AvtoTrans] SET RECOVERY FULL 
GO
ALTER DATABASE [AvtoTrans] SET  MULTI_USER 
GO
ALTER DATABASE [AvtoTrans] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AvtoTrans] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AvtoTrans] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AvtoTrans] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AvtoTrans] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AvtoTrans] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AvtoTrans', N'ON'
GO
ALTER DATABASE [AvtoTrans] SET QUERY_STORE = ON
GO
ALTER DATABASE [AvtoTrans] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AvtoTrans]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 24.06.2024 0:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentId] [bigint] IDENTITY(1,1) NOT NULL,
	[commentMessage] [nvarchar](150) NOT NULL,
	[masterId] [bigint] NOT NULL,
	[requestId] [bigint] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 24.06.2024 0:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[requestId] [bigint] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[carType] [nvarchar](50) NOT NULL,
	[carModel] [nvarchar](50) NOT NULL,
	[problemDescryption] [nvarchar](100) NOT NULL,
	[requestStatus] [nvarchar](50) NOT NULL,
	[completionDate] [date] NULL,
	[repairParts] [bigint] NULL,
	[masterId] [bigint] NULL,
	[clientId] [bigint] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.06.2024 0:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[secondName] [nvarchar](50) NOT NULL,
	[thirdName] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](20) NOT NULL,
	[userLogin] [nvarchar](50) NOT NULL,
	[userPassword] [nvarchar](50) NOT NULL,
	[userTypeId] [bigint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 24.06.2024 0:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[userTypesId] [bigint] IDENTITY(1,1) NOT NULL,
	[userTypesName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[userTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([commentId], [commentMessage], [masterId], [requestId]) VALUES (9, N'Очень странно.', 12, 6)
INSERT [dbo].[Comments] ([commentId], [commentMessage], [masterId], [requestId]) VALUES (10, N'Будем разбираться!', 13, 7)
INSERT [dbo].[Comments] ([commentId], [commentMessage], [masterId], [requestId]) VALUES (11, N'Будем разбираться!', 13, 8)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([requestId], [startDate], [carType], [carModel], [problemDescryption], [requestStatus], [completionDate], [repairParts], [masterId], [clientId]) VALUES (6, CAST(N'2023-06-06' AS Date), N'Легковая', N'Hyundai Avante (CN7)', N'Отказали тормоза.', N'В процессе ремонта', NULL, NULL, 12, 17)
INSERT [dbo].[Requests] ([requestId], [startDate], [carType], [carModel], [problemDescryption], [requestStatus], [completionDate], [repairParts], [masterId], [clientId]) VALUES (7, CAST(N'2023-05-05' AS Date), N'Легковая', N'Nissan 180SX ', N'Отказали тормоза.', N'В процессе ремонта', NULL, NULL, 13, 18)
INSERT [dbo].[Requests] ([requestId], [startDate], [carType], [carModel], [problemDescryption], [requestStatus], [completionDate], [repairParts], [masterId], [clientId]) VALUES (8, CAST(N'2022-07-07' AS Date), N'Легковая', N'Toyota 2000GT ', N'В салоне пахнет бензином.', N'Готова к выдаче', CAST(N'2023-01-01' AS Date), NULL, 13, 19)
INSERT [dbo].[Requests] ([requestId], [startDate], [carType], [carModel], [problemDescryption], [requestStatus], [completionDate], [repairParts], [masterId], [clientId]) VALUES (9, CAST(N'2023-08-02' AS Date), N'Грузовая', N'Citroen Berlingo (B9)', N'Руль плохо крутится.', N'Новая заявка', NULL, NULL, NULL, 18)
INSERT [dbo].[Requests] ([requestId], [startDate], [carType], [carModel], [problemDescryption], [requestStatus], [completionDate], [repairParts], [masterId], [clientId]) VALUES (10, CAST(N'2023-08-02' AS Date), N'Грузовая', N'УАЗ 2360 ', N'Руль плохо крутится.', N'Новая заявка', NULL, NULL, NULL, 19)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (11, N'Белов', N'Александр', N'Давидович', N'89210563128', N'login1', N'pass1', 1)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (12, N'Харитонова', N'Мария', N'Павловна', N'89535078985', N'login2', N'pass2', 3)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (13, N'Марков', N'Давид', N'Иванович', N'89210673849', N'login3', N'pass3', 3)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (14, N'Громова', N'Анна', N'Семёновна', N'89990563748', N'login4', N'pass4', 2)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (15, N'Карташова', N'Мария', N'Данииловна', N'89994563847', N'login5', N'pass5', 2)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (16, N'Касаткин', N'Егор', N'Львович', N'89219567849', N'login11', N'pass11', 4)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (17, N'Ильина', N'Тамара', N'Даниловна', N'89219567841', N'login12', N'pass12', 4)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (18, N'Елисеева', N'Юлиана', N'Алексеевна', N'89219567842', N'login13', N'pass13', 4)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (19, N'Никифорова', N'Алиса', N'Тимофеевна', N'89219567843', N'login14', N'pass14', 4)
INSERT [dbo].[Users] ([userId], [firstName], [secondName], [thirdName], [phoneNumber], [userLogin], [userPassword], [userTypeId]) VALUES (20, N'Васильев', N'Али', N'Евгеньевич', N'89219567844', N'login15', N'pass15', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([userTypesId], [userTypesName]) VALUES (1, N'Менеджер')
INSERT [dbo].[UserTypes] ([userTypesId], [userTypesName]) VALUES (2, N'Оператор')
INSERT [dbo].[UserTypes] ([userTypesId], [userTypesName]) VALUES (3, N'Автомеханик')
INSERT [dbo].[UserTypes] ([userTypesId], [userTypesName]) VALUES (4, N'Заказчик')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([requestId])
REFERENCES [dbo].[Requests] ([requestId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([masterId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([masterId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users1] FOREIGN KEY([clientId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([userTypeId])
REFERENCES [dbo].[UserTypes] ([userTypesId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [AvtoTrans] SET  READ_WRITE 
GO
