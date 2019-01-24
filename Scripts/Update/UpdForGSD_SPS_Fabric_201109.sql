/**
处理SPS Status Report的时候发现Remarks不能显示中文，把此字段转换成nvarchar的类型后再试，
发现ETL从SAP里面取到的数据中文已经变成#号，目前没办法通过ELT来解决这个问题，所以暂时没更新。
	-- Rocky 02 Sep 2011
print 'alter SPS_Fabric set column Remarks type to nvarchar(80)'
alter table SPS_Fabric_Hist alter column Remarks nvarchar(80)
alter table SPS_Fabric_Tmp alter column Remarks nvarchar(80)
alter table SPS_Fabric alter column Remarks nvarchar(80)
**/