print 'alter SPS_Fabric set column Remarks type to nvarchar(80)'
alter table SPS_Fabric_Hist alter column Remarks nvarchar(80)
alter table SPS_Fabric_Tmp alter column Remarks nvarchar(80)
alter table SPS_Fabric alter column Remarks nvarchar(80)