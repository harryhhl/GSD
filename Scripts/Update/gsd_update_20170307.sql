ALTER TABLE dbo.SO_Plan_2nd ADD
	Seasonal varchar(10) NULL,
	FGGRQty decimal(15, 2) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_Tmp ADD
	Seasonal varchar(10) NULL,
	FGGRQty decimal(15, 2) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_Hist ADD
	Seasonal varchar(10) NULL,
	FGGRQty decimal(15, 2) NULL
GO

--------


/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :Harry Huang    
Date  :14 Mar 2016  
Decription :往So_Plan_2nd_Tmp表中插入记录    
 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

ALTER procedure [dbo].[p_InsertSo_Plan_2nd_Temp]
    @Company_Code varchar(4),
	@Sales_Org varchar(4) ,
	@SO_No varchar(10)  ,
	@SO_ItemNo int  ,
	@SO_Type varchar(4)  ,
	@Country_Origin varchar(3)  ,
	@Factory_Group varchar(4)  ,
    @KnitStruct_MainCode varchar(1),
    @KnitStruct_MainCat varchar(30),
    @KnitStruct_SubCode varchar(3),
    @KnitStruct_SubCat varchar(30),
    @RawMaterial_Info nvarchar(132),
    @FG_LongDesc nvarchar(132),
    @CustomerSeason varchar(10),
    @PNNo varchar(10),
    @Seasonal varchar(10),
    @FGGRQty decimal(15,2)
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into So_Plan_2nd_Tmp(
			Company_Code
           ,Sales_Org
           ,SO_No
           ,SO_ItemNo
           ,SO_Type
           ,Country_Origin
           ,Factory_Group
           ,KnitStruct_MainCode,
    KnitStruct_MainCat,
    KnitStruct_SubCode,
    KnitStruct_SubCat,
    RawMaterial_Info,
    FG_LongDesc,
    CustomerSeason,
    PNNo,
    Seasonal,
    FGGRQty
    )
values(
@Company_Code ,
	@Sales_Org  ,
	@SO_No   ,
	@SO_ItemNo   ,
	@SO_Type   ,
	@Country_Origin ,
	@Factory_Group   ,
    @KnitStruct_MainCode,
    @KnitStruct_MainCat,
    @KnitStruct_SubCode,
    @KnitStruct_SubCat,
    @RawMaterial_Info,
    @FG_LongDesc,
	@CustomerSeason,
	@PNNo,
	@Seasonal,
	@FGGRQty
)

COMMIT TRANSACTION
END

GO
---------




ALTER VIEW [dbo].[V_SO_Plan_SPS]
AS

SELECT a.[Company_Code]
      ,a.[Sales_Org]
      ,a.[SO_No]
      ,a.[SO_ItemNo]
      ,a.[SO_Type]
      ,a.[Country_Origin]
      ,a.[Factory_Group]
      ,a.[Sales_Group]
      ,[Sold_To_Party_Code]
      ,[Sold_To_Party_Name]
      ,[Bland_Name]
      ,[Bland_Code]
      ,[Bill_To_Party_Code]
      ,[Bill_To_Party_Name]
      ,[Payer_Code]
      ,[Payer_Name]
      ,[Ship_to_Party_Code]
      ,[Ship_to_Party_Name]
      ,[Sales_Agent_Code]
      ,[Sales_Agent_Name]
      ,[Product_Div_Code]
      ,[Product_Div_Name]
      ,[Product_Group_Code]
      ,[Product_Group]
      ,[Season]
      ,[Program_Name]
      ,[Machine_Type]
      ,[Guage]
      ,[Market]
      ,[Customer_StyleNo]
      ,[Factory_StyleNo]
      ,[Customer_PONo]
      ,[Quota_Category1]
      ,[Quota_Category2]
      ,[Quota_Category3]
      ,[Order_Qty]
      ,[Sales_Unit]
      ,[Projection_Qty]
      ,[Projection_UOM]
      ,[Req_Del_Date]
      ,[Req_Del_Month]
      ,[Customer_Del_Date]
      ,[Shipping_Type]
      ,[Port_Disc]
      ,[Price_Team]
      ,[Payment_Term]
      ,[Unit_Price]
      ,[Sales_Amount]
      ,[Sales_Amount_HKD]
      ,[Net_Price]
      ,[Net_Amount]
      ,[Currency_Key]
      ,[Net_Amount_HKD]
      ,[GP_Percent]
      ,[GP_Amount_USD]
      ,[Special_Wages]
      ,[CM_Cost_USD]
      ,[SAM_Per_DZ]
      ,[SAM2_Per_DZ]
      ,[SAM3_Per_DZ]
      ,[SAM_Knitting_DZ]
      ,[SAM_FinishStd_DZ]
      ,[SAM_FinishOth_DZ]
      ,[Total_SAH]
      ,[Projection_SAH]
      ,[SO_Status]
      ,[Delivery_Status]
      ,[Component]
      ,[Order_Qty_PCS]
      ,[GP_Amount_HKD]
      ,[Customer_Dept_Name]
      ,[Customer_Dept_Code]
      ,[CM_Cost_HKD]
      ,[DDU_Sales]
      ,[Total_Cost]
      ,[Total_Cost_HKD]
      ,[Fabric_Type]
      ,[Style_Desc]
      ,[Commit_date]
      ,[OrderRemark]
      ,[PD_Process_Code]
      ,[Material]
      ,[Product_Type_Code]
      ,[Product_Type]
      ,[Washing_Type]
      ,[Avg_GarmentWeight]
      ,[Version]
      ,[MachineModel]
      ,[Confirm_Draft_Date]
      ,[USDHKRATE]
      ,[Customer_Program]
      ,[Quota_CO]
      ,[ConfirmDraftSO]
      ,[Factory_Group2]
      ,[CreatedBy]
      ,[Approver]
      ,[LastSOApprovalDate]
      ,[SAMUploadDate]
       ,[KnitStruct_MainCode]
      ,[KnitStruct_MainCat]
      ,[KnitStruct_SubCode]
      ,[KnitStruct_SubCat]
      ,[RawMaterial_Info]
      ,[FG_LongDesc]
      ,[CustomerSeason] 
      ,[Seasonal]
      ,[FGGRQty]
FROM         dbo.SO_Plan a
left join SO_Plan_2nd b on a.Company_Code=b.Company_Code and a.Sales_Org=b.Sales_Org and a.SO_No=b.SO_No and a.SO_ItemNo=b.SO_ItemNo and a.SO_Type=b.SO_Type and a.Country_Origin=b.Country_Origin and a.Factory_Group = b.Factory_Group



GO





