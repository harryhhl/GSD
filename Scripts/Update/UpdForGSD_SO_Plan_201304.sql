--1.SO_Plan
Print 'Update Table: [SO_Plan]'
If Object_ID(N'SO_Plan',N'U') is Null 
Begin
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Purpose		: for GSD - SO Plan 
Date		: 01 Mar 2010
Author		: James Dudn

---------------------------------------
01 Mar 2010		James Duan		the first version
17 Apr 2013		Aaron		Add order remark & commit date
	the latest update: 2013-04-17 18:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
	CREATE TABLE [dbo].[SO_Plan](
		[Company_Code] [varchar](4) NULL,
		[Sales_Org] [varchar](4) NULL,
		[SO_No] [varchar](10) NOT NULL,
		[SO_ItemNo] [int] NOT NULL,
		[SO_Type] [varchar](4) NOT NULL,
		[Country_Origin] [varchar](3) NOT NULL,
		[Factory_Group] [varchar](4) NOT NULL,
		[Sales_Group] [varchar](3) NULL,
		[Sold_To_Party_Code] [varchar](10) NULL,
		[Sold_To_Party_Name] [varchar](35) NULL,
		[Bland_Name] [varchar](35) NULL,
		[Bland_Code] [varchar](10) NULL,
		[Bill_To_Party_Code] [varchar](10) NULL,
		[Bill_To_Party_Name] [varchar](35) NULL,
		[Payer_Code] [varchar](10) NULL,
		[Payer_Name] [varchar](35) NULL,
		[Ship_to_Party_Code] [varchar](10) NULL,
		[Ship_to_Party_Name] [varchar](35) NULL,
		[Sales_Agent_Code] [varchar](10) NULL,
		[Sales_Agent_Name] [varchar](35) NULL,
		[Product_Div_Code] [varchar](3) NULL,
		[Product_Div_Name] [varchar](40) NULL,
		[Product_Type_Code] [varchar](3) NULL,
		[Product_Type_Name] [varchar](40) NULL,
		[Season] [varchar](4) NULL,
		[Program_Name] [varchar](12) NULL,
		[Machine_Type] [varchar](3) NULL,
		[Guage] [varchar](3) NULL,
		[Market] [varchar](3) NULL,
		[Customer_StyleNo] [varchar](35) NULL,
		[Factory_StyleNo] [varchar](10) NULL,
		[Customer_PONo] [varchar](35) NULL,
		[Quota_Category1] [varchar](8) NULL,
		[Quota_Category2] [varchar](8) NULL,
		[Quota_Category3] [varchar](8) NULL,
		[Order_Qty] [decimal](15, 3) NULL,
		[Sales_Unit] [varchar](3) NULL,
		[Projection_Qty] [decimal](15, 3) NULL,
		[Projection_UOM] [varchar](3) NULL,
		[Req_Del_Date] [smalldatetime] NULL,
		[Req_Del_Month] [varchar](6) NULL,
		[Customer_Del_Date] [datetime] NULL,
		[Shipping_Type] [varchar](2) NULL,
		[Port_Disc] [varchar](3) NULL,
		[Price_Team] [varchar](3) NULL,
		[Payment_Term] [varchar](4) NULL,
		[Unit_Price] [decimal](11, 2) NULL,
		[Sales_Amount] [decimal](15, 2) NULL,
		[Sales_Amount_HKD] [decimal](15, 2) NULL,
		[Net_Price] [decimal](15, 2) NULL,
		[Net_Amount] [decimal](15, 2) NULL,
		[Currency_Key] [varchar](5) NULL,
		[Net_Amount_HKD] [varchar](15) NULL,
		[GP_Percent] [decimal](9, 3) NULL,
		[GP_Amount_USD] [decimal](13, 2) NULL,
		[Special_Wages] [decimal](7, 2) NULL,
		[CM_Cost_USD] [decimal](13, 2) NULL,
		[SAM_Per_DZ] [decimal](10, 2) NULL,
		[Total_SAH] [decimal](8, 0) NULL,
		[Projection_SAH] [decimal](8, 0) NULL,
		[SO_Status] [varchar](30) NULL,
		[Delivery_Status] [varchar](30) NULL,
		[Component] [int] NULL,
		[Order_Qty_PCS] [decimal](10, 3) NULL,
		[GP_Amount_HKD] [decimal](13, 2) NULL,
		[Customer_Dept_Name] [varchar](15) NULL,
		[Customer_Dept_Code] [varchar](3) NULL,
		[CM_Cost_HKD] [decimal](13, 2) NULL,
		[DDU_Sales] [decimal](7, 2) NULL,
		[Style_Desc] [varchar](160) null,
		[Commit_date] [datetime] null,
		[OrderRemark] [varchar](150) null,
	 CONSTRAINT [PK_SO_Plan] PRIMARY KEY CLUSTERED 
	(
		[SO_No] ASC,
		[SO_ItemNo] ASC,
		[SO_Type] ASC,
		[Country_Origin] ASC,
		[Factory_Group] ASC
	) ON [PRIMARY]
	) ON [PRIMARY]
End
Else
Begin
	Print '==> Table [SO_Plan] is exists!'
	print 'Add Column Style_Desc'
	if not exists(select * from syscolumns where name= 'Style_Desc' and id=object_id('SO_Plan'))
	begin
		alter table SO_Plan add Style_Desc varchar(160)
	end
	
	If Not Exists ( Select * From SysColumns Where name = 'Commit_date' and id = Object_id(N'[dbo].SO_Plan') )
	Begin			
		Alter Table SO_Plan add Commit_date datetime null
	End

	If Not Exists ( Select * From SysColumns Where name = 'OrderRemark' and id = Object_id(N'[dbo].SO_Plan') )
	Begin
		Alter Table SO_Plan add OrderRemark varchar(150) null
	End	
End
--2.SO_Plan_Hist
Print 'Update Table: [SO_Plan_Hist]'
If Object_ID(N'SO_Plan_Hist',N'U') is Null 
Begin
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Purpose		: for GSD - SO Plan 
Date		: 01 Mar 2010
Author		: James Dudn

---------------------------------------
01 Mar 2010		James Duan		the first version
17 Apr 2013		Aaron		Add order remark & commit date
	the latest update: 2013-04-17 18:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
	CREATE TABLE [dbo].[SO_Plan_Hist](
		[Company_Code] [varchar](4) NULL,
		[Sales_Org] [varchar](4) NULL,
		[SO_No] [varchar](10) NOT NULL,
		[SO_ItemNo] [int] NOT NULL,
		[SO_Type] [varchar](4) NOT NULL,
		[Country_Origin] [varchar](3) NOT NULL,
		[Factory_Group] [varchar](4) NOT NULL,
		[Sales_Group] [varchar](3) NULL,
		[Sold_To_Party_Code] [varchar](10) NULL,
		[Sold_To_Party_Name] [varchar](35) NULL,
		[Bland_Name] [varchar](35) NULL,
		[Bland_Code] [varchar](10) NULL,
		[Bill_To_Party_Code] [varchar](10) NULL,
		[Bill_To_Party_Name] [varchar](35) NULL,
		[Payer_Code] [varchar](10) NULL,
		[Payer_Name] [varchar](35) NULL,
		[Ship_to_Party_Code] [varchar](10) NULL,
		[Ship_to_Party_Name] [varchar](35) NULL,
		[Sales_Agent_Code] [varchar](10) NULL,
		[Sales_Agent_Name] [varchar](35) NULL,
		[Product_Div_Code] [varchar](3) NULL,
		[Product_Div_Name] [varchar](40) NULL,
		[Product_Type_Code] [varchar](3) NULL,
		[Product_Type_Name] [varchar](40) NULL,
		[Season] [varchar](4) NULL,
		[Program_Name] [varchar](12) NULL,
		[Machine_Type] [varchar](3) NULL,
		[Guage] [varchar](3) NULL,
		[Market] [varchar](3) NULL,
		[Customer_StyleNo] [varchar](35) NULL,
		[Factory_StyleNo] [varchar](10) NULL,
		[Customer_PONo] [varchar](35) NULL,
		[Quota_Category1] [varchar](8) NULL,
		[Quota_Category2] [varchar](8) NULL,
		[Quota_Category3] [varchar](8) NULL,
		[Order_Qty] [decimal](15, 3) NULL,
		[Sales_Unit] [varchar](3) NULL,
		[Projection_Qty] [decimal](15, 3) NULL,
		[Projection_UOM] [varchar](3) NULL,
		[Req_Del_Date] [smalldatetime] NULL,
		[Req_Del_Month] [varchar](6) NULL,
		[Customer_Del_Date] [datetime] NULL,
		[Shipping_Type] [varchar](2) NULL,
		[Port_Disc] [varchar](3) NULL,
		[Price_Team] [varchar](3) NULL,
		[Payment_Term] [varchar](4) NULL,
		[Unit_Price] [decimal](11, 2) NULL,
		[Sales_Amount] [decimal](15, 2) NULL,
		[Sales_Amount_HKD] [decimal](15, 2) NULL,
		[Net_Price] [decimal](15, 2) NULL,
		[Net_Amount] [decimal](15, 2) NULL,
		[Currency_Key] [varchar](5) NULL,
		[Net_Amount_HKD] [varchar](15) NULL,
		[GP_Percent] [decimal](9, 3) NULL,
		[GP_Amount_USD] [decimal](13, 2) NULL,
		[Special_Wages] [decimal](7, 2) NULL,
		[CM_Cost_USD] [decimal](13, 2) NULL,
		[SAM_Per_DZ] [decimal](10, 2) NULL,
		[Total_SAH] [decimal](8, 0) NULL,
		[Projection_SAH] [decimal](8, 0) NULL,
		[SO_Status] [varchar](30) NULL,
		[Delivery_Status] [varchar](30) NULL,
		[Component] [int] NULL,
		[Order_Qty_PCS] [decimal](10, 3) NULL,
		[GP_Amount_HKD] [decimal](13, 2) NULL,
		[Customer_Dept_Name] [varchar](15) NULL,
		[Customer_Dept_Code] [varchar](3) NULL,
		[CM_Cost_HKD] [decimal](13, 2) NULL,
		[DDU_Sales] [decimal](7, 2) NULL,
		[History_DateTime] [smalldatetime] Not Null,
		[Style_Desc] [varchar](160) null,
		[Commit_date] [datetime] null,
		[OrderRemark] [varchar](150) null,		
	 CONSTRAINT [PK_SO_Plan_Hist] PRIMARY KEY CLUSTERED 
	(
		[SO_No] ASC,
		[SO_ItemNo] ASC,
		[SO_Type] ASC,
		[Country_Origin] ASC,
		[Factory_Group] ASC,
		[History_DateTime] ASC
	) ON [PRIMARY]
	) ON [PRIMARY]
End
Else
Begin
	Print '==> Table [SO_Plan_Hist] is exists!'
	if not exists(select * from syscolumns where name= 'Style_Desc' and id=object_id('SO_Plan_Hist'))
	begin
		alter table SO_Plan_Hist add Style_Desc varchar(160)
	end
	--- add ZCommit_date & Order_Remark to table SO_Plan_Hist
	If Not Exists ( Select * From SysColumns Where name = 'Commit_date' and id = Object_id(N'[dbo].SO_Plan_Hist') )
	Begin		
		Alter Table SO_Plan_Hist add Commit_date datetime null
	End
	If Not Exists ( Select * From SysColumns Where name = 'OrderRemark' and id = Object_id(N'[dbo].SO_Plan_Hist') )
	Begin	
		Alter Table SO_Plan_Hist add OrderRemark varchar(150) null
	End
End

--3.SO_Plan_Tmp
Print 'Update Table: [SO_Plan_Tmp]'
If Object_ID(N'SO_Plan_Tmp',N'U') is Null 
Begin
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Purpose		: for GSD - SO Plan 
Date		: 01 Mar 2010
Author		: James Dudn

---------------------------------------
01 Mar 2010		James Duan		the first version
17 Apr 2013		Aaron		Add order remark & commit date
	the latest update: 2013-04-17 18:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
	CREATE TABLE [dbo].[SO_Plan_Tmp](
		[Company_Code] [varchar](4) NULL,
		[Sales_Org] [varchar](4) NULL,
		[SO_No] [varchar](10) NOT NULL,
		[SO_ItemNo] [int] NOT NULL,
		[SO_Type] [varchar](4) NOT NULL,
		[Country_Origin] [varchar](3) NOT NULL,
		[Factory_Group] [varchar](4) NOT NULL,
		[Sales_Group] [varchar](3) NULL,
		[Sold_To_Party_Code] [varchar](10) NULL,
		[Sold_To_Party_Name] [varchar](35) NULL,
		[Bland_Name] [varchar](35) NULL,
		[Bland_Code] [varchar](10) NULL,
		[Bill_To_Party_Code] [varchar](10) NULL,
		[Bill_To_Party_Name] [varchar](35) NULL,
		[Payer_Code] [varchar](10) NULL,
		[Payer_Name] [varchar](35) NULL,
		[Ship_to_Party_Code] [varchar](10) NULL,
		[Ship_to_Party_Name] [varchar](35) NULL,
		[Sales_Agent_Code] [varchar](10) NULL,
		[Sales_Agent_Name] [varchar](35) NULL,
		[Product_Div_Code] [varchar](3) NULL,
		[Product_Div_Name] [varchar](40) NULL,
		[Product_Type_Code] [varchar](3) NULL,
		[Product_Type_Name] [varchar](40) NULL,
		[Season] [varchar](4) NULL,
		[Program_Name] [varchar](12) NULL,
		[Machine_Type] [varchar](3) NULL,
		[Guage] [varchar](3) NULL,
		[Market] [varchar](3) NULL,
		[Customer_StyleNo] [varchar](35) NULL,
		[Factory_StyleNo] [varchar](10) NULL,
		[Customer_PONo] [varchar](35) NULL,
		[Quota_Category1] [varchar](8) NULL,
		[Quota_Category2] [varchar](8) NULL,
		[Quota_Category3] [varchar](8) NULL,
		[Order_Qty] [decimal](15, 3) NULL,
		[Sales_Unit] [varchar](3) NULL,
		[Projection_Qty] [decimal](15, 3) NULL,
		[Projection_UOM] [varchar](3) NULL,
		[Req_Del_Date] [smalldatetime] NULL,
		[Req_Del_Month] [varchar](6) NULL,
		[Customer_Del_Date] [datetime] NULL,
		[Shipping_Type] [varchar](2) NULL,
		[Port_Disc] [varchar](3) NULL,
		[Price_Team] [varchar](3) NULL,
		[Payment_Term] [varchar](4) NULL,
		[Unit_Price] [decimal](11, 2) NULL,
		[Sales_Amount] [decimal](15, 2) NULL,
		[Sales_Amount_HKD] [decimal](15, 2) NULL,
		[Net_Price] [decimal](15, 2) NULL,
		[Net_Amount] [decimal](15, 2) NULL,
		[Currency_Key] [varchar](5) NULL,
		[Net_Amount_HKD] [varchar](15) NULL,
		[GP_Percent] [decimal](9, 3) NULL,
		[GP_Amount_USD] [decimal](13, 2) NULL,
		[Special_Wages] [decimal](7, 2) NULL,
		[CM_Cost_USD] [decimal](13, 2) NULL,
		[SAM_Per_DZ] [decimal](10, 2) NULL,
		[Total_SAH] [decimal](8, 0) NULL,
		[Projection_SAH] [decimal](8, 0) NULL,
		[SO_Status] [varchar](30) NULL,
		[Delivery_Status] [varchar](30) NULL,
		[Component] [int] NULL,
		[Order_Qty_PCS] [decimal](10, 3) NULL,
		[GP_Amount_HKD] [decimal](13, 2) NULL,
		[Customer_Dept_Name] [varchar](15) NULL,
		[Customer_Dept_Code] [varchar](3) NULL,
		[CM_Cost_HKD] [decimal](13, 2) NULL,
		[DDU_Sales] [decimal](7, 2) NULL,
		[Style_Desc] [varchar](160) null,
		[Commit_date] [datetime] null,
		[OrderRemark] [varchar](150) null,		
	 CONSTRAINT [PK_SO_Plan_Tmp] PRIMARY KEY CLUSTERED 
	(
		[SO_No] ASC,
		[SO_ItemNo] ASC,
		[SO_Type] ASC,
		[Country_Origin] ASC,
		[Factory_Group] ASC
	) ON [PRIMARY]
	) ON [PRIMARY]
End
Else
Begin
	Print '==> Table [SO_Plan_Tmp] is exists!'
	if not exists(select * from syscolumns where name= 'Style_Desc' and id=object_id('SO_Plan_Tmp'))
	begin
		alter table SO_Plan_Tmp add Style_Desc varchar(160)
	end
	If Not Exists ( Select * From SysColumns Where name = 'Commit_date' and id = Object_id(N'[dbo].SO_Plan_Tmp') )
	Begin
			
		Alter Table SO_Plan_Tmp add Commit_date datetime null
	End
	If Not Exists ( Select * From SysColumns Where name = 'OrderRemark' and id = Object_id(N'[dbo].SO_Plan_Tmp') )
	Begin
			
		Alter Table SO_Plan_Tmp add OrderRemark varchar(150) null
	End	
End

