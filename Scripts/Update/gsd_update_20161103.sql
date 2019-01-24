USE [GSDDB]
GO


alter table SO_Plan  ALTER COLUMN Sold_To_Party_Name nvarchar(35) NULL;
alter table SO_Plan_Hist  ALTER COLUMN Sold_To_Party_Name nvarchar(35) NULL;
alter table SO_Plan_Tmp  ALTER COLUMN Sold_To_Party_Name nvarchar(35)NULL;

alter table SO_Plan  ALTER COLUMN Bland_Name nvarchar(35) NULL;
alter table SO_Plan_Hist  ALTER COLUMN Bland_Name nvarchar(35) NULL;
alter table SO_Plan_Tmp  ALTER COLUMN Bland_Name nvarchar(35)NULL;

alter table SO_Plan  ALTER COLUMN Bill_To_Party_Name nvarchar(35) NULL;
alter table SO_Plan_Hist  ALTER COLUMN Bill_To_Party_Name nvarchar(35) NULL;
alter table SO_Plan_Tmp  ALTER COLUMN Bill_To_Party_Name nvarchar(35)NULL;

alter table SO_Plan  ALTER COLUMN Payer_Name nvarchar(35) NULL;
alter table SO_Plan_Hist  ALTER COLUMN Payer_Name nvarchar(35) NULL;
alter table SO_Plan_Tmp  ALTER COLUMN Payer_Name nvarchar(35)NULL;

alter table SO_Plan  ALTER COLUMN Ship_to_Party_Name nvarchar(35) NULL;
alter table SO_Plan_Hist  ALTER COLUMN Ship_to_Party_Name nvarchar(35) NULL;
alter table SO_Plan_Tmp  ALTER COLUMN Ship_to_Party_Name nvarchar(35)NULL;

alter table SO_Plan  ALTER COLUMN Sales_Agent_Name nvarchar(35) NULL;
alter table SO_Plan_Hist  ALTER COLUMN Sales_Agent_Name nvarchar(35) NULL;
alter table SO_Plan_Tmp  ALTER COLUMN Sales_Agent_Name nvarchar(35)NULL;

GO

-----------------------------------------------



/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_Temp]    Script Date: 11/03/2016 16:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :27 Apr 2015  
Decription :往So_Plan_Tmp表中插入记录    
 
	the latest update: 2015-04-27 16:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

ALTER procedure [dbo].[p_InsertSo_Plan_Temp]
    @Company_Code varchar(4),
	@Sales_Org varchar(4) ,
	@SO_No varchar(10)  ,
	@SO_ItemNo int  ,
	@SO_Type varchar(4)  ,
	@Country_Origin varchar(3)  ,
	@Factory_Group varchar(4)  ,
	@Sales_Group varchar(3) ,
	@Sold_To_Party_Code varchar(10) ,
	@Sold_To_Party_Name nvarchar(35) ,
	@Bland_Name nvarchar(35) ,
	@Bland_Code varchar(10) ,
	@Bill_To_Party_Code varchar(10) ,
	@Bill_To_Party_Name nvarchar(35) ,
	@Payer_Code varchar(10) ,
	@Payer_Name nvarchar(35) ,
	@Ship_to_Party_Code varchar(10) ,
	@Ship_to_Party_Name nvarchar(35) ,
	@Sales_Agent_Code varchar(10) ,
	@Sales_Agent_Name nvarchar(35) ,
	@Product_Div_Code varchar(3) ,
	@Product_Div_Name varchar(40) ,
	@Product_Group_Code varchar(3) ,
	@Product_Group varchar(40) ,
	@Season varchar(4) ,
	@Program_Name varchar(12) ,
	@Machine_Type varchar(3) ,
	@Guage varchar(3) ,
	@Market varchar(3) ,
	@Customer_StyleNo varchar(35) ,
	@Factory_StyleNo varchar(20) ,
	@Customer_PONo varchar(35) ,
	@Quota_Category1 varchar(8) ,
	@Quota_Category2 varchar(8) ,
	@Quota_Category3 varchar(8) ,
	@Order_Qty decimal(15, 3) ,
	@Sales_Unit varchar(3) ,
	@Projection_Qty decimal(15, 3) ,
	@Projection_UOM varchar(3) ,
	@Req_Del_Date smalldatetime ,
	@Req_Del_Month varchar(6) ,
	@Customer_Del_Date datetime ,
	@Shipping_Type varchar(2) ,
	@Port_Disc varchar(3) ,
	@Price_Team varchar(3) ,
	@Payment_Term varchar(4) ,
	@Unit_Price decimal(11, 2) ,
	@Sales_Amount decimal(15, 2) ,
	@Sales_Amount_HKD decimal(15, 2) ,
	@Net_Price decimal(15, 2) ,
	@Net_Amount decimal(15, 2) ,
	@Currency_Key varchar(5) ,
	@Net_Amount_HKD varchar(15) ,
	@GP_Percent decimal(9, 3) ,
	@GP_Amount_USD decimal(13, 2) ,
	@Special_Wages decimal(13, 2) ,
	@CM_Cost_USD decimal(13, 2) ,
	@SAM_Per_DZ decimal(10, 2) ,
	@Total_SAH decimal(8, 0) ,
	@Projection_SAH decimal(8, 0) ,
	@SO_Status varchar(30) ,
	@Delivery_Status varchar(30) ,
	@Component int ,
	@Order_Qty_PCS decimal(15, 3) ,
	@GP_Amount_HKD decimal(13, 2) ,
	@Customer_Dept_Name varchar(15) ,
	@Customer_Dept_Code varchar(7) ,
	@CM_Cost_HKD decimal(13, 2) ,
	@DDU_Sales decimal(15, 2) ,
	@Total_Cost decimal(13, 2) ,
	@Total_Cost_HKD decimal(13, 2) ,
	@Fabric_Type varchar(50) ,
	@Commit_date datetime ,
	@OrderRemark varchar(150),
	@SAM2_Per_DZ decimal(10, 2) ,
	@SAM3_Per_DZ decimal(10, 2) ,
	@SAM_Knitting_DZ decimal(10, 2) ,
	@SAM_FinishStd_DZ decimal(10, 2) ,
	@SAM_FinishOth_DZ decimal(10, 2) ,
	@Style_Desc varchar(160),
	@PD_Process_Code varchar(10),
	@Material varchar(100),
	@Product_Type_Code varchar(3) ,
	@Product_Type varchar(50) ,
	@Washing_Type varchar(35) ,
	@Avg_GarmentWeight varchar(8) ,
	@Version varchar(12) ,
	@MachineModel varchar(10) ,
	@Confirm_Draft_Date varchar(10) ,
	@USDHKRATE decimal(15, 2) ,
	@Customer_Program varchar(40) ,
	@Quota_CO varchar(5) ,
	@ConfirmDraftSO varchar(10) ,
	@Factory_Group2 varchar(4) ,
    @CreatedBy varchar(12) ,
	@Approver varchar(12) ,
	@LastSOApprovalDate datetime ,
	@SAMUploadDate varchar(20) 
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into So_Plan_Tmp(
			Company_Code
           ,Sales_Org
           ,SO_No
           ,SO_ItemNo
           ,SO_Type
           ,Country_Origin
           ,Factory_Group
           ,Sales_Group
           ,Sold_To_Party_Code
           ,Sold_To_Party_Name
           ,Bland_Name
           ,Bland_Code
           ,Bill_To_Party_Code
           ,Bill_To_Party_Name
           ,Payer_Code
           ,Payer_Name
           ,Ship_to_Party_Code
           ,Ship_to_Party_Name
           ,Sales_Agent_Code
           ,Sales_Agent_Name
           ,Product_Div_Code
           ,Product_Div_Name
           ,Product_Group_Code
           ,Product_Group
           ,Season
           ,Program_Name
           ,Machine_Type
           ,Guage
           ,Market
           ,Customer_StyleNo
           ,Factory_StyleNo
           ,Customer_PONo
           ,Quota_Category1
           ,Quota_Category2
           ,Quota_Category3
           ,Order_Qty
           ,Sales_Unit
           ,Projection_Qty
           ,Projection_UOM
           ,Req_Del_Date
           ,Req_Del_Month
           ,Customer_Del_Date
           ,Shipping_Type
           ,Port_Disc
           ,Price_Team
           ,Payment_Term
           ,Unit_Price
           ,Sales_Amount
           ,Sales_Amount_HKD
           ,Net_Price
           ,Net_Amount
           ,Currency_Key
           ,Net_Amount_HKD
           ,GP_Percent
           ,GP_Amount_USD
           ,Special_Wages
           ,CM_Cost_USD
           ,SAM_Per_DZ
           ,Total_SAH
           ,Projection_SAH
           ,SO_Status
           ,Delivery_Status
           ,Component
           ,Order_Qty_PCS
           ,GP_Amount_HKD
           ,Customer_Dept_Name
           ,Customer_Dept_Code
           ,CM_Cost_HKD
           ,DDU_Sales
           ,Total_Cost
           ,Total_Cost_HKD
           ,Fabric_Type
           ,Commit_date
           ,OrderRemark
           	,SAM2_Per_DZ
			,SAM3_Per_DZ
			,SAM_Knitting_DZ
			,SAM_FinishStd_DZ
			,SAM_FinishOth_DZ
			,Style_Desc
			,PD_Process_Code
			,Material
	   ,Product_Type_Code
      ,Product_Type
      ,Washing_Type
      ,Avg_GarmentWeight
      ,[Version]
      ,MachineModel
      ,Confirm_Draft_Date
      ,USDHKRATE
      ,Customer_Program
      ,Quota_CO
      ,ConfirmDraftSO
      ,Factory_Group2
      ,CreatedBy
      ,Approver
      ,LastSOApprovalDate
      ,SAMUploadDate)
values(
@Company_Code ,
	@Sales_Org  ,
	@SO_No   ,
	@SO_ItemNo   ,
	@SO_Type   ,
	@Country_Origin ,
	@Factory_Group   ,
	@Sales_Group  ,
	@Sold_To_Party_Code  ,
	@Sold_To_Party_Name  ,
	@Bland_Name  ,
	@Bland_Code  ,
	@Bill_To_Party_Code  ,
	@Bill_To_Party_Name ,
	@Payer_Code ,
	@Payer_Name  ,
	@Ship_to_Party_Code  ,
	@Ship_to_Party_Name  ,
	@Sales_Agent_Code  ,
	@Sales_Agent_Name  ,
	@Product_Div_Code  ,
	@Product_Div_Name  ,
	@Product_Group_Code ,
	@Product_Group  ,
	@Season  ,
	@Program_Name  ,
	@Machine_Type  ,
	@Guage  ,
	@Market  ,
	@Customer_StyleNo  ,
	@Factory_StyleNo  ,
	@Customer_PONo  ,
	@Quota_Category1  ,
	@Quota_Category2  ,
	@Quota_Category3  ,
	@Order_Qty  ,
	@Sales_Unit  ,
	@Projection_Qty  ,
	@Projection_UOM  ,
	@Req_Del_Date  ,
	@Req_Del_Month  ,
	@Customer_Del_Date ,
	@Shipping_Type  ,
	@Port_Disc  ,
	@Price_Team  ,
	@Payment_Term  ,
	@Unit_Price  ,
	@Sales_Amount  ,
	@Sales_Amount_HKD  ,
	@Net_Price  ,
	@Net_Amount  ,
	@Currency_Key  ,
	@Net_Amount_HKD  ,
	@GP_Percent ,
	@GP_Amount_USD  ,
	@Special_Wages  ,
	@CM_Cost_USD  ,
	@SAM_Per_DZ  ,
	@Total_SAH  ,
	@Projection_SAH  ,
	@SO_Status ,
	@Delivery_Status ,
	@Component ,
	@Order_Qty_PCS ,
	@GP_Amount_HKD ,
	@Customer_Dept_Name ,
	@Customer_Dept_Code ,
	@CM_Cost_HKD ,
	@DDU_Sales ,
	@Total_Cost ,
	@Total_Cost_HKD ,
	@Fabric_Type ,
	@Commit_date ,
	@OrderRemark,
	@SAM2_Per_DZ,
	@SAM3_Per_DZ,
	@SAM_Knitting_DZ,
	@SAM_FinishStd_DZ,
	@SAM_FinishOth_DZ,
	@Style_Desc,
	@PD_Process_Code,
	@Material,
	  @Product_Type_Code,
      @Product_Type,
      @Washing_Type,
      @Avg_GarmentWeight,
      @Version,
      @MachineModel,
      @Confirm_Draft_Date,
      @USDHKRATE,
      @Customer_Program,
      @Quota_CO,
      @ConfirmDraftSO,
      @Factory_Group2,
      @CreatedBy,
      @Approver,
      @LastSOApprovalDate,
      @SAMUploadDate

)

COMMIT TRANSACTION
END
