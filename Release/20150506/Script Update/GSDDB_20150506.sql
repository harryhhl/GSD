--如果不存在表Customer_Mapping_Hist 就创建该表

IF object_id(N'Customer_Mapping_Hist') is null 
BEGIN
	PRINT 'create table Customer_Mapping_Hist'
	CREATE TABLE [dbo].[Customer_Mapping_Hist](
		[comp_code] [varchar](3) NOT NULL,
		[Customer_code] [varchar](10) NOT NULL,
		[Customer_name] [nvarchar](50) NULL,
		[Short_Code] [varchar](3) NULL,
		[Brand_code] [varchar](50) NOT NULL,
	 CONSTRAINT [PK_Customer_Mapping_Hist] PRIMARY KEY CLUSTERED 
	(
		[comp_code] ASC,
		[Customer_code] ASC,
		[Brand_code] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END 
ELSE
	PRINT 'table Customer_Mapping_Hist is exists!'
GO

--创建存储过程 p_InsertSo_Plan_Temp
PRINT 'Create p_InsertSo_Plan_Temp'
IF Object_ID('p_InsertSo_Plan_Temp') IS NOT NULL	
	DROP PROC p_InsertSo_Plan_Temp
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :27 Apr 2015  
Decription :往So_Plan_Tmp表中插入记录    
 
	the latest update: 2015-04-27 16:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

create procedure [dbo].[p_InsertSo_Plan_Temp]
    @Company_Code varchar(4),
	@Sales_Org varchar(4) ,
	@SO_No varchar(10)  ,
	@SO_ItemNo int  ,
	@SO_Type varchar(4)  ,
	@Country_Origin varchar(3)  ,
	@Factory_Group varchar(4)  ,
	@Sales_Group varchar(3) ,
	@Sold_To_Party_Code varchar(10) ,
	@Sold_To_Party_Name varchar(35) ,
	@Bland_Name varchar(35) ,
	@Bland_Code varchar(10) ,
	@Bill_To_Party_Code varchar(10) ,
	@Bill_To_Party_Name varchar(35) ,
	@Payer_Code varchar(10) ,
	@Payer_Name varchar(35) ,
	@Ship_to_Party_Code varchar(10) ,
	@Ship_to_Party_Name varchar(35) ,
	@Sales_Agent_Code varchar(10) ,
	@Sales_Agent_Name varchar(35) ,
	@Product_Div_Code varchar(3) ,
	@Product_Div_Name varchar(40) ,
	@Product_Type_Code varchar(3) ,
	@Product_Type_Name varchar(40) ,
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
	@Customer_Dept_Code varchar(3) ,
	@CM_Cost_HKD decimal(13, 2) ,
	@DDU_Sales decimal(15, 2) ,
	@Total_Cost decimal(13, 2) ,
	@Total_Cost_HKD decimal(13, 2) ,
	@Fabric_Type varchar(50) ,
	@Commit_date datetime ,
	@OrderRemark varchar(150)
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
           ,Product_Type_Code
           ,Product_Type_Name
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
           ,OrderRemark)
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
	@Product_Type_Code ,
	@Product_Type_Name  ,
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
	@OrderRemark
)
END
GO

--创建存储过程 p_Ins_Customer_Mapping_Tmp
PRINT 'Create p_Ins_Customer_Mapping_Tmp'
IF Object_ID('p_Ins_Customer_Mapping_Tmp') IS NOT NULL	
	DROP PROC p_Ins_Customer_Mapping_Tmp
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :05 May 2015  
Decription :往SD_Act_Sales表中插入记录    
 
	the latest update: 2015-05-05 10:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

create procedure [dbo].[p_Ins_Customer_Mapping_Tmp]
	@comp_code varchar(3),
	@Customer_code varchar(10),
	@Customer_name nvarchar(50),
	@Short_Code varchar(3),
	@Brand_code varchar(50)
    
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into [dbo].[Customer_Mapping_Tmp](
			comp_code,
			Customer_code,
			Customer_name,
			Short_Code,
			Brand_code
          )
values(
	@comp_code,
	@Customer_code,
	@Customer_name,
	@Short_Code,
	@Brand_code
)
END 
GO

--创建存储过程 p_Ins_SD_Act_Sales
PRINT 'Create Procedure p_Ins_SD_Act_Sales'
IF Object_ID('p_Ins_SD_Act_Sales') IS NOT NULL
	DROP PROC p_Ins_SD_Act_Sales
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :04 May 2015  
Decription :往SD_Act_Sales表中插入记录    
 
	the latest update: 2015-05-04 16:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

CREATE procedure [dbo].[p_Ins_SD_Act_Sales]
	@Company varchar(4),
	@SO_NO varchar(10),
	@Act_Year int,
	@Act_Month int,
	@Qty numeric(18, 3),
	@Sales_Amt numeric(18, 2),
	@TTL_Cost numeric(18, 2),
	@GP_Amt numeric(18, 2)
    
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into [dbo].[SD_Act_Sales_Tmp](
			Company,
			SO_NO,
			Act_Year,
			Act_Month,
			Qty,
			Sales_Amt,
			TTL_Cost,
			GP_Amt
          )
values(
	@Company,
	@SO_NO,
	@Act_Year,
	@Act_Month,
	@Qty,
	@Sales_Amt,
	@TTL_Cost,
	@GP_Amt
)
END 
GO

--创建存储过程 p_Ins_SD_Precost_Tmp
PRINT 'Create Procedure p_Ins_SD_Precost_Tmp'
IF Object_ID('p_Ins_SD_Precost_Tmp') IS NOT NULL
	DROP PROC p_Ins_SD_Precost_Tmp
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :05 May 2015  
Decription :往SD_Precost_Tmp表中插入记录    
 
	the latest update: 2015-05-05 11:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

CREATE procedure [dbo].[p_Ins_SD_Precost_Tmp]
	@CO_Code varchar(4),
	@SO_NO varchar(10),
	@Quotation_No varchar(12),
	@Qty numeric(18, 3),
	@UOM varchar(3),
	@Unit_Price numeric(18, 2),
	@Total_Cost numeric(18, 2),
	@Sales_Amt numeric(18, 2),
	@GP_Amt numeric(18, 2),
	@Currency varchar(5)
    
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into [dbo].[SD_Precost_Tmp](
		CO_Code,
		SO_NO,
		Quotation_No,
		Qty,
		UOM,
		Unit_Price,
		Total_Cost,
		Sales_Amt,
		GP_Amt,
		Currency
          )
values(
		@CO_Code,
		@SO_NO,
		@Quotation_No,
		@Qty,
		@UOM,
		@Unit_Price,
		@Total_Cost,
		@Sales_Amt,
		@GP_Amt,
		@Currency
)
END
GO

--创建存储过程 p_Ins_SD_Ship_Tmp
PRINT 'Create Procedure p_Ins_SD_Ship_Tmp'
IF Object_ID('p_Ins_SD_Ship_Tmp') IS NOT NULL
	DROP PROC p_Ins_SD_Ship_Tmp
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :05 May 2015  
Decription :往SD_Ship_Tmp表中插入记录    
 
	the latest update: 2015-05-05 15:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

CREATE procedure [dbo].[p_Ins_SD_Ship_Tmp]
	@CO_Code varchar(4),
	@SO_NO varchar(10),
	@SO_Item_NO int,
	@Invoice_No varchar(10),
	@Invoice_Date datetime,
	@Invoice_Qty numeric(18, 3),
	@UOM varchar(3),
	@Invoice_AMT numeric(18, 2),
	@Invoice_Currency varchar(5),
	@Invoice_AMT_HKD numeric(18, 2)
    
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into [dbo].[SD_Ship_Tmp](
		CO_Code,
		SO_NO,
		SO_Item_NO,
		Invoice_No,
		Invoice_Date,
		Invoice_Qty,
		UOM,
		Invoice_AMT,
		Invoice_Currency,
		Invoice_AMT_HKD
          )
values(
		@CO_Code,
		@SO_NO,
		@SO_Item_NO,
		@Invoice_No,
		@Invoice_Date,
		@Invoice_Qty,
		@UOM,
		@Invoice_AMT,
		@Invoice_Currency,
		@Invoice_AMT_HKD
)
END
GO
