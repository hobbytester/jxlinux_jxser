--description: 武陵山 伏流洞火蜥蜴　天王40级任务
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) and (HaveItem(93) == 0) and (random(0,99) < 50) then
		AddEventItem(93)
		Msg2Player("L蕐 頲 v秠 th籲 l籲 l鯽. ")
		AddNote("T筰 ng Ph鬰 L璾 V� L╪g s琻, nh b筰 th籲 l籲 l鯽 l蕐 頲 mi課g v秠. ")
	end
end;	
