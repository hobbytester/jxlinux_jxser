--description: 唐门普通弟子 竹海第二关
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(9) == 1 then
		allbrother_0801_FindNpcTaskDialog(9)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 20) then					--入门任务
		if (HaveItem(33) == 1) then
			Talk(1,"enroll_V2_Q1","G藋 tr骳 n祔 ng r錳! B﹜ gi� xin tr� l阨 m閠 v蕁 !")
		else
			Talk(1,"","C� 頲 <color=Red>g藋 tr骳 m祏 xanh<color> r錳 n t譵 ta!")
		end
	elseif (Uworld37 >= 60) and (Uworld37 < 127) then						--已经过了这一关
		if (HaveItem(34) == 1) then
			Talk(1,"","Mu鑞 qua 秈 thu薾 l頸, ngi ph秈 l蕐  3 c﹜ tr骳, sau  a cho ng m玭 � l鑙 ra.")
		else
			AddEventItem(34)
			Talk(1,"","T筰 sao ngi l筰 v鴗 g藋 tr骳 trong r鮪g? Ta s� gi髉 ngi nh苩 l筰, ng v鴗 lung tung n鱝! ")
		end
	else
		Talk(1,"","� y th阨 gian d礽 m韎 bi誸 th� ra Чi M� h莡 n祔 c騨g bi誸 t輓h ngi.")
	end
end;

function enroll_V2_Q1()
	Say("C鰑 cung tr薾 c� 9 �, m鏸 � c� 1 s�, sau khi 甶襫  r錳, b蕋 lu薾 ngang hay d鋍 c� 3 s� c閚g l筰 c� t鎛g l� 15, ngi bi誸 l祄 kh玭g? H祅g th� nh蕋 l�:", 3, "4, 9, 2 /False1", "2, 4, 9 /False1", "2, 9, 4 /enroll_V2_Q2")
end;

function False1()
	Talk(1,"","Kh玭g ng! M蕐 con <color=Red>Чi M� h莡, Чi D� h莡<color> xem ra c遪 th玭g minh h琻 ngi!")
end;

function enroll_V2_Q2()
	Say("Цp ng r錳! C遪 h祅g th� 2 頲 ch璦?", 3, "7, 5, 3 /enroll_V2_Q3", "5, 3, 7 /False2", "5, 7, 3 /False2")
end;

function False2()
	Talk(1,"","Kh玭g ng! H穣 甶 h醝 <color=Red>Чi M� h莡, Чi D� h莡<color>甶! ")
end;

function enroll_V2_Q3()
	Say("ng r錳! V藋 h祅g cu鑙 c飊g 甶襫 th� n祇:", 3, "6, 8, 1 /False3", "8, 1, 6 /False3", "6, 1, 8 /enroll_V2_prise")
end;

function False3()
	Talk(1,"","Kh玭g ng! T筰 sao kh玭g 甶 h醝 <color=Red>Чi M� h莡, Чi D� h莡<color> ch�?")
end;

function enroll_V2_prise()
	Talk(1,"","T鑤 l緈! G藋 tr骳 m祏 tr緉g n祔 c馻 ngi! Qua 秈 th� 3 t譵 Tr竛g nh l蕐 <color=Red>g藋 tr骳 m祏 t輒<color> 甶!")
	AddEventItem(34)
	Msg2Player("T筰 秈 th� 2 tr� l阨 Л阯g M玭 tr竛g 甶nh v� c﹗  ma tr薾 9 s�, c� 頲 g藋 tr骳 m祏 tr緉g. ")
	Uworld37 = SetByte(GetTask(37),1,60)
	SetTask(37,Uworld37)
	AddNote("T筰 秈 th� 2 tr� l阨 Л阯g M玭 tr竛g 甶nh v� c﹗  ma tr薾 9 s�, c� 頲 g藋 tr骳 m祏 tr緉g. ")
end;
