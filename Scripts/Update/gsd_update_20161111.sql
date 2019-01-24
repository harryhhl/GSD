ALTER TABLE dbo.ZQTN_RM_Hist ADD
	ZYARN_TYPE int NULL,
	ZSUPPLIER varchar(30) NULL,
	ZYARN_ACTICLE_NO varchar(30) NULL,
	ZYARN_REMARKS varchar(200) NULL,
	ZYARN_ID varchar(7) NULL

GO

ALTER TABLE dbo.ZQTN_RM_Tmp ADD
	ZYARN_TYPE int NULL,
	ZSUPPLIER varchar(30) NULL,
	ZYARN_ACTICLE_NO varchar(30) NULL,
	ZYARN_REMARKS varchar(200) NULL,
	ZYARN_ID varchar(7) NULL

GO

ALTER TABLE dbo.ZQTN_RM ADD
	ZYARN_TYPE int NULL,
	ZSUPPLIER varchar(30) NULL,
	ZYARN_ACTICLE_NO varchar(30) NULL,
	ZYARN_REMARKS varchar(200) NULL,
	ZYARN_ID varchar(7) NULL

GO


------
USE [GSDDB]
GO
/****** Object:  StoredProcedure [dbo].[p_Ins_ZQTN_RM_Tmp]    Script Date: 11/23/2016 17:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[p_Ins_ZQTN_RM_Tmp]
	@BUKRS varchar(4),
	@VBELN varchar(10),
	@RBELN varchar(10),
	@RPOSN varchar(6),
	@MATNR varchar(18),
	@MAKTX nvarchar(max),
	@MENGE decimal(18, 3),
	@MEINS varchar(3),
	@WASTAGE decimal(18, 2),
	@KBETR decimal(18, 2),
	@NETWR decimal(18, 2),
	@WAERS varchar(5),
	@SEL varchar(1),
	@ZMOD varchar(1),
	@ZNEW varchar(1),
	@ZOLD varchar(1),
	@ZMAT varchar(1),
	@FLAG varchar(1) ,
	@ZYARN_TYPE int,
	@ZSUPPLIER varchar(30),
	@ZYARN_ACTICLE_NO varchar(30),
	@ZYARN_REMARKS varchar(200),
	@ZYARN_ID varchar(7)
    
AS 
BEGIN
set nocount on

Insert into [dbo].[ZQTN_RM_Tmp](
			BUKRS,
			VBELN,
			RBELN,
			RPOSN,
			MATNR,
			MAKTX,
			MENGE,
			MEINS,
			WASTAGE,
			KBETR,
			NETWR,
			WAERS,
			SEL,
			ZMOD,
			ZNEW,
			ZOLD,
			ZMAT,
			FLAG ,
			ZYARN_TYPE,
			ZSUPPLIER,
			ZYARN_ACTICLE_NO,
			ZYARN_REMARKS,
			ZYARN_ID
          )
values(
	@BUKRS,
	@VBELN,
	@RBELN,
	@RPOSN,
	@MATNR,
	@MAKTX,
	@MENGE,
	@MEINS,
	@WASTAGE,
	@KBETR,
	@NETWR,
	@WAERS,
	@SEL,
	@ZMOD,
	@ZNEW,
	@ZOLD,
	@ZMAT,
	@FLAG,
	@ZYARN_TYPE,
	@ZSUPPLIER,
	@ZYARN_ACTICLE_NO,
	@ZYARN_REMARKS,
	@ZYARN_ID 
)

END 
