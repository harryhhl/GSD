/**
����SPS Status Report��ʱ����Remarks������ʾ���ģ��Ѵ��ֶ�ת����nvarchar�����ͺ����ԣ�
����ETL��SAP����ȡ�������������Ѿ����#�ţ�Ŀǰû�취ͨ��ELT�����������⣬������ʱû���¡�
	-- Rocky 02 Sep 2011
print 'alter SPS_Fabric set column Remarks type to nvarchar(80)'
alter table SPS_Fabric_Hist alter column Remarks nvarchar(80)
alter table SPS_Fabric_Tmp alter column Remarks nvarchar(80)
alter table SPS_Fabric alter column Remarks nvarchar(80)
**/