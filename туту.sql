USE [master]
GO
/****** Object:  Database [Bes_laboratory]    Script Date: 15.05.2024 20:17:02 ******/
CREATE DATABASE [Bes_laboratory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bes_laboratory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bes_laboratory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bes_laboratory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Bes_laboratory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bes_laboratory] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bes_laboratory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bes_laboratory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bes_laboratory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bes_laboratory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bes_laboratory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bes_laboratory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bes_laboratory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bes_laboratory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bes_laboratory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bes_laboratory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bes_laboratory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bes_laboratory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bes_laboratory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bes_laboratory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bes_laboratory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bes_laboratory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bes_laboratory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bes_laboratory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bes_laboratory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bes_laboratory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bes_laboratory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bes_laboratory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bes_laboratory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bes_laboratory] SET RECOVERY FULL 
GO
ALTER DATABASE [Bes_laboratory] SET  MULTI_USER 
GO
ALTER DATABASE [Bes_laboratory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bes_laboratory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bes_laboratory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bes_laboratory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bes_laboratory] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bes_laboratory', N'ON'
GO
ALTER DATABASE [Bes_laboratory] SET QUERY_STORE = OFF
GO
USE [Bes_laboratory]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Bes_laboratory]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[id_patients] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[passport] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[id_insurance] [int] NOT NULL,
	[insurance] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[id_patients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_service]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_service](
	[id_order] [int] NOT NULL,
	[cod_service] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[id_execution] [int] NOT NULL,
	[biamaterial] [int] NOT NULL,
 CONSTRAINT [PK_order_service] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC,
	[cod_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[datestart] [datetime] NOT NULL,
	[dateend] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_patients] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[code] [int] NOT NULL,
	[service] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[date] [int] NULL,
 CONSTRAINT [PK_Service_1] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[report]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[report]
AS
SELECT        c.Name AS Страховая, c.Surname + ' ' + c.Name + ' ' + c.Patronymic AS FIO, dbo.Service.service AS Услуга, dbo.Service.price AS Цена
FROM            dbo.Service INNER JOIN
                         dbo.[Order] INNER JOIN
                         dbo.Patients AS c ON dbo.[Order].id_patients = c.id_patients INNER JOIN
                         dbo.order_service ON dbo.[Order].id_order = dbo.order_service.id_order ON dbo.Service.code = dbo.order_service.cod_service
GO
/****** Object:  Table [dbo].[Status]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[date_entry] [datetime] NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AllOrder]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllOrder]
AS
SELECT        dbo.[Order].id_order, dbo.[Order].datestart AS [Дата начала], dbo.[Order].dateend AS [Время выполнения], dbo.Service.service AS Услуга, dbo.Patients.Surname + ' ' + dbo.Patients.Name + ' ' + dbo.Patients.Patronymic AS ФИО,
                          dbo.Status.Name AS Статус
FROM            dbo.[Order] INNER JOIN
                         dbo.order_service ON dbo.[Order].id_order = dbo.order_service.id_order INNER JOIN
                         dbo.Service ON dbo.order_service.cod_service = dbo.Service.code INNER JOIN
                         dbo.[User] ON dbo.order_service.id_user = dbo.[User].id_user INNER JOIN
                         dbo.Status ON dbo.[Order].id_status = dbo.Status.id_status INNER JOIN
                         dbo.Patients ON dbo.[Order].id_patients = dbo.Patients.id_patients
GO
/****** Object:  Table [dbo].[Execution]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Execution](
	[id_execution] [int] IDENTITY(1,1) NOT NULL,
	[date_end] [int] NOT NULL,
	[id_analyzer] [int] NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_Execution] PRIMARY KEY CLUSTERED 
(
	[id_execution] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 15.05.2024 20:17:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[id_insurance] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[Payment_account] [int] NOT NULL,
	[INN] [int] NOT NULL,
	[BIC] [int] NOT NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[id_insurance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.05.2024 20:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeWork]    Script Date: 15.05.2024 20:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeWork](
	[id_TypeWork] [int] IDENTITY(1,1) NOT NULL,
	[id_work] [int] NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_TypeWork] PRIMARY KEY CLUSTERED 
(
	[id_TypeWork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work]    Script Date: 15.05.2024 20:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work](
	[id_work] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[id_work] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Аnalyzer]    Script Date: 15.05.2024 20:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Аnalyzer](
	[id_analyzer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[second] [int] NOT NULL,
 CONSTRAINT [PK_Аnalyzer] PRIMARY KEY CLUSTERED 
(
	[id_analyzer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Insurance] ON 

INSERT [dbo].[Insurance] ([id_insurance], [Name], [Adress], [Payment_account], [INN], [BIC]) VALUES (2, N'jjj', N'adadada', 12, 12, 12)
SET IDENTITY_INSERT [dbo].[Insurance] OFF
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([id_patients], [Surname], [Name], [Patronymic], [passport], [Phone], [Email], [id_insurance], [insurance]) VALUES (6, N'Бебесова', N'coфия', N'Сергеевна', N'1212121212', N'11111111111', N'asdfgh', 2, 1212112121)
SET IDENTITY_INSERT [dbo].[Patients] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id_role], [name]) VALUES (1, N'Лаборант')
INSERT [dbo].[Role] ([id_role], [name]) VALUES (2, N'лаборант-исследователь ')
INSERT [dbo].[Role] ([id_role], [name]) VALUES (3, N'Бухгалтер')
INSERT [dbo].[Role] ([id_role], [name]) VALUES (4, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (229, N'СПИД', 244.1, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (287, N'Волчаночный антикоагулянт,', 911.24, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (323, N',Глюкоза', 447.65, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (346, N'Общий белок,', 396.03, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (415, N'Кальций общий', 341.78, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (543, N'Гепатит С,', 289.99, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (557, N'ВИЧ', 490.77, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (659, N'Сифилис RPR', 443.66, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (797, N'АТ и АГ к ВИЧ 1/2', 370.62, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (836, N'Железо', 105.32, 2)
INSERT [dbo].[Service] ([code], [service], [price], [date]) VALUES (855, N'Ковид IgM', 209.78, 2)
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id_status], [Name]) VALUES (1, N'Принят')
INSERT [dbo].[Status] ([id_status], [Name]) VALUES (2, N'Выполнен')
INSERT [dbo].[Status] ([id_status], [Name]) VALUES (3, N'Выдан')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TypeWork] ON 

INSERT [dbo].[TypeWork] ([id_TypeWork], [id_work], [id_user]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[TypeWork] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id_user], [Surname], [Name], [patronymic], [Login], [password], [date_entry], [role]) VALUES (1, N'ббесова', N'София', N'Сергеевна', N'Qwerty', N'qwerty', CAST(N'2024-05-14T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Work] ON 

INSERT [dbo].[Work] ([id_work], [Name]) VALUES (1, N'Супер сотрудник')
INSERT [dbo].[Work] ([id_work], [Name]) VALUES (2, N'Супер сотрудник 3000')
SET IDENTITY_INSERT [dbo].[Work] OFF
SET IDENTITY_INSERT [dbo].[Аnalyzer] ON 

INSERT [dbo].[Аnalyzer] ([id_analyzer], [name], [second]) VALUES (1, N'Анализатор 3000', 21600)
INSERT [dbo].[Аnalyzer] ([id_analyzer], [name], [second]) VALUES (2, N'Анализатор экстра', 19080)
SET IDENTITY_INSERT [dbo].[Аnalyzer] OFF
ALTER TABLE [dbo].[Execution]  WITH CHECK ADD  CONSTRAINT [FK_Execution_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id_user])
GO
ALTER TABLE [dbo].[Execution] CHECK CONSTRAINT [FK_Execution_User]
GO
ALTER TABLE [dbo].[Execution]  WITH CHECK ADD  CONSTRAINT [FK_Execution_Аnalyzer] FOREIGN KEY([id_analyzer])
REFERENCES [dbo].[Аnalyzer] ([id_analyzer])
GO
ALTER TABLE [dbo].[Execution] CHECK CONSTRAINT [FK_Execution_Аnalyzer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Patients] FOREIGN KEY([id_patients])
REFERENCES [dbo].[Patients] ([id_patients])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Patients]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Status] ([id_status])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[order_service]  WITH CHECK ADD  CONSTRAINT [FK_order_service_Execution] FOREIGN KEY([id_execution])
REFERENCES [dbo].[Execution] ([id_execution])
GO
ALTER TABLE [dbo].[order_service] CHECK CONSTRAINT [FK_order_service_Execution]
GO
ALTER TABLE [dbo].[order_service]  WITH CHECK ADD  CONSTRAINT [FK_order_service_Order] FOREIGN KEY([id_order])
REFERENCES [dbo].[Order] ([id_order])
GO
ALTER TABLE [dbo].[order_service] CHECK CONSTRAINT [FK_order_service_Order]
GO
ALTER TABLE [dbo].[order_service]  WITH CHECK ADD  CONSTRAINT [FK_order_service_order_service] FOREIGN KEY([cod_service])
REFERENCES [dbo].[Service] ([code])
GO
ALTER TABLE [dbo].[order_service] CHECK CONSTRAINT [FK_order_service_order_service]
GO
ALTER TABLE [dbo].[order_service]  WITH CHECK ADD  CONSTRAINT [FK_order_service_Status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Status] ([id_status])
GO
ALTER TABLE [dbo].[order_service] CHECK CONSTRAINT [FK_order_service_Status]
GO
ALTER TABLE [dbo].[order_service]  WITH CHECK ADD  CONSTRAINT [FK_order_service_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id_user])
GO
ALTER TABLE [dbo].[order_service] CHECK CONSTRAINT [FK_order_service_User]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Insurance] FOREIGN KEY([id_insurance])
REFERENCES [dbo].[Insurance] ([id_insurance])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Insurance]
GO
ALTER TABLE [dbo].[TypeWork]  WITH CHECK ADD  CONSTRAINT [FK_TypeWork_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id_user])
GO
ALTER TABLE [dbo].[TypeWork] CHECK CONSTRAINT [FK_TypeWork_User]
GO
ALTER TABLE [dbo].[TypeWork]  WITH CHECK ADD  CONSTRAINT [FK_TypeWork_Work] FOREIGN KEY([id_work])
REFERENCES [dbo].[Work] ([id_work])
GO
ALTER TABLE [dbo].[TypeWork] CHECK CONSTRAINT [FK_TypeWork_Work]
GO
/****** Object:  StoredProcedure [dbo].[aut]    Script Date: 15.05.2024 20:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[aut]
@login nvarchar(50),
@password nvarchar(50)
as
begin
select *
from [dbo].[User] where [Login] =@login and [password] = @password
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
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "order_service"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 174
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 136
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 6
               Left = 886
               Bottom = 102
               Right = 1060
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 102
               Left = 886
               Bottom = 232
               Right = 1060
            End
            DisplayFlags = 280
            TopColumn = 4
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
         Alias =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllOrder'
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
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 200
               Left = 758
               Bottom = 330
               Right = 932
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 164
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "order_service"
            Begin Extent = 
               Top = 6
               Left = 886
               Bottom = 136
               Right = 1060
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'report'
GO
USE [master]
GO
ALTER DATABASE [Bes_laboratory] SET  READ_WRITE 
GO
