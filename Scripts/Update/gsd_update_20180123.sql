ALTER TABLE dbo.SO_Plan_2nd ADD
	CustProgName1 nvarchar(40) NULL,
	CustProgName2 nvarchar(40) NULL
GO

ALTER TABLE dbo.SO_Plan_2nd_tmp ADD
	CustProgName1 nvarchar(40) NULL,
	CustProgName2 nvarchar(40) NULL
GO


ALTER TABLE dbo.SO_Plan_2nd_hist ADD
	CustProgName1 nvarchar(40) NULL,
	CustProgName2 nvarchar(40) NULL
GO

---------

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
	@Business_Model varchar(50) ,
	@SAM_HeatTransfer_DZ decimal(13, 2) ,
	@SAM_Bonding_DZ decimal(13, 2) ,
	@SAM_Fusing_DZ decimal(13, 2) ,
	@SAM_OfflineSeamseal_DZ decimal(13, 2) ,
	@SAM_LaserCut_DZ decimal(13, 2) ,
	@SAM_StripeCut_DZ decimal(13, 2) ,
	@CustPurchaseOrderDate datetime ,
	@OrderIndicator varchar(10)	,
	@CustProgName1 nvarchar(40) ,
	@CustProgName2 nvarchar(40) 	
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
	Business_Model,
	SAM_HeatTransfer_DZ ,
	SAM_Bonding_DZ ,
	SAM_Fusing_DZ,
	SAM_OfflineSeamseal_DZ ,
	SAM_LaserCut_DZ ,
	SAM_StripeCut_DZ ,
	CustPurchaseOrderDate, 	
	OrderIndicator,
	CustProgName1,
	CustProgName2
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
	@Business_Model,
	@SAM_HeatTransfer_DZ ,
	@SAM_Bonding_DZ ,
	@SAM_Fusing_DZ,
	@SAM_OfflineSeamseal_DZ ,
	@SAM_LaserCut_DZ ,
	@SAM_StripeCut_DZ ,
	@CustPurchaseOrderDate,
	@OrderIndicator,
	@CustProgName1,
	@CustProgName2 			
)

COMMIT TRANSACTION
END



GO