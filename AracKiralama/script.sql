/****** SCRİPTİ ÇALIŞTIMADAN ÖNCE SERVER NAME İNİZİN localhost OLDUĞUNDAN EMİN OLUN YOKSA SQL ÇALIŞIR FAKAT C# a ERİŞEMEZ' ******/
CREATE DATABASE OtoKiralama
USE [OtoKiralama]
GO
/****** Object:  Table [dbo].[Araclar]    Script Date: 24.06.2023 01:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Araclar](
	[Plaka] [varchar](50) NOT NULL,
	[Marka] [nvarchar](50) NULL,
	[Seri] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Renk] [nvarchar](50) NULL,
	[Km] [int] NULL,
	[Yakit] [nvarchar](50) NULL,
	[Ücret] [decimal](18, 2) NULL,
	[Durumu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Araclar] PRIMARY KEY CLUSTERED 
(
	[Plaka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 24.06.2023 01:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[TcNo] [nvarchar](50) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Adres] [nvarchar](100) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[TcNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 24.06.2023 01:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[AracPlaka] [varchar](50) NOT NULL,
	[MusteriTcNo] [nvarchar](50) NOT NULL,
	[GunSayisi] [int] NOT NULL,
	[ToplamTutar] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__Satis__3214EC07A8D019C6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sozlesme]    Script Date: 24.06.2023 01:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sozlesme](
	[tcno] [varchar](50) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[ehliyetno] [varchar](50) NULL,
	[ehliyettarih] [varchar](50) NULL,
	[plaka] [varchar](50) NULL,
	[Marka] [varchar](50) NULL,
	[Seri] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Renk] [varchar](50) NULL,
	[kirasekli] [varchar](50) NULL,
	[kiraücreti] [varchar](50) NULL,
	[kiralanangünsayisi] [varchar](50) NULL,
	[tutar] [varchar](50) NULL,
	[cikistarih] [datetime] NULL,
	[dönüstarih] [datetime] NULL,
 CONSTRAINT [PK_Sozlesme] PRIMARY KEY CLUSTERED 
(
	[tcno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK__Satis__AracPlaka__5AEE82B9] FOREIGN KEY([AracPlaka])
REFERENCES [dbo].[Araclar] ([Plaka])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK__Satis__AracPlaka__5AEE82B9]
GO

INSERT INTO [dbo].[Araclar] ([Plaka], [Marka], [Seri], [Model], [Renk], [Km], [Yakit], [Ücret], [Durumu])
VALUES
('34ABC123', 'Renault', 'Clio', '1.5 DCI', 'Beyaz', 100000, 'Dizel', 150, 'Müsait'),
('34DEF456', 'Peugeot', '308', '1.6 HDI', 'Gri', 75000, 'Dizel', 200, 'Kirada'),
('34GHI789', 'Volkswagen', 'Passat', '2.0 TDI', 'Siyah', 50000, 'Dizel', 300, 'Kirada'),
('34JKL012', 'Ford', 'Fiesta', '1.0 EcoBoost', 'Kırmızı', 80000, 'Benzin', 180, 'Müsait'),
('34MNO345', 'Toyota', 'Corolla', '1.6 Valvematic', 'Mavi', 60000, 'Benzin', 250, 'Müsait')

-- Müşteriler Tablosu Veri Ekleme
INSERT INTO [dbo].[Musteriler] ([TcNo], [AdSoyad], [Telefon], [Mail], [Adres])
VALUES
('123', 'Koza Balcı', '5551234567', 'koza.balcı@mail.com', 'İstanbul/Kadıköy'),
('12345678901', 'Ali Şahin', '5551234567', 'ali.sahin@gmail.com', 'İstanbul/Kadıköy'),
('23456789012', 'Mehmet Yılmaz', '5552345678', 'mehmet.yilmaz@hotmail.com', 'İstanbul/Üsküdar'),
('34567890123', 'Ayşe Özcan', '5553456789', 'ayse.ozcan@yahoo.com', 'İstanbul/Kartal'),
('45678901234', 'Fatma Akgün', '5554567890', 'fatma.akgun@gmail.com', 'İstanbul/Pendik'),
('56789012345', 'Ahmet Karaca', '5555678901', 'ahmet.karaca@hotmail.com', 'İstanbul/Ümraniye')

-- Satış Tablosu Veri Ekleme
INSERT INTO [dbo].[Satis] ([Tarih], [AracPlaka], [MusteriTcNo], [GunSayisi], [ToplamTutar])
VALUES
('2023-06-19', '34ABC123', '12345678901', 2, 300),
('2023-06-20', '34DEF456', '23456789012', 4, 800),
('2023-06-21', '34GHI789', '34567890123', 3, 900),
('2023-06-22', '34JKL012', '45678901234', 1, 180),
('2023-06-23', '34MNO345', '56789012345', 5, 1250)

