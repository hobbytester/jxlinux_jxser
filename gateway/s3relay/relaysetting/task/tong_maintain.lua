--帮会维护脚本
--by luobaohang 06/03/10
IncludeLib("TONG")
-- 帮会维护定时器
INTERVAL_TIME = 1440	-- 每24小时触发7次
function TaskShedule()
	TaskName("B秓 tr� h祅g ng祔");
	-- 1440分钟一次
	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间(0点0分)
	TaskTime(0, 0);
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("Kh雐 ng b秓 tr� bang h閕.......................")
	while (nTongID ~= 0)do
		OutputMsg("ng ti課 h祅h b秓 tr� bang:  "..TONG_GetName(nTongID))
		TONG_ApplyMaintain(nTongID)
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
