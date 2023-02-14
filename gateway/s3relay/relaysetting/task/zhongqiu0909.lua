Include("\\script\\tong\\tong_header.lua")
local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

local tbLadderId = 
{
	10263,10264,10265
}
local tbTongTSK_Exploit = 
{
	TONGTSK_Gongde_meici,
	TONGTSK_Gongde_meizhou,
	TONGTSK_Gongde_Total,
}


IncludeLib("TONG")
function TaskShedule()
	--设置方案名称
	TaskName("中秋神奇榕树")
	
	local  nInterval = 30
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数
	

	TaskCountLimit(0)

	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "MidA200909",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

local clearLaddderData = function (nId)
	OutputMsg("clear ladder ing ...");
	Ladder_ClearLadder(%tbLadderId[nId])
	local nTongID = TONG_GetFirstTong();
	while(nTongID and nTongID ~= 0)do
		TONG_ApplySetTaskValue(nTongID, %tbTongTSK_Exploit[nId], 0);
		nTongID = TONG_GetNextTong(nTongID);
	end
	OutputMsg("clear ladder over");
end

local _PublicRank = function(nId)
	local szName, nValue = Ladder_GetLadderInfo(%tbLadderId[nId], 1);
	local szMsg = ""
	if szName ~= nil and szName ~= "" then
		if nId == 1 then
			szMsg = format("Ch骳 m鮪g %s %s  t 頲 h筺g nh蕋, th祅h vi猲 trong bang h閕  甶襲 ki謓 c� th� nh薾 %u kinh nghi謒",szName, "B秐g x誴 h筺g t n祔", 6e7)
		elseif nId == 2 then
			szMsg = format("Ch骳 m鮪g %s %s  t 頲 h筺g nh蕋, th祅h vi猲 trong bang h閕  甶襲 ki謓 c� th� nh薾 %u kinh nghi謒",szName, "B秐g x誴 h筺g tu莕", 15e7)
		elseif nId == 3 then
			szMsg = format("Ch骳 m鮪g %s %s  t 頲 h筺g nh蕋, th祅h vi猲 trong bang h閕  甶襲 ki謓 c� th� nh薾 %u kinh nghi謒",szName, "B秐g x誴 h筺g su鑤 th阨 gian ho箃 ng", 20e7)
		end
	end
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	
	if nDate < 091211 or nDate > 100124 then
		return
	end
	
	
	--公告
	if nTime >= 2000 and nTime < 2030 then
		local szMsg = ""
		if ( nWeek == 5 or nWeek == 6 or nWeek == 0)  then
			%_PublicRank(1)
		end
		if nWeek == 0 then
			%_PublicRank(2)
		end
		if nDate == 100124 then
			
			%_PublicRank(3)
		end
	end
	
	
	local callnpc_flag = 0
	
	if (nTime >= 1930 and nTime < 2000 ) and ( nWeek == 5 or nWeek == 6 or nWeek == 0) then
		callnpc_flag = 1	
	elseif (nTime >= 0000 and nTime < 0100) then
		%clearLaddderData(1)
		if nWeek == 1 then
			%clearLaddderData(2)
		end
		
	end
	
	local tbPos = 
	{
		{121,226*8*32,275*16*32 },
		{100,183*8*32,203*16*32 },
		{101,171*8*32,198*16*32 },
		{174,218*8*32,192*16*32 },
		{53, 220*8*32,200*16*32},
		{20, 432*8*32,359*16*32},
		{153,232*8*32,180*16*32 },
		{99, 189*8*32,223*16*32 },
	}
	if callnpc_flag == 1 then
		local nId = random(1, getn(tbPos))
		--刷
		local szExeMsg = format("dwf \\script\\event\\zhongqiu_jieri\\200909\\rongshu\\addnpc.lua tbZhongQiu200909:AddTree(%d,%d,%d,%d)", 1496, tbPos[nId][1],tbPos[nId][2],tbPos[nId][3])
		OutputMsg(szExeMsg)
		GlobalExecute(szExeMsg)
		--tbPos[nId], tbPos[4] = tbPos[4], tbPos[nId]
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end