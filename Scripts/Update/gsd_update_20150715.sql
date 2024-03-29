/*
   Wednesday, July 15, 201518:30:30
   User: cbif_etl
   Server: hkgsql01
   Database: GSDDB
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.SO_Plan.Product_Type_Code', N'Tmp_Product_Group_Code_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan.Product_Type_Name', N'Tmp_Product_Group_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan.Tmp_Product_Group_Code_1', N'Product_Group_Code', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan.Tmp_Product_Group_2', N'Product_Group', 'COLUMN' 
GO
ALTER TABLE dbo.SO_Plan ADD
	Product_Type_Code varchar(3) NULL,
	Product_Type varchar(50) NULL,
	Washing_Type varchar(35) NULL,
	Avg_GarmentWeight varchar(8) NULL,
	Version varchar(12) NULL,
	MachineModel varchar(10) NULL,
	Confirm_Draft_Date varchar(10) NULL,
	USDHKRATE decimal(15, 2) NULL,
	Customer_Program varchar(40) NULL,
	Quota_CO varchar(5) NULL,
	ConfirmDraftSO varchar(10) NULL,
	Factory_Group2 varchar(4) NULL,
	CreatedBy varchar(12) NULL,
	Approver varchar(12) NULL,
	LastSOApprovalDate datetime NULL,
	SAMUploadDate varchar(20) NULL
GO


EXECUTE sp_rename N'dbo.SO_Plan_Hist.Product_Type_Code', N'Tmp_Product_Group_Code_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist.Product_Type_Name', N'Tmp_Product_Group_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist.Tmp_Product_Group_Code_1', N'Product_Group_Code', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist.Tmp_Product_Group_2', N'Product_Group', 'COLUMN' 
GO
ALTER TABLE dbo.SO_Plan_Hist ADD
	Product_Type_Code varchar(3) NULL,
	Product_Type varchar(50) NULL,
	Washing_Type varchar(35) NULL,
	Avg_GarmentWeight varchar(8) NULL,
	Version varchar(12) NULL,
	MachineModel varchar(10) NULL,
	Confirm_Draft_Date varchar(10) NULL,
	USDHKRATE decimal(15, 2) NULL,
	Customer_Program varchar(40) NULL,
	Quota_CO varchar(5) NULL,
	ConfirmDraftSO varchar(10) NULL,
	Factory_Group2 varchar(4) NULL,
	CreatedBy varchar(12) NULL,
	Approver varchar(12) NULL,
	LastSOApprovalDate datetime NULL,
	SAMUploadDate varchar(20) NULL
GO


EXECUTE sp_rename N'dbo.SO_Plan_Hist.Product_Type_Code', N'Tmp_Product_Group_Code_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist.Product_Type_Name', N'Tmp_Product_Group_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist.Tmp_Product_Group_Code_1', N'Product_Group_Code', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist.Tmp_Product_Group_2', N'Product_Group', 'COLUMN' 
GO
ALTER TABLE dbo.SO_Plan_Hist ADD
	Product_Type_Code varchar(3) NULL,
	Product_Type varchar(50) NULL,
	Washing_Type varchar(35) NULL,
	Avg_GarmentWeight varchar(8) NULL,
	Version varchar(12) NULL,
	MachineModel varchar(10) NULL,
	Confirm_Draft_Date varchar(10) NULL,
	USDHKRATE decimal(15, 2) NULL,
	Customer_Program varchar(40) NULL,
	Quota_CO varchar(5) NULL,
	ConfirmDraftSO varchar(10) NULL,
	Factory_Group2 varchar(4) NULL,
	CreatedBy varchar(12) NULL,
	Approver varchar(12) NULL,
	LastSOApprovalDate datetime NULL,
	SAMUploadDate varchar(20) NULL
GO


EXECUTE sp_rename N'dbo.SO_Plan_Hist_tmp.Product_Type_Code', N'Tmp_Product_Group_Code_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist_tmp.Product_Type_Name', N'Tmp_Product_Group_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist_tmp.Tmp_Product_Group_Code_1', N'Product_Group_Code', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_Hist_tmp.Tmp_Product_Group_2', N'Product_Group', 'COLUMN' 
GO
ALTER TABLE dbo.SO_Plan_Hist_tmp ADD
	Product_Type_Code varchar(3) NULL,
	Product_Type varchar(50) NULL,
	Washing_Type varchar(35) NULL,
	Avg_GarmentWeight varchar(8) NULL,
	Version varchar(12) NULL,
	MachineModel varchar(10) NULL,
	Confirm_Draft_Date varchar(10) NULL,
	USDHKRATE decimal(15, 2) NULL,
	Customer_Program varchar(40) NULL,
	Quota_CO varchar(5) NULL,
	ConfirmDraftSO varchar(10) NULL,
	Factory_Group2 varchar(4) NULL,
	CreatedBy varchar(12) NULL,
	Approver varchar(12) NULL,
	LastSOApprovalDate datetime NULL,
	SAMUploadDate varchar(20) NULL
GO


EXECUTE sp_rename N'dbo.SO_Plan_tmp.Product_Type_Code', N'Tmp_Product_Group_Code_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_tmp.Product_Type_Name', N'Tmp_Product_Group_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_tmp.Tmp_Product_Group_Code_1', N'Product_Group_Code', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SO_Plan_tmp.Tmp_Product_Group_2', N'Product_Group', 'COLUMN' 
GO
ALTER TABLE dbo.SO_Plan_tmp ADD
	Product_Type_Code varchar(3) NULL,
	Product_Type varchar(50) NULL,
	Washing_Type varchar(35) NULL,
	Avg_GarmentWeight varchar(8) NULL,
	Version varchar(12) NULL,
	MachineModel varchar(10) NULL,
	Confirm_Draft_Date varchar(10) NULL,
	USDHKRATE decimal(15, 2) NULL,
	Customer_Program varchar(40) NULL,
	Quota_CO varchar(5) NULL,
	ConfirmDraftSO varchar(10) NULL,
	Factory_Group2 varchar(4) NULL,
	CreatedBy varchar(12) NULL,
	Approver varchar(12) NULL,
	LastSOApprovalDate datetime NULL,
	SAMUploadDate varchar(20) NULL
GO

COMMIT
