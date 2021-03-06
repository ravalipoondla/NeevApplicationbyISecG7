USE [master]
GO
/****** Object:  Database [Neev]    Script Date: 10/30/2015 22:11:24 ******/
CREATE DATABASE [Neev] ON  PRIMARY 
( NAME = N'Neev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Neev.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Neev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Neev_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Neev] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Neev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Neev] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Neev] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Neev] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Neev] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Neev] SET ARITHABORT OFF
GO
ALTER DATABASE [Neev] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Neev] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Neev] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Neev] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Neev] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Neev] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Neev] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Neev] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Neev] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Neev] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Neev] SET  DISABLE_BROKER
GO
ALTER DATABASE [Neev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Neev] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Neev] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Neev] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Neev] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Neev] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Neev] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Neev] SET  READ_WRITE
GO
ALTER DATABASE [Neev] SET RECOVERY FULL
GO
ALTER DATABASE [Neev] SET  MULTI_USER
GO
ALTER DATABASE [Neev] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Neev] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Neev', N'ON'
GO
USE [Neev]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRoles](
	[user_role_id] [int] IDENTITY(1,1) NOT NULL,
	[user_role] [varchar](100) NOT NULL,
	[active_flag] [tinyint] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[product_inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NOT NULL,
	[product_image] [varbinary](max) NULL,
	[total_quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[sold_quantity] [int] NULL,
	[returned_quantity] [int] NULL,
	[creation_dt] [datetime] NOT NULL,
	[change_dt] [datetime] NOT NULL,
	[is_active] [int] NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[product_inventory_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activities](
	[activity_id] [int] NOT NULL,
	[active_flag] [tinyint] NOT NULL,
	[activity_name] [varchar](max) NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RawMaterialInventory]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RawMaterialInventory](
	[raw_material_inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[raw_material_name] [varchar](100) NOT NULL,
	[available_quantity] [int] NULL,
	[threshhold_value] [int] NOT NULL,
	[creation_dt] [datetime] NOT NULL,
	[change_dt] [datetime] NOT NULL,
	[is_active] [int] NULL,
 CONSTRAINT [PK_RawMaterialInventory] PRIMARY KEY CLUSTERED 
(
	[raw_material_inventory_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductInventoryTrans]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventoryTrans](
	[product_inventory_trans_id] [int] IDENTITY(1,1) NOT NULL,
	[product_inventory_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[sold_flag] [tinyint] NULL,
	[returned_flag] [tinyint] NULL,
	[creation_dt] [datetime] NOT NULL,
	[change_dt] [datetime] NOT NULL,
	[unit_price] [float] NULL,
	[is_active] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPasscode]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserPasscode](
	[user_passcode_id] [int] IDENTITY(1,1) NOT NULL,
	[user_role_id] [int] NOT NULL,
	[user_passcode] [varchar](100) NOT NULL,
 CONSTRAINT [PK_UserPasscode] PRIMARY KEY CLUSTERED 
(
	[user_passcode_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserActivities]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivities](
	[user_activity_id] [int] IDENTITY(1,1) NOT NULL,
	[user_role_id] [int] NOT NULL,
	[activity_id] [int] NOT NULL,
 CONSTRAINT [PK_UserActivities] PRIMARY KEY CLUSTERED 
(
	[user_activity_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RawMaterialInventoryTrans]    Script Date: 10/30/2015 22:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawMaterialInventoryTrans](
	[raw_material_inventory_trans_id] [int] IDENTITY(1,1) NOT NULL,
	[raw_material_inventory_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[creation_dt] [datetime] NOT NULL,
	[change_dt] [datetime] NOT NULL,
	[is_active] [int] NULL,
 CONSTRAINT [PK_RawMaterialInventoryTrans] PRIMARY KEY CLUSTERED 
(
	[raw_material_inventory_trans_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductInventory]    Script Date: 10/30/2015 22:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteProductInventory]
(
 @ProductInventoryId int
)  
AS  
BEGIN

Update [ProductInventory] set is_active=0 where product_inventory_id = @ProductInventoryId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRawMaterialInventory]    Script Date: 10/30/2015 22:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteRawMaterialInventory]
(
 @RawMaterialInventoryID int
)  
AS  
BEGIN

Update [RawMaterialInventory] set is_active=0 where raw_material_inventory_id = @RawMaterialInventoryID

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetALLInventories]    Script Date: 10/30/2015 22:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetALLInventories]
AS
BEGIN
--SELECT [product_inventory_id],[product_name] FROM [Neev].[dbo].[ProductInventory]  where is_active = 1
SELECT [product_inventory_id],[product_name], total_quantity - (sold_quantity - returned_quantity) [quantity],creation_dt FROM [Neev].[dbo].[ProductInventory]  where is_active = 1  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserRoles]    Script Date: 10/30/2015 22:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserRoles]
AS
BEGIN
SELECT [user_role_id],[user_role] FROM [Neev].[dbo].[UserRoles] WHERE active_flag=1   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateUser]    Script Date: 10/30/2015 22:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ValidateUser]
(
 @UserRole varchar(max),
 @PassCode varchar(max)
)  
AS  
BEGIN

--declare @InventoryCost float
--declare @SalesCost float
--declare @IntransitCost float
--declare @ReturnedCost float

--select @InventoryCost = sum(price)
--from ProductInventory
--select 

IF EXISTS ( select 1 FROM UserRoles UR INNER JOIN UserPasscode UPC ON UPC.user_role_id = UR.user_role_id where UPC.user_passcode = @PassCode AND UR.user_role = @UserRole)
BEGIN
	SELECT 1
	RETURN
END
ELSE
BEGIN 
	SELECT 0
	RETURN
END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserActivities]    Script Date: 10/30/2015 22:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserActivities]
(
@UserRoleId INT,
@FromDate DateTime,
@ToDate DateTime
)
AS
BEGIN

Declare @totalQty int
Declare @SoldQty int
Declare @ReturnedQty int

Declare @totalPrice decimal
Declare @SoldPrice decimal
Declare @ReturnedPrice decimal

IF(@FromDate IS NOT NULL and @ToDate IS NOT NULL)
BEGIN
	Declare @fromdt date
	Declare @todt date
	set @fromdt = CAST(CONVERT(VARCHAR(30), @FromDate, 101) as date)
	set @todt = CAST(CONVERT(VARCHAR(30), @ToDate, 101) as date)
	
	Select @totalQty = sum(PIT.quantity),@totalPrice = sum(PIT.quantity*PIT.unit_price)
	from ProductInventory PII
	Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
	where sold_flag = 0 and returned_flag=0 and ((CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))

	Select @SoldQty = sum(PIT.quantity),@SoldPrice = sum(PIT.quantity*PIT.unit_price)
	from ProductInventory PII
	Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
	where sold_flag = 1 and ((CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))

	Select @ReturnedQty = sum(PIT.quantity),@ReturnedPrice = sum(PIT.quantity*PIT.unit_price)
	from ProductInventory PII
	Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
	where returned_flag = 1 and ((CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
END
ELSE 
	BEGIN 
		Select @totalQty = sum(PIT.quantity),@totalPrice = sum(PIT.quantity*PIT.unit_price)
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where sold_flag = 0 and returned_flag=0

		Select @SoldQty = sum(PIT.quantity),@SoldPrice = sum(PIT.quantity*PIT.unit_price)
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where sold_flag = 1 

		Select @ReturnedQty = sum(PIT.quantity),@ReturnedPrice = sum(PIT.quantity*PIT.unit_price)
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where returned_flag = 1 
	END
	

SET @totalPrice = @totalPrice - @SoldPrice + @ReturnedPrice
SET @totalQty = @totalQty - @SoldQty + @ReturnedQty


SELECT 1 as activity_id,@totalQty as quantity, @totalPrice price into #TempData

Insert into #TempData values (2,@SoldQty,@SoldPrice)

Insert into #TempData values (3,0,0.0)

Insert into #TempData values (4,0,0.0)

Insert into #TempData values (5,@ReturnedQty,@ReturnedPrice)

SELECT ua.activity_id, a.activity_name ,ISNULL(TD.quantity,0) as quantity, Round(ISNULL(TD.price,0.0),2) as price --  0  as quantity, 0.0 as price -- 
FROM [Neev].[dbo].[UserActivities] UA 
INNER JOIN [Neev].[dbo].[Activities] A on ua.activity_id = a.activity_id
LEFT JOIN #TempData TD on TD.activity_id = UA.activity_id
WHERE user_role_id = @UserRoleId and A.active_flag=1

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetInventoryData]    Script Date: 10/30/2015 22:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetInventoryData]
(
@FromDate DateTime,
@ToDate DateTime
)
AS
BEGIN

declare @TotalInventoryQty float
declare @customDate int
set @customDate = 0

Declare @fromdt date
Declare @todt date
	
	
IF(@FromDate IS NOT NULL and @ToDate IS NOT NULL)
BEGIN
	
		set @fromdt = CAST(CONVERT(VARCHAR(30), @FromDate, 101) as date)
		set @todt = CAST(CONVERT(VARCHAR(30), @ToDate, 101) as date)
	
		set @customDate = 1
		
		
END

		
		Select PII.Product_inventory_id, sum(PIT.quantity) as SoldQty, sum(PIT.quantity*PIT.unit_price) as SoldPrice INTO #TempSoldInventory
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where sold_flag = 1 and (@customDate=0 OR (CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
		group by PII.product_inventory_id
		
		
		
		Select PII.Product_inventory_id, sum(PIT.quantity) as ReturnedQty , sum(PIT.quantity*PIT.unit_price) as ReturnedPrice INTO #TempReturnedInventory
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where returned_flag = 1 and (@customDate=0 OR (CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
		group by PII.product_inventory_id
		
		
		
		Select PI.product_inventory_id, sum(PIT.quantity) as quantity, sum(PIT.quantity*PIT.unit_price) as price INTO #TempInventory
		from ProductInventory PI
		Inner join ProductInventoryTrans PIT  on pi.product_inventory_id = pit.product_inventory_id
		where sold_flag = 0 and returned_flag=0 and (@customDate=0 OR (CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
		group by PI.product_inventory_id
		
		
		
		SELECT @TotalInventoryQty = SUM(quantity) - SUM(TSI.SoldQty) + SUM(TRI.returnedQty)
		from #TempInventory TI
		LEFT JOIN #TempSoldInventory TSI on TSI.product_inventory_id = TI.Product_inventory_id
		LEFT JOIN #TempReturnedInventory TRI on TRI.product_inventory_id = TI.Product_inventory_id
		
		
		
		Select PI.product_inventory_id, product_name, --PI.total_quantity as quantity,PI.price as price,PI.price as percentage
		(ISNULL(TI.quantity,0) - ISNULL(TSI.SOldQty,0) + ISNULL( TRI.ReturnedQty,0)) as quantity,
		Round(( ISNULL(TI.price,0.0) - ISNULL( TSI.SoldPrice,0) + ISNULL( TRI.ReturnedPrice,0)),2) as price,
		CASE WHEN @TotalInventoryQty!=0 THEN ROUND((((ISNULL(TI.quantity,0) - ISNULL(TSI.SOldQty,0) + ISNULL( TRI.ReturnedQty,0))/@TotalInventoryQty) * 100),2) ELSE 0 END as percentage
		from ProductInventory PI
		LEFT JOIN #TempInventory TI on TI.product_inventory_id = PI.Product_inventory_id
		LEFT JOIN #TempSoldInventory TSI on TSI.product_inventory_id = PI.Product_inventory_id
		LEFT JOIN #TempReturnedInventory TRI on TRI.product_inventory_id = PI.Product_inventory_id
		
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetExportData]    Script Date: 10/30/2015 22:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetExportData]
(
@ActivityId int,
@FromDate DateTime,
@ToDate DateTime
)
AS
BEGIN

declare @TotalInventoryQty float
declare @TotalSoldQty float
declare @TotalReturnedQty float

declare @customDate int
set @customDate = 0

Declare @fromdt date
Declare @todt date
	
	
IF(@FromDate IS NOT NULL and @ToDate IS NOT NULL)
BEGIN
	
		set @fromdt = CAST(CONVERT(VARCHAR(30), @FromDate, 101) as date)
		set @todt = CAST(CONVERT(VARCHAR(30), @ToDate, 101) as date)
	
		set @customDate = 1
		
		
END
ELSE
BEGIN
		set @fromdt = CAST(CONVERT(VARCHAR(30), GETDATE(), 101) as date)
		set @todt = CAST(CONVERT(VARCHAR(30), GETDATE(), 101) as date)
	
		set @customDate = 1
		
END
		
		Select PII.Product_inventory_id, sum(PIT.quantity) as SoldQty, sum(PIT.quantity*PIT.unit_price) as SoldPrice INTO #TempSoldInventory
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where sold_flag = 1 and (@customDate=0 OR (CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
		group by PII.product_inventory_id
		
		
		
		Select PII.Product_inventory_id, sum(PIT.quantity) as ReturnedQty , sum(PIT.quantity*PIT.unit_price) as ReturnedPrice INTO #TempReturnedInventory
		from ProductInventory PII
		Inner join ProductInventoryTrans PIT  on pii.product_inventory_id = pit.product_inventory_id
		where returned_flag = 1 and (@customDate=0 OR (CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
		group by PII.product_inventory_id
		
		
		
		Select PI.product_inventory_id, sum(PIT.quantity) as quantity, sum(PIT.quantity*PIT.unit_price) as price INTO #TempInventory
		from ProductInventory PI
		Inner join ProductInventoryTrans PIT  on pi.product_inventory_id = pit.product_inventory_id
		where sold_flag = 0 and returned_flag=0 and (@customDate=0 OR (CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date) >=@fromdt and CAST(CONVERT(VARCHAR(30), PIT.creation_dt, 101)as date)<=@todt))
		group by PI.product_inventory_id
		
	
		SELECT @TotalInventoryQty = SUM(quantity) - SUM(TSI.SoldQty) + SUM(TRI.returnedQty)
		from #TempInventory TI
		LEFT JOIN #TempSoldInventory TSI on TSI.product_inventory_id = TI.Product_inventory_id
		LEFT JOIN #TempReturnedInventory TRI on TRI.product_inventory_id = TI.Product_inventory_id
		
		SELECT @TotalSoldQty = SUM(TSI.SoldQty) FROM #TempSoldInventory TSI
		
		SELECT @TotalReturnedQty = SUM(TRI.ReturnedQty) FROM #TempReturnedInventory TRI
		
		IF(@ActivityId =1)
		BEGIN
			Select PI.product_inventory_id, product_name, --PI.total_quantity as quantity,PI.price as price,PI.price as percentage
			(ISNULL(TI.quantity,0) - ISNULL(TSI.SOldQty,0) + ISNULL( TRI.ReturnedQty,0)) as quantity,
			Round(( ISNULL(TI.price,0.0) - ISNULL( TSI.SoldPrice,0) + ISNULL( TRI.ReturnedPrice,0)),2) as price,
			CASE WHEN @TotalInventoryQty!=0 THEN ROUND((((ISNULL(TI.quantity,0) - ISNULL(TSI.SOldQty,0) + ISNULL( TRI.ReturnedQty,0))/@TotalInventoryQty) * 100),2) ELSE 0 END as percentage
			from ProductInventory PI
			LEFT JOIN #TempInventory TI on TI.product_inventory_id = PI.Product_inventory_id
			LEFT JOIN #TempSoldInventory TSI on TSI.product_inventory_id = PI.Product_inventory_id
			LEFT JOIN #TempReturnedInventory TRI on TRI.product_inventory_id = PI.Product_inventory_id
		END
		ELSE IF(@ActivityId = 2)
		BEGIN
			Select PI.product_inventory_id, product_name, -- 100 as quantity,PI.price as price,PI.price as percentage
			ISNULL(TSI.SOldQty,0) as quantity,
			Round(ISNULL( TSI.SoldPrice,0),2) as price,
			CASE WHEN @TotalSoldQty!=0 THEN ROUND(((ISNULL(TSI.SOldQty,0)/@TotalSoldQty) * 100),2) ELSE 0 END as percentage
			from ProductInventory PI 
			LEFT JOIN #TempSoldInventory TSI on TSI.product_inventory_id = PI.Product_inventory_id
		END
		ELSE IF(@ActivityId = 3)
		BEGIN
			Select PI.product_inventory_id, product_name, -- 100 as quantity,PI.price as price,PI.price as percentage
			ISNULL(TRI.ReturnedQty,0) as quantity,
			Round(ISNULL( TRI.ReturnedPrice,0),2) as price,
			CASE WHEN @TotalReturnedQty!=0 THEN ROUND(((ISNULL(TRI.ReturnedQty,0)/@TotalReturnedQty) * 100),2) ELSE 0 END as percentage
			from ProductInventory PI 
			LEFT JOIN #TempReturnedInventory TRI on TRI.product_inventory_id = PI.Product_inventory_id
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetALLRawMaterialInventoryItems]    Script Date: 10/30/2015 22:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetALLRawMaterialInventoryItems]
AS
BEGIN
SELECT RIT.[raw_material_inventory_trans_id],RI.[raw_material_name],RIT.quantity, (RIT.quantity * RIT.price) as price,RIT.creation_dt FROM [Neev].[dbo].[RawMaterialInventoryTrans] as RIT
inner join [Neev].[dbo].[RawMaterialInventory] as RI on RI.raw_material_inventory_id = RIT.raw_material_inventory_id
where RI.is_active = 1 and RIT.is_active = 1
order by RIT.creation_dt desc

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetALLRawMaterialInventories]    Script Date: 10/30/2015 22:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetALLRawMaterialInventories]
AS
BEGIN

SELECT RMIT.[raw_material_inventory_id] raw_material_inventory_id,sum(RMIT.price) price INTO #TempRawMaterial
FROM [Neev].[dbo].[RawMaterialInventoryTrans] RMIT
where RMIT.is_Active=1
group by RMIT.raw_material_inventory_id,RMIT.price


SELECT RMI.[raw_material_inventory_id],RMI.[raw_material_name],RMI.[available_quantity],RMI.[threshhold_value],RMI.creation_dt, ISNULL(TM.price,0) as price
FROM [Neev].[dbo].[RawMaterialInventory] as RMI
left JOIN #TempRawMaterial TM on TM.raw_material_inventory_id = RMI.raw_material_inventory_id
where RMI.is_active = 1 


END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetALLInventoryItems]    Script Date: 10/30/2015 22:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetALLInventoryItems]
AS
BEGIN
SELECT PIT.[product_inventory_trans_id],PI.[product_name],PIT.quantity, (PIT.quantity * PIT.unit_price) as price,PIT.creation_dt FROM [Neev].[dbo].[ProductInventoryTrans] as PIT
inner join [Neev].[dbo].[ProductInventory] as PI on PI.product_inventory_id = PIT.product_inventory_id
where PI.is_active = 1 and PIT.is_active = 1
order by PIT.creation_dt desc

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRawMaterialInventoryItem]    Script Date: 10/30/2015 22:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteRawMaterialInventoryItem]
(
 @RawMaterialInventoryTransId int
)  
AS  
BEGIN

Declare @quantity INT

Declare @RawMaterialInventoryID INT

SELECT @RawMaterialInventoryID = raw_material_inventory_id, @quantity =  quantity  from [RawMaterialInventoryTrans] where raw_material_inventory_trans_id = @RawMaterialInventoryTransId

UPDATE [RawMaterialInventory] SET available_quantity = available_quantity - @quantity  where raw_material_inventory_id = @RawMaterialInventoryID

Update [RawMaterialInventoryTrans] set is_active=0 where raw_material_inventory_trans_id = @RawMaterialInventoryTransId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductInventoryItem]    Script Date: 10/30/2015 22:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteProductInventoryItem]
(
 @ProductInventoryTransId int
)  
AS  
BEGIN

Declare @quantity INT
Declare @Price FLOAT
Declare @ProductInventoryID INT

SELECT @ProductInventoryID = product_inventory_id, @quantity =  quantity , @Price = (quantity * unit_price) from ProductInventoryTrans where product_inventory_trans_id = @ProductInventoryTransId

UPDATE [ProductInventory] SET total_quantity = total_quantity - @quantity , price = price - @Price where product_inventory_id = @ProductInventoryID

Update [ProductInventoryTrans] set is_active=0 where product_inventory_trans_id = @ProductInventoryTransId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddRawMaterialInventoryItem]    Script Date: 10/30/2015 22:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddRawMaterialInventoryItem]
(
@RawMaterialInventoryID INT,
@RawMaterialInventoryName varchar(max),
@NoOfUnits INT,
@UnitPrice FLOAT,
@Threshold INT
)

AS
BEGIN

IF(@NoOfUnits <> 0 OR @UnitPrice <> 0)
BEGIN

BEGIN TRAN
declare @TotalPrice float
set @TotalPrice =  @NoOfUnits * @UnitPrice

INSERT INTO [RawMaterialInventoryTrans]([raw_material_inventory_id],[quantity],[price], [creation_dt],[change_dt])
VALUES(@RawMaterialInventoryID,@NoOfUnits,@NoOfUnits*@UnitPrice,GETDATE(),GETDATE())


IF EXISTS ( SELECT 1 FROM [RawMaterialInventory] where raw_material_inventory_id = @RawMaterialInventoryID)
BEGIN
UPDATE [RawMaterialInventory] SET available_quantity = available_quantity + @NoOfUnits,threshhold_value=@Threshold where raw_material_inventory_id = @RawMaterialInventoryID
END

IF @@ERROR <> 0 
		BEGIN
			GOTO on_error
		END
	SET NOCOUNT OFF
COMMIT TRAN
	RETURN 1;
on_error:
	ROLLBACK TRAN
	RETURN 0;
END
ELSE
BEGIN
	INSERT INTO [RawMaterialInventory](raw_material_name,available_quantity,threshhold_value,creation_dt,change_dt,is_active)
	VALUES(@RawMaterialInventoryName,0,@Threshold,GETDATE(),GETDATE(),1)
END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddRawMaterialInventory]    Script Date: 10/30/2015 22:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddRawMaterialInventory]  
(  
 @RawMaterialName varchar(max),
 @Qty INT,
 @threshholdVal INT,
 @Price FLOAT
 )
 
 AS 
 BEGIN
 BEGIN TRAN 
 
 declare @RawMaterialInvId INT
 declare @existingQty INT

 --set @RawMaterialName = 'Fevicol11'
 --SET @Qty = 5
 --SET @threshholdVal = 1000
 --SET @Price = 10
 
 
 IF EXISTS ( SELECT 1 FROM [RawMaterialInventory] where raw_material_name = @RawMaterialName)  
 BEGIN 
 SELECT @existingQty = [available_quantity] , @RawMaterialInvId = raw_material_inventory_id
 FROM [RawMaterialInventory] where raw_material_name = @RawMaterialName
 SET @existingQty = @existingQty + @Qty
 
 INSERT INTO [RawMaterialInventoryTrans]([raw_material_inventory_id],[quantity],[price], [creation_dt],[change_dt])
 VALUES(@RawMaterialInvId,@Qty,@Price,GETDATE(),GETDATE()) 
 
 UPDATE  [RawMaterialInventory] 
 SET [available_quantity] = @existingQty
 WHERE raw_material_inventory_id = @RawMaterialInvId
 END 
 ELSE
 BEGIN
 
 INSERT INTO [RawMaterialInventory]([raw_material_name],[available_quantity],[threshhold_value], [creation_dt],[change_dt],[is_active])
 VALUES(@RawMaterialName,@Qty,@threshholdVal,GETDATE(),GETDATE(),1)  
 
 SET @RawMaterialInvId = @@IDENTITY
 
 INSERT INTO [RawMaterialInventoryTrans]([raw_material_inventory_id],[quantity],[price], [creation_dt],[change_dt])
 VALUES(@RawMaterialInvId,@Qty,@Price,GETDATE(),GETDATE()) 
  
 END
 
 IF @@ERROR <> 0   
  BEGIN  
   GOTO on_error  
  END  
 SET NOCOUNT OFF  
COMMIT TRAN  
 RETURN 1;  
on_error:  
 ROLLBACK TRAN  
 RETURN 0;  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddProductInventoryItem]    Script Date: 10/30/2015 22:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddProductInventoryItem]
(
@ProductInventoryID INT,
@ProductInventoryName varchar(max),
@NoOfUnits INT,
@UnitPrice FLOAT,
@SoldFlag INT,
@ReturnedFlag INT
)

AS
BEGIN

IF(@NoOfUnits <> 0 OR @UnitPrice <> 0)
BEGIN

BEGIN TRAN
declare @TotalPrice float
set @TotalPrice =  @NoOfUnits * @UnitPrice

INSERT INTO [ProductInventoryTrans]([product_inventory_id],[quantity],[unit_price], [sold_flag],[returned_flag],[creation_dt],[change_dt],[is_active])
VALUES(@ProductInventoryID,@NoOfUnits,@UnitPrice,@SoldFlag,@ReturnedFlag,GETDATE(),GETDATE(),1)

IF(@SoldFlag = 0 AND @ReturnedFlag = 0)
BEGIN
	IF EXISTS ( SELECT 1 FROM [ProductInventory] where product_inventory_id = @ProductInventoryID)
	BEGIN
	UPDATE [ProductInventory] SET total_quantity = total_quantity + @NoOfUnits , price = price + @TotalPrice where product_inventory_id = @ProductInventoryID
	END
END
ELSE IF(@SoldFlag <> 0)
BEGIN
	IF EXISTS ( SELECT 1 FROM [ProductInventory] where product_inventory_id = @ProductInventoryID)
	BEGIN
	UPDATE [ProductInventory] SET  sold_quantity = sold_quantity + @NoOfUnits where product_inventory_id = @ProductInventoryID
	END
END
ELSE IF(@ReturnedFlag <> 0)
BEGIN
	IF EXISTS ( SELECT 1 FROM [ProductInventory] where product_inventory_id = @ProductInventoryID)
	BEGIN
	UPDATE [ProductInventory] SET  returned_quantity = returned_quantity + @NoOfUnits where product_inventory_id = @ProductInventoryID
	END
END

IF @@ERROR <> 0 
		BEGIN
			GOTO on_error
		END
	SET NOCOUNT OFF
COMMIT TRAN
	RETURN 1;
on_error:
	ROLLBACK TRAN
	RETURN 0;
END
ELSE
BEGIN
	INSERT INTO [ProductInventory](product_name,product_image,total_quantity,price,sold_quantity,returned_quantity,creation_dt,change_dt,is_active)
	VALUES(@ProductInventoryName,NULL,0,0,0,0,GETDATE(),GETDATE(),1)
END

END
GO
/****** Object:  ForeignKey [FK_ProductInventoryTrans_ProductInventory]    Script Date: 10/30/2015 22:11:32 ******/
ALTER TABLE [dbo].[ProductInventoryTrans]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventoryTrans_ProductInventory] FOREIGN KEY([product_inventory_id])
REFERENCES [dbo].[ProductInventory] ([product_inventory_id])
GO
ALTER TABLE [dbo].[ProductInventoryTrans] CHECK CONSTRAINT [FK_ProductInventoryTrans_ProductInventory]
GO
/****** Object:  ForeignKey [FK_UserPasscode_UserRoles]    Script Date: 10/30/2015 22:11:32 ******/
ALTER TABLE [dbo].[UserPasscode]  WITH CHECK ADD  CONSTRAINT [FK_UserPasscode_UserRoles] FOREIGN KEY([user_role_id])
REFERENCES [dbo].[UserRoles] ([user_role_id])
GO
ALTER TABLE [dbo].[UserPasscode] CHECK CONSTRAINT [FK_UserPasscode_UserRoles]
GO
/****** Object:  ForeignKey [FK_UserActivities_Activities]    Script Date: 10/30/2015 22:11:32 ******/
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_Activities] FOREIGN KEY([activity_id])
REFERENCES [dbo].[Activities] ([activity_id])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_Activities]
GO
/****** Object:  ForeignKey [FK_UserActivities_UserRoles]    Script Date: 10/30/2015 22:11:32 ******/
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_UserRoles] FOREIGN KEY([user_role_id])
REFERENCES [dbo].[UserRoles] ([user_role_id])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_UserRoles]
GO
/****** Object:  ForeignKey [FK_RawMaterialInventoryTrans_RawMaterialInventory]    Script Date: 10/30/2015 22:11:32 ******/
ALTER TABLE [dbo].[RawMaterialInventoryTrans]  WITH CHECK ADD  CONSTRAINT [FK_RawMaterialInventoryTrans_RawMaterialInventory] FOREIGN KEY([raw_material_inventory_id])
REFERENCES [dbo].[RawMaterialInventory] ([raw_material_inventory_id])
GO
ALTER TABLE [dbo].[RawMaterialInventoryTrans] CHECK CONSTRAINT [FK_RawMaterialInventoryTrans_RawMaterialInventory]
GO
