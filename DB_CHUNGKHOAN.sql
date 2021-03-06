USE [master]
GO
/****** Object:  Database [CHUNGKHOAN]    Script Date: 5/21/2021 7:02:13 PM ******/
CREATE DATABASE [CHUNGKHOAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHUNGKHOAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CHUNGKHOAN.mdf' , SIZE = 17408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CHUNGKHOAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CHUNGKHOAN_log.ldf' , SIZE = 199296KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CHUNGKHOAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHUNGKHOAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHUNGKHOAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHUNGKHOAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECOVERY FULL 
GO
ALTER DATABASE [CHUNGKHOAN] SET  MULTI_USER 
GO
ALTER DATABASE [CHUNGKHOAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHUNGKHOAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHUNGKHOAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CHUNGKHOAN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHUNGKHOAN', N'ON'
GO
USE [CHUNGKHOAN]
GO
/****** Object:  Table [dbo].[BANG_GIA_TRUC_TUYEN]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANG_GIA_TRUC_TUYEN](
	[MACP] [char](7) NOT NULL,
	[DM_GIA3] [float] NULL,
	[DM_KL3] [int] NULL,
	[DM_GIA2] [float] NULL,
	[DM_KL2] [int] NULL,
	[DM_GIA1] [float] NULL,
	[DM_KL1] [int] NULL,
	[KL_GIA] [float] NULL,
	[KL_KL] [int] NULL,
	[DB_GIA1] [float] NULL,
	[DB_KL1] [int] NULL,
	[DB_GIA2] [float] NULL,
	[DB_KL2] [int] NULL,
	[DB_GIA3] [float] NULL,
	[DB_KL3] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [char](7) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL,
	[LOAIGD] [nchar](1) NOT NULL,
	[LOAILENH] [nchar](10) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[GIADAT] [float] NOT NULL,
	[TRANGTHAILENH] [nvarchar](30) NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NOT NULL,
	[SOLUONGKHOP] [int] NOT NULL,
	[GIAKHOP] [float] NOT NULL,
	[IDLENHDAT] [int] NULL,
 CONSTRAINT [PK__LENHKHOP__F336C59879AC3042] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BANG_GIA_TRUC_TUYEN] ([MACP], [DM_GIA3], [DM_KL3], [DM_GIA2], [DM_KL2], [DM_GIA1], [DM_KL1], [KL_GIA], [KL_KL], [DB_GIA1], [DB_KL1], [DB_GIA2], [DB_KL2], [DB_GIA3], [DB_KL3]) VALUES (N'ACB    ', 0, 0, 9000, 1000, 10000, 1010, 11000, 1000, 10500, 21000, 12000, 1000, 0, 0)
INSERT [dbo].[BANG_GIA_TRUC_TUYEN] ([MACP], [DM_GIA3], [DM_KL3], [DM_GIA2], [DM_KL2], [DM_GIA1], [DM_KL1], [KL_GIA], [KL_KL], [DB_GIA1], [DB_KL1], [DB_GIA2], [DB_KL2], [DB_GIA3], [DB_KL3]) VALUES (N'A      ', 0, 0, 0, 0, 9000, 1000, 10000, 1000, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[LENHDAT] ON 

INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6744, N'ACB    ', CAST(N'2021-05-21T10:45:21.450' AS DateTime), N'M', N'LO        ', 1000, 10000, N'Chờ khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6745, N'ACB    ', CAST(N'2021-05-21T10:45:35.450' AS DateTime), N'M', N'LO        ', 10, 10000, N'Chờ khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6746, N'ACB    ', CAST(N'2021-05-21T10:46:34.460' AS DateTime), N'M', N'LO        ', 1000, 9000, N'Chờ khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6747, N'ACB    ', CAST(N'2021-05-21T10:46:58.460' AS DateTime), N'M', N'LO        ', 0, 11000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6748, N'ACB    ', CAST(N'2021-05-21T10:48:19.480' AS DateTime), N'B', N'LO        ', 1000, 12000, N'Chờ khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6749, N'ACB    ', CAST(N'2021-05-21T10:45:00.000' AS DateTime), N'B', N'LO        ', 19000, 10500, N'Khớp lệnh 1 phần')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6750, N'ACB    ', CAST(N'2021-05-21T00:00:00.000' AS DateTime), N'B', N'LO        ', 2000, 10500, N'Chờ khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6751, N'A      ', CAST(N'2021-05-21T11:38:00.380' AS DateTime), N'M', N'LO        ', 0, 15000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6752, N'A      ', CAST(N'2021-05-21T11:38:11.380' AS DateTime), N'M', N'LO        ', 0, 10000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6753, N'A      ', CAST(N'2021-05-21T11:38:25.380' AS DateTime), N'M', N'LO        ', 1000, 9000, N'Chờ khớp')
SET IDENTITY_INSERT [dbo].[LENHDAT] OFF
GO
SET IDENTITY_INSERT [dbo].[LENHKHOP] ON 

INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (7270, CAST(N'2021-05-21T10:50:07.590' AS DateTime), 1000, 11000, 6747)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (7271, CAST(N'2021-05-21T11:39:25.663' AS DateTime), 1000, 15000, 6751)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (7272, CAST(N'2021-05-21T11:39:25.670' AS DateTime), 1000, 10000, 6752)
SET IDENTITY_INSERT [dbo].[LENHKHOP] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_MACP]    Script Date: 5/21/2021 7:02:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_MACP] ON [dbo].[BANG_GIA_TRUC_TUYEN]
(
	[MACP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LENHDAT] ADD  CONSTRAINT [DF__LENHDAT_NGAYDAT]  DEFAULT (getdate()) FOR [NGAYDAT]
GO
ALTER TABLE [dbo].[LENHKHOP]  WITH CHECK ADD  CONSTRAINT [FK_LENHKHOP_LENHDAT] FOREIGN KEY([IDLENHDAT])
REFERENCES [dbo].[LENHDAT] ([ID])
GO
ALTER TABLE [dbo].[LENHKHOP] CHECK CONSTRAINT [FK_LENHKHOP_LENHDAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_GIADAT] CHECK  (([GIADAT]>(0)))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_GIADAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_LOAIGD] CHECK  (([LOAIGD]='M' OR [LOAIGD]='B'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_LOAIGD]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_LOAILENH] CHECK  (([LOAILENH]='LO' OR [LOAILENH]='ATO' OR [LOAILENH]='ATC'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_LOAILENH]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_SOLUONG] CHECK  (([SOLUONG]>=(0)))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_SOLUONG]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_TRANGTHAILENH] CHECK  (([TRANGTHAILENH]=N'Chờ khớp' OR [TRANGTHAILENH]=N'Khớp lệnh 1 phần' OR [TRANGTHAILENH]=N'Khớp hết' OR [TRANGTHAILENH]=N'Đã hủy' OR [TRANGTHAILENH]=N'Chưa khớp'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_TRANGTHAILENH]
GO
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CursorLoaiGD]
  @OutCrsr CURSOR VARYING OUTPUT, 
  @macp NVARCHAR( 10), @Ngay NVARCHAR( 50),  @LoaiGD CHAR 
AS
SET DATEFORMAT DMY 
IF (@LoaiGD='M') 
-- giữ nguyên vị trí, giữ nguyên các thuộc tính nên sử dụng CURSOR KEYSET FOR
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@macp 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT DESC, NGAYDAT 
ELSE
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID,NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@macp 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT ASC, NGAYDAT 
OPEN @OutCrsr
GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KHOPLENH_LO]
    @macp NVARCHAR(10) ,
    @Ngay NVARCHAR(50) ,
    @LoaiGD CHAR ,
    @soluongMB INT ,
    @giadatMB FLOAT
AS --Viết SP tính số lượng cổ phiếu khớp theo thuật toán khớp lệnh liên tục khi có 1 lệnh mua hoặc bán được gởi đến bảng LENHDAT
   
    DECLARE @Ngay_Convert DATETIME
               
    SET @Ngay_Convert = CONVERT(DATETIME, @Ngay)


	 SET DATEFORMAT DMY
    DECLARE @CrsrVar CURSOR ,
        @ngaydat NVARCHAR(50) ,
        @soluong INT ,
        @giadat FLOAT ,
        @soluongkhop INT ,
        @giakhop FLOAT ,
        @IDLENHDAT INT ,
        @soluongkhopALL INT

    SET @soluongkhopALL = 0
    IF ( @LoaiGD = 'B' )
        EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'M'
    ELSE
        EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'B'
  
    FETCH NEXT FROM @CrsrVar  INTO @IDLENHDAT, @ngaydat, @soluong, @giadat
 
    WHILE ( @@FETCH_STATUS <> -1
            AND @soluongMB > 0
          )
        BEGIN
    --  Trường hợp lệnh gởi vào là lệnh bán
            IF ( @LoaiGD = 'B' )
                IF ( @giadatMB <= @giadat )
                    BEGIN
                       IF @soluongMB >= @soluong
                        BEGIN
                                SET @soluongkhop = @soluong
                                SET @giakhop = @giadat
                                SET @soluongMB = @soluongMB - @soluong

                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
                                WHERE CURRENT OF @CrsrVar
                            END
                        ELSE
                            BEGIN
                                SET @soluongkhop = @soluongMB
                                SET @giakhop = @giadat
       
                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = SOLUONG - @soluongMB , TRANGTHAILENH = N'Khớp lệnh 1 phần'
                                WHERE CURRENT OF @CrsrVar
                                SET @soluongMB = 0
                            END
                    END
                ELSE
                    GOTO THOAT

    -- Còn Trường hợp lệnh gởi vào là lệnh mua
            IF ( @LoaiGD = 'M' )
                IF ( @giadatMB >= @giadat )
                    BEGIN
                        IF @soluongMB >= @soluong
                            BEGIN
                                SET @soluongkhop = @soluong
                                SET @giakhop = @giadat
                                SET @soluongMB = @soluongMB - @soluong
                               
							    UPDATE  dbo.LENHDAT
                                SET     SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
                                WHERE CURRENT OF @CrsrVar
                            END
                        ELSE
                            BEGIN
                                SET @soluongkhop = @soluongMB
                                SET @giakhop = @giadat

                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = SOLUONG - @soluongMB, TRANGTHAILENH = N'Khớp lệnh 1 phần'
                                WHERE CURRENT OF @CrsrVar
                                SET @soluongMB = 0
                            END
                    END
                ELSE
                    GOTO THOAT

			-- cập nhật tổng số lượng khớp của lệnh gưi vào
            SET @soluongkhopALL = @soluongkhopALL + @soluongkhop
                                
			 -- Cập nhật table LENHKHOP
            INSERT  INTO dbo.LENHKHOP
                    ( NGAYKHOP ,
                        SOLUONGKHOP ,
                        GIAKHOP ,
                        IDLENHDAT
	                )
            VALUES  ( GETDATE() , -- NGAYKHOP - datetime   
                        @soluongkhop , -- SOLUONGKHOP - int
                        @giakhop , -- GIAKHOP - float
                        @IDLENHDAT -- IDLENHDAT - int
	                )

	        -- Câp nhật thông tin vào 	[dbo].[BANG_GIA_TRUC_TUYEN]
			IF EXISTS(SELECT * FROM dbo.BANG_GIA_TRUC_TUYEN WHERE MACP = @macp)
			BEGIN
				UPDATE dbo.BANG_GIA_TRUC_TUYEN
				SET KL_GIA = @giakhop, KL_KL = @soluongkhop
				WHERE MACP = @macp
			END
			ELSE
            BEGIN
                INSERT INTO dbo.BANG_GIA_TRUC_TUYEN( MACP ,  KL_GIA , KL_KL )
                VALUES  ( @macp, @giakhop, @soluongkhop )	       
            END
            FETCH NEXT FROM @CrsrVar INTO @IDLENHDAT, @ngaydat, @soluong,
                @giadat
        END
    THOAT:
    IF ( @soluongMB > 0  AND @soluongkhopALL > 0)
        BEGIN
            INSERT  INTO LENHDAT
                    ( MACP ,
                      NGAYDAT ,
                      LOAIGD ,
                      LOAILENH ,
                      SOLUONG ,
                      GIADAT ,
                      TRANGTHAILENH
                    )
            VALUES  ( @macp ,
                      @ngaydat ,
                      @LoaiGD ,
                      N'LO' ,
                      @soluongMB ,
                      @giadatMB ,
                      N'Khớp lệnh 1 phần'
                    )
        END
	ELSE IF ( @soluongMB > 0  AND @soluongkhopALL = 0)
		BEGIN
		 INSERT  INTO LENHDAT
                    ( MACP ,
                      NGAYDAT ,
                      LOAIGD ,
                      LOAILENH ,
                      SOLUONG ,
                      GIADAT ,
                      TRANGTHAILENH
                    )
            VALUES  ( @macp ,
                      @Ngay_Convert ,
                      @LoaiGD ,
                      N'LO' ,
                      @soluongMB ,
                      @giadatMB ,
                      N'Chờ khớp'
                    )
		END
	-- in ra kết quả  số lượng cổ phiếu khớp theo thuật toán khớp lệnh liên tục khi có 1 lệnh mua hoặc bán được gởi đến bảng LENHDAT
   -- PRINT N'Số lương cổ phiếu khớp: ' + CAST(@soluongkhopALL AS NVARCHAR(10))
    CLOSE @CrsrVar
    DEALLOCATE @CrsrVar



GO
/****** Object:  StoredProcedure [dbo].[SP_SET_BGTT]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SET_BGTT]
 @LoaiGD NCHAR(1), 
 @MACP CHAR(10),   
 @NGAYDAT DATETIME ,   
 @GIADAT FLOAT 
AS

-- Xóa table ảo nếu tồn tại
        IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TEMP_BGLD%' )
            DROP TABLE #TEMP_BGLD

	     IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TEMP_BGLB_TOP3%' )
            DROP TABLE #TEMP_BGLB_TOP3

		 IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TEMP_BGLM_TOP3%' )
         DROP TABLE #TEMP_BGLM_TOP3
-- lấy ra danh sách LÊNH ĐẶT cần thao tác bỏ vào tảng tạm #TEMP_BGLD
        SELECT  MACP ,
                GIADAT ,
                Sum(ISNULL(SOLUONG, 0)) AS KL
        INTO    #TEMP_BGLD
        FROM    dbo.LENHDAT
        WHERE   MACP = @MACP
                AND DAY(NGAYDAT) = DAY(@NGAYDAT)
                AND MONTH(NGAYDAT) = MONTH(@NGAYDAT)
                AND YEAR(NGAYDAT) = YEAR(@NGAYDAT)
                AND LOAIGD = @LoaiGD
                AND SOLUONG > 0
        GROUP BY MACP ,  GIADAT
--trường hợp lệnh đặt mua
IF(@LoaiGD ='M')
	BEGIN
		SELECT * INTO #TEMP_BGLM_TOP3
		FROM (SELECT * , ROW_NUMBER() OVER (ORDER BY GIADAT DESC) AS Row_Number
			  FROM #TEMP_BGLD
			 ) TEMP
		WHERE Row_Number <=3
		--trường hợp xóa các record trước khi insert vào BGTT
		UPDATE BANG_GIA_TRUC_TUYEN
		SET DM_GIA3 = 0, DM_GIA2 = 0, DM_GIA1 = 0,
			DM_KL3 = 0, DM_KL1 = 0, DM_KL2 = 0
		WHERE MACP = @MACP

		--Lấy giá trị đầu tiên
		IF EXISTS (SELECT * FROM #TEMP_BGLM_TOP3 WHERE Row_Number = 1)
			BEGIN
				IF EXISTS(SELECT * FROM BANG_GIA_TRUC_TUYEN WHERE MACP=@MACP)
					BEGIN
						UPDATE BANG_GIA_TRUC_TUYEN
						SET DM_GIA1 = (SELECT GIADAT FROM #TEMP_BGLM_TOP3 WHERE Row_Number=1),
							DM_KL1 = (SELECT KL FROM #TEMP_BGLM_TOP3 WHERE Row_Number=1)
						WHERE MACP=@MACP
					END
				ELSE
					BEGIN
						INSERT INTO BANG_GIA_TRUC_TUYEN(MACP,DM_GIA1,DM_KL1)
						SELECT MACP, GIADAT, KL FROM #TEMP_BGLM_TOP3 WHERE Row_Number = 1
					END
			END
		--Lấy giá trị Tthứ 2
		IF EXISTS (SELECT * FROM #TEMP_BGLM_TOP3 WHERE Row_Number = 2)
			BEGIN
				IF EXISTS(SELECT * FROM BANG_GIA_TRUC_TUYEN WHERE MACP=@MACP)
					BEGIN
						UPDATE BANG_GIA_TRUC_TUYEN
						SET DM_GIA2 = (SELECT GIADAT FROM #TEMP_BGLM_TOP3 WHERE Row_Number=2),
							DM_KL2 = (SELECT KL FROM #TEMP_BGLM_TOP3 WHERE Row_Number=2)
						WHERE MACP=@MACP
					END
				ELSE
					BEGIN
						INSERT INTO BANG_GIA_TRUC_TUYEN(MACP,DM_GIA2,DM_KL2)
						SELECT MACP, GIADAT, KL FROM #TEMP_BGLM_TOP3 WHERE Row_Number = 2
					END
			END
		--Lấy giá trị thứ 3
		IF EXISTS (SELECT * FROM #TEMP_BGLM_TOP3 WHERE Row_Number = 3)
			BEGIN
				IF EXISTS(SELECT * FROM BANG_GIA_TRUC_TUYEN WHERE MACP=@MACP)
					BEGIN
						UPDATE BANG_GIA_TRUC_TUYEN
						SET DM_GIA3 = (SELECT GIADAT FROM #TEMP_BGLM_TOP3 WHERE Row_Number=3),
							DM_KL3 = (SELECT KL FROM #TEMP_BGLM_TOP3 WHERE Row_Number=3)
						WHERE MACP=@MACP
					END
				ELSE
					BEGIN
						INSERT INTO BANG_GIA_TRUC_TUYEN(MACP,DM_GIA3,DM_KL3)
						SELECT MACP, GIADAT, KL FROM #TEMP_BGLM_TOP3 WHERE Row_Number = 3
					END
			END
	END
--nếu lệnh đặt bán
ELSE
	BEGIN
		SELECT * INTO #TEMP_BGLB_TOP3
		FROM (SELECT * , ROW_NUMBER() OVER (ORDER BY GIADAT ASC) AS Row_Number
			  FROM #TEMP_BGLD
			 ) TEMP
		WHERE Row_Number <=3
		--trường hợp xóa các record trước khi insert vào BGTT
		UPDATE BANG_GIA_TRUC_TUYEN
		SET DB_GIA3 = 0, DB_GIA2 = 0, DB_GIA1 = 0,
			DB_KL3 = 0, DB_KL1 = 0, DB_KL2 = 0
		WHERE MACP = @MACP

		--Lấy giá trị đầu tiên
		IF EXISTS (SELECT * FROM #TEMP_BGLB_TOP3 WHERE Row_Number = 1)
			BEGIN
				IF EXISTS(SELECT * FROM BANG_GIA_TRUC_TUYEN WHERE MACP=@MACP)
					BEGIN
						UPDATE BANG_GIA_TRUC_TUYEN
						SET DB_GIA1 = (SELECT GIADAT FROM #TEMP_BGLB_TOP3 WHERE Row_Number=1),
							DB_KL1 = (SELECT KL FROM #TEMP_BGLB_TOP3 WHERE Row_Number=1)
						WHERE MACP=@MACP
					END
				ELSE
					BEGIN
						INSERT INTO BANG_GIA_TRUC_TUYEN(MACP,DB_GIA1,DB_KL1)
						SELECT MACP, GIADAT, KL FROM #TEMP_BGLB_TOP3 WHERE Row_Number = 1
					END
			END
		--Lấy giá trị thứ 2
		IF EXISTS (SELECT * FROM #TEMP_BGLB_TOP3 WHERE Row_Number = 2)
			BEGIN
				IF EXISTS(SELECT * FROM BANG_GIA_TRUC_TUYEN WHERE MACP=@MACP)
					BEGIN
						UPDATE BANG_GIA_TRUC_TUYEN
						SET DB_GIA2 = (SELECT GIADAT FROM #TEMP_BGLB_TOP3 WHERE Row_Number=2),
							DB_KL2 = (SELECT KL FROM #TEMP_BGLB_TOP3 WHERE Row_Number=2)
						WHERE MACP=@MACP
					END
				ELSE
					BEGIN
						INSERT INTO BANG_GIA_TRUC_TUYEN(MACP,DB_GIA2,DB_KL2)
						SELECT MACP, GIADAT, KL FROM #TEMP_BGLB_TOP3 WHERE Row_Number = 2
					END
			END
		--Lấy giá trị thứ 3
		IF EXISTS (SELECT * FROM #TEMP_BGLB_TOP3 WHERE Row_Number = 3)
			BEGIN
				IF EXISTS(SELECT * FROM BANG_GIA_TRUC_TUYEN WHERE MACP=@MACP)
					BEGIN
						UPDATE BANG_GIA_TRUC_TUYEN
						SET DB_GIA3 = (SELECT GIADAT FROM #TEMP_BGLB_TOP3 WHERE Row_Number=3),
							DB_KL3 = (SELECT KL FROM #TEMP_BGLB_TOP3 WHERE Row_Number=3)
						WHERE MACP=@MACP
					END
				ELSE
					BEGIN
						INSERT INTO BANG_GIA_TRUC_TUYEN(MACP,DB_GIA3,DB_KL3)
						SELECT MACP, GIADAT, KL FROM #TEMP_BGLB_TOP3 WHERE Row_Number = 3
					END
			END
	END
	-- xóa mã cổ phiếu trong bảng nếu không còn lệnh đặt
	--	  DECLARE @check BIGINT
		  
		--  SELECT    @check = SUM(ISNULL(DM_KL3, 0) +ISNULL(DM_KL2, 0) +    ISNULL(DM_KL1, 0) +  ISNULL(DB_KL1, 0) + ISNULL(DB_KL2, 0)+ ISNULL(DB_KL3, 0))
		--  FROM dbo.BANG_GIA_TRUC_TUYEN
		--  WHERE MACP = @MACP

		--  IF (@check = 0)
		 -- BEGIN
		  	
		--	DELETE FROM dbo.BANG_GIA_TRUC_TUYEN WHERE MACP = @MACP

		 -- END
GO
/****** Object:  Trigger [dbo].[TR_AfterDelete_LENHDAT]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_AfterDelete_LENHDAT] ON [dbo].[LENHDAT]
    AFTER DELETE
AS
BEGIN
		

	 DECLARE @LoaiGD_Deleted NCHAR(1) ,
            @MACP_Deleted CHAR(7) ,
            @NGAYDAT_Deleted DATETIME ,
            @GIADAT_Deleted FLOAT,
			@SoLuong_Deleted INT
	
	DECLARE @CurrentDay DATETIME
	SET @CurrentDay = GETDATE()
	 
		-- gán các giá trị cần thiết...
		SELECT  @LoaiGD_Deleted =  Deleted.LOAIGD,
                @MACP_Deleted = Deleted.MACP ,
                @NGAYDAT_Deleted= Deleted.NGAYDAT,
				@GIADAT_Deleted = Deleted.GIADAT ,
				@SoLuong_Deleted = Deleted.SOLUONG
        FROM   Deleted
		

	IF (  DAY(@CurrentDay)=DAY(@NGAYDAT_Deleted) AND MONTH(@CurrentDay)= MONTH(@NGAYDAT_Deleted) AND YEAR(@CurrentDay)=YEAR(@NGAYDAT_Deleted)  
    AND @SoLuong_Deleted  > 0 )
	BEGIN
		EXEC [dbo].[SP_SET_BGTT] @LoaiGD_Deleted , @MACP_Deleted , 	@NGAYDAT_Deleted,  @GIADAT_Deleted		
	END

  




		
			

  
END 
GO
ALTER TABLE [dbo].[LENHDAT] ENABLE TRIGGER [TR_AfterDelete_LENHDAT]
GO
/****** Object:  Trigger [dbo].[TR_AfterInsert_LENHDAT]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_AfterInsert_LENHDAT] ON [dbo].[LENHDAT]
    AFTER INSERT 
AS
BEGIN
	  DECLARE @LoaiGD_InSerted NCHAR(1) ,
            @MACP_Inserted CHAR(7) ,
            @NGAYDAT_Inserted DATETIME ,
            @GIADAT_Inserted FLOAT

    SELECT  @LoaiGD_InSerted = Inserted.LOAIGD ,
                @MACP_Inserted = Inserted.MACP ,
                @GIADAT_Inserted = Inserted.GIADAT,
				@NGAYDAT_Inserted = Inserted.NGAYDAT
        FROM    Inserted
	  EXEC [dbo].[SP_SET_BGTT] @LoaiGD_InSerted, @MACP_Inserted, @NGAYDAT_Inserted, @GIADAT_Inserted
END 
GO
ALTER TABLE [dbo].[LENHDAT] ENABLE TRIGGER [TR_AfterInsert_LENHDAT]
GO
/****** Object:  Trigger [dbo].[TR_AfterUpdate_LENHDAT]    Script Date: 5/21/2021 7:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_AfterUpdate_LENHDAT] ON [dbo].[LENHDAT]
    AFTER UPDATE 
AS
BEGIN
	 DECLARE @LoaiGD_Updated NCHAR(1) ,
            @MACP_Updated CHAR(7) ,
            @NGAYDAT_Updated DATETIME ,
            @GIADAT_Updated FLOAT
     --Theo dõi việc chịu tác động của cột SOLUONG
	 IF UPDATE(SOLUONG)
	 BEGIN
		-- gán các giá trị cần thiết...
		SELECT  @LoaiGD_Updated =  Inserted.LOAIGD,
                @MACP_Updated = Inserted.MACP ,
                @GIADAT_Updated= Inserted.GIADAT,
				@NGAYDAT_Updated = Inserted.NGAYDAT
        FROM   Inserted
		
		EXEC [dbo].SP_SET_BGTT @LoaiGD_Updated , @MACP_Updated , 	@NGAYDAT_Updated,  @GIADAT_Updated
	END 
END 
GO
ALTER TABLE [dbo].[LENHDAT] ENABLE TRIGGER [TR_AfterUpdate_LENHDAT]
GO
USE [master]
GO
ALTER DATABASE [CHUNGKHOAN] SET  READ_WRITE 
GO
