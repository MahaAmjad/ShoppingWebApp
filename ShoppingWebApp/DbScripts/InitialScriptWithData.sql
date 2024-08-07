USE [master]
GO
/****** Object:  Database [shopping_db]    Script Date: 30.07.2024 21:21:49 ******/
CREATE DATABASE [shopping_db]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shopping_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shopping_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shopping_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shopping_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shopping_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shopping_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [shopping_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shopping_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shopping_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shopping_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shopping_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shopping_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shopping_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shopping_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shopping_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shopping_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shopping_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shopping_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shopping_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shopping_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shopping_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shopping_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shopping_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shopping_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shopping_db] SET  MULTI_USER 
GO
ALTER DATABASE [shopping_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shopping_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shopping_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shopping_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shopping_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shopping_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shopping_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [shopping_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [shopping_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shared_list]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shared_list](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[shopping_list_id] [int] NULL,
	[permission] [nvarchar](50) NULL,
	[shared_list_with_id] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_shared_list] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_list]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_list](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[buyer_id] [nvarchar](50) NULL,
	[sub_total] [float] NULL,
	[discount] [float] NULL,
	[grand_total] [float] NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_ShoppingLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_list_items]    Script Date: 30.07.2024 21:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_list_items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[shopping_list_id] [int] NULL,
	[product_name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[status] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_shopping_list_items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240730143902_identydb', N'8.0.7')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0ad34f85-aa77-401e-9e46-3021879ed4c3', N'johnsteve@gmail.com', N'JOHNSTEVE@GMAIL.COM', N'johnsteve@gmail.com', N'JOHNSTEVE@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKrJC2f54gR9qEHpg8+5ZdgFrIo6HJ/LfdTt77PSRF+9O5G/djv+uVMR2Zgm/LDiyA==', N'UEVZNFVRKWTUGHA7XCGNZ6BOXDENPJUP', N'da990f0b-7b6d-4df7-ade6-a2b46280decf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a01c0a42-1df8-4662-88b4-74aac9fd67b3', N'billgates@gmail.com', N'BILLGATES@GMAIL.COM', N'billgates@gmail.com', N'BILLGATES@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJDsMQ622/oOyFr5dIVBsHk+gPoYy5CzoWr1odqgCjeVmmSdyb1eEPUgl2wrT18uhg==', N'SCLVD6VIW73SLZIWSSLPZOGGKJ2E34KI', N'b6fa6d78-5df0-4d72-97ef-afb57c816c39', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[shared_list] ON 

INSERT [dbo].[shared_list] ([Id], [shopping_list_id], [permission], [shared_list_with_id], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (4, 14, N'Write', N'a01c0a42-1df8-4662-88b4-74aac9fd67b3', N'Active', CAST(N'2024-07-30T21:16:47.847' AS DateTime), N'Admin', NULL, NULL)
INSERT [dbo].[shared_list] ([Id], [shopping_list_id], [permission], [shared_list_with_id], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (5, 15, N'Read', N'a01c0a42-1df8-4662-88b4-74aac9fd67b3', N'Active', CAST(N'2024-07-30T21:17:47.410' AS DateTime), N'Admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[shared_list] OFF
GO
SET IDENTITY_INSERT [dbo].[shopping_list] ON 

INSERT [dbo].[shopping_list] ([Id], [buyer_id], [sub_total], [discount], [grand_total], [created_date], [created_by], [modified_date], [modified_by], [status]) VALUES (14, N'0ad34f85-aa77-401e-9e46-3021879ed4c3', 500, 200, 300, CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'', N'Active')
INSERT [dbo].[shopping_list] ([Id], [buyer_id], [sub_total], [discount], [grand_total], [created_date], [created_by], [modified_date], [modified_by], [status]) VALUES (15, N'0ad34f85-aa77-401e-9e46-3021879ed4c3', 500, 200, 300, CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'', N'Active')
SET IDENTITY_INSERT [dbo].[shopping_list] OFF
GO
SET IDENTITY_INSERT [dbo].[shopping_list_items] ON 

INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (29, 14, N'Choclate', 1, 220, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (30, 14, N'Cheese Chips', 1, 280, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (31, 14, N'Choclate', 1, 220, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (32, 14, N'Cheese Chips', 1, 280, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (33, 15, N'Biscuits', 1, 220, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (34, 15, N'Caramel Candy', 1, 280, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (35, 15, N'Biscuits', 1, 220, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
INSERT [dbo].[shopping_list_items] ([Id], [shopping_list_id], [product_name], [quantity], [price], [status], [created_date], [created_by], [modified_date], [modified_by]) VALUES (36, 15, N'Caramel Candy', 1, 280, N'Active', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'Admin', CAST(N'2024-07-30T16:13:39.190' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[shopping_list_items] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 30.07.2024 21:21:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 30.07.2024 21:21:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 30.07.2024 21:21:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 30.07.2024 21:21:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 30.07.2024 21:21:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 30.07.2024 21:21:49 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 30.07.2024 21:21:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [shopping_db] SET  READ_WRITE 
GO
