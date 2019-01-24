ALTER TABLE dbo.SO_Plan_Detail ADD
	HeatTransferCost decimal(13, 2) NULL,
	SpecialServiceCost decimal(13, 2) NULL
GO

ALTER TABLE dbo.SO_Plan_Detail_Tmp ADD
	HeatTransferCost decimal(13, 2) NULL,
	SpecialServiceCost decimal(13, 2) NULL
GO

ALTER TABLE dbo.SO_Plan_Detail_Hist ADD
	HeatTransferCost decimal(13, 2) NULL,
	SpecialServiceCost decimal(13, 2) NULL
GO


----

USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_Detail_Temp]    Script Date: 09/06/2017 14:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

ALTER procedure [dbo].[p_InsertSo_Plan_Detail_Temp]
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
	@Customer_Program varchar(80) ,
	@Quota_CO varchar(5) ,
	@ConfirmDraftSO varchar(10) ,
	@Factory_Group2 varchar(4) ,
    @CreatedBy varchar(12) ,
	@Approver varchar(12) ,
	@LastSOApprovalDate datetime ,
	@SAMUploadDate varchar(20), 
	@OutputTax decimal(15, 2) ,
	@TotalRMCost1 decimal(15, 2) ,
	@TotalRMCost2 decimal(15, 2) ,
	@InwardHandling decimal(15, 2) ,
	@CentralPurchaseTrim decimal(15, 2) ,
	@FactoryPurchaseTrim decimal(15, 2) ,
	@TotalCMCost decimal(15, 2) ,
	@KnittingSAMCost decimal(15, 2) ,
	@LinkingSAMCost decimal(15, 2) ,
	@SewingSAMCost decimal(15, 2) ,
	@FinishingSAMCost decimal(15, 2) ,
	@KnitTrimSAMCost decimal(15, 2) ,
	@FactorySubsidies decimal(15, 2) ,
	@FinishOthSAMCost decimal(15, 2) ,
	@BondingSAMCost decimal(15, 2) ,
	@RhinestoneSAMCost decimal(15, 2) ,
	@SubconLinkingCost decimal(15, 2) ,
	@SubconFinishCost decimal(15, 2) ,
	@HandStitchSAMCost decimal(15, 2) ,
	@WaterTreatmentCost decimal(15, 2) ,
	@WashingCost decimal(15, 2) ,
	@EmbroideryCost decimal(15, 2) ,
	@PrintingCost decimal(15, 2) ,
	@SpecialProcessCost decimal(15, 2) ,
	@SpProcessTrading decimal(15, 2) ,
	@QuotaCost decimal(15, 2) ,
	@OutwardHandling decimal(15, 2) ,
	@OutboundFreight decimal(15, 2) ,
	@CommInternalExclus decimal(15, 2) ,
	@CommExternalInclus decimal(15, 2) ,
	@MiscCost decimal(15, 2) ,
	@CommExternalExclus decimal(15, 2) ,
	@SpecialWages decimal(15, 2) ,
	@FactoryTaxOthers decimal(15, 2) ,
	@OptionPremium decimal(15, 2) ,
	@LiaInsurance decimal(15, 2) ,
	@OPAOverhead decimal(15, 2) ,
	@OPASpecialWages decimal(15, 2) ,
	@ProdLiaInsurance decimal(15, 2) ,
	@PaymentDiscount decimal(15, 2) ,
	@PaymntDisAccrual decimal(15, 2) ,
	@Lamination decimal(15, 2) ,
	@Moulding decimal(15, 2) ,
	@TotalFGCost1 decimal(15, 2) ,
	@CMLocAdjTTL decimal(15, 2) ,
	@WashingLocAdjTTL decimal(15, 2) ,
	@KnittingLocAdjTTL decimal(15, 2) ,
	@LinkingLocAdjTTL decimal(15, 2) ,
	@SewingLocAdjTTL decimal(15, 2) ,
	@FinishingLocAdjTT decimal(15, 2) ,
	@FSMarkup decimal(15, 2) ,
	@CMCostLocAdj decimal(15, 2) ,
	@WashingCostLocAdj decimal(15, 2) ,
	@KnitCostLocAdj decimal(15, 2) ,
	@LinkCostLocAdj decimal(15, 2) ,
	@SewCostLocAdj decimal(15, 2) ,
	@FinishCostLocAdj decimal(15, 2) ,
	@CostCurrency varchar(10) ,
	@SAM6DZ decimal(15, 2) ,
	@OPAFactory varchar(50) ,
	@OPACountry varchar(50) ,
	@ContractWeight varchar(50) ,
	@CentralPurchaseTrimFty decimal(15, 2) ,
	@KnitStruct_MainCode varchar(1)  ,
	@KnitStruct_MainCat varchar(30)  ,
	@KnitStruct_SubCode varchar(3)  ,
	@KnitStruct_SubCat varchar(30)  ,
	@RawMaterial_Info nvarchar(132)  ,
	@FG_LongDesc nvarchar(132)  ,
	@CustomerSeason varchar(10) ,
	@Seasonal varchar(10) ,
	@FGGRQty decimal(15, 2) ,
	@PNNo varchar(10) ,
	@SampleQty decimal(15, 2) ,
	@PDFtyStyle varchar(20) ,
	@PDHitArea varchar(60) ,
	@PlanSampleDate smalldatetime ,
	@SampleTypeCust varchar(30) ,
	@SampleTypeSubCat varchar(50) ,
	@SampleTypeMatCat varchar(15) ,
	@ProductLine varchar(15) ,
	@HeatTransferCost decimal(13, 2),
	@SpecialServiceCost decimal(13, 2)
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into So_Plan_detail_Tmp(
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
      ,SAMUploadDate
      ,[OutputTax]
      ,[TotalRMCost1]
      ,[TotalRMCost2]
      ,[InwardHandling]
      ,[CentralPurchaseTrim]
      ,[FactoryPurchaseTrim]
      ,[TotalCMCost]
      ,[KnittingSAMCost]
      ,[LinkingSAMCost]
      ,[SewingSAMCost]
      ,[FinishingSAMCost]
      ,[KnitTrimSAMCost]
      ,[FactorySubsidies]
      ,[FinishOthSAMCost]
      ,[BondingSAMCost]
      ,[RhinestoneSAMCost]
      ,[SubconLinkingCost]
      ,[SubconFinishCost]
      ,[HandStitchSAMCost]
      ,[WaterTreatmentCost]
      ,[WashingCost]
      ,[EmbroideryCost]
      ,[PrintingCost]
      ,[SpecialProcessCost]
      ,[SpProcessTrading]
      ,[QuotaCost]
      ,[OutwardHandling]
      ,[OutboundFreight]
      ,[CommInternalExclus]
      ,[CommExternalInclus]
      ,[MiscCost]
      ,[CommExternalExclus]
      ,[SpecialWages]
      ,[FactoryTaxOthers]
      ,[OptionPremium]
      ,[LiaInsurance]
      ,[OPAOverhead]
      ,[OPASpecialWages]
      ,[ProdLiaInsurance]
      ,[PaymentDiscount]
      ,[PaymntDisAccrual]
      ,[Lamination]
      ,[Moulding]
      ,[TotalFGCost1]
      ,[CMLocAdjTTL]
      ,[WashingLocAdjTTL]
      ,[KnittingLocAdjTTL]
      ,[LinkingLocAdjTTL]
      ,[SewingLocAdjTTL]
      ,[FinishingLocAdjTT]
      ,[FSMarkup]
      ,[CMCostLocAdj]
      ,[WashingCostLocAdj]
      ,[KnitCostLocAdj]
      ,[LinkCostLocAdj]
      ,[SewCostLocAdj]
      ,[FinishCostLocAdj]
      ,[CostCurrency]
      ,[SAM6DZ]
      ,[OPAFactory]
      ,[OPACountry]
      ,[ContractWeight]
      ,[CentralPurchaseTrimFty]
      ,[KnitStruct_MainCode]
      ,[KnitStruct_MainCat]
      ,[KnitStruct_SubCode]
      ,[KnitStruct_SubCat]
      ,[RawMaterial_Info]
      ,[FG_LongDesc]
      ,[CustomerSeason]
      ,[Seasonal]
      ,[FGGRQty]
      ,[PNNo]
      ,[SampleQty]
      ,[PDFtyStyle]
      ,[PDHitArea]
      ,[PlanSampleDate]
      ,[SampleTypeCust]
      ,[SampleTypeSubCat]
      ,[SampleTypeMatCat]
      ,[ProductLine]
      ,[HeatTransferCost]
      ,[SpecialServiceCost])
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
        ,@OutputTax
      ,@TotalRMCost1
      ,@TotalRMCost2
      ,@InwardHandling
      ,@CentralPurchaseTrim
      ,@FactoryPurchaseTrim
      ,@TotalCMCost
      ,@KnittingSAMCost
      ,@LinkingSAMCost
      ,@SewingSAMCost
      ,@FinishingSAMCost
      ,@KnitTrimSAMCost
      ,@FactorySubsidies
      ,@FinishOthSAMCost
      ,@BondingSAMCost
      ,@RhinestoneSAMCost
      ,@SubconLinkingCost
      ,@SubconFinishCost
      ,@HandStitchSAMCost
      ,@WaterTreatmentCost
      ,@WashingCost
      ,@EmbroideryCost
      ,@PrintingCost
      ,@SpecialProcessCost
      ,@SpProcessTrading
      ,@QuotaCost
      ,@OutwardHandling
      ,@OutboundFreight
      ,@CommInternalExclus
      ,@CommExternalInclus
      ,@MiscCost
      ,@CommExternalExclus
      ,@SpecialWages
      ,@FactoryTaxOthers
      ,@OptionPremium
      ,@LiaInsurance
      ,@OPAOverhead
      ,@OPASpecialWages
      ,@ProdLiaInsurance
      ,@PaymentDiscount
      ,@PaymntDisAccrual
      ,@Lamination
      ,@Moulding
      ,@TotalFGCost1
      ,@CMLocAdjTTL
      ,@WashingLocAdjTTL
      ,@KnittingLocAdjTTL
      ,@LinkingLocAdjTTL
      ,@SewingLocAdjTTL
      ,@FinishingLocAdjTT
      ,@FSMarkup
      ,@CMCostLocAdj
      ,@WashingCostLocAdj
      ,@KnitCostLocAdj
      ,@LinkCostLocAdj
      ,@SewCostLocAdj
      ,@FinishCostLocAdj
      ,@CostCurrency
      ,@SAM6DZ
      ,@OPAFactory
      ,@OPACountry
      ,@ContractWeight
      ,@CentralPurchaseTrimFty
      ,@KnitStruct_MainCode
      ,@KnitStruct_MainCat
      ,@KnitStruct_SubCode
      ,@KnitStruct_SubCat
      ,@RawMaterial_Info
      ,@FG_LongDesc
      ,@CustomerSeason
      ,@Seasonal
      ,@FGGRQty
      ,@PNNo
      ,@SampleQty
      ,@PDFtyStyle
      ,@PDHitArea
      ,@PlanSampleDate
      ,@SampleTypeCust
      ,@SampleTypeSubCat
      ,@SampleTypeMatCat
      ,@ProductLine
      ,@HeatTransferCost
      ,@SpecialServiceCost

)

COMMIT TRANSACTION
END

