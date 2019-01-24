
ALTER TABLE dbo.SO_Plan_Cost ADD
	CentralPurchaseTrimFty decimal(15, 2) NULL
GO

ALTER TABLE dbo.SO_Plan_Cost_Hist ADD
	CentralPurchaseTrimFty decimal(15, 2) NULL
GO

ALTER TABLE dbo.SO_Plan_Cost_Tmp ADD
	CentralPurchaseTrimFty decimal(15, 2) NULL
GO



----------------------



USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_InsertSo_Plan_Cost_Temp]    Script Date: 11/21/2016 17:32:19 ******/
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

ALTER procedure [dbo].[p_InsertSo_Plan_Cost_Temp]
    @Company_Code varchar(4),
	@Sales_Org varchar(4) ,
	@SO_No varchar(10)  ,
	@SO_ItemNo int  ,
	@SO_Type varchar(4)  ,
	@Country_Origin varchar(3)  ,
	@Factory_Group varchar(4)  ,
	@OutputTax decimal (15, 2) ,
	@TotalRMCost1 decimal (15, 2) ,
	@TotalRMCost2 decimal (15, 2) ,
	@InwardHandling decimal (15, 2) ,
	@CentralPurchaseTrim decimal (15, 2) ,
	@FactoryPurchaseTrim decimal (15, 2) ,
	@TotalCMCost decimal (15, 2) ,
	@KnittingSAMCost decimal (15, 2) ,
	@LinkingSAMCost decimal (15, 2) ,
	@SewingSAMCost decimal (15, 2) ,
	@FinishingSAMCost decimal (15, 2) ,
	@KnitTrimSAMCost decimal (15, 2) ,
	@FactorySubsidies decimal (15, 2) ,
	@FinishOthSAMCost decimal (15, 2) ,
	@BondingSAMCost decimal (15, 2) ,
	@RhinestoneSAMCost decimal (15, 2) ,
	@SubconLinkingCost decimal (15, 2) ,
	@SubconFinishCost decimal (15, 2) ,
	@HandStitchSAMCost decimal (15, 2) ,
	@WaterTreatmentCost decimal (15, 2) ,
	@WashingCost decimal (15, 2) ,
	@EmbroideryCost decimal (15, 2) ,
	@PrintingCost decimal (15, 2) ,
	@SpecialProcessCost decimal (15, 2) ,
	@SpProcessTrading decimal (15, 2) ,
	@QuotaCost decimal (15, 2) ,
	@OutwardHandling decimal (15, 2) ,
	@OutboundFreight decimal (15, 2) ,
	@CommInternalExclus decimal (15, 2) ,
	@CommExternalInclus decimal (15, 2) ,
	@MiscCost decimal (15, 2) ,
	@CommExternalExclus decimal (15, 2) ,
	@SpecialWages decimal (15, 2) ,
	@FactoryTaxOthers decimal (15, 2) ,
	@OptionPremium decimal (15, 2) ,
	@LiaInsurance decimal (15, 2) ,
	@OPAOverhead decimal (15, 2) ,
	@OPASpecialWages decimal (15, 2) ,
	@ProdLiaInsurance decimal (15, 2) ,
	@PaymentDiscount decimal (15, 2) ,
	@PaymntDisAccrual decimal (15, 2) ,
	@Lamination decimal (15, 2) ,
	@Moulding decimal (15, 2) ,
	@TotalFGCost1 decimal (15, 2) ,
	@CMLocAdjTTL decimal (15, 2) ,
	@WashingLocAdjTTL decimal (15, 2) ,
	@KnittingLocAdjTTL decimal (15, 2) ,
	@LinkingLocAdjTTL decimal (15, 2) ,
	@SewingLocAdjTTL decimal (15, 2) ,
	@FinishingLocAdjTT decimal (15, 2) ,
	@FSMarkup decimal (15, 2) ,
	@CMCostLocAdj decimal (15, 2) ,
	@WashingCostLocAdj decimal (15, 2) ,
	@KnitCostLocAdj decimal (15, 2) ,
	@LinkCostLocAdj decimal (15, 2) ,
	@SewCostLocAdj decimal (15, 2) ,
	@FinishCostLocAdj decimal (15, 2) ,
	@CostCurrency varchar(10),
	@SAM6DZ decimal (15, 2) ,
	@OPAFactory varchar (50) ,
	@OPACountry varchar (50) ,
	@ContractWeight varchar (50) ,
	@CentralPurchaseTrimFty decimal (15, 2)
AS 
BEGIN
SET NOCOUNT ON

BEGIN TRANSACTION
Insert into So_Plan_Cost_Tmp(
			Company_Code
           ,Sales_Org
           ,SO_No
           ,SO_ItemNo
           ,SO_Type
           ,Country_Origin
           ,Factory_Group
           ,OutputTax
		 ,TotalRMCost1
		 ,TotalRMCost2
		 ,InwardHandling
		 ,CentralPurchaseTrim
		 ,FactoryPurchaseTrim
		 ,TotalCMCost
		 ,KnittingSAMCost
		 ,LinkingSAMCost
		 ,SewingSAMCost
		 ,FinishingSAMCost
		 ,KnitTrimSAMCost
		 ,FactorySubsidies
		 ,FinishOthSAMCost
		 ,BondingSAMCost
		 ,RhinestoneSAMCost
		 ,SubconLinkingCost
		 ,SubconFinishCost
		 ,HandStitchSAMCost
		 ,WaterTreatmentCost
		 ,WashingCost
		 ,EmbroideryCost
		 ,PrintingCost
		 ,SpecialProcessCost
		 ,SpProcessTrading
		 ,QuotaCost
		 ,OutwardHandling
		 ,OutboundFreight
		 ,CommInternalExclus
		 ,CommExternalInclus
		 ,MiscCost
		 ,CommExternalExclus
		 ,SpecialWages
		 ,FactoryTaxOthers
		 ,OptionPremium
		 ,LiaInsurance
		 ,OPAOverhead
		 ,OPASpecialWages
		 ,ProdLiaInsurance
		 ,PaymentDiscount
		 ,PaymntDisAccrual
		 ,Lamination
		 ,Moulding
		 ,TotalFGCost1
		 ,CMLocAdjTTL
		 ,WashingLocAdjTTL
		 ,KnittingLocAdjTTL
		 ,LinkingLocAdjTTL
		 ,SewingLocAdjTTL
		 ,FinishingLocAdjTT
		 ,FSMarkup
		 ,CMCostLocAdj
		 ,WashingCostLocAdj
		 ,KnitCostLocAdj
		 ,LinkCostLocAdj
		 ,SewCostLocAdj
		 ,FinishCostLocAdj
		 ,CostCurrency
		 ,SAM6DZ
		 ,OPAFactory
		 ,OPACountry
		 ,ContractWeight
		 ,CentralPurchaseTrimFty)
values(
@Company_Code ,
	@Sales_Org  ,
	@SO_No   ,
	@SO_ItemNo   ,
	@SO_Type   ,
	@Country_Origin ,
	@Factory_Group   ,
	@OutputTax,
	@TotalRMCost1,
	@TotalRMCost2,
	@InwardHandling,
	@CentralPurchaseTrim,
	@FactoryPurchaseTrim,
	@TotalCMCost,
	@KnittingSAMCost,
	@LinkingSAMCost,
	@SewingSAMCost,
	@FinishingSAMCost,
	@KnitTrimSAMCost,
	@FactorySubsidies,
	@FinishOthSAMCost,
	@BondingSAMCost,
	@RhinestoneSAMCost,
	@SubconLinkingCost,
	@SubconFinishCost,
	@HandStitchSAMCost,
	@WaterTreatmentCost,
	@WashingCost,
	@EmbroideryCost,
	@PrintingCost,
	@SpecialProcessCost,
	@SpProcessTrading,
	@QuotaCost,
	@OutwardHandling,
	@OutboundFreight,
	@CommInternalExclus,
	@CommExternalInclus,
	@MiscCost,
	@CommExternalExclus,
	@SpecialWages,
	@FactoryTaxOthers,
	@OptionPremium,
	@LiaInsurance,
	@OPAOverhead,
	@OPASpecialWages,
	@ProdLiaInsurance,
	@PaymentDiscount,
	@PaymntDisAccrual,
	@Lamination,
	@Moulding,
	@TotalFGCost1,
	@CMLocAdjTTL,
	@WashingLocAdjTTL,
	@KnittingLocAdjTTL,
	@LinkingLocAdjTTL,
	@SewingLocAdjTTL,
	@FinishingLocAdjTT,
	@FSMarkup,
	@CMCostLocAdj,
	@WashingCostLocAdj,
	@KnitCostLocAdj,
	@LinkCostLocAdj,
	@SewCostLocAdj,
	@FinishCostLocAdj,
	@CostCurrency,
	@SAM6DZ,
	@OPAFactory,
	@OPACountry,
	@ContractWeight,
	@CentralPurchaseTrimFty

)

COMMIT TRANSACTION
END

