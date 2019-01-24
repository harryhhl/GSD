USE [GSDDB]
GO

/****** Object:  Table [dbo].[ZSD_SPS_FABRIC]    Script Date: 08/08/2018 12:21:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ZSD_SPS_FABRIC](
	[Client] [varchar](3) NOT NULL,
	[Sales_ProjectionNo] [varchar](14) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[Sales_ProjectionItem] [int] NOT NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[PurchaseOrderNumber] [varchar](35) NULL,
	[Mill_Vendor] [varchar](10) NULL,
	[Mill_Name] [varchar](35) NULL,
	[Mill_Description] [varchar](80) NULL,
	[Fabric_Category] [varchar](3) NULL,
	[Body_Ex_Mill_Date] [varchar](80) NULL,
	[Trim_Ex_Mill_Date] [varchar](80) NULL,
	[Print_Vendor] [varchar](10) NULL,
	[Print_FtyName] [varchar](50) NULL,
	[EMB_Vendor] [varchar](10) NULL,
	[EMB_FtyName] [varchar](50) NULL,
	[WashingMethod] [varchar](50) NULL,
	[Special_ACC] [varchar](50) NULL,
	[Body_Confirm] [varchar](1) NULL,
	[Trim_Confirm] [varchar](1) NULL,
	[Remarks] [nvarchar](200) NULL,
	[EntryDatetime] [smalldatetime] NULL,
	[ChangedOn] [smalldatetime] NULL,
	[Download_Flag] [varchar](1) NULL,
	[Heat_transfer_label] [varchar](50) NULL,
	[Fabric_ShipMode_Body] [varchar](50) NULL,
	[Fabric_ShipMode_Trim] [varchar](50) NULL,
	[Req_Del_Date] [smalldatetime] NULL,
	[Order_Quantity] [decimal](15, 3) NULL,
	[Description] [nvarchar](200) NULL,
	[Body_Ex_Mill_Date_End] [varchar](80) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


----------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ZSD_SPS_FABRIC_Hist](
	[Client] [varchar](3) NOT NULL,
	[Sales_ProjectionNo] [varchar](14) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[Sales_ProjectionItem] [int] NOT NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[PurchaseOrderNumber] [varchar](35) NULL,
	[Mill_Vendor] [varchar](10) NULL,
	[Mill_Name] [varchar](35) NULL,
	[Mill_Description] [varchar](80) NULL,
	[Fabric_Category] [varchar](3) NULL,
	[Body_Ex_Mill_Date] [varchar](80) NULL,
	[Trim_Ex_Mill_Date] [varchar](80) NULL,
	[Print_Vendor] [varchar](10) NULL,
	[Print_FtyName] [varchar](50) NULL,
	[EMB_Vendor] [varchar](10) NULL,
	[EMB_FtyName] [varchar](50) NULL,
	[WashingMethod] [varchar](50) NULL,
	[Special_ACC] [varchar](50) NULL,
	[Body_Confirm] [varchar](1) NULL,
	[Trim_Confirm] [varchar](1) NULL,
	[Remarks] [nvarchar](200) NULL,
	[EntryDatetime] [smalldatetime] NULL,
	[ChangedOn] [smalldatetime] NULL,
	[Download_Flag] [varchar](1) NULL,
	[Heat_transfer_label] [varchar](50) NULL,
	[Fabric_ShipMode_Body] [varchar](50) NULL,
	[Fabric_ShipMode_Trim] [varchar](50) NULL,
	[Req_Del_Date] [smalldatetime] NULL,
	[Order_Quantity] [decimal](15, 3) NULL,
	[Description] [nvarchar](200) NULL,
	[Body_Ex_Mill_Date_End] [varchar](80) NULL,
	[History_DateTime] [smalldatetime] NOT NULL
) ON [PRIMARY]


GO

SET ANSI_PADDING OFF
GO
--

/****** Object:  Table [dbo].[ZSD_SPS_FABRIC_tmp]    Script Date: 08/08/2018 12:21:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ZSD_SPS_FABRIC_tmp](
	[Client] [varchar](3) NOT NULL,
	[Sales_ProjectionNo] [varchar](14) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[Sales_ProjectionItem] [int] NOT NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[PurchaseOrderNumber] [varchar](35) NULL,
	[Mill_Vendor] [varchar](10) NULL,
	[Mill_Name] [varchar](35) NULL,
	[Mill_Description] [varchar](80) NULL,
	[Fabric_Category] [varchar](3) NULL,
	[Body_Ex_Mill_Date] [varchar](80) NULL,
	[Trim_Ex_Mill_Date] [varchar](80) NULL,
	[Print_Vendor] [varchar](10) NULL,
	[Print_FtyName] [varchar](50) NULL,
	[EMB_Vendor] [varchar](10) NULL,
	[EMB_FtyName] [varchar](50) NULL,
	[WashingMethod] [varchar](50) NULL,
	[Special_ACC] [varchar](50) NULL,
	[Body_Confirm] [varchar](1) NULL,
	[Trim_Confirm] [varchar](1) NULL,
	[Remarks] [nvarchar](200) NULL,
	[EntryDatetime] [smalldatetime] NULL,
	[ChangedOn] [smalldatetime] NULL,
	[Download_Flag] [varchar](1) NULL,
	[Heat_transfer_label] [varchar](50) NULL,
	[Fabric_ShipMode_Body] [varchar](50) NULL,
	[Fabric_ShipMode_Trim] [varchar](50) NULL,
	[Req_Del_Date] [smalldatetime] NULL,
	[Order_Quantity] [decimal](15, 3) NULL,
	[Description] [nvarchar](200) NULL,
	[Body_Ex_Mill_Date_End] [varchar](80) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--


Create procedure [dbo].[p_Ins_ZSD_SPS_FABRIC_tmp]
	@Client varchar(3),
	@Sales_ProjectionNo varchar(14),
	@SeqNo int,
	@Sales_ProjectionItem int,
	@SO_No varchar(10),
	@SO_ItemNo int,
	@PurchaseOrderNumber varchar(35),
	@Mill_Vendor varchar(10),
	@Mill_Name varchar(35),
	@Mill_Description varchar(80),
	@Fabric_Category varchar(3),
	@Body_Ex_Mill_Date varchar(80),
	@Trim_Ex_Mill_Date varchar(80),
	@Print_Vendor varchar(10),
	@Print_FtyName varchar(50),
	@EMB_Vendor varchar(10),
	@EMB_FtyName varchar(50),
	@WashingMethod varchar(50),
	@Special_ACC varchar(50),
	@Body_Confirm varchar(1),
	@Trim_Confirm varchar(1),
	@Remarks nvarchar(200),
	@EntryDatetime smalldatetime,
	@ChangedOn smalldatetime,
	@Download_Flag varchar(1),
	@Heat_transfer_label varchar(50),
	@Fabric_ShipMode_Body varchar(50),
	@Fabric_ShipMode_Trim varchar(50),
	@Req_Del_Date smalldatetime,
	@Order_Quantity decimal(15, 3),
	@Description nvarchar(200),
	@Body_Ex_Mill_Date_End varchar(80)
    
AS 
BEGIN
set nocount on

Insert into [dbo].[ZSD_SPS_FABRIC_tmp](
       Client
      ,Sales_ProjectionNo
      ,SeqNo
      ,Sales_ProjectionItem
      ,SO_No
      ,SO_ItemNo
      ,PurchaseOrderNumber
      ,Mill_Vendor
      ,Mill_Name
      ,Mill_Description
      ,Fabric_Category
      ,Body_Ex_Mill_Date
      ,Trim_Ex_Mill_Date
      ,Print_Vendor
      ,Print_FtyName
      ,EMB_Vendor
      ,EMB_FtyName
      ,WashingMethod
      ,Special_ACC
      ,Body_Confirm
      ,Trim_Confirm
      ,Remarks
      ,EntryDatetime
      ,ChangedOn
      ,Download_Flag
      ,Heat_transfer_label
      ,Fabric_ShipMode_Body
      ,Fabric_ShipMode_Trim
      ,Req_Del_Date
      ,Order_Quantity
      ,Description
      ,Body_Ex_Mill_Date_End
          )
values(
       @Client
      ,@Sales_ProjectionNo
      ,@SeqNo
      ,@Sales_ProjectionItem
      ,@SO_No
      ,@SO_ItemNo
      ,@PurchaseOrderNumber
      ,@Mill_Vendor
      ,@Mill_Name
      ,@Mill_Description
      ,@Fabric_Category
      ,@Body_Ex_Mill_Date
      ,@Trim_Ex_Mill_Date
      ,@Print_Vendor
      ,@Print_FtyName
      ,@EMB_Vendor
      ,@EMB_FtyName
      ,@WashingMethod
      ,@Special_ACC
      ,@Body_Confirm
      ,@Trim_Confirm
      ,@Remarks
      ,@EntryDatetime
      ,@ChangedOn
      ,@Download_Flag
      ,@Heat_transfer_label
      ,@Fabric_ShipMode_Body
      ,@Fabric_ShipMode_Trim
      ,@Req_Del_Date
      ,@Order_Quantity
      ,@Description
      ,@Body_Ex_Mill_Date_End
)

END 


GO


