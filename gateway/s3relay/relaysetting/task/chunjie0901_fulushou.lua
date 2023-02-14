-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版一 2009年新年-福禄寿小游戏

-- Edited by 子非魚
-- 2009/01/07 15:58
-- 
-- ======================================================

function TaskShedule()
	TaskName("2009Xinnian_FuLuShou");
	TaskInterval(60);
	local nhour = tonumber(date("%H"));
	local nstarth = 0;
	if nhour >= 23 then
		nstarth = 12;
	else
		tb_xmas2009_strattime = {12,19};
		for ni,nh in tb_xmas2009_strattime do
			if nh >= nhour then
				nstarth = nh;
				break
			end
		end
	end
	
	TaskTime(nstarth, 0);
	OutputMsg(format("2009Xinnian_FuLuShou %d:%d Start...",nstarth,0));
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"));
	if ndate < 09011612 or ndate > 09021519 then
		return 
	end
	
	local nhm = tonumber(date("%H%M"))
	
	if nhm >= 1200 and nhm < 1300 then
		--通过pass
	elseif nhm >= 1900 and nhm < 2000 then
		--通过pass
	else
		return
	end
	
	local nrand = random(1, 2);
	local narry = random(1, 6);
	
	GlobalExecute(format("dwf \\script\\event\\chunjie_jieri\\200901\\fulushou\\findnpc.lua chunjie0901_findnpc(%d, %d, %d)",nrand, ndate, narry));
	
	local szMsg = "Hi謓 t筰 3 v� th莕 c馻 ch髇g ta 產ng mu鑞 t譵 nhau  c飊g l猲 Thi猲 ёnh b竔 ki課 Ng鋍 Ho祅g, c竎 nh﹏ s� h穣 c飊g gi髉 h�.";
	GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg));
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
end

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

