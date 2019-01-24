--如果不存在表SPS_Fabric_Hist就创建
IF Object_ID(N'SPS_Fabric_Hist') IS NULL
BEGIN
	CREATE TABLE [dbo].[SPS_Fabric_Hist](
		[Projection_NO] [varchar](8) NOT NULL,
		[Sequence_No] [int] NOT NULL,
		[Item_No] [int] NOT NULL,
		[SO_NO] [varchar](10) NOT NULL,
		[PO_NO] [varchar](35) NOT NULL,
		[Mill] [varchar](10) NULL,
		[Mill_Desc] [varchar](80) NULL,
		[Category] [varchar](3) NULL,
		[Body_Ex_Mill_Date] [nvarchar](80) NULL,
		[Trim_Ex_Mill_Date] [nvarchar](80) NULL,
		[printing_Fty] [varchar](10) NULL,
		[EMB_Fty] [varchar](10) NULL,
		[Washing_Method] [varchar](3) NULL,
		[Special_ACC] [varchar](20) NULL,
		[Body_Confirm] [varchar](1) NULL,
		[Trims_Confirm] [varchar](1) NULL,
		[Remarks] [varchar](80) NULL,
		[Heat_Transfer_Lable] [nvarchar](10) NULL,
	 CONSTRAINT [PK_FSPS_Fabric_Hist] PRIMARY KEY NONCLUSTERED 
	(
		[Projection_NO] ASC,
		[Sequence_No] ASC,
		[Item_No] ASC,
		[SO_NO] ASC,
		[PO_NO] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
	PRINT 'Table SPS_Fabric_Hist Is Already Exists!'
GO

--如果不存在表SPS_Fabric_Tmp就创建
IF Object_ID(N'SPS_Fabric_Tmp') IS NULL
BEGIN
	CREATE TABLE [dbo].[SPS_Fabric_Tmp](
		[Projection_NO] [varchar](8) NOT NULL,
		[Sequence_No] [int] NOT NULL,
		[Item_No] [int] NOT NULL,
		[SO_NO] [varchar](10) NOT NULL,
		[PO_NO] [varchar](35) NOT NULL,
		[Mill] [varchar](10) NULL,
		[Mill_Desc] [varchar](80) NULL,
		[Category] [varchar](3) NULL,
		[Body_Ex_Mill_Date] [nvarchar](80) NULL,
		[Trim_Ex_Mill_Date] [nvarchar](80) NULL,
		[printing_Fty] [varchar](10) NULL,
		[EMB_Fty] [varchar](10) NULL,
		[Washing_Method] [varchar](3) NULL,
		[Special_ACC] [varchar](20) NULL,
		[Body_Confirm] [varchar](1) NULL,
		[Trims_Confirm] [varchar](1) NULL,
		[Remarks] [varchar](80) NULL,
		[Heat_Transfer_Lable] [nvarchar](10) NULL,
	 CONSTRAINT [PK_FSPS_Fabric_Tmp] PRIMARY KEY NONCLUSTERED 
	(
		[Projection_NO] ASC,
		[Sequence_No] ASC,
		[Item_No] ASC,
		[SO_NO] ASC,
		[PO_NO] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE 
BEGIN
	PRINT 'Table SPS_Fabric_Tmp Is Already Exists!'
	IF COL_LENGTH('SPS_Fabric_Tmp','Heat_Transfer_Lable') IS NULL
	BEGIN
		PRINT 'Update Table SPS_Fabric_Tmp ADD Heat_Transfer_Lable'
		ALTER TABLE SPS_Fabric_Tmp ADD Heat_Transfer_Lable nvarchar(10) NULL
	END
END
GO

--如果不存在表SPS_Fabric_Tmp2就创建
IF Object_ID(N'SPS_Fabric_Tmp2') IS NULL
BEGIN
	CREATE TABLE [dbo].[SPS_Fabric_Tmp2](
		[Projection_NO] [varchar](8) NOT NULL,
		[Sequence_No] [int] NOT NULL,
		[Item_No] [int] NOT NULL,
		[SO_NO] [varchar](10) NOT NULL,
		[PO_NO] [varchar](35) NOT NULL,
		[Mill] [varchar](10) NULL,
		[Mill_Desc] [varchar](80) NULL,
		[Category] [varchar](3) NULL,
		[Body_Ex_Mill_Date] [nvarchar](80) NULL,
		[Trim_Ex_Mill_Date] [nvarchar](80) NULL,
		[printing_Fty] [varchar](10) NULL,
		[EMB_Fty] [varchar](10) NULL,
		[Washing_Method] [varchar](3) NULL,
		[Special_ACC] [varchar](20) NULL,
		[Body_Confirm] [varchar](1) NULL,
		[Trims_Confirm] [varchar](1) NULL,
		[Remarks] [varchar](80) NULL,
		[Heat_Transfer_Lable] [nvarchar](10) NULL,
	 CONSTRAINT [PK_FSPS_Fabric_Tmp2] PRIMARY KEY NONCLUSTERED 
	(
		[Projection_NO] ASC,
		[Sequence_No] ASC,
		[Item_No] ASC,
		[SO_NO] ASC,
		[PO_NO] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
	PRINT 'Table SPS_Fabric_Tmp2 Is Already Exists!'
GO	

--创建存储过程 p_Insert_SPS_Fabric_Tmp2
IF Object_ID('p_Insert_SPS_Fabric_Tmp2') IS NOT NULL
	DROP PROC p_Insert_SPS_Fabric_Tmp2
GO
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Author  :John    
Date  :05 May 2015  
Decription :往[SPS_Fabric_Tmp2]表中插入记录    
 
	the latest update: 2015-05-05 16:00
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/  

CREATE procedure [dbo].[p_Insert_SPS_Fabric_Tmp2]
	@Projection_NO varchar(8),
	@Sequence_No int,
	@Item_No int,
	@SO_NO varchar(10),
	@PO_NO varchar(35),
	@Mill varchar(10),
	@Mill_Desc varchar(80),
	@Category varchar(3),
	@Body_Ex_Mill_Date nvarchar(80),
	@Trim_Ex_Mill_Date nvarchar(80),
	@printing_Fty varchar(10),
	@EMB_Fty varchar(10),
	@Washing_Method varchar(3),
	@Special_ACC nvarchar(20),
	@Body_Confirm varchar(1),
	@Trims_Confirm varchar(1),
	@Remarks nvarchar(80),
	@Heat_Transfer_Lable varchar(10)
    
AS 
SET NOCOUNT ON

IF not exists(select * from SPS_Fabric_Tmp2 where Projection_No=@Projection_No and Sequence_No=@Sequence_No and Item_No=@Item_No and SO_NO=@SO_NO and PO_NO=@PO_NO) 
BEGIN
Insert into [dbo].[SPS_Fabric_Tmp2](
		Projection_NO,
		Sequence_No,
		Item_No,
		SO_NO,
		PO_NO,
		Mill,
		Mill_Desc,
		Category,
		Body_Ex_Mill_Date,
		Trim_Ex_Mill_Date,
		printing_Fty,
		EMB_Fty,
		Washing_Method,
		Special_ACC,
		Body_Confirm,
		Trims_Confirm,
		Remarks,
		Heat_Transfer_Lable
          )
values(
		@Projection_NO,
		@Sequence_No,
		@Item_No,
		@SO_NO,
		@PO_NO,
		@Mill,
		@Mill_Desc,
		@Category,
		@Body_Ex_Mill_Date,
		@Trim_Ex_Mill_Date,
		@printing_Fty,
		@EMB_Fty,
		@Washing_Method,
		@Special_ACC,
		@Body_Confirm,
		@Trims_Confirm,
		@Remarks,
		@Heat_Transfer_Lable
)
END
GO
