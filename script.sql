USE [MilkTea]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [nvarchar](10) NOT NULL,
	[ProductId] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EmployeeDob] [nvarchar](50) NOT NULL,
	[EmployeeEmail] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[ManagerId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerName] [nvarchar](50) NOT NULL,
	[ManagerDob] [nvarchar](50) NOT NULL,
	[ManagerEmail] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[DateCreate] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[OrderId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Origin] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/15/2021 12:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Username], [Password], [RoleId], [UserId]) VALUES (N'admin01', N'123456', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [UserId]) VALUES (N'admin02', N'123456', 1, 4)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [UserId]) VALUES (N'user01', N'123456', 2, 2)
INSERT [dbo].[Account] ([Username], [Password], [RoleId], [UserId]) VALUES (N'user02', N'123456', 2, 3)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Tra sua')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Banh')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Khac')
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [EmployeeName], [EmployeeDob], [EmployeeEmail], [Phone], [Address], [Gender], [ManagerId], [UserId]) VALUES (2, N'Tuan ANhh', N'21-01-2000', N'ngotuananh2101@gmail.com', N'0396-902-252', N'Ha Noi', 1, 1, 2)
INSERT [dbo].[Employee] ([EmployeeId], [EmployeeName], [EmployeeDob], [EmployeeEmail], [Phone], [Address], [Gender], [ManagerId], [UserId]) VALUES (3, N'Tuan Anh 2', N'21-01-2000', N'ngotuananh2101@gmail.com', N'0396-902-252', N'HN', 0, 2, 3)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ManagerId], [ManagerName], [ManagerDob], [ManagerEmail], [Phone], [Address], [Gender], [UserId]) VALUES (1, N'NGo Tuan Anh', N'21-01-2000', N'anh@gmail.com', N'0396-902-252', N'a', 0, 1)
INSERT [dbo].[Manager] ([ManagerId], [ManagerName], [ManagerDob], [ManagerEmail], [Phone], [Address], [Gender], [UserId]) VALUES (2, N'Admin 02', N'21-01-2000', N'ngotuananh2101@mail.com', N'0123-456-789', N'HN', 1, 4)
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (2, 2, 100.0000, CAST(N'2021-11-14' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (3, 2, 100000.0000, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (4, 2, 650000.0000, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (5, 2, 150000.0000, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (6, 2, 900000.0000, CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (7, 2, 600000.0000, CAST(N'2021-11-15' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (8, 2, 450000.0000, CAST(N'2021-11-15' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (9, 3, 2150000.0000, CAST(N'2021-11-15' AS Date))
INSERT [dbo].[Orders] ([OrderId], [EmployeeId], [Total], [DateCreate]) VALUES (10, 3, 600000.0000, CAST(N'2021-11-15' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (5, N'1', 1, 1.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (6, N'1', 8, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (6, N'2', 5, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (8, N'1', 3, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (8, N'2', 3, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (8, N'3', 3, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (10, N'1', 6, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (10, N'2', 6, 50000.0000)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductName], [Quantity], [Price]) VALUES (6, N'3', 5, 50000.0000)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Origin], [CategoryId], [Image]) VALUES (N'1', N'ts1', 50000, N'lagi', 1, N'C:\Users\ngotu\Downloads\Images\thumb-1920-736462.png')
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Origin], [CategoryId], [Image]) VALUES (N'2', N'ts2', 50000, N'lagi', 2, N'C:\Users\ngotu\Downloads\General\mau-lo-go-tra-sua-cute.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Origin], [CategoryId], [Image]) VALUES (N'3', N'ts3', 50000, N'lagi', 3, N'C:\Users\ngotu\Downloads\Images\thumb-1920-736462.png')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Employee')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Product]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Manager] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Manager]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Orders1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Orders1]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Product] FOREIGN KEY([ProductName])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
