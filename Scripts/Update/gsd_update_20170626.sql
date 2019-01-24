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
ALTER TABLE dbo.SO_Plan_2nd_Tmp ADD
	SampleQty decimal(15, 2) NULL,
	PDFtyStyle varchar(20) NULL,
	PDHitArea varchar(60) NULL,
	PlanSampleDate smalldatetime NULL,
	SampleTypeCust varchar(30) NULL,
	SampleTypeSubCat varchar(50) NULL,
	SampleTypeMatCat varchar(15) NULL,
	ProductLine varchar(15) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd ADD
	SampleQty decimal(15, 2) NULL,
	PDFtyStyle varchar(20) NULL,
	PDHitArea varchar(60) NULL,
	PlanSampleDate smalldatetime NULL,
	SampleTypeCust varchar(30) NULL,
	SampleTypeSubCat varchar(50) NULL,
	SampleTypeMatCat varchar(15) NULL,
	ProductLine varchar(15) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_Hist ADD
	SampleQty decimal(15, 2) NULL,
	PDFtyStyle varchar(20) NULL,
	PDHitArea varchar(60) NULL,
	PlanSampleDate smalldatetime NULL,
	SampleTypeCust varchar(30) NULL,
	SampleTypeSubCat varchar(50) NULL,
	SampleTypeMatCat varchar(15) NULL,
	ProductLine varchar(15) NULL
GO
COMMIT


/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_2nd_Temp]    Script Date: 06/26/2017 15:40:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_InsertSo_Plan_2nd_Temp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_InsertSo_Plan_2nd_Temp]
GO


/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_2nd_Temp]    Script Date: 06/26/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--------


/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :Harry Huang    
Date  :14 Mar 2016  
Decription :往So_Plan_2nd_Tmp表中插入记录    
 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

CREATE procedure [dbo].[p_InsertSo_Plan_2nd_Temp]
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
    @FGGRQty decimal(15,2),
    @SampleQty decimal(15, 2),
	@PDFtyStyle varchar(20),
	@PDHitArea varchar(60),
	@PlanSampleDate smalldatetime,
	@SampleTypeCust varchar(30),
	@SampleTypeSubCat varchar(50),
	@SampleTypeMatCat varchar(15),
	@ProductLine varchar(15)
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
    FGGRQty,
    SampleQty,
	PDFtyStyle,
	PDHitArea,
	PlanSampleDate,
	SampleTypeCust,
	SampleTypeSubCat,
	SampleTypeMatCat,
	ProductLine
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
	@FGGRQty,
	@SampleQty,
	@PDFtyStyle,
	@PDHitArea,
	@PlanSampleDate,
	@SampleTypeCust,
	@SampleTypeSubCat,
	@SampleTypeMatCat,
	@ProductLine
)

COMMIT TRANSACTION
END


GO


