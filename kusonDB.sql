USE [master]
GO
/****** Object:  Database [KusonDb]    Script Date: 2017/6/10 21:06:09 ******/
CREATE DATABASE [KusonDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KusonDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\KusonDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KusonDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\KusonDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KusonDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KusonDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KusonDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KusonDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KusonDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KusonDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KusonDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [KusonDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KusonDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KusonDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KusonDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KusonDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KusonDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KusonDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KusonDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KusonDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KusonDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KusonDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KusonDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KusonDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KusonDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KusonDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KusonDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KusonDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KusonDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KusonDb] SET RECOVERY FULL 
GO
ALTER DATABASE [KusonDb] SET  MULTI_USER 
GO
ALTER DATABASE [KusonDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KusonDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KusonDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KusonDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KusonDb', N'ON'
GO
USE [KusonDb]
GO
/****** Object:  Table [dbo].[t_address]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_address](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[receiver] [nvarchar](10) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_address] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_adminInfo]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_adminInfo](
	[adminId] [int] IDENTITY(1,1) NOT NULL,
	[adminName] [nvarchar](20) NOT NULL,
	[adminAccount] [nvarchar](20) NOT NULL,
	[adminPassword] [nvarchar](20) NOT NULL,
	[adminAuthority] [int] NOT NULL,
 CONSTRAINT [PK_t_adminInfo] PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_emailuser]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_emailuser](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL,
	[validateCode] [nvarchar](50) NOT NULL,
	[signupTime] [datetime] NOT NULL,
	[money] [float] NULL,
 CONSTRAINT [PK_t_emailuser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_evaluation]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_evaluation](
	[evaluationId] [int] IDENTITY(1,1) NOT NULL,
	[goodsId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[evaluateContent] [nvarchar](50) NULL,
	[status] [int] NOT NULL,
	[evaluateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_t_evaluation] PRIMARY KEY CLUSTERED 
(
	[evaluationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_goods]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_goods](
	[goodsId] [int] IDENTITY(1,1) NOT NULL,
	[goodsNo] [nvarchar](50) NOT NULL,
	[goodsTitle] [nvarchar](50) NOT NULL,
	[goodsSize] [nvarchar](10) NOT NULL,
	[goodsColor] [nvarchar](10) NOT NULL,
	[goodsAmount] [int] NULL,
	[goodsDescription] [nvarchar](500) NULL,
	[goodsPicUrl] [nvarchar](50) NULL,
	[goodsPrice] [float] NOT NULL,
	[typeId] [int] NOT NULL,
 CONSTRAINT [PK_t_goods] PRIMARY KEY CLUSTERED 
(
	[goodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_order]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[orderNo] [nvarchar](25) NOT NULL,
	[userId] [int] NOT NULL,
	[status] [int] NULL,
	[orderTime] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[receiver] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_t_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_orderItem]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_orderItem](
	[orderItemId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[goodsId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[subtotal] [float] NOT NULL,
 CONSTRAINT [PK_t_orderItem] PRIMARY KEY CLUSTERED 
(
	[orderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_type]    Script Date: 2017/6/10 21:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_type](
	[typeId] [int] IDENTITY(1,1) NOT NULL,
	[typeOne] [nvarchar](20) NOT NULL,
	[typeTwo] [nvarchar](20) NULL,
 CONSTRAINT [PK_t_type] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[t_address] ON 

INSERT [dbo].[t_address] ([addressId], [userId], [receiver], [phone], [address]) VALUES (1034, 1023, N'麦俊杰', N'13160665586', N'广东省珠海市香洲区北理工')
INSERT [dbo].[t_address] ([addressId], [userId], [receiver], [phone], [address]) VALUES (1035, 1023, N'麦俊杰', N'13160665586', N'广东省珠海市香洲区唐家湾镇北京理工大学珠海学院')
INSERT [dbo].[t_address] ([addressId], [userId], [receiver], [phone], [address]) VALUES (1036, 1023, N'陈伟浩', N'13160665327', N'广东省珠海市香洲区唐家湾镇北京理工大学珠海学院')
SET IDENTITY_INSERT [dbo].[t_address] OFF
SET IDENTITY_INSERT [dbo].[t_adminInfo] ON 

INSERT [dbo].[t_adminInfo] ([adminId], [adminName], [adminAccount], [adminPassword], [adminAuthority]) VALUES (2, N'admin', N'admin', N'admin', 0)
INSERT [dbo].[t_adminInfo] ([adminId], [adminName], [adminAccount], [adminPassword], [adminAuthority]) VALUES (2010, N'order', N'order', N'order', 2)
INSERT [dbo].[t_adminInfo] ([adminId], [adminName], [adminAccount], [adminPassword], [adminAuthority]) VALUES (2011, N'product', N'product', N'product', 1)
INSERT [dbo].[t_adminInfo] ([adminId], [adminName], [adminAccount], [adminPassword], [adminAuthority]) VALUES (2012, N'deliver', N'deliver', N'deliver', 3)
SET IDENTITY_INSERT [dbo].[t_adminInfo] OFF
SET IDENTITY_INSERT [dbo].[t_emailuser] ON 

INSERT [dbo].[t_emailuser] ([userId], [username], [password], [email], [status], [validateCode], [signupTime], [money]) VALUES (1023, N'maijunjie', N'c578c98cf9b07b9f812c276698a3ba28', N'kusonz@163.com', 1, N'c61f1af06c77253b4843ad5e257b5c3e', CAST(0x0000A78901757D19 AS DateTime), 995477)
SET IDENTITY_INSERT [dbo].[t_emailuser] OFF
SET IDENTITY_INSERT [dbo].[t_goods] ON 

INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3020, N'001', N'男士夏季T恤', N'L', N'黑色', 496, N'', N'a1.png', 35, 3038)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3021, N'002', N'男士西装', N'L', N'黑色', 198, N'', N'a2.png', 999, 3047)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3022, N'003', N'男士正装', N'XL', N'棕色', 149, N'', N'a8.png', 800, 3047)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3023, N'B01', N'女士夏秋连衣裙', N'L', N'红色', 250, N'', N'a7.png', 100, 3042)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3024, N'B02', N'女生夏季T恤', N'M', N'黑色', 500, N'', N'a5.png', 50, 3040)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3025, N'B01', N'女士夏秋连衣裙', N'M', N'红色', 198, N'', N'a7.png', 100, 3042)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3026, N'A03', N'男士羽绒服', N'XL', N'黑色', 199, N'', N'a6.png', 200, 3039)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3027, N'A02', N'男士衬衫', N'L', N'黑色', 200, N'我是男生衬衫', N'a1.png', 200, 3037)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3028, N'A04', N'男生卫衣', N'XL', N'黑色', 99, N'', N'a1.png', 120, 3036)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3029, N'C03', N'童装', N'M', N'蓝色', 197, N'', N'g2.png', 200, 3044)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3030, N'B05', N'女装外套', N'L', N'蓝色', 498, N'', N'g3.png', 150, 3043)
INSERT [dbo].[t_goods] ([goodsId], [goodsNo], [goodsTitle], [goodsSize], [goodsColor], [goodsAmount], [goodsDescription], [goodsPicUrl], [goodsPrice], [typeId]) VALUES (3031, N'D01', N'内衣', N'L', N'黑色', 99, N'', N'g1.png', 200, 3048)
SET IDENTITY_INSERT [dbo].[t_goods] OFF
SET IDENTITY_INSERT [dbo].[t_order] ON 

INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (37, N'20170610827947805', 1023, 1, CAST(0x0000A78E01536C69 AS DateTime), 2868, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (38, N'201706102141091023', 1023, 3, CAST(0x0000A78E0153EBE0 AS DateTime), 135, N'广东省珠海市香洲区唐家湾镇北京理工大学珠海学院', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (39, N'201706101631467833', 1023, 1, CAST(0x0000A78E01540843 AS DateTime), 350, N'广东省珠海市香洲区唐家湾镇北京理工大学珠海学院', N'13160665327', N'陈伟浩')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (40, N'201706102088508100', 1023, 2, CAST(0x0000A78E01542780 AS DateTime), 220, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (41, N'2017061028517347', 1023, 1, CAST(0x0000A78E01543E4A AS DateTime), 350, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (42, N'201706101789275016', 1023, -1, CAST(0x0000A78E01544A06 AS DateTime), 200, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (43, N'2017061091061441', 1023, 3, CAST(0x0000A78E01545953 AS DateTime), 200, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (44, N'201706101112646603', 1023, 3, CAST(0x0000A78E01546A33 AS DateTime), 200, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
INSERT [dbo].[t_order] ([orderId], [orderNo], [userId], [status], [orderTime], [total], [address], [phone], [receiver]) VALUES (45, N'201706101925998282', 1023, 1, CAST(0x0000A78E015623CB AS DateTime), 35, N'广东省珠海市香洲区北理工', N'13160665586', N'麦俊杰')
SET IDENTITY_INSERT [dbo].[t_order] OFF
SET IDENTITY_INSERT [dbo].[t_orderItem] ON 

INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (53, 37, 3021, 2, 1998)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (54, 37, 3022, 1, 800)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (55, 37, 3020, 2, 70)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (56, 38, 3025, 1, 100)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (57, 38, 3020, 1, 35)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (58, 39, 3030, 1, 150)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (59, 39, 3029, 1, 200)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (60, 40, 3028, 1, 120)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (61, 40, 3025, 1, 100)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (62, 41, 3030, 1, 150)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (63, 41, 3026, 1, 200)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (64, 42, 3031, 1, 200)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (65, 43, 3029, 1, 200)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (66, 44, 3029, 1, 200)
INSERT [dbo].[t_orderItem] ([orderItemId], [orderId], [goodsId], [quantity], [subtotal]) VALUES (67, 45, 3020, 1, 35)
SET IDENTITY_INSERT [dbo].[t_orderItem] OFF
SET IDENTITY_INSERT [dbo].[t_type] ON 

INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3031, N'男装', NULL)
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3038, N'男装', N'T恤')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3037, N'男装', N'衬衫')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3036, N'男装', N'卫衣')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3047, N'男装', N'西装')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3039, N'男装', N'羽绒服')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3032, N'女装', NULL)
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3040, N'女装', N'T恤')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3042, N'女装', N'连衣裙')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3043, N'女装', N'外套')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3041, N'女装', N'羽绒服')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3035, N'其他', NULL)
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3048, N'其他', N'内衣')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3033, N'童装', NULL)
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3045, N'童装', N'背带裤')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3046, N'童装', N'睡衣')
INSERT [dbo].[t_type] ([typeId], [typeOne], [typeTwo]) VALUES (3044, N'童装', N'运动服')
SET IDENTITY_INSERT [dbo].[t_type] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_adminInfo]    Script Date: 2017/6/10 21:06:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_adminInfo] ON [dbo].[t_adminInfo]
(
	[adminAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_emailuser_1]    Script Date: 2017/6/10 21:06:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_emailuser_1] ON [dbo].[t_emailuser]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_id]    Script Date: 2017/6/10 21:06:09 ******/
ALTER TABLE [dbo].[t_goods] ADD  CONSTRAINT [unique_id] UNIQUE NONCLUSTERED 
(
	[goodsNo] ASC,
	[goodsSize] ASC,
	[goodsColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_order]    Script Date: 2017/6/10 21:06:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_order] ON [dbo].[t_order]
(
	[orderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_type]    Script Date: 2017/6/10 21:06:09 ******/
ALTER TABLE [dbo].[t_type] ADD  CONSTRAINT [unique_type] UNIQUE NONCLUSTERED 
(
	[typeOne] ASC,
	[typeTwo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_emailuser] ADD  CONSTRAINT [DF_t_emailuser_money]  DEFAULT ((0.00)) FOR [money]
GO
ALTER TABLE [dbo].[t_evaluation] ADD  CONSTRAINT [DF_t_evaluation_evaluateContent]  DEFAULT ('好评') FOR [evaluateContent]
GO
ALTER TABLE [dbo].[t_goods] ADD  CONSTRAINT [DF_t_goods_goodsAmount]  DEFAULT ((0)) FOR [goodsAmount]
GO
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[t_address]  WITH CHECK ADD  CONSTRAINT [FK_t_address_t_emailuser] FOREIGN KEY([userId])
REFERENCES [dbo].[t_emailuser] ([userId])
GO
ALTER TABLE [dbo].[t_address] CHECK CONSTRAINT [FK_t_address_t_emailuser]
GO
ALTER TABLE [dbo].[t_evaluation]  WITH CHECK ADD  CONSTRAINT [FK_t_evaluation_t_emailuser] FOREIGN KEY([userId])
REFERENCES [dbo].[t_emailuser] ([userId])
GO
ALTER TABLE [dbo].[t_evaluation] CHECK CONSTRAINT [FK_t_evaluation_t_emailuser]
GO
ALTER TABLE [dbo].[t_evaluation]  WITH CHECK ADD  CONSTRAINT [FK_t_evaluation_t_evaluation] FOREIGN KEY([goodsId])
REFERENCES [dbo].[t_goods] ([goodsId])
GO
ALTER TABLE [dbo].[t_evaluation] CHECK CONSTRAINT [FK_t_evaluation_t_evaluation]
GO
ALTER TABLE [dbo].[t_goods]  WITH CHECK ADD  CONSTRAINT [FK_t_goods_t_type] FOREIGN KEY([typeId])
REFERENCES [dbo].[t_type] ([typeId])
GO
ALTER TABLE [dbo].[t_goods] CHECK CONSTRAINT [FK_t_goods_t_type]
GO
ALTER TABLE [dbo].[t_order]  WITH CHECK ADD  CONSTRAINT [FK_t_order_t_order] FOREIGN KEY([userId])
REFERENCES [dbo].[t_emailuser] ([userId])
GO
ALTER TABLE [dbo].[t_order] CHECK CONSTRAINT [FK_t_order_t_order]
GO
ALTER TABLE [dbo].[t_orderItem]  WITH CHECK ADD  CONSTRAINT [FK_t_orderItem_t_goods] FOREIGN KEY([goodsId])
REFERENCES [dbo].[t_goods] ([goodsId])
GO
ALTER TABLE [dbo].[t_orderItem] CHECK CONSTRAINT [FK_t_orderItem_t_goods]
GO
ALTER TABLE [dbo].[t_orderItem]  WITH CHECK ADD  CONSTRAINT [FK_t_orderItem_t_order] FOREIGN KEY([orderId])
REFERENCES [dbo].[t_order] ([orderId])
GO
ALTER TABLE [dbo].[t_orderItem] CHECK CONSTRAINT [FK_t_orderItem_t_order]
GO
USE [master]
GO
ALTER DATABASE [KusonDb] SET  READ_WRITE 
GO
