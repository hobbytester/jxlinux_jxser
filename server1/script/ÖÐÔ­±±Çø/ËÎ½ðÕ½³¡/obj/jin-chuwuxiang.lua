--中原北区 宋金战场 金方储物箱
-- lixin 2004-10-13

function main(sel)
if (GetCurCamp() == 2) then    --判断如果属于金方阵营
	OpenBox();		--弹出储物箱物品框和玩家物品框，以便于玩家进行物品和金钱的存取
else
	Talk(1,"","B鋘 Nam man to gan, ng玭g cu錸g mu鑞 chi誱 rng  c馻 ngi Kim ta, th藅 l� n籱 m� gi鱝 ban ng祔. ")
end;
end;