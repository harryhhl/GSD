ALTER TABLE dbo.SD_Ship ADD
	GrossAmount numeric(18, 2) NULL
GO
ALTER TABLE dbo.SD_Ship_Hist ADD
	GrossAmount numeric(18, 2) NULL
GO
ALTER TABLE dbo.SD_Ship_Tmp ADD
	GrossAmount numeric(18, 2) NULL
GO

---
USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_Ins_SD_Ship_Tmp]    Script Date: 10/31/2018 15:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :05 May 2015  
Decription :往SD_Ship_Tmp表中插入记录    
 
	the latest update: 2015-05-05 15:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

ALTER procedure [dbo].[p_Ins_SD_Ship_Tmp]
	@CO_Code varchar(4),
	@SO_NO varchar(10),
	@SO_Item_NO int,
	@Invoice_No varchar(10),
	@Invoice_Date datetime,
	@Invoice_Qty numeric(18, 3),
	@UOM varchar(3),
	@Invoice_AMT numeric(18, 2),
	@Invoice_Currency varchar(5),
	@Invoice_AMT_HKD numeric(18, 2),
	@Amount_FI numeric(18, 2),
	@Amount_Local numeric(18, 2),
	@FI_Doc varchar(10),
	@GrossAmount numeric(18, 2)
    
AS 
BEGIN
SET NOCOUNT ON


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
		Invoice_AMT_HKD,
		Amount_FI,
		Amount_Local,
		FI_Doc,
		GrossAmount
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
		@Invoice_AMT_HKD,
		@Amount_FI,
		@Amount_Local,
		@FI_Doc,
		@GrossAmount
)
END

GO

