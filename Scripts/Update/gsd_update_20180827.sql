Alter table ZSD_SPS_FABRIC_tmp Alter Column Mill_Name nvarchar(35) NULL
Alter table ZSD_SPS_FABRIC_tmp Alter Column Mill_Description nvarchar(80) NULL
Alter table ZSD_SPS_FABRIC_tmp Alter Column Print_FtyName nvarchar(50) NULL
Alter table ZSD_SPS_FABRIC_tmp Alter Column EMB_FtyName nvarchar(50) NULL

Alter table ZSD_SPS_FABRIC_Hist Alter Column Mill_Name nvarchar(35) NULL
Alter table ZSD_SPS_FABRIC_Hist Alter Column Mill_Description nvarchar(80) NULL
Alter table ZSD_SPS_FABRIC_Hist Alter Column Print_FtyName nvarchar(50) NULL
Alter table ZSD_SPS_FABRIC_Hist Alter Column EMB_FtyName nvarchar(50) NULL

Alter table ZSD_SPS_FABRIC Alter Column Mill_Name nvarchar(35) NULL
Alter table ZSD_SPS_FABRIC Alter Column Mill_Description nvarchar(80) NULL
Alter table ZSD_SPS_FABRIC Alter Column Print_FtyName nvarchar(50) NULL
Alter table ZSD_SPS_FABRIC Alter Column EMB_FtyName nvarchar(50) NULL

GO

----
USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_Ins_ZSD_SPS_FABRIC_tmp]    Script Date: 08/27/2018 18:08:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[p_Ins_ZSD_SPS_FABRIC_tmp]
	@Client varchar(3),
	@Sales_ProjectionNo varchar(14),
	@SeqNo int,
	@Sales_ProjectionItem int,
	@SO_No varchar(10),
	@SO_ItemNo int,
	@PurchaseOrderNumber varchar(35),
	@Mill_Vendor varchar(10),
	@Mill_Name nvarchar(35),
	@Mill_Description nvarchar(80),
	@Fabric_Category varchar(3),
	@Body_Ex_Mill_Date varchar(80),
	@Trim_Ex_Mill_Date varchar(80),
	@Print_Vendor varchar(10),
	@Print_FtyName nvarchar(50),
	@EMB_Vendor varchar(10),
	@EMB_FtyName nvarchar(50),
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