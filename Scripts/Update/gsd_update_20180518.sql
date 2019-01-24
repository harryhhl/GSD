USE [GSDDB]
GO

/****** Object:  Table [dbo].[ZSD_FTY_INFO_CAL]    Script Date: 05/18/2018 18:17:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ZSD_FTY_INFO_CAL](
	[Client] [varchar](3) NOT NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[Sales_ProjectionNo] [varchar](14) NULL,
	[Original_SPS_ItemNo] [int] NULL,
	[TIMESTAMP] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](12) NULL,
	[LastChangeDate] [datetime] NULL,
	[LastChangeBy] [varchar](12) NULL,
	[FabricInfo] [varchar](200) NULL,
	[WashingColor] [varchar](200) NULL,
	[WashingMethod] [varchar](200) NULL,
	[LeadTime] [int] NULL,
	[SpeedOrderRemark] [varchar](10) NULL,
	[WashingLaundry] [varchar](200) NULL,
	[WashingGrade] [varchar](10) NULL,
	[WashingDailyOutput] [int] NULL,
	[WashingLeadTime] [decimal](13, 2) NULL,
	[MajorMerchandiser] [varchar](200) NULL,
	[Dyeing] [varchar](10) NULL,
	[InterlingPressing] [decimal](13, 2) NULL,
	[EMB_BW] [decimal](13, 2) NULL,
	[PRINT_BW] [decimal](13, 2) NULL,
	[LASER_BW] [decimal](13, 2) NULL,
	[Washing_Whisker] [decimal](13, 2) NULL,
	[Washing_HandSand] [decimal](13, 2) NULL,
	[Washing_Damage] [decimal](13, 2) NULL,
	[Washing_OtherHand] [decimal](13, 2) NULL,
	[Washing_SprayPP] [decimal](13, 2) NULL,
	[Washing_SweepPP] [decimal](13, 2) NULL,
	[Washing_Pigment] [decimal](13, 2) NULL,
	[Washing_Resin] [decimal](13, 2) NULL,
	[Washing_Caulking] [decimal](13, 2) NULL,
	[Washing_GenWork] [decimal](13, 2) NULL,
	[Washing_G2M_G2] [decimal](13, 2) NULL,
	[Washing_Wet] [decimal](13, 2) NULL,
	[Washing_SpecialProc] [decimal](13, 2) NULL,
	[LASER_AW] [decimal](13, 2) NULL,
	[Print_HD] [decimal](13, 2) NULL,
	[EMB_AW] [decimal](13, 2) NULL,
	[PRINT_AW] [decimal](13, 2) NULL,
	[IronMark] [decimal](13, 2) NULL,
	[Phinestone] [decimal](13, 2) NULL,
	[Others1] [decimal](13, 2) NULL,
	[Remark1] [varchar](200) NULL,
	[Others2] [decimal](13, 2) NULL,
	[Remark2] [varchar](200) NULL,
	[Others3] [decimal](13, 2) NULL,
	[Remark3] [varchar](200) NULL,
	[Others4] [decimal](13, 2) NULL,
	[Remark4] [varchar](200) NULL,
	[Others5] [decimal](13, 2) NULL,
	[Remark5] [varchar](200) NULL,
 CONSTRAINT [PK_ZSD_FTY_INFO_CAL] PRIMARY KEY CLUSTERED 
(
	[Client] ASC,
	[SO_No] ASC,
	[SO_ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


---
CREATE TABLE [dbo].[ZSD_FTY_INFO_CAL_Tmp](
	[Client] [varchar](3) NOT NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[Sales_ProjectionNo] [varchar](14) NULL,
	[Original_SPS_ItemNo] [int] NULL,
	[TIMESTAMP] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](12) NULL,
	[LastChangeDate] [datetime] NULL,
	[LastChangeBy] [varchar](12) NULL,
	[FabricInfo] [varchar](200) NULL,
	[WashingColor] [varchar](200) NULL,
	[WashingMethod] [varchar](200) NULL,
	[LeadTime] [int] NULL,
	[SpeedOrderRemark] [varchar](10) NULL,
	[WashingLaundry] [varchar](200) NULL,
	[WashingGrade] [varchar](10) NULL,
	[WashingDailyOutput] [int] NULL,
	[WashingLeadTime] [decimal](13, 2) NULL,
	[MajorMerchandiser] [varchar](200) NULL,
	[Dyeing] [varchar](10) NULL,
	[InterlingPressing] [decimal](13, 2) NULL,
	[EMB_BW] [decimal](13, 2) NULL,
	[PRINT_BW] [decimal](13, 2) NULL,
	[LASER_BW] [decimal](13, 2) NULL,
	[Washing_Whisker] [decimal](13, 2) NULL,
	[Washing_HandSand] [decimal](13, 2) NULL,
	[Washing_Damage] [decimal](13, 2) NULL,
	[Washing_OtherHand] [decimal](13, 2) NULL,
	[Washing_SprayPP] [decimal](13, 2) NULL,
	[Washing_SweepPP] [decimal](13, 2) NULL,
	[Washing_Pigment] [decimal](13, 2) NULL,
	[Washing_Resin] [decimal](13, 2) NULL,
	[Washing_Caulking] [decimal](13, 2) NULL,
	[Washing_GenWork] [decimal](13, 2) NULL,
	[Washing_G2M_G2] [decimal](13, 2) NULL,
	[Washing_Wet] [decimal](13, 2) NULL,
	[Washing_SpecialProc] [decimal](13, 2) NULL,
	[LASER_AW] [decimal](13, 2) NULL,
	[Print_HD] [decimal](13, 2) NULL,
	[EMB_AW] [decimal](13, 2) NULL,
	[PRINT_AW] [decimal](13, 2) NULL,
	[IronMark] [decimal](13, 2) NULL,
	[Phinestone] [decimal](13, 2) NULL,
	[Others1] [decimal](13, 2) NULL,
	[Remark1] [varchar](200) NULL,
	[Others2] [decimal](13, 2) NULL,
	[Remark2] [varchar](200) NULL,
	[Others3] [decimal](13, 2) NULL,
	[Remark3] [varchar](200) NULL,
	[Others4] [decimal](13, 2) NULL,
	[Remark4] [varchar](200) NULL,
	[Others5] [decimal](13, 2) NULL,
	[Remark5] [varchar](200) NULL,
 CONSTRAINT [PK_ZSD_FTY_INFO_CAL_Tmp] PRIMARY KEY CLUSTERED 
(
	[Client] ASC,
	[SO_No] ASC,
	[SO_ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----

CREATE TABLE [dbo].[ZSD_FTY_INFO_CAL_Hist](
	[Client] [varchar](3) NOT NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[Sales_ProjectionNo] [varchar](14) NULL,
	[Original_SPS_ItemNo] [int] NULL,
	[TIMESTAMP] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](12) NULL,
	[LastChangeDate] [datetime] NULL,
	[LastChangeBy] [varchar](12) NULL,
	[FabricInfo] [varchar](200) NULL,
	[WashingColor] [varchar](200) NULL,
	[WashingMethod] [varchar](200) NULL,
	[LeadTime] [int] NULL,
	[SpeedOrderRemark] [varchar](10) NULL,
	[WashingLaundry] [varchar](200) NULL,
	[WashingGrade] [varchar](10) NULL,
	[WashingDailyOutput] [int] NULL,
	[WashingLeadTime] [decimal](13, 2) NULL,
	[MajorMerchandiser] [varchar](200) NULL,
	[Dyeing] [varchar](10) NULL,
	[InterlingPressing] [decimal](13, 2) NULL,
	[EMB_BW] [decimal](13, 2) NULL,
	[PRINT_BW] [decimal](13, 2) NULL,
	[LASER_BW] [decimal](13, 2) NULL,
	[Washing_Whisker] [decimal](13, 2) NULL,
	[Washing_HandSand] [decimal](13, 2) NULL,
	[Washing_Damage] [decimal](13, 2) NULL,
	[Washing_OtherHand] [decimal](13, 2) NULL,
	[Washing_SprayPP] [decimal](13, 2) NULL,
	[Washing_SweepPP] [decimal](13, 2) NULL,
	[Washing_Pigment] [decimal](13, 2) NULL,
	[Washing_Resin] [decimal](13, 2) NULL,
	[Washing_Caulking] [decimal](13, 2) NULL,
	[Washing_GenWork] [decimal](13, 2) NULL,
	[Washing_G2M_G2] [decimal](13, 2) NULL,
	[Washing_Wet] [decimal](13, 2) NULL,
	[Washing_SpecialProc] [decimal](13, 2) NULL,
	[LASER_AW] [decimal](13, 2) NULL,
	[Print_HD] [decimal](13, 2) NULL,
	[EMB_AW] [decimal](13, 2) NULL,
	[PRINT_AW] [decimal](13, 2) NULL,
	[IronMark] [decimal](13, 2) NULL,
	[Phinestone] [decimal](13, 2) NULL,
	[Others1] [decimal](13, 2) NULL,
	[Remark1] [varchar](200) NULL,
	[Others2] [decimal](13, 2) NULL,
	[Remark2] [varchar](200) NULL,
	[Others3] [decimal](13, 2) NULL,
	[Remark3] [varchar](200) NULL,
	[Others4] [decimal](13, 2) NULL,
	[Remark4] [varchar](200) NULL,
	[Others5] [decimal](13, 2) NULL,
	[Remark5] [varchar](200) NULL,
	[History_DateTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ZSD_FTY_INFO_CAL_Hist] PRIMARY KEY CLUSTERED 
(
	[Client] ASC,
	[SO_No] ASC,
	[SO_ItemNo] ASC,
	[History_DateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------

CREATE procedure [dbo].[p_Ins_ZSD_FTY_INFO_CAL_Tmp]
	@Client varchar(3),
	@SO_No varchar(10),
	@SO_ItemNo int,
	@Sales_ProjectionNo varchar(14),
	@Original_SPS_ItemNo int,
	@TIMESTAMP varchar(50),
	@CreatedDate datetime,
	@CreatedBy varchar(12),
	@LastChangeDate datetime,
	@LastChangeBy varchar(12),
	@FabricInfo varchar(200),
	@WashingColor varchar(200),
	@WashingMethod varchar(200),
	@LeadTime int,
	@SpeedOrderRemark varchar(10),
	@WashingLaundry varchar(200),
	@WashingGrade varchar(10),
	@WashingDailyOutput int,
	@WashingLeadTime decimal(13, 2),
	@MajorMerchandiser varchar(200),
	@Dyeing varchar(10),
	@InterlingPressing decimal(13, 2),
	@EMB_BW decimal(13, 2),
	@PRINT_BW decimal(13, 2),
	@LASER_BW decimal(13, 2),
	@Washing_Whisker decimal(13, 2),
	@Washing_HandSand decimal(13, 2),
	@Washing_Damage decimal(13, 2),
	@Washing_OtherHand decimal(13, 2),
	@Washing_SprayPP decimal(13, 2),
	@Washing_SweepPP decimal(13, 2),
	@Washing_Pigment decimal(13, 2),
	@Washing_Resin decimal(13, 2),
	@Washing_Caulking decimal(13, 2),
	@Washing_GenWork decimal(13, 2),
	@Washing_G2M_G2 decimal(13, 2),
	@Washing_Wet decimal(13, 2),
	@Washing_SpecialProc decimal(13, 2),
	@LASER_AW decimal(13, 2),
	@Print_HD decimal(13, 2),
	@EMB_AW decimal(13, 2),
	@PRINT_AW decimal(13, 2),
	@IronMark decimal(13, 2),
	@Phinestone decimal(13, 2),
	@Others1 decimal(13, 2),
	@Remark1 varchar(200),
	@Others2 decimal(13, 2),
	@Remark2 varchar(200),
	@Others3 decimal(13, 2),
	@Remark3 varchar(200),
	@Others4 decimal(13, 2),
	@Remark4 varchar(200),
	@Others5 decimal(13, 2),
	@Remark5 varchar(200)
    
AS 
BEGIN
set nocount on

Insert into [dbo].[ZSD_FTY_INFO_CAL_Tmp](
	Client,
	SO_No ,
	SO_ItemNo,
	Sales_ProjectionNo,
	Original_SPS_ItemNo ,
	TIMESTAMP ,
	CreatedDate,
	CreatedBy ,
	LastChangeDate ,
	LastChangeBy ,
	FabricInfo ,
	WashingColor ,
	WashingMethod ,
	LeadTime ,
	SpeedOrderRemark ,
	WashingLaundry ,
	WashingGrade ,
	WashingDailyOutput ,
	WashingLeadTime ,
	MajorMerchandiser ,
	Dyeing ,
	InterlingPressing ,
	EMB_BW ,
	PRINT_BW ,
	LASER_BW ,
	Washing_Whisker ,
	Washing_HandSand ,
	Washing_Damage ,
	Washing_OtherHand ,
	Washing_SprayPP ,
	Washing_SweepPP ,
	Washing_Pigment ,
	Washing_Resin ,
	Washing_Caulking ,
	Washing_GenWork ,
	Washing_G2M_G2 ,
	Washing_Wet ,
	Washing_SpecialProc ,
	LASER_AW ,
	Print_HD ,
	EMB_AW ,
	PRINT_AW ,
	IronMark ,
	Phinestone ,
	Others1 ,
	Remark1 ,
	Others2 ,
	Remark2 ,
	Others3 ,
	Remark3 ,
	Others4 ,
	Remark4 ,
	Others5 ,
	Remark5 
          )
values(
	@Client,
	@SO_No ,
	@SO_ItemNo,
	@Sales_ProjectionNo,
	@Original_SPS_ItemNo ,
	@TIMESTAMP ,
	@CreatedDate,
	@CreatedBy ,
	@LastChangeDate ,
	@LastChangeBy ,
	@FabricInfo ,
	@WashingColor ,
	@WashingMethod ,
	@LeadTime ,
	@SpeedOrderRemark ,
	@WashingLaundry ,
	@WashingGrade ,
	@WashingDailyOutput ,
	@WashingLeadTime ,
	@MajorMerchandiser ,
	@Dyeing ,
	@InterlingPressing ,
	@EMB_BW ,
	@PRINT_BW ,
	@LASER_BW ,
	@Washing_Whisker ,
	@Washing_HandSand ,
	@Washing_Damage ,
	@Washing_OtherHand ,
	@Washing_SprayPP ,
	@Washing_SweepPP ,
	@Washing_Pigment ,
	@Washing_Resin ,
	@Washing_Caulking ,
	@Washing_GenWork ,
	@Washing_G2M_G2 ,
	@Washing_Wet ,
	@Washing_SpecialProc ,
	@LASER_AW ,
	@Print_HD ,
	@EMB_AW ,
	@PRINT_AW ,
	@IronMark ,
	@Phinestone ,
	@Others1 ,
	@Remark1 ,
	@Others2 ,
	@Remark2 ,
	@Others3 ,
	@Remark3 ,
	@Others4 ,
	@Remark4 ,
	@Others5 ,
	@Remark5 
)

END 


GO


------------



create VIEW [dbo].[V_ZSD_FTY_INFO_CAL]

as  

SELECT [Client]
      ,[SO_No]
      ,[SO_ItemNo]
      ,[Sales_ProjectionNo]
      ,[Original_SPS_ItemNo]
      ,[TIMESTAMP]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[LastChangeDate]
      ,[LastChangeBy]
      ,[FabricInfo]
      ,[WashingColor]
      ,[WashingMethod]
      ,[LeadTime]
      ,[SpeedOrderRemark]
      ,[WashingLaundry]
      ,[WashingGrade]
      ,[WashingDailyOutput]
      ,[WashingLeadTime]
      ,[MajorMerchandiser]
      ,[Dyeing]
      ,[InterlingPressing]
      ,[EMB_BW]
      ,[PRINT_BW]
      ,[LASER_BW]
      ,[Washing_Whisker]
      ,[Washing_HandSand]
      ,[Washing_Damage]
      ,[Washing_OtherHand]
      ,[Washing_SprayPP]
      ,[Washing_SweepPP]
      ,[Washing_Pigment]
      ,[Washing_Resin]
      ,[Washing_Caulking]
      ,[Washing_GenWork]
      ,[Washing_G2M_G2]
      ,[Washing_Wet]
      ,[Washing_SpecialProc]
      ,[LASER_AW]
      ,[Print_HD]
      ,[EMB_AW]
      ,[PRINT_AW]
      ,[IronMark]
      ,[Phinestone]
      ,[Others1]
      ,[Remark1]
      ,[Others2]
      ,[Remark2]
      ,[Others3]
      ,[Remark3]
      ,[Others4]
      ,[Remark4]
      ,[Others5]
      ,[Remark5]
  FROM [dbo].[ZSD_FTY_INFO_CAL]




GO