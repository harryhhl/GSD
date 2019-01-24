
print 'Add Column Style_Desc'
if not exists(select * from syscolumns where name= 'Style_Desc' and id=object_id('SO_Plan'))
	alter table SO_Plan add Style_Desc varchar(160)
go

if not exists(select * from syscolumns where name= 'Style_Desc' and id=object_id('SO_Plan_Hist'))
	alter table SO_Plan_Hist add Style_Desc varchar(160)
go

if not exists(select * from syscolumns where name= 'Style_Desc' and id=object_id('SO_Plan_Tmp'))
	alter table SO_Plan_Tmp add Style_Desc varchar(160)
go

print 'Create table SPS_Fabric'
if exists(select * from sysobjects where name='SPS_Fabric')
	print 'Table SPS_Fabric is exists'
else
begin

	Create table SPS_Fabric
	(
		Projection_NO varchar(8),
		Sequence_No int,
		Item_No int,
		SO_NO varchar(10),
		PO_NO varchar(35),
		Mill varchar(10),
		Mill_Desc varchar(80),
		Category varchar(3),
		Body_Ex_Mill_Date datetime,
		Trim_Ex_Mill_Date datetime,
		printing_Fty varchar(10),
		EMB_Fty varchar(10),
		Washing_Method varchar(3),
		Special_ACC varchar(5),
		Body_Confirm varchar(1),
		Trims_Confirm varchar(1),
		Remarks nvarchar(80),
		CONSTRAINT [PK_SPS_Fabric] PRIMARY KEY NONCLUSTERED 
		(
			Projection_NO ASC,
			Sequence_No ASC,
			Item_No ASC,
			SO_NO ASC,
			PO_NO ASC
		)
	)
end
	go


print 'Create table SPS_Fabric_Tmp'
if exists(select * from sysobjects where name='SPS_Fabric_Tmp')
	print 'Table SPS_Fabric_Tmp is exists'
else
begin
	Create table SPS_Fabric_Tmp
	(
		Projection_NO varchar(8),
		Sequence_No int,
		Item_No int,
		SO_NO varchar(10),
		PO_NO varchar(35),
		Mill varchar(10),
		Mill_Desc varchar(80),
		Category varchar(3),
		Body_Ex_Mill_Date datetime,
		Trim_Ex_Mill_Date datetime,
		printing_Fty varchar(10),
		EMB_Fty varchar(10),
		Washing_Method varchar(3),
		Special_ACC varchar(5),
		Body_Confirm varchar(1),
		Trims_Confirm varchar(1),
		Remarks nvarchar(80),
		CONSTRAINT [PK_FSPS_Fabric_Tmp] PRIMARY KEY NONCLUSTERED 
		(
			Projection_NO ASC,
			Sequence_No ASC,
			Item_No ASC,
			SO_NO ASC,
			PO_NO ASC
		)
	)
end
go



print 'Create table SPS_Fabric_Hist'
if exists(select * from sysobjects where name='SPS_Fabric_Hist')
	print 'table SPS_Fabric_Hist is exists'
else
begin
	Create table SPS_Fabric_Hist
	(
		Projection_NO varchar(8),
		Sequence_No int,
		Item_No int,
		SO_NO varchar(10),
		PO_NO varchar(35),
		Mill varchar(10),
		Mill_Desc varchar(80),
		Category varchar(3),
		Body_Ex_Mill_Date datetime,
		Trim_Ex_Mill_Date datetime,
		printing_Fty varchar(10),
		EMB_Fty varchar(10),
		Washing_Method varchar(3),
		Special_ACC varchar(5),
		Body_Confirm varchar(1),
		Trims_Confirm varchar(1),
		Remarks nvarchar(80),
		History_DateTime datetime,
		CONSTRAINT [PK_SPS_Fabric_Hist] PRIMARY KEY NONCLUSTERED 
		(
			Projection_NO ASC,
			Sequence_No ASC,
			Item_No ASC,
			SO_NO ASC,
			PO_NO ASC,
			History_DateTime ASC
		)
	)
end
go


print 'alter SPS_Fabric set column Remarks type to nvarchar(80)'
alter table SPS_Fabric_Hist alter column Remarks nvarchar(80)
alter table SPS_Fabric_Tmp alter column Remarks nvarchar(80)
alter table SPS_Fabric alter column Remarks nvarchar(80)

