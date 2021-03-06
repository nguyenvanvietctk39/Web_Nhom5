USE [TTTinHoc]
GO
/****** Object:  StoredProcedure [dbo].[GV_Insert]    Script Date: 15/05/2019 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GV_Insert] 
@ID int,
@MaGV nchar(6),
@TenGV nvarchar(50),
@DiaChi nvarchar(50),
@SDT nvarchar (50),
@Email nvarchar(50),
@GioiTinh nvarchar(50),
@NTNS nchar(10),
@HinhAnh nvarchar(50) 
as
BEGIN
if(Not Exists(Select MaGV From GV Where MAGV = @MAGV))
insert into GV(MaGV,TenGV,DiaChi,SDT, Email, GioiTinh,NTNS, HinhAnh) values (@MaGV,@TenGV,@DiaChi,@SDT, @Email, @GioiTinh,@NTNS, @HinhAnh)
set @ID=@@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[GV_Update]    Script Date: 15/05/2019 8:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GV_Update]
@ID int,
@MaGV nchar(6),
@TenGV nvarchar(50),
@DiaChi nvarchar(50),
@SDT nvarchar (50),
@Email nvarchar(50),
@GioiTinh nvarchar(50),
@NTNS nchar(10),
@HinhAnh nvarchar(50) 
AS
Update GV
SET
MAGV=@MAGV,
TenGV=@TenGV,
DiaChi=@DiaChi,
SDT=@SDT,
Email=@Email,
GioiTinh=@GioiTinh,
NTNS=@NTNS,
HinhAnh=@HinhAnh
Where ID=@ID

GO
/****** Object:  Table [dbo].[CT_TKB]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[GV]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[HV]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[HV_DK_KhoaHoc]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[HV_Lop]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[Lop]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[NoiDungKH]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[Phong]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 15/05/2019 8:42:44 PM ******/
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
/****** Object:  Table [dbo].[TKB]    Script Date: 15/05/2019 8:42:44 PM ******/
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
SET IDENTITY_INSERT [dbo].[CT_TKB] ON 

INSERT [dbo].[CT_TKB] ([ID], [IDTKB], [IDPhong], [Buoi], [Thu], [NoiDung], [ThoiGianBD], [ThoiGIanKT]) VALUES (1, 1, 1, N'sang', N'2', N'1', N'1', N'1')
INSERT [dbo].[CT_TKB] ([ID], [IDTKB], [IDPhong], [Buoi], [Thu], [NoiDung], [ThoiGianBD], [ThoiGIanKT]) VALUES (2, 1, 2, N'chieu ', N'2', N'2', N'2', N'2')
INSERT [dbo].[CT_TKB] ([ID], [IDTKB], [IDPhong], [Buoi], [Thu], [NoiDung], [ThoiGianBD], [ThoiGIanKT]) VALUES (3, 1, 3, N'toi', N'2', N'3', N'3', N'3')
SET IDENTITY_INSERT [dbo].[CT_TKB] OFF
SET IDENTITY_INSERT [dbo].[GV] ON 

INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (2, N'GV002 ', N'NGuyễn Vũ Hoàng Anh', N'Ninh Thuận', N'03456789', N'long@gmail.comlong@gmail.com', N'Nu', N'23/10/1980', N'02.png')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (3, N'GV003 ', N'Nguyễn Thùy Vân', N'Đà Lạt', N'123456860', N'van@gmail.com', N'Nu', N'2/11/1980 ', N'03.png')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (4, N'GV001 ', N'Nguyen Van A', N'Lâm Đồng', N'12345667', N'a@gmail.com', N'Nam', N'23/10/1980', N'02.png')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (6, N'GV005 ', N'Nguyễn Tuấn Anh', N'đà nẵng', N'02397537', N'tuananh@gmail.com', N'Nam', N'2/1/1980  ', N'5.png')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (8, N'GV007 ', N'Nguyễn Văn Ba', N'Phú Yên', N'12345678', N'b@gmail.com', N'nam', N'2/11/1980 ', N'')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (9, N'GV008 ', N'Trần Thu Hương', N'Lâm Đồng ', N'01234587', N'thuhg@gmail.com', N'Nữ', N'4/12/1990 ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (10, N'GV009 ', N'Phạm Văn Bằng', N'Hội An', N'09876432', N'bang@gmail.com', N'Nam', N'2/11/1980 ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (11, N'GV010 ', N'Nguyễn Thanh ', N'Phú Thọ', N'07895367', N'thanh@gmail.com', N'Nam', N'2/11/1980 ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (12, N'GV011 ', N'Trần Kiều Trinh', N'Hà Nội', N'05678347', N'trinh@gmail.com', N'Nữ', N'2/1/1980  ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (13, N'GV012 ', N'Mai Văn Nam', N'Lâm Dồng', N'04245784', N'nam@gmail.com', N'Nam', N'23/10/1980', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (14, N'GV013 ', N'Lê Thị Thủy', N'Hà Nội', N'02345672', N't@gmail.com', N'Nữ', N'23/10/1980', N't.png')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (15, N'GV014 ', N'Mai Lan', N'Đà Lạt', N'05678932', N'lan@gmail.com', N'Nữ', N'23/10/1980', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (16, N'GV015 ', N'Trần Lam', N'Quảng Ngãi', N'03450975', N'lam@gmail.com', N'Nam', N'2/1/1980  ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (17, N'GV016 ', N'Trần Thị Hoa', N'Phú Yên', N'07085463', N'hoa@gmail.com', N'Nữ', N'23/10/1980', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (18, N'GV017 ', N'Mai Văn Sang', N'Hội An', N'08347869', N'sang@gmail.com', N'Nam', N'2/1/1980  ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (19, N'GV018 ', N'Nguyễn Thị Tố', N'Huế', N'03245667', N'to@gmail.com', N'Nữ', N'2/11/1980 ', NULL)
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (20, N'GV030 ', N'Nguyến Văn Viết', N'Lâm Đồng', N'02465477', N'viet@gmail.com', N'Nam', N'23/10/1980', N'faf')
INSERT [dbo].[GV] ([ID], [MaGV], [TenGV], [DiaChi], [SDT], [Email], [GioiTinh], [NTNS], [HinhAnh]) VALUES (22, N'GV000 ', N'Dương Phi Long', N'Đà Lạt', N'01234866', N'long@gmail.com', N'Nam', N'2/1/1980  ', N'img')
SET IDENTITY_INSERT [dbo].[GV] OFF
SET IDENTITY_INSERT [dbo].[HV] ON 

INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (1, N'HV001 ', N'THU D', N'NỮ        ', CAST(0x00008ECD00000000 AS DateTime), N'123 Lý Nam Đế Đà Lạt', N'012346466 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (2, N'HV002 ', N'THU C', N'NỮ        ', CAST(0x000092A400000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'042649676 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (3, N'HV003 ', N'NGUYỄN A', N'NAM       ', CAST(0x0000938E00000000 AS DateTime), N'23 Bùi Thị Xuân Đà Lạt', N'098765434 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (4, N'HV004 ', N'NGUYỄN C', N'NAM       ', CAST(0x00008ECD00000000 AS DateTime), N'4 Hai Bà Trưng P5 Đà Lạt', N'078965374 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (6, N'HV006 ', N'THI A', N'NỮ        ', CAST(0x0000938E00000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'043536763 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (7, N'HV007 ', N'THI E', N'NỮ        ', CAST(0x0000938E00000000 AS DateTime), N'123 Lý Nam Đế Đà Lạt', N'098765434 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (8, N'HV008 ', N' THI D', N'NỮ        ', CAST(0x00008ECD00000000 AS DateTime), N'23 Bùi Thị Xuân Đà Lạt', N'042649676 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (9, N'HV009 ', N'TH C', N'NỮ        ', CAST(0x000092A400000000 AS DateTime), N'4 Hai Bà Trưng P5 Đà Lạt', N'098765434 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (10, N'HV010 ', N'THI B', N'NỮ        ', CAST(0x0000938E00000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'012346466 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (11, N'HV011 ', N' VAN A', N'NAM       ', CAST(0x00008ECD00000000 AS DateTime), N'23 Bùi Thị Xuân Đà Lạt', N'098765434 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (12, N'HV012 ', N'VAN E', N'NAM       ', CAST(0x0000938E00000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'012346466 ', N'd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (13, N'HV013 ', N'VAN D', N'NAM       ', CAST(0x000092A400000000 AS DateTime), N'4 Hai Bà Trưng P5 Đà Lạt', N'042649676 ', N'nvd@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (14, N'HV014 ', N'VAN B', N'NAM       ', CAST(0x0000938E00000000 AS DateTime), N'123 Lý Nam Đế Đà Lạt', N'098765434 ', N'vanb@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (15, N'HV015 ', N'VAN D', N'NAM       ', CAST(0x0000907600000000 AS DateTime), N'23 Bùi Thị Xuân Đà Lạt', N'012346466 ', N'vand@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (16, N'HV016 ', N'VAN C', N'NAM       ', CAST(0x000092A400000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'042649676 ', N'c@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (17, N'HV017 ', N'NAM', N'NAM       ', CAST(0x0000938E00000000 AS DateTime), N'4 Hai Bà Trưng P5 Đà Lạt', N'012346466 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (18, N'HV018 ', N'PHẠM BẮC', N'NAM       ', CAST(0x00008ECD00000000 AS DateTime), N'123 Lý Nam Đế Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (19, N'HV019 ', N'NGỌC HOÀNG', N'NAM       ', CAST(0x0000907600000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (20, N'HV020 ', N'THỊ TƯƠI', N'NỮ        ', CAST(0x00008ECD00000000 AS DateTime), N'123 Lý Nam Đế Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (21, N'HV021 ', N'VĂN QUANG', N'NAM       ', CAST(0x0000907600000000 AS DateTime), N'48 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (22, N'HV022 ', N'VĂN ĐẠI', N'NAM       ', CAST(0x00008ECD00000000 AS DateTime), N'18 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (23, N'HV023 ', N'MAI SANG', N'NAM       ', CAST(0x0000938E00000000 AS DateTime), N'28 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (24, N'HV024 ', N'TRẦN BÁCH', N'NAM       ', CAST(0x0000907600000000 AS DateTime), N'123 Lý Nam Đế Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (25, N'HV025 ', N'MAI NGỌC', N'NỮ        ', CAST(0x0000938E00000000 AS DateTime), N'81 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (26, N'HV026 ', N'THU LAN', N'NỮ        ', CAST(0x00008ECD00000000 AS DateTime), N'83 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (27, N'HV027 ', N'MẠNH HÙNG', N'NAM       ', CAST(0x0000938E00000000 AS DateTime), N'234 Bùi Thị Xuân Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (28, N'HV028 ', N'MAI HÀ', N'NỮ        ', CAST(0x0000907600000000 AS DateTime), N'23 Bùi Thị Xuân Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (29, N'HV029 ', N'THU LAM', N'NỮ        ', CAST(0x0000938E00000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (30, N'HV030 ', N'TRẦN Đ', N'NAM       ', CAST(0x0000907600000000 AS DateTime), N'8 Trần Phú Đà Lạt', N'042649676 ', N'nam@gmail.com', NULL)
INSERT [dbo].[HV] ([ID], [MaHV], [TenHV], [GioiTinh], [NTNS], [DiaChi], [SDT], [Email], [HinhAnh]) VALUES (31, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL)
SET IDENTITY_INSERT [dbo].[HV] OFF
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (2, N'HV001 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (2, N'HV002 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (2, N'HV003 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (2, N'HV004 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (2, N'HV005 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (2, N'HV006 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (3, N'HV004 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (3, N'HV007 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (3, N'HV008 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (4, N'HV005 ', NULL)
INSERT [dbo].[HV_Lop] ([IDLop], [MaHV], [ChiTiet]) VALUES (5, N'HV009 ', NULL)
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (1, N'Lập trình Android sơ cấp', CAST(0xC73A0B00 AS Date), 450.0000, 60, N'Lập trình android sơ cấp', N'Hiểu lập trình android sơ cấp', N'Android sơ cấp', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (2, N'Lập trình Android trung cấp', CAST(0xC73A0B00 AS Date), 500.0000, 60, N'Lập trình android trung cấp', N'Hiểu lập trình android trung cấp', N'Android trung cấp', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (3, N'Lập trình Android cao cấp', CAST(0xC73A0B00 AS Date), 600.0000, 60, N'Lập trình android cao cấp', N'Hiểu và thành thạo android cao cấp', N'Android cao cấp', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (4, N'Lập trình Java sơ cấp', CAST(0xEB3A0B00 AS Date), 500.0000, 70, N'Lập trình java đơn giản', N'Hiểu và lập trình java', N'Java sơ cấp', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (5, N'Lập trình java trung cấp', CAST(0xEB3A0B00 AS Date), 600.0000, 50, N'Lập trình java căn bản', N'Lập có thể lập trình java căn bản', N'Java trung cấp', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (6, N'Lập trình java cao cấp', CAST(0xEB3A0B00 AS Date), 600.0000, 60, N'Lập trình java phức tạp', N'Có thể lập trình tốt java', N'Java cao cấp', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (7, N'Lập trình python', CAST(0xEE3A0B00 AS Date), 400.0000, 80, N'Am hiểu python', N'Lập trình tốt python', N'Python ', NULL)
INSERT [dbo].[KhoaHoc] ([ID], [TenKhoaHoc], [NgayKG], [HocPhi], [SoTiet], [GioiThieu], [MucTieu], [BangCap], [Hinh]) VALUES (8, N'Lập trình IOS', CAST(0xFA3A0B00 AS Date), 500.0000, 60, N'Am hiểu IOS', N'Lập trình tốt IOS', N'IOS', NULL)
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([ID], [IDNoiDungKH], [TenLop], [SoHV], [MaGV]) VALUES (2, 1, N'Android 1', 30, N'GV0001')
INSERT [dbo].[Lop] ([ID], [IDNoiDungKH], [TenLop], [SoHV], [MaGV]) VALUES (3, 2, N'Android 2', 35, N'GV0002')
INSERT [dbo].[Lop] ([ID], [IDNoiDungKH], [TenLop], [SoHV], [MaGV]) VALUES (4, 3, N'Android 3', 30, N'GV0003')
INSERT [dbo].[Lop] ([ID], [IDNoiDungKH], [TenLop], [SoHV], [MaGV]) VALUES (5, 4, N'Java 1', 20, N'GV0004')
INSERT [dbo].[Lop] ([ID], [IDNoiDungKH], [TenLop], [SoHV], [MaGV]) VALUES (6, 5, N'Java 2', 25, N'GV0005')
INSERT [dbo].[Lop] ([ID], [IDNoiDungKH], [TenLop], [SoHV], [MaGV]) VALUES (7, 6, N'Java 3', 30, N'GV0006')
SET IDENTITY_INSERT [dbo].[Lop] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (1, N'phong 1', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (2, N'phong 2', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (3, N'phong 3', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (4, N'phòng 4', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (5, N'phong 5', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (6, N'phong 6', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (7, N'phong 7', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (8, N'phong 8', N'phòng học')
INSERT [dbo].[Phong] ([ID], [TenPhong], [Mota]) VALUES (9, N'phong 9', N'phòng học')
SET IDENTITY_INSERT [dbo].[Phong] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID], [TenTK], [MatKhau], [Quyen], [MaUser]) VALUES (1, N'viet', N'C4CA4238A0B923820DCC509A6F75849B', 2, N'gv    ')
INSERT [dbo].[TaiKhoan] ([ID], [TenTK], [MatKhau], [Quyen], [MaUser]) VALUES (2, N'admin', N'C4CA4238A0B923820DCC509A6F75849B', 1, N'ac    ')
INSERT [dbo].[TaiKhoan] ([ID], [TenTK], [MatKhau], [Quyen], [MaUser]) VALUES (3, N'soi', N'C4CA4238A0B923820DCC509A6F75849B', 3, N'soi   ')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[TKB] ON 

INSERT [dbo].[TKB] ([ID], [IDLop], [Thang], [Tuan], [NgayBDTuan], [NgayKTTuan]) VALUES (1, 1, N'1', N'1', N'21/3/2019', N'18/3/2019')
INSERT [dbo].[TKB] ([ID], [IDLop], [Thang], [Tuan], [NgayBDTuan], [NgayKTTuan]) VALUES (2, 1, N'1', N'2', N'7/5/2019', N'14/5/2019')
INSERT [dbo].[TKB] ([ID], [IDLop], [Thang], [Tuan], [NgayBDTuan], [NgayKTTuan]) VALUES (3, 1, N'1', N'3', N'23/2/2019', N'29/2/2019')
INSERT [dbo].[TKB] ([ID], [IDLop], [Thang], [Tuan], [NgayBDTuan], [NgayKTTuan]) VALUES (4, 1, N'1', N'4', N'9/6/2019', N'16/6/2019')
SET IDENTITY_INSERT [dbo].[TKB] OFF
