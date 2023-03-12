Include("\\script\\missions\\qianchonglou\\rule.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")

-- §ãng tÝnh n¨ng thiªn trïng l©u - Modified By DinhHQ - 20120402
-- H­íng dÉn: Gäi hµm thientrunglau tõ lÖnh bµi bÊt kú ®Ó vµo Map Thiªn Trïng L©u

function thientrunglau()
--do return end
	local szTitle = "Tham gia Thiªn Trïng L©u, mçi ng­êi ch¬i sÏ nhËn ®­îc <color=yellow>200 ®iÓm c¬ së <color>dïng ®Ó mua ®¹n. Cã <color=yellow>7 lo¹i ®¹n kh¸c nhau <color>trÞ gi¸ tõ 1 ®Õn 7 ®iÓm. §¹n cµng m¾c th× tØ lÖ tiªu diÖt qu¸i vËt cµng lín. Tiªu diÖt qu¸i vËt sÏ nhËn ®­îc ®iÓm th­ëng t­¬ng øng. Khi ®iÓm c¬ së bÞ tiªu hao hÕt, th× còng cã thÓ dïng ®iÓm phÇn th­ëng ®Ó mua ®¹n."
	local tbOpt =
	{
		{"Ta muèn tham gia", signup},
		{"Ta muèn xem ®iÓm", score},
		{"Mua B¹o né lÖnh phï(200 v¹n)", buyitem},
		{"NhËn l·nh phÇn th­ëng", give_award},
		{"NhËn ®iÓm c¬ së", give_basepoint},
		{"NhËn ®iÓm th­ëng", give_score},
		{"Hñy bá "}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function signup()
	if tbPlayerHandle:CheckDate() ~= 1 then
		local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
		if nAwardPoint > 100 then
			return Talk(1, "", "Ng­¬i ph¶i nhËn phÇn th­ëng tr­íc ®ã míi tiÕp tôc tham gia ®­îc.")
		else
			tbPlayerHandle:SetAwardPoint(0)
			Msg2Player(format("%d ®iÓm th­ëng cßn l¹i ®· ®­îc reset.", nAwardPoint))
		end
	end
	if ST_IsTransLife() ~= 1  and GetLevel() < 120 then
		return Talk(1, "", format("CÊp %d trë xuèng kh«ng thÓ tham gia ho¹t ®éng nµy", 120))
	end
	local pDungeonType = DungeonType["endless tower"]
	local pChallenger = tbChallenger:new()
	pChallenger:Update()
	if pChallenger:GetPlayTime() <= 0 then
		return Talk(1, "", "Thêi gian h«m nay cña c¸c h¹ ®· sö dông hÕt")
	end
	if pDungeonType then
		local pDungeon = pDungeonType:new_dungeon(pDungeonType.TEMPLATE_MAP_ID, {pChallenger})
		if pDungeon then
			pChallenger:Update()
			local nMapId, nX, nY = pDungeon:GetTowerPos()
			NewWorld(nMapId, nX, nY)
		else
			print("fail")
		end
	end
end

function give_award()
    local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
	local PushAward = floor(nAwardPoint/100)
	local Scoresave = (nAwardPoint-PushAward*100)
	local szTitle = "<npc>100 ®iÓm nhËn ®­îc 1 lÇn quay sè th­ëng (l­u ý:sè d­ vÉn cßn),víi nhiÒu k× tr©n dÞ b¶o ,ng­¬i cã muèn ®æi ®iÓm ®Ó lÊy phÇn th­ëng kh«ng ?\n§iÓm th­ëng hiÖn t¹i:<color=green>"..nAwardPoint.."<color>\nSè lÇn quay th­ëng:<color=yellow>"..PushAward.."<color>\n§iÓm th­ëng cßn d­ :<color=red>"..Scoresave.."<color>"
	local tbOpt =
	{
		{"NhËn th­ëng", give_award2},
		{"Trë l¹i ",thientrunglau}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function give_award2()
	local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
    	local PushAward = floor(nAwardPoint/100)
	local Scoresave = (nAwardPoint-(PushAward*100))
	if nAwardPoint <= 0 or PushAward < 1 then
		return Talk(1, "","§iÓm phÇn th­ëng cña c¸c h¹ kh«ng ®ñ ®Ó sö dông phÇn th­ëng nµy")
	end

	for i=1,PushAward do
        		Give_Award()
	end

	Msg2Player(format("Ng­¬i ®· sö dông %d ®iÓm th­ëng, cßn l¹i %d ®iÓm.", PushAward * 100, Scoresave))
	tbPlayerHandle:SetAwardPoint(Scoresave)
end

function Give_Award()
    local ThientrunglauAward = {
            [5555] = {--vat pham event--47
            ------------------------------------------------DIEM EXP--------------------------------------------------------------
            {szName = "§iÓm Kinh NghiÖm", nRate=25, nExp = 100e6},
            {szName = "§iÓm Kinh NghiÖm", nRate=15, nExp = 200e6},
            {szName = "§iÓm Kinh NghiÖm", nRate=10, nExp = 500e6},
        },
    }

    tbAwardTemplet:Give(ThientrunglauAward[5555], 1, {"Qianchonglou", "Thiªn Trïng L©u"})
    return 0
end

function score()
    local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
	local szTitle = "<npc>Sè ®iÓm <color=yellow>Thiªn Trïng L©u<color> hiÖn t¹i lµ : <color=green>"..nAwardPoint.."<color> ®iÓm"
	local tbOpt =
	{
		{"Trë l¹i ",thientrunglau}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function give_score()
    g_AskClientNumberEx(0, 10000, "NhËp Sè §iÓm:", {give_score2, {nIndex}})
end

function give_score2(nCount)
    tbPlayerHandle:SetAwardPoint(nCount)
    Msg2Player("NhËn ®­îc <color=green>"..nCount.."<color> §iÓm Thiªn Trïng L©u!")
end

function give_basepoint()
    g_AskClientNumberEx(0, 10000, "NhËp Sè l­îng:", {give_basepoint2, {nIndex}})
end

function give_basepoint2(nCount)
    tbPlayerHandle:AddBasePoint(nCount)
    Msg2Player("NhËn ®­îc <color=green>"..nCount.."<color> ®iÓm c¬ së!")
end

function buyitem()
    g_AskClientNumberEx(0, 8, "NhËp Sè L­îng:", {buyitem2, {nIndex}})
end

function buyitem2(nCount)
    local i = 2000000*nCount
    if GetCash() < i then --kiem tra tien
        Talk(1,"","Kh«ng ®ñ <color=yellow>Ng©n l­îng<color>. Cã tiÒn råi h·y quay l¹i gÆp ta!")
    else
        Pay(i)
        for i=1, nCount do
            AddItem(6,1,3150,1,0,0)
        end
        Msg2Player("NhËn ®­îc <color=green>"..nCount.."<color> B¹o né lÖnh phï!")
    end
end
