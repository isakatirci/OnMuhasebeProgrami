USE [master]
GO
/****** Object:  Database [OnMuhasebeUygulamasi]    Script Date: 5/25/2020 5:04:47 PM ******/
CREATE DATABASE [OnMuhasebeUygulamasi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnMuhasebeUygulamasi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnMuhasebeUygulamasi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnMuhasebeUygulamasi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnMuhasebeUygulamasi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnMuhasebeUygulamasi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET  MULTI_USER 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET QUERY_STORE = OFF
GO
USE [OnMuhasebeUygulamasi]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 5/25/2020 5:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FaturaAciklamasi] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MusteriId] [int] NULL,
	[DuzenlenmeTarihi] [datetime2](7) NULL,
	[TahsilatTarihi] [datetime2](7) NULL,
	[FaturaNoSeri] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaturaNoSira] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaEtiket]    Script Date: 5/25/2020 5:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaEtiket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FaturaEtiket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaKalemleri]    Script Date: 5/25/2020 5:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaKalemleri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FaturaId] [int] NULL,
	[HizmetUrunId] [int] NULL,
	[Miktar] [decimal](18, 6) NULL,
	[BirimFiyat] [decimal](18, 6) NULL,
	[KDV] [decimal](18, 6) NULL,
	[Vergi] [decimal](18, 6) NULL,
	[Toplam] [decimal](18, 6) NULL,
 CONSTRAINT [PK_FaturaKalemleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaKategori]    Script Date: 5/25/2020 5:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaKategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FaturaKategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HizmetUrun]    Script Date: 5/25/2020 5:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HizmetUrun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_HizmetUrun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusteriTedarikci]    Script Date: 5/25/2020 5:04:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriTedarikci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Soyad] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Adres] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Il] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ilce] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Telefon] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VKNTCKN] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VergiDairesi] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fatura] ON 
GO
INSERT [dbo].[Fatura] ([Id], [FaturaAciklamasi], [MusteriId], [DuzenlenmeTarihi], [TahsilatTarihi], [FaturaNoSeri], [FaturaNoSira]) VALUES (1, NULL, 1, CAST(N'2020-01-29T00:04:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[Fatura] ([Id], [FaturaAciklamasi], [MusteriId], [DuzenlenmeTarihi], [TahsilatTarihi], [FaturaNoSeri], [FaturaNoSira]) VALUES (2, NULL, 3, CAST(N'2020-01-25T00:05:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[Fatura] ([Id], [FaturaAciklamasi], [MusteriId], [DuzenlenmeTarihi], [TahsilatTarihi], [FaturaNoSeri], [FaturaNoSira]) VALUES (3, N'Fatura Açıklaması', 2, CAST(N'2020-01-06T00:05:00.0000000' AS DateTime2), CAST(N'2020-01-30T00:04:00.0000000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Fatura] OFF
GO
SET IDENTITY_INSERT [dbo].[FaturaKalemleri] ON 
GO
INSERT [dbo].[FaturaKalemleri] ([Id], [FaturaId], [HizmetUrunId], [Miktar], [BirimFiyat], [KDV], [Vergi], [Toplam]) VALUES (2, 2, 2, CAST(10.000000 AS Decimal(18, 6)), CAST(15.000000 AS Decimal(18, 6)), NULL, CAST(19.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)))
GO
INSERT [dbo].[FaturaKalemleri] ([Id], [FaturaId], [HizmetUrunId], [Miktar], [BirimFiyat], [KDV], [Vergi], [Toplam]) VALUES (3, 2, 3, CAST(20.000000 AS Decimal(18, 6)), CAST(25.000000 AS Decimal(18, 6)), NULL, CAST(29.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)))
GO
INSERT [dbo].[FaturaKalemleri] ([Id], [FaturaId], [HizmetUrunId], [Miktar], [BirimFiyat], [KDV], [Vergi], [Toplam]) VALUES (4, 2, 1, CAST(50.000000 AS Decimal(18, 6)), CAST(55.000000 AS Decimal(18, 6)), NULL, CAST(90.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)))
GO
INSERT [dbo].[FaturaKalemleri] ([Id], [FaturaId], [HizmetUrunId], [Miktar], [BirimFiyat], [KDV], [Vergi], [Toplam]) VALUES (5, 3, 2, CAST(10.000000 AS Decimal(18, 6)), CAST(15.000000 AS Decimal(18, 6)), NULL, CAST(19.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)))
GO
INSERT [dbo].[FaturaKalemleri] ([Id], [FaturaId], [HizmetUrunId], [Miktar], [BirimFiyat], [KDV], [Vergi], [Toplam]) VALUES (6, 3, 3, CAST(20.000000 AS Decimal(18, 6)), CAST(25.000000 AS Decimal(18, 6)), NULL, CAST(29.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)))
GO
INSERT [dbo].[FaturaKalemleri] ([Id], [FaturaId], [HizmetUrunId], [Miktar], [BirimFiyat], [KDV], [Vergi], [Toplam]) VALUES (7, 3, 1, CAST(30.000000 AS Decimal(18, 6)), CAST(35.000000 AS Decimal(18, 6)), NULL, CAST(39.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)))
GO
SET IDENTITY_INSERT [dbo].[FaturaKalemleri] OFF
GO
SET IDENTITY_INSERT [dbo].[HizmetUrun] ON 
GO
INSERT [dbo].[HizmetUrun] ([Id], [Ad]) VALUES (1, N'Kalem')
GO
INSERT [dbo].[HizmetUrun] ([Id], [Ad]) VALUES (2, N'Silgi')
GO
INSERT [dbo].[HizmetUrun] ([Id], [Ad]) VALUES (3, N'Defter')
GO
INSERT [dbo].[HizmetUrun] ([Id], [Ad]) VALUES (4, N'Kitap')
GO
INSERT [dbo].[HizmetUrun] ([Id], [Ad]) VALUES (5, N'Cetvel')
GO
SET IDENTITY_INSERT [dbo].[HizmetUrun] OFF
GO
SET IDENTITY_INSERT [dbo].[MusteriTedarikci] ON 
GO
INSERT [dbo].[MusteriTedarikci] ([Id], [Ad], [Soyad], [Adres], [Il], [Ilce], [Telefon], [VKNTCKN], [VergiDairesi]) VALUES (1, N'Ahmet', N'Demir', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MusteriTedarikci] ([Id], [Ad], [Soyad], [Adres], [Il], [Ilce], [Telefon], [VKNTCKN], [VergiDairesi]) VALUES (2, N'Okan', N'Yazıcı', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MusteriTedarikci] ([Id], [Ad], [Soyad], [Adres], [Il], [Ilce], [Telefon], [VKNTCKN], [VergiDairesi]) VALUES (3, N'Mehmet', N'Okuyan', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MusteriTedarikci] ([Id], [Ad], [Soyad], [Adres], [Il], [Ilce], [Telefon], [VKNTCKN], [VergiDairesi]) VALUES (4, N'Ali', N'Gümüş', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MusteriTedarikci] OFF
GO
USE [master]
GO
ALTER DATABASE [OnMuhasebeUygulamasi] SET  READ_WRITE 
GO
