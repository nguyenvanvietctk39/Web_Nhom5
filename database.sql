USE [TTTinHoc]
GO
/****** Object:  Table [dbo].[CT_TKB]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_TKB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDTKB] [int] NOT NULL,
	[IDPhong] [int] NOT NULL,
	[Buoi] [nvarchar](50) NULL,
	[Thu] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](50) NULL,
	[ThoiGianBD] [nvarchar](50) NULL,
	[ThoiGIanKT] [nvarchar](50) NULL,
 CONSTRAINT [PK_CT_TKB_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GV]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GV](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaGV] [nchar](6) NULL,
	[TenGV] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[NTNS] [nchar](10) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_GV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HV]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HV](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaHV] [nchar](6) NULL,
	[TenHV] [nvarchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
	[NTNS] [datetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_HV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HV_DK_KhoaHoc]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HV_DK_KhoaHoc](
	[IDKhoaHoc] [int] NOT NULL,
	[MaHV] [nchar](6) NOT NULL,
	[NgayDK] [date] NULL,
	[ChiTiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_HV_DK_KhoaHoc] PRIMARY KEY CLUSTERED 
(
	[IDKhoaHoc] ASC,
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HV_Lop]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HV_Lop](
	[IDLop] [int] NOT NULL,
	[MaHV] [nchar](6) NOT NULL,
	[ChiTiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_CT_Lop] PRIMARY KEY CLUSTERED 
(
	[IDLop] ASC,
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoaHoc] [nvarchar](50) NULL,
	[NgayKG] [date] NULL,
	[HocPhi] [money] NULL,
	[SoTiet] [int] NULL,
	[GioiThieu] [nvarchar](max) NULL,
	[MucTieu] [nvarchar](max) NULL,
	[BangCap] [nvarchar](max) NULL,
	[Hinh] [nvarchar](max) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNoiDungKH] [int] NOT NULL,
	[TenLop] [nvarchar](50) NULL,
	[SoHV] [int] NULL,
	[MaGV] [nchar](6) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoiDungKH]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDungKH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDKH] [int] NOT NULL,
	[TieuDe] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_NoiDungKH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phong]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](10) NULL,
	[Mota] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTK] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[Quyen] [int] NULL,
	[MaUser] [nchar](6) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TKB]    Script Date: 02/05/2019 10:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDLop] [int] NOT NULL,
	[Thang] [nvarchar](50) NULL,
	[Tuan] [nvarchar](50) NULL,
	[NgayBDTuan] [nvarchar](50) NULL,
	[NgayKTTuan] [nvarchar](50) NULL,
 CONSTRAINT [PK_TKB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
