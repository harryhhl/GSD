
ALTER TABLE dbo.SO_Plan_2nd ADD
	AGE_SEX varchar(50) NULL,
	Product_Segment varchar(50) NULL,
	Product_Group_Desc varchar(50) NULL,
	Business_Feature varchar(50) NULL,
	Business_Model varchar(50) NULL
GO


ALTER TABLE dbo.SO_Plan_2nd_Hist ADD
	AGE_SEX varchar(50) NULL,
	Product_Segment varchar(50) NULL,
	Product_Group_Desc varchar(50) NULL,
	Business_Feature varchar(50) NULL,
	Business_Model varchar(50) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_Tmp ADD
	AGE_SEX varchar(50) NULL,
	Product_Segment varchar(50) NULL,
	Product_Group_Desc varchar(50) NULL,
	Business_Feature varchar(50) NULL,
	Business_Model varchar(50) NULL
GO

---------------
USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_2nd_Temp]    Script Date: 10/24/2017 14:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------


/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :Harry Huang    
Date  :14 Mar 2016  
Decription :��So_Plan_2nd_Tmp���в����¼    
 
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
    @FGGRQty decimal(15,2),
    @SampleQty decimal(15, 2),
	@PDFtyStyle varchar(20),
	@PDHitArea varchar(60),
	@PlanSampleDate smalldatetime,
	@SampleTypeCust varchar(30),
	@SampleTypeSubCat varchar(50),
	@SampleTypeMatCat varchar(15),
	@ProductLine varchar(15),
	@WashingQty varchar(50) ,
	@PrintingQty varchar(50) ,
	@EmbroideryQty varchar(50) ,
	@HeatTransferQty varchar(50) ,
	@SpecialServiceQty varchar(50),
	@AGE_SEX varchar(50) ,
	@Product_Segment varchar(50) ,
	@Product_Group_Desc varchar(50) ,
	@Business_Feature varchar(50) ,
	@Business_Model varchar(50)	
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
	ProductLine,
	WashingQty,
	PrintingQty,
	EmbroideryQty, 
	HeatTransferQty, 
	SpecialServiceQty,
	AGE_SEX,
	Product_Segment,
	Product_Group_Desc,
	Business_Feature,
	Business_Model		
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
	@ProductLine,
	@WashingQty,
	@PrintingQty,
	@EmbroideryQty, 
	@HeatTransferQty, 
	@SpecialServiceQty,
	@AGE_SEX,
	@Product_Segment,
	@Product_Group_Desc,
	@Business_Feature,
	@Business_Model	
)

COMMIT TRANSACTION
END



