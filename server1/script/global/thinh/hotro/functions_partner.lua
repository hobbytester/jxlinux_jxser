IncludeLib("PARTNER");


function functions_for_partner()
	local szTitle = "B�n mu�n s� d�ng ch�c n�ng g� v�i b�n ��ng h�nh?"
	local tbOpt =
	{
		"Ch�n Pet/Create_Pet",
		"X�a Pet hi�n t�i/Delete_Pet",
		"��i h�nh Pet hi�n t�i/FeaturePet",	
		"��i t�n Pet hi�n t�i/change_name_pet",
		"T�ng Emotion/IncreaseEmotion",
		"L�y S�ch Kh�ng m�i 12 level, d�ng t�i �a 20 quy�n/HoiLV",
		"L�y S�ch Skill m�i 10 level/SachSkill",
		"Tr� L�i/main",
		"Tho�t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

------------------------------------------------ ��i ngo�i h�nh --------------------------------

function FeaturePet()
local szTitle = "B�n mu�n ��i ngo�i h�nh n�o cho b�n ��ng h�nh?"
local tbOpt =
	{
		"Chu k� 1/#DoiHinhPet(1)",
		"Chu k� 2/#DoiHinhPet(2)",
		"Chu k� 3/#DoiHinhPet(3)",
		"Tr� L�i/Pet",
		"Tho�t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function DoiHinhPet(nP)
	local partner_index = PARTNER_GetCurPartner()
	PARTNER_ChangeFeatureOfPeriod(partner_index, nP)
end

------------------------------------------------ ��i T�n --------------------------------

function change_name_pet()
	AskClientForString("DoiTenPet", "PetName", 1, 500, "<#>Nh�p t�n pet")
end

function DoiTenPet(szName)
	local partner_index = PARTNER_GetCurPartner()
	PARTNER_SetName(partner_index, szName)
	Msg2Player("�� ��i t�n pet th�nh <color=yellow>"..szName)
end

-------------------------- S�ch kh�ng ----------------------------------------------

function HoiLV()
	g_AskClientStringEx("1", 0, 256, "Level S�ch", {SachKhang1})
end

function SachKhang1(nLV)
	for i=0,4 do
		AddItem(6,1,834+i,nLV,0,0,0)
	end
end

---------------------- S�ch skill ---------------------------------------

function SachSkill()
local szTitle = "B�n mu�n nh�n s�ch n�o?"
local tbOpt =
	{
		{"H�c skill TGPH", learn_skill_special},
		{"S�ch Chung",HoiLVSkill},
		{"S�ch T�ng KTC",SachSpecial,{853}},
		{"S�ch T�ng T�c �� Di Chuy�n",SachSpecial,{854}},
		{"S�ch T�ng TDD Ngo�i C�ng",SachSpecial,{855}},
		{"S�ch T�ng T� L� Ch�nh X�c",SachSpecial,{851}},
		{"S�ch Sinh L�c",SachSpecial,{868}},
		{"S�ch Ph�c H�i Sinh L�c",SachSpecial,{869}},
		{"S�ch May M�n",SachSpecial,{870}},
		--{"S�ch Gi�m th�i gian tr�ng ��c",SachSpecial,{861}},
		--{"S�ch Tang Kha nang Choang",SachSpecial,{867}},
		--{"S�ch Tang Thoi gian Choang",SachSpecial,{883}},
		{"S�ch T�ng H� Tr� T�t C� Chi�u",SachSpecial,{884}},
		{"Tr� L�i",Pet},
		{"Tho�t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function learn_skill_special()
	local partner_index = PARTNER_GetCurPartner()
	PARTNER_AddSkill(partner_index, 2, 594, 20)
end

function HoiLVSkill()
	g_AskClientStringEx("1", 0, 256, "Level S�ch", {SachSkillLV})
end

function SachSkillLV(nLV)
	for i = 1, nLV do
		AddItem(6,1,864,i,0,0,0)
		AddItem(6,1,856,i,0,0,0)
		AddItem(6,1,849,i,0,0,0)
		AddItem(6,1,867,i,0,0,0)
		AddItem(6,1,883,i,0,0,0)
	end
end

function SachSpecial(nS)
	-- local partner_index = PARTNER_GetCurPartner()
	-- if partner_index > 0 then
		-- local partner_level = PARTNER_GetLevel(partner_index)
		-- local book_level = min(10, floor(partner_level/10)+1)
		-- AddItem(6,1,nS,book_level,0,0,0)
	-- end
	for i=1,10 do
		AddItem(6,1,nS,i,0,0,0)
	end
end

function IncreaseEmotion()
	local partner_index = PARTNER_GetCurPartner()
	Msg2Player("Pet ID "..partner_index)
	PARTNER_AddEmotionDegree(nPartnerIdx,1)
end

function Create_Pet()
local szTitle = "B�n mu�n nh�n ��ng H�nh h� n�o?"
local tbOpt =
	{
		{"H� Kim",Pet_Create, {0}},
		{"H� M�c",Pet_Create, {1}},
		{"H� Th�y",Pet_Create, {2}},
		{"H� H�a",Pet_Create, {3}},
		{"H� Th�",Pet_Create, {4}},
		{"Tr� L�i", Pet},
		{"Tho�t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function Pet_Create(nSeries)
 	local partneridex = PARTNER_AddFightPartner(5-nSeries,nSeries,1,5,5,5,5,5,5)
	local nCount = PARTNER_Count()
	PARTNER_SetCurPartner(nCount)
	PARTNER_CallOutCurPartner()
end

---------------------------- X�a partner -----------------------------------------

function Delete_Pet()
	local partnerindex,partnerstate = PARTNER_GetCurPartner() 
	PARTNER_RemovePartner(partnerindex)
end
