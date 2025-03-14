USE [master]
GO
/****** Object:  Database [Keychain]    Script Date: 2/17/2025 8:17:57 PM ******/
CREATE DATABASE [Keychain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Keychain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Keychain.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Keychain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Keychain_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Keychain] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Keychain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Keychain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Keychain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Keychain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Keychain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Keychain] SET ARITHABORT OFF 
GO
ALTER DATABASE [Keychain] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Keychain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Keychain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Keychain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Keychain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Keychain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Keychain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Keychain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Keychain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Keychain] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Keychain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Keychain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Keychain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Keychain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Keychain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Keychain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Keychain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Keychain] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Keychain] SET  MULTI_USER 
GO
ALTER DATABASE [Keychain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Keychain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Keychain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Keychain] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Keychain] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Keychain] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Keychain] SET QUERY_STORE = ON
GO
ALTER DATABASE [Keychain] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Keychain]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 2/17/2025 8:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](400) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/17/2025 8:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductCode] [varchar](50) NOT NULL,
	[Image] [nvarchar](200) NULL,
	[Answer] [nvarchar](400) NULL,
	[MainPage] [bit] NULL,
	[KeyImageId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RandomAnswer]    Script Date: 2/17/2025 8:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RandomAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [nvarchar](400) NULL,
 CONSTRAINT [PK_RandomAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [Image]) VALUES (1, N'Sample.png')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[Product] ([ProductCode], [Image], [Answer], [MainPage], [KeyImageId]) VALUES (N'NO001', NULL, NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[RandomAnswer] ON 

INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (1, N'Tơ duyên còn vướng, chưa thể dứt bỏ.')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (2, N'Thủy chung hữu định, nhật nguyệt luân phiên. (Mọi sự đều có định số, như mặt trời mọc rồi lại lặn.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (3, N'Nhân sinh như mộng, cần gì quá bận lòng? (Đời người như giấc mộng, chớ quá bận tâm.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (4, N'Tâm tịnh vạn sự an, dục tốc bất đạt. (Tâm an thì mọi chuyện sẽ yên, nóng vội chỉ làm hỏng việc.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (5, N'Hành thiện tích đức, phúc báo tự lai. (Làm điều lành, tích công đức, may mắn sẽ đến.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (6, N'Tuyệt cảnh sinh cơ, tử địa hồi sinh. (Nơi tận cùng lại là nơi bắt đầu, nguy cơ cũng là cơ hội.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (7, N'Vạn sự khởi đầu nan, kiên tâm tất đạt. (Mọi việc khởi đầu khó khăn, nhưng kiên trì sẽ thành công.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (8, N'Hỷ khí lâm môn, cát tường như ý. (Điềm lành sắp đến, mọi chuyện hanh thông.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (9, N'Hữu duyên thiên lý năng tương ngộ, vô duyên đối diện bất tương phùng. (Có duyên dù xa cũng gặp, vô duyên dù gần cũng không thể thành.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (10, N'Phong vân biến hóa, thời vận xoay vần. (Thời thế thay đổi, vận mệnh không cố định.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (11, N'Nhất nhật hữu khánh, phúc khí tràn đầy. (Hôm nay có điềm lành, phúc khí vây quanh.)')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (12, N'Trời xanh dù có xoay vần, 
Một lòng chân chính, mấy lần gian truân? (Dù đời đổi thay, nhưng kiên định thì sẽ vượt qua thử thách.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (13, N'Mây trôi nước chảy thảnh thơi,
 Mọi điều chớ vội, kịp thời sẽ hay. (Hãy thong thả, đúng lúc thì mọi thứ sẽ tốt đẹp.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (14, N'Vạn sự thành bại do tâm,
 Thiện căn gieo trước, phúc âm sẽ về. (Mọi chuyện đều từ tâm mà ra, làm lành thì sẽ gặp lành.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (15, N'Bước chân qua ngõ, nhìn trời xanh cao, 
Phúc duyên tích tụ, ngày sau sẽ về. (Hãy kiên nhẫn, vận may sẽ đến khi thời điểm thích hợp.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (16, N'Gió cuốn bụi trần tan mất, 
Mọi điều rồi cũng sẽ qua. (Đừng lo lắng, mọi chuyện đều sẽ trôi qua như gió cuốn.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (17, N'Trăng tròn rồi lại khuyết, 
Đời người cũng có lúc thăng trầm. (Vận mệnh có lúc thịnh lúc suy, không có gì mãi mãi.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (18, N'Dò sông, dò biển dễ dò,
 Ai hay lòng người, khó dò lắm thay! (Lòng người khó đoán, hãy cẩn trọng.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (19, N'Gió đông chưa nổi, sao vội buồm căng? 
Thời cơ chưa đến, hãy chờ giây lát. (Đừng nóng vội, thời cơ chưa chín muồi.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (20, N'Xuân đến hoa nở, thu về lá rơi,
 Mọi chuyện đều có thời gian của nó. (Đừng gấp gáp, hãy để tự nhiên định đoạt.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (21, N'Nước chảy đá mòn,
 Kiên trì thì sẽ đến đích. (Nhẫn nại và bền bỉ sẽ giúp bạn đạt được mục tiêu.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (22, N'“Trời cao có mắt soi xét,
 Gieo nhân lành, ắt gặp phước duyên.”
(Ý nghĩa: Hãy làm điều tốt, vận may sẽ đến.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (23, N'“Mưa dầm thấm đất lâu ngày,
 Kiên nhẫn chờ đợi, vận may sẽ về.”
(Ý nghĩa: Hãy kiên trì, cơ hội tốt sẽ đến.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (24, N'“Sông có khúc, người có lúc,
 Đừng lo chi chuyện không may.”
(Ý nghĩa: Cuộc sống có thăng trầm, đừng buồn lâu.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (25, N'“Gian nan chẳng quản chi đâu,
Sau cơn bĩ cực, ắt thời thái lai.”
(Ý nghĩa: Khó khăn nào rồi cũng sẽ qua.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (26, N'“Trăng mờ rồi sẽ sáng soi,
Tiền tài như nước, chảy hoài không ngưng.”
(Ý nghĩa: Vận tài chính đang có dấu hiệu khởi sắc.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (27, N'“Cần kiệm, tích tiểu thành đại,
Tay trắng nên cơ, rạng rỡ ngày mai.”
(Ý nghĩa: Kiên trì tiết kiệm sẽ đạt được thành công lớn.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (28, N'“Tháng này hên lắm ai ơi,
Túi vàng túi bạc đầy nhà như chơi.”
(Ý nghĩa: Tài lộc sắp tới, chuẩn bị tinh thần đón nhận.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (29, N'“Có làm thì mới có ăn,
Muốn giàu muốn sướng, gian nan cũng đành.”
(Ý nghĩa: Muốn giàu có thì phải chăm chỉ làm việc.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (30, N'“Duyên trời khó đoán, khó dò,
Có khi vừa gặp, thành thơ cả đời.”
(Ý nghĩa: Đôi khi tình yêu đến bất ngờ.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (31, N'“Bướm vàng lượn cánh vườn hoa,
Tình duyên khởi sắc, thuận hòa đón xuân.”
(Ý nghĩa: Tình duyên sắp nở rộ, chuẩn bị đón niềm vui.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (32, N'“Lửa gần rơm lâu ngày cũng bén,
Người thương chớ vội hờ hững nhau.”
(Ý nghĩa: Nếu có cảm tình với ai đó, hãy cho họ cơ hội.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (33, N'“Trầu cau kết nghĩa phu thê,
Người thương chín chắn, lời thề sánh đôi.”
(Ý nghĩa: Nếu đang yêu, đây là dấu hiệu tốt để tiến xa hơn.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (34, N'“Lửa thử vàng, gian nan thử sức,
Kiên trì ắt có phước phần.”
(Ý nghĩa: Cứ cố gắng, thành công sẽ đến.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (35, N'“Muốn nhanh thì phải từ từ,
Nhảy cao phải có đà đỡ chân.”
(Ý nghĩa: Kiên nhẫn là chìa khóa của thành công.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (36, N'“Sông sâu còn có thể dò,
Công danh gắng sức, ai lo chi hoài.”
(Ý nghĩa: Cứ chăm chỉ làm việc, đừng sợ thất bại.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (37, N'“Mưu cao ắt gặp gió xuôi,
Làm ăn phát đạt, tiền thời tới tay.”
(Ý nghĩa: Có chiến lược tốt, tài lộc sẽ đến.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (38, N'“Gió đưa cành trúc la đà,
Thời vận sắp đến, nở hoa tưng bừng.”
(Ý nghĩa: Thời vận đang lên, chuẩn bị đón may mắn.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (39, N'“Lênh đênh giữa sóng mà chơi,
Có khi gió đổi, cuộc đời sang trang.”
(Ý nghĩa: Cuộc sống luôn thay đổi, đừng lo lắng quá.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (40, N'“Sông sâu còn có kẻ dò,
Lòng người khó đo, chớ vội tin ai.”
(Ý nghĩa: Hãy cẩn trọng với những người xung quanh.)
')
INSERT [dbo].[RandomAnswer] ([Id], [Answer]) VALUES (41, N'“Mây mờ rồi sẽ trời quang,
Qua cơn hoạn nạn, hiên ngang mỉm cười.”
(Ý nghĩa: Sau khó khăn, mọi chuyện sẽ tốt đẹp hơn.)
')
SET IDENTITY_INSERT [dbo].[RandomAnswer] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Image] FOREIGN KEY([KeyImageId])
REFERENCES [dbo].[Image] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Image]
GO
USE [master]
GO
ALTER DATABASE [Keychain] SET  READ_WRITE 
GO
