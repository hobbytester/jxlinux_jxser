--西南北区 峨嵋派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(208) == 1 then
		allbrother_0801_FindNpcTaskDialog(208)
		return 0;
	end
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("th秓 dc tr猲 n骾 Nga Mi r蕋 nhi襲,  t� b鎛 ph竔 d飊g nh鱪g lo筰 th秓 dc n祔  l祄 ra nhi襲 th莕 dc tr� thng. ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h: Dc ph萴 m玭 ph竔 ch� b竛 cho t� mu閕 ng m玭!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;
