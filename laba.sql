USE [Bes_laboratory]
GO
SET IDENTITY_INSERT [dbo].[Insurance] ON 

INSERT [dbo].[Insurance] ([id_insurance], [Name], [Adress], [Payment_account], [INN], [BIC]) VALUES (2, N'jjj', N'adadada', 12, 12, 12)
SET IDENTITY_INSERT [dbo].[Insurance] OFF
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([id_patients], [Surname], [Name], [Patronymic], [passport], [Phone], [Email], [id_insurance], [insurance]) VALUES (6, N'Бебесова', N'coфия', N'Сергеевна', N'1212121212', N'11111111111', N'asdfgh', 2, 1212112121)
SET IDENTITY_INSERT [dbo].[Patients] OFF
SET IDENTITY_INSERT [dbo].[Work] ON 

INSERT [dbo].[Work] ([id_work], [Name]) VALUES (1, N'Супер сотрудник')
INSERT [dbo].[Work] ([id_work], [Name]) VALUES (2, N'Супер сотрудник 3000')
SET IDENTITY_INSERT [dbo].[Work] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id_user], [Surname], [Name], [patronymic], [Login], [password], [date_entry], [role]) VALUES (1, N'Бесова', N'София', N'Сергеевна', N'Qwerty', N'qwerty', CAST(N'2024-05-14T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[TypeWork] ON 

INSERT [dbo].[TypeWork] ([id_TypeWork], [id_work], [id_user]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[TypeWork] OFF
SET IDENTITY_INSERT [dbo].[Аnalyzer] ON 

INSERT [dbo].[Аnalyzer] ([id_analyzer], [name], [second]) VALUES (1, N'Анализатор 3000', 21600)
INSERT [dbo].[Аnalyzer] ([id_analyzer], [name], [second]) VALUES (2, N'Анализатор экстра', 19080)
SET IDENTITY_INSERT [dbo].[Аnalyzer] OFF
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
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id_role], [name]) VALUES (1, N'Лаборант')
INSERT [dbo].[Role] ([id_role], [name]) VALUES (2, N'лаборант-исследователь ')
INSERT [dbo].[Role] ([id_role], [name]) VALUES (3, N'Бухгалтер')
INSERT [dbo].[Role] ([id_role], [name]) VALUES (4, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
