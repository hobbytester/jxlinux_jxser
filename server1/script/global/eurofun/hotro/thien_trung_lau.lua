Include("\\script\\missions\\qianchonglou\\rule.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")

-- ��ng t�nh n�ng thi�n tr�ng l�u - Modified By DinhHQ - 20120402
-- H��ng d�n: G�i h�m thientrunglau t� l�nh b�i b�t k� �� v�o Map Thi�n Tr�ng L�u

function thientrunglau()
--do return end
	local szTitle = "Tham gia Thi�n Tr�ng L�u, m�i ng��i ch�i s� nh�n ���c <color=yellow>200 �i�m c� s� <color>d�ng �� mua ��n. C� <color=yellow>7 lo�i ��n kh�c nhau <color>tr� gi� t� 1 ��n 7 �i�m. ��n c�ng m�c th� t� l� ti�u di�t qu�i v�t c�ng l�n. Ti�u di�t qu�i v�t s� nh�n ���c �i�m th��ng t��ng �ng. Khi �i�m c� s� b� ti�u hao h�t, th� c�ng c� th� d�ng �i�m ph�n th��ng �� mua ��n."
	local tbOpt =
	{
		{"Ta mu�n tham gia", signup},
		{"Ta mu�n xem �i�m", score},
		{"Mua B�o n� l�nh ph�(200 v�n)", buyitem},
		{"Nh�n l�nh ph�n th��ng", give_award},
		{"Nh�n �i�m c� s�", give_basepoint},
		{"Nh�n �i�m th��ng", give_score},
		{"H�y b� "}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function signup()
	if tbPlayerHandle:CheckDate() ~= 1 then
		local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
		if nAwardPoint > 100 then
			return Talk(1, "", "Ng��i ph�i nh�n ph�n th��ng tr��c �� m�i ti�p t�c tham gia ���c.")
		else
			tbPlayerHandle:SetAwardPoint(0)
			Msg2Player(format("%d �i�m th��ng c�n l�i �� ���c reset.", nAwardPoint))
		end
	end
	if ST_IsTransLife() ~= 1  and GetLevel() < 120 then
		return Talk(1, "", format("C�p %d tr� xu�ng kh�ng th� tham gia ho�t ��ng n�y", 120))
	end
	local pDungeonType = DungeonType["endless tower"]
	local pChallenger = tbChallenger:new()
	pChallenger:Update()
	if pChallenger:GetPlayTime() <= 0 then
		return Talk(1, "", "Th�i gian h�m nay c�a c�c h� �� s� d�ng h�t")
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
	local szTitle = "<npc>100 �i�m nh�n ���c 1 l�n quay s� th��ng (l�u �:s� d� v�n c�n),v�i nhi�u k� tr�n d� b�o ,ng��i c� mu�n ��i �i�m �� l�y ph�n th��ng kh�ng ?\n�i�m th��ng hi�n t�i:<color=green>"..nAwardPoint.."<color>\nS� l�n quay th��ng:<color=yellow>"..PushAward.."<color>\n�i�m th��ng c�n d� :<color=red>"..Scoresave.."<color>"
	local tbOpt =
	{
		{"Nh�n th��ng", give_award2},
		{"Tr� l�i ",thientrunglau}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function give_award2()
	local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
    	local PushAward = floor(nAwardPoint/100)
	local Scoresave = (nAwardPoint-(PushAward*100))
	if nAwardPoint <= 0 or PushAward < 1 then
		return Talk(1, "","�i�m ph�n th��ng c�a c�c h� kh�ng �� �� s� d�ng ph�n th��ng n�y")
	end

	for i=1,PushAward do
        		Give_Award()
	end

	Msg2Player(format("Ng��i �� s� d�ng %d �i�m th��ng, c�n l�i %d �i�m.", PushAward * 100, Scoresave))
	tbPlayerHandle:SetAwardPoint(Scoresave)
end

function Give_Award()
    local ThientrunglauAward = {
            [5555] = {--vat pham event--47
            ------------------------------------------------DIEM EXP--------------------------------------------------------------
            {szName = "�i�m Kinh Nghi�m", nRate=25, nExp = 100e6},
            {szName = "�i�m Kinh Nghi�m", nRate=15, nExp = 200e6},
            {szName = "�i�m Kinh Nghi�m", nRate=10, nExp = 500e6},
        },
    }

    tbAwardTemplet:Give(ThientrunglauAward[5555], 1, {"Qianchonglou", "Thi�n Tr�ng L�u"})
    return 0
end

function score()
    local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
	local szTitle = "<npc>S� �i�m <color=yellow>Thi�n Tr�ng L�u<color> hi�n t�i l� : <color=green>"..nAwardPoint.."<color> �i�m"
	local tbOpt =
	{
		{"Tr� l�i ",thientrunglau}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function give_score()
    g_AskClientNumberEx(0, 10000, "Nh�p S� �i�m:", {give_score2, {nIndex}})
end

function give_score2(nCount)
    tbPlayerHandle:SetAwardPoint(nCount)
    Msg2Player("Nh�n ���c <color=green>"..nCount.."<color> �i�m Thi�n Tr�ng L�u!")
end

function give_basepoint()
    g_AskClientNumberEx(0, 10000, "Nh�p S� l��ng:", {give_basepoint2, {nIndex}})
end

function give_basepoint2(nCount)
    tbPlayerHandle:AddBasePoint(nCount)
    Msg2Player("Nh�n ���c <color=green>"..nCount.."<color> �i�m c� s�!")
end

function buyitem()
    g_AskClientNumberEx(0, 8, "Nh�p S� L��ng:", {buyitem2, {nIndex}})
end

function buyitem2(nCount)
    local i = 2000000*nCount
    if GetCash() < i then --kiem tra tien
        Talk(1,"","Kh�ng �� <color=yellow>Ng�n l��ng<color>. C� ti�n r�i h�y quay l�i g�p ta!")
    else
        Pay(i)
        for i=1, nCount do
            AddItem(6,1,3150,1,0,0)
        end
        Msg2Player("Nh�n ���c <color=green>"..nCount.."<color> B�o n� l�nh ph�!")
    end
end
