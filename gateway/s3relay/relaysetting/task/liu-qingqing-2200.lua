Include("\\RelaySetting\\Task\\bosswhere.lua")
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 52322
Interval = 1440;
Count = 0;
StartHour=23;
StartMin=0;

function NewBoss()
	str = "Nghe n�i ���ng M�n Li�u Thanh Thanh �� h� s�t r�t nhi�u cao th� giang h�!"
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["liuqingqing"][Random(getn(where.liuqingqing))+1], 523, 90;
end;



