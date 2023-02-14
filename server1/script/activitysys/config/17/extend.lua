Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--数据埋点第一期
end

--襲 ch豱h ph莕 thng r琲 ra t� boss thu� t芻 i u l躰h - Modified By ThanhLD - 20140422
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
			-- [1] = {{szName="X輈h L﹏ L謓h",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
			-- [2] = {{szName="M秐h X輈h L﹏",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
			-- [3] = {{szName="X輈h L﹏ Kim B礽",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
			-- [4] = {{szName="X輈h L﹏ Tr秓",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
			-- [5] = {{szName="X輈h L﹏ Gi竎",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
			-- [6] = {{szName="X輈h L﹏ T譶h",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
			-- [7] = {{szName="B筩h H� Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={2,0,0,0,0,0}},},
			-- [8] = {{szName="B筩h H� Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
			-- [9] = {{szName="B筩h H� Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={5,0,0,0,0,0}},},
			-- [10] = {{szName="B筩h H� H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={1,0,0,0,0,0}},},
			-- [11] = {{szName="B筩h H� Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={9,0,0,0,0,0}},},
			-- [12] = {{szName="B筩h H� H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={8,0,0,0,0,0}},},
			-- [13] = {{szName="B筩h H� H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={4,0,0,0,0,0}},},
			-- [14] = {{szName="B筩h H� Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={3,0,0,0,0,0}},},
			-- [15] = {{szName="B筩h H� H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={10,0,0,0,0,0}},},
			-- [16] = {{szName="B筩h H� Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
			-- [17] = {{szName="X輈h L﹏ Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
			-- [18] = {{szName="X輈h L﹏ Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
			-- [19] = {{szName="X輈h L﹏ Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
			-- [20] = {{szName="X輈h L﹏ H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
			-- [21] = {{szName="X輈h L﹏ Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
			-- [22] = {{szName="X輈h L﹏ H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
			-- [23] = {{szName="X輈h L﹏ H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
			-- [24] = {{szName="X輈h L﹏ Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
			-- [25] = {{szName="X輈h L﹏ H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
			-- [26] = {{szName="X輈h L﹏ Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
			-- [27] = {{szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
			-- [28] = {{szName="C鑞g Hi課 L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			-- [29] = {{szName="Ki課 Thi誸 L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			-- [30] = {{szName="Chi課 B� L� Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			-- [31] = {{szName="Bao Dc ho祅 ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
			-- [32] = {{szName="B筩h H� Tr飊g Luy謓 Ng鋍",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
			-- [33] = {{szName="M筩 B綾 Truy襫 T鑞g L謓h",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
			-- [34] = {{szName="V� L﹎ M藅 T辌h",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
			-- [35] = {{szName="T葃 T駓 Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
			-- [36] = {{szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
			-- [37] = {{szName="Чi l鵦 ho祅 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			-- [38] = {{szName="Phi t鑓 ho祅 l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			-- [39] = {{szName="Qu� Ho祅g Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	
	}	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "Ph莕 thng ti猽 di謙 Th駓 T芻 Чi u L躰h", 1)
	tbAward = {szName = "觤 kinh nghi謒", nExp=2e7}
	tbAwardTemplet:Give(tbAward, 1, {"TinhNangKey", "NhanthuongtieudietBoss"})
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end