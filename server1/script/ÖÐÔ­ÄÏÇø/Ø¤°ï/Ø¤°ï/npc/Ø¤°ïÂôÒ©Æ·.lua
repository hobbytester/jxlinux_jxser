--丐帮 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("T蕋 c� c竎 dc ph萴 � y u do huynh  c竔 bang t� b祇 ch� c� ", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Bang ch� c� l謓h: Dc ph萴 c馻 b鎛 m玭 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
	Sale(74)
end;

function no()
end;
