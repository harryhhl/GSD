USE [GSDDB]
GO

/****** Object:  Table [dbo].[SO_Plan_2nd]    Script Date: 03/14/2016 12:23:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SO_Plan_2nd](
	[Company_Code] [varchar](4) NULL,
	[Sales_Org] [varchar](4) NULL,
	[SO_No] [varchar](10) NOT NULL,
	[SO_ItemNo] [int] NOT NULL,
	[SO_Type] [varchar](4) NOT NULL,
	[Country_Origin] [varchar](3) NOT NULL,
	[Factory_Group] [varchar](4) NOT NULL,
	[KnitStruct_MainCode][varchar](1) NOT NULL,
	[KnitStruct_MainCat] [varchar](30) NOT NULL,
	[KnitStruct_SubCode] [varchar](3) NOT NULL,
	[KnitStruct_SubCat] [varchar](30) NOT NULL,
	[RawMaterial_Info] [nvarchar](132) NOT NULL,
	[FG_LongDesc] [nvarchar](132) NOT NULL
 CONSTRAINT [PK_SO_Plan_2nd] PRIMARY KEY CLUSTERED 
(
	[SO_No] ASC,
	[SO_ItemNo] ASC,
	[SO_Type] ASC,
	[Country_Origin] ASC,
	[Factory_Group] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


