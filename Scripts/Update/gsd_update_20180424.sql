ALTER TABLE dbo.SD_Ship ADD
	Amount_FI numeric(18, 2) NULL,
	Amount_Local numeric(18, 2) NULL,
	FI_Doc varchar(10) NULL
GO

ALTER TABLE dbo.SD_Ship_Tmp ADD
	Amount_FI numeric(18, 2) NULL,
	Amount_Local numeric(18, 2) NULL,
	FI_Doc varchar(10) NULL
GO


ALTER TABLE dbo.SD_Ship_Hist ADD
	Amount_FI numeric(18, 2) NULL,
	Amount_Local numeric(18, 2) NULL,
	FI_Doc varchar(10) NULL
GO