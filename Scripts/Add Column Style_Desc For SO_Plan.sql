
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