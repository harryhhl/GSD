ALTER TABLE dbo.SO_Plan_2nd ADD
	PNNo varchar(10) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_Hist ADD
	PNNo varchar(10) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_Tmp ADD
	PNNo varchar(10) NULL
GO


-----------
USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_2nd_Temp]    Script Date: 02/16/2017 17:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



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
    @PNNo varchar(10)
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
    PNNo
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
	@PNNo
)

COMMIT TRANSACTION
END



