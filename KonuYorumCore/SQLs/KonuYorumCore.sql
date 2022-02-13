USE master
GO
if exists (select name from sys.databases where name = 'BA_KonuYorumCore')
begin
	alter database BA_KonuYorumCore set single_user with rollback immediate -- veritabanı bağlantısını koparmak için
	drop database BA_KonuYorumCore
end
go
create database BA_KonuYorumCore
go
use BA_KonuYorumCore

GO
/****** Object:  Table [dbo].[Konu]    Script Date: 6.02.2022 17:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [varchar](100) NOT NULL,
	[Aciklama] [varchar](200) NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_Konu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 6.02.2022 17:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icerik] [varchar](500) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Yorumcu] [varchar](50) NOT NULL,
	[KonuId] [int] NOT NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Konu] ON 

INSERT [dbo].[Konu] ([Id], [Baslik], [Aciklama], [Tarih]) VALUES (1, N'Koronavirüs', N'COVID-19 ile ilgili gelişmeler.', CAST(N'2022-02-06T16:16:45.000' AS DateTime))
INSERT [dbo].[Konu] ([Id], [Baslik], [Aciklama], [Tarih]) VALUES (2, N'Fenerbahçe', N'Fenerbahçe''nin son durumu.', CAST(N'2022-02-06T16:27:15.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[Konu] OFF
SET IDENTITY_INSERT [dbo].[Yorum] ON 

INSERT [dbo].[Yorum] ([Id], [Icerik], [Tarih], [Yorumcu], [KonuId]) VALUES (1, N'En son Omicron varyantı ortaya çıktı.', CAST(N'2022-02-06T16:27:15.093' AS DateTime), N'MasqueR', 1)
INSERT [dbo].[Yorum] ([Id], [Icerik], [Tarih], [Yorumcu], [KonuId]) VALUES (2, N'Türkiye''de vakalar 100000''i geçti.', CAST(N'2022-02-06T16:27:15.093' AS DateTime), N'Profesör', 1)
INSERT [dbo].[Yorum] ([Id], [Icerik], [Tarih], [Yorumcu], [KonuId]) VALUES (3, N'Fenerbahçe''nin son transferi Mesut Özil beklentileri karşılayamadı.', CAST(N'2022-02-06T16:27:15.097' AS DateTime), N'Yakışıklı', 2)
SET IDENTITY_INSERT [dbo].[Yorum] OFF
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Konu] FOREIGN KEY([KonuId])
REFERENCES [dbo].[Konu] ([Id])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Konu]
GO
USE [master]
GO
ALTER DATABASE [BA_KonuYorumCore] SET  READ_WRITE 
GO