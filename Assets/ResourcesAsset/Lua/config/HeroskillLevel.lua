-- id                               int                              唯一id（精灵id*10000+类型*100+等级）
-- icon                             string                           技能图标
-- name                             lang                             技能名称
-- des                              lang                             技能描述
-- lock                             int                              升级条件
-- lockdes                          lang                             升级描述
-- consume                          tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   升级消耗
-- max                              bool                             满级

return {
	[401010101] = {
		icon = "",
		name = "普攻",
		des = "十香普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010102] = {
		icon = "",
		name = "普攻",
		des = "十香普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010103] = {
		icon = "",
		name = "普攻",
		des = "十香普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010104] = {
		icon = "",
		name = "普攻",
		des = "十香普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010105] = {
		icon = "",
		name = "普攻",
		des = "十香普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010106] = {
		icon = "",
		name = "普攻",
		des = "十香普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010107] = {
		icon = "",
		name = "普攻",
		des = "十香普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010108] = {
		icon = "",
		name = "普攻",
		des = "十香普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010109] = {
		icon = "",
		name = "普攻",
		des = "十香普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010110] = {
		icon = "",
		name = "普攻",
		des = "十香普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010201] = {
		icon = "",
		name = "1技能",
		des = "十香1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010202] = {
		icon = "",
		name = "1技能",
		des = "十香1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010203] = {
		icon = "",
		name = "1技能",
		des = "十香1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010204] = {
		icon = "",
		name = "1技能",
		des = "十香1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010205] = {
		icon = "",
		name = "1技能",
		des = "十香1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010206] = {
		icon = "",
		name = "1技能",
		des = "十香1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010207] = {
		icon = "",
		name = "1技能",
		des = "十香1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010208] = {
		icon = "",
		name = "1技能",
		des = "十香1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010209] = {
		icon = "",
		name = "1技能",
		des = "十香1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010210] = {
		icon = "",
		name = "1技能",
		des = "十香1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010301] = {
		icon = "",
		name = "2技能",
		des = "十香2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010302] = {
		icon = "",
		name = "2技能",
		des = "十香2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010303] = {
		icon = "",
		name = "2技能",
		des = "十香2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010304] = {
		icon = "",
		name = "2技能",
		des = "十香2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010305] = {
		icon = "",
		name = "2技能",
		des = "十香2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010306] = {
		icon = "",
		name = "2技能",
		des = "十香2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010307] = {
		icon = "",
		name = "2技能",
		des = "十香2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010308] = {
		icon = "",
		name = "2技能",
		des = "十香2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010309] = {
		icon = "",
		name = "2技能",
		des = "十香2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010310] = {
		icon = "",
		name = "2技能",
		des = "十香2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010401] = {
		icon = "",
		name = "3技能",
		des = "十香3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010402] = {
		icon = "",
		name = "3技能",
		des = "十香3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010403] = {
		icon = "",
		name = "3技能",
		des = "十香3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010404] = {
		icon = "",
		name = "3技能",
		des = "十香3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010405] = {
		icon = "",
		name = "3技能",
		des = "十香3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010406] = {
		icon = "",
		name = "3技能",
		des = "十香3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010407] = {
		icon = "",
		name = "3技能",
		des = "十香3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010408] = {
		icon = "",
		name = "3技能",
		des = "十香3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010409] = {
		icon = "",
		name = "3技能",
		des = "十香3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010410] = {
		icon = "",
		name = "3技能",
		des = "十香3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010501] = {
		icon = "",
		name = "大招",
		des = "十香大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010502] = {
		icon = "",
		name = "大招",
		des = "十香大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010503] = {
		icon = "",
		name = "大招",
		des = "十香大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010504] = {
		icon = "",
		name = "大招",
		des = "十香大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010505] = {
		icon = "",
		name = "大招",
		des = "十香大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010506] = {
		icon = "",
		name = "大招",
		des = "十香大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010507] = {
		icon = "",
		name = "大招",
		des = "十香大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010508] = {
		icon = "",
		name = "大招",
		des = "十香大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010509] = {
		icon = "",
		name = "大招",
		des = "十香大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010510] = {
		icon = "",
		name = "大招",
		des = "十香大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010601] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010602] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010603] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010604] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010605] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010606] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010607] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010608] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010609] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010610] = {
		icon = "",
		name = "qte援护",
		des = "十香qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010701] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010702] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010703] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010704] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010705] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010706] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010707] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010708] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010709] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010710] = {
		icon = "",
		name = "换人出场技",
		des = "十香换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010801] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010802] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010803] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010804] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010805] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010806] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010807] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010808] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010809] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010810] = {
		icon = "",
		name = "核心被动",
		des = "十香核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401010901] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010902] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010903] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010904] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010905] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010906] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010907] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010908] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010909] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401010910] = {
		icon = "",
		name = "职业被动",
		des = "十香职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401011001] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011002] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011003] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011004] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011005] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011006] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011007] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011008] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011009] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011010] = {
		icon = "",
		name = "队长被动",
		des = "十香队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401011101] = {
		icon = "",
		name = "S被动",
		des = "十香S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011102] = {
		icon = "",
		name = "S被动",
		des = "十香S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011103] = {
		icon = "",
		name = "S被动",
		des = "十香S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011104] = {
		icon = "",
		name = "S被动",
		des = "十香S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011105] = {
		icon = "",
		name = "S被动",
		des = "十香S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011106] = {
		icon = "",
		name = "S被动",
		des = "十香S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011107] = {
		icon = "",
		name = "S被动",
		des = "十香S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011108] = {
		icon = "",
		name = "S被动",
		des = "十香S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011109] = {
		icon = "",
		name = "S被动",
		des = "十香S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011110] = {
		icon = "",
		name = "S被动",
		des = "十香S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401011201] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011202] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011203] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011204] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011205] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011206] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011207] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011208] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011209] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011210] = {
		icon = "",
		name = "SS被动",
		des = "十香SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401011301] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011302] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011303] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011304] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011305] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011306] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011307] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011308] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011309] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011310] = {
		icon = "",
		name = "SSS被动",
		des = "十香SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401011401] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011402] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011403] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011404] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011405] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011406] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011407] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011408] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011409] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401011410] = {
		icon = "",
		name = "EX被动",
		des = "十香EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020101] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020102] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020103] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020104] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020105] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020106] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020107] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020108] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020109] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020110] = {
		icon = "",
		name = "普攻",
		des = "狂三普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020201] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020202] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020203] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020204] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020205] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020206] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020207] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020208] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020209] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020210] = {
		icon = "",
		name = "1技能",
		des = "狂三1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020301] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020302] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020303] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020304] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020305] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020306] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020307] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020308] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020309] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020310] = {
		icon = "",
		name = "2技能",
		des = "狂三2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020401] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020402] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020403] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020404] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020405] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020406] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020407] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020408] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020409] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020410] = {
		icon = "",
		name = "3技能",
		des = "狂三3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020501] = {
		icon = "",
		name = "大招",
		des = "狂三大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020502] = {
		icon = "",
		name = "大招",
		des = "狂三大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020503] = {
		icon = "",
		name = "大招",
		des = "狂三大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020504] = {
		icon = "",
		name = "大招",
		des = "狂三大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020505] = {
		icon = "",
		name = "大招",
		des = "狂三大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020506] = {
		icon = "",
		name = "大招",
		des = "狂三大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020507] = {
		icon = "",
		name = "大招",
		des = "狂三大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020508] = {
		icon = "",
		name = "大招",
		des = "狂三大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020509] = {
		icon = "",
		name = "大招",
		des = "狂三大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020510] = {
		icon = "",
		name = "大招",
		des = "狂三大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020601] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020602] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020603] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020604] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020605] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020606] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020607] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020608] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020609] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020610] = {
		icon = "",
		name = "qte援护",
		des = "狂三qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020701] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020702] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020703] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020704] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020705] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020706] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020707] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020708] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020709] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020710] = {
		icon = "",
		name = "换人出场技",
		des = "狂三换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020801] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020802] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020803] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020804] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020805] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020806] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020807] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020808] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020809] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020810] = {
		icon = "",
		name = "核心被动",
		des = "狂三核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401020901] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020902] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020903] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020904] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020905] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020906] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020907] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020908] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020909] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401020910] = {
		icon = "",
		name = "职业被动",
		des = "狂三职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401021001] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021002] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021003] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021004] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021005] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021006] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021007] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021008] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021009] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021010] = {
		icon = "",
		name = "队长被动",
		des = "狂三队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401021101] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021102] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021103] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021104] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021105] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021106] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021107] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021108] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021109] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021110] = {
		icon = "",
		name = "S被动",
		des = "狂三S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401021201] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021202] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021203] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021204] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021205] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021206] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021207] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021208] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021209] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021210] = {
		icon = "",
		name = "SS被动",
		des = "狂三SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401021301] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021302] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021303] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021304] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021305] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021306] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021307] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021308] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021309] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021310] = {
		icon = "",
		name = "SSS被动",
		des = "狂三SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401021401] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021402] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021403] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021404] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021405] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021406] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021407] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021408] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021409] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401021410] = {
		icon = "",
		name = "EX被动",
		des = "狂三EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030101] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030102] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030103] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030104] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030105] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030106] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030107] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030108] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030109] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030110] = {
		icon = "",
		name = "普攻",
		des = "四糸乃普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030201] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030202] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030203] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030204] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030205] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030206] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030207] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030208] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030209] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030210] = {
		icon = "",
		name = "1技能",
		des = "四糸乃1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030301] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030302] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030303] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030304] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030305] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030306] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030307] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030308] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030309] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030310] = {
		icon = "",
		name = "2技能",
		des = "四糸乃2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030401] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030402] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030403] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030404] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030405] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030406] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030407] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030408] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030409] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030410] = {
		icon = "",
		name = "3技能",
		des = "四糸乃3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030501] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030502] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030503] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030504] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030505] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030506] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030507] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030508] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030509] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030510] = {
		icon = "",
		name = "大招",
		des = "四糸乃大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030601] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030602] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030603] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030604] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030605] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030606] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030607] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030608] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030609] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030610] = {
		icon = "",
		name = "qte援护",
		des = "四糸乃qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030701] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030702] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030703] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030704] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030705] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030706] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030707] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030708] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030709] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030710] = {
		icon = "",
		name = "换人出场技",
		des = "四糸乃换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030801] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030802] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030803] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030804] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030805] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030806] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030807] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030808] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030809] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030810] = {
		icon = "",
		name = "核心被动",
		des = "四糸乃核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401030901] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030902] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030903] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030904] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030905] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030906] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030907] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030908] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030909] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401030910] = {
		icon = "",
		name = "职业被动",
		des = "四糸乃职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401031001] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031002] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031003] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031004] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031005] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031006] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031007] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031008] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031009] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031010] = {
		icon = "",
		name = "队长被动",
		des = "四糸乃队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401031101] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031102] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031103] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031104] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031105] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031106] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031107] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031108] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031109] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031110] = {
		icon = "",
		name = "S被动",
		des = "四糸乃S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401031201] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031202] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031203] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031204] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031205] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031206] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031207] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031208] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031209] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031210] = {
		icon = "",
		name = "SS被动",
		des = "四糸乃SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401031301] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031302] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031303] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031304] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031305] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031306] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031307] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031308] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031309] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031310] = {
		icon = "",
		name = "SSS被动",
		des = "四糸乃SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401031401] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031402] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031403] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031404] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031405] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031406] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031407] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031408] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031409] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401031410] = {
		icon = "",
		name = "EX被动",
		des = "四糸乃EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040101] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040102] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040103] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040104] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040105] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040106] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040107] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040108] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040109] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040110] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040201] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040202] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040203] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040204] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040205] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040206] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040207] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040208] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040209] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040210] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040301] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040302] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040303] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040304] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040305] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040306] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040307] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040308] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040309] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040310] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040401] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040402] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040403] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040404] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040405] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040406] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040407] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040408] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040409] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040410] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040501] = {
		icon = "",
		name = "大招",
		des = "琴里大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040502] = {
		icon = "",
		name = "大招",
		des = "琴里大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040503] = {
		icon = "",
		name = "大招",
		des = "琴里大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040504] = {
		icon = "",
		name = "大招",
		des = "琴里大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040505] = {
		icon = "",
		name = "大招",
		des = "琴里大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040506] = {
		icon = "",
		name = "大招",
		des = "琴里大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040507] = {
		icon = "",
		name = "大招",
		des = "琴里大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040508] = {
		icon = "",
		name = "大招",
		des = "琴里大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040509] = {
		icon = "",
		name = "大招",
		des = "琴里大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040510] = {
		icon = "",
		name = "大招",
		des = "琴里大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040601] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040602] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040603] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040604] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040605] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040606] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040607] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040608] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040609] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040610] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040701] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040702] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040703] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040704] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040705] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040706] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040707] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040708] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040709] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040710] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040801] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040802] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040803] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040804] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040805] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040806] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040807] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040808] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040809] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040810] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401040901] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040902] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040903] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040904] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040905] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040906] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040907] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040908] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040909] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401040910] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401041001] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041002] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041003] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041004] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041005] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041006] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041007] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041008] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041009] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041010] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401041101] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041102] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041103] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041104] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041105] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041106] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041107] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041108] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041109] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041110] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401041201] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041202] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041203] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041204] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041205] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041206] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041207] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041208] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041209] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041210] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401041301] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041302] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041303] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041304] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041305] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041306] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041307] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041308] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041309] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041310] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401041401] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041402] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041403] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041404] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041405] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041406] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041407] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041408] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041409] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401041410] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050101] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050102] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050103] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050104] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050105] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050106] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050107] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050108] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050109] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050110] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050201] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050202] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050203] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050204] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050205] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050206] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050207] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050208] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050209] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050210] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050301] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050302] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050303] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050304] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050305] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050306] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050307] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050308] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050309] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050310] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050401] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050402] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050403] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050404] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050405] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050406] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050407] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050408] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050409] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050410] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050501] = {
		icon = "",
		name = "大招",
		des = "琴里大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050502] = {
		icon = "",
		name = "大招",
		des = "琴里大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050503] = {
		icon = "",
		name = "大招",
		des = "琴里大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050504] = {
		icon = "",
		name = "大招",
		des = "琴里大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050505] = {
		icon = "",
		name = "大招",
		des = "琴里大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050506] = {
		icon = "",
		name = "大招",
		des = "琴里大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050507] = {
		icon = "",
		name = "大招",
		des = "琴里大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050508] = {
		icon = "",
		name = "大招",
		des = "琴里大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050509] = {
		icon = "",
		name = "大招",
		des = "琴里大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050510] = {
		icon = "",
		name = "大招",
		des = "琴里大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050601] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050602] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050603] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050604] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050605] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050606] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050607] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050608] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050609] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050610] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050701] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050702] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050703] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050704] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050705] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050706] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050707] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050708] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050709] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050710] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050801] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050802] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050803] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050804] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050805] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050806] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050807] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050808] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050809] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050810] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401050901] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050902] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050903] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050904] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050905] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050906] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050907] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050908] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050909] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401050910] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401051001] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051002] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051003] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051004] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051005] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051006] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051007] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051008] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051009] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051010] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401051101] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051102] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051103] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051104] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051105] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051106] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051107] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051108] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051109] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051110] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401051201] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051202] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051203] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051204] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051205] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051206] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051207] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051208] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051209] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051210] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401051301] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051302] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051303] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051304] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051305] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051306] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051307] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051308] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051309] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051310] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401051401] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051402] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051403] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051404] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051405] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051406] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051407] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051408] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051409] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401051410] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060101] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060102] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060103] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060104] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060105] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060106] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060107] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060108] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060109] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060110] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060201] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060202] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060203] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060204] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060205] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060206] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060207] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060208] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060209] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060210] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060301] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060302] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060303] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060304] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060305] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060306] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060307] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060308] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060309] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060310] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060401] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060402] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060403] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060404] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060405] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060406] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060407] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060408] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060409] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060410] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060501] = {
		icon = "",
		name = "大招",
		des = "琴里大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060502] = {
		icon = "",
		name = "大招",
		des = "琴里大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060503] = {
		icon = "",
		name = "大招",
		des = "琴里大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060504] = {
		icon = "",
		name = "大招",
		des = "琴里大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060505] = {
		icon = "",
		name = "大招",
		des = "琴里大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060506] = {
		icon = "",
		name = "大招",
		des = "琴里大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060507] = {
		icon = "",
		name = "大招",
		des = "琴里大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060508] = {
		icon = "",
		name = "大招",
		des = "琴里大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060509] = {
		icon = "",
		name = "大招",
		des = "琴里大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060510] = {
		icon = "",
		name = "大招",
		des = "琴里大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060601] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060602] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060603] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060604] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060605] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060606] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060607] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060608] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060609] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060610] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060701] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060702] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060703] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060704] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060705] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060706] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060707] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060708] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060709] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060710] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060801] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060802] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060803] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060804] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060805] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060806] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060807] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060808] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060809] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060810] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401060901] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060902] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060903] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060904] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060905] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060906] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060907] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060908] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060909] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401060910] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401061001] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061002] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061003] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061004] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061005] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061006] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061007] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061008] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061009] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061010] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401061101] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061102] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061103] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061104] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061105] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061106] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061107] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061108] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061109] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061110] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401061201] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061202] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061203] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061204] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061205] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061206] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061207] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061208] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061209] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061210] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401061301] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061302] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061303] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061304] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061305] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061306] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061307] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061308] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061309] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061310] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401061401] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061402] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061403] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061404] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061405] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061406] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061407] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061408] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061409] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401061410] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070101] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070102] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070103] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070104] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070105] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070106] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070107] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070108] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070109] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070110] = {
		icon = "",
		name = "普攻",
		des = "琴里普攻10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070201] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070202] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070203] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070204] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070205] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070206] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070207] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070208] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070209] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070210] = {
		icon = "",
		name = "1技能",
		des = "琴里1技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070301] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070302] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070303] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070304] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070305] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070306] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070307] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070308] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070309] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070310] = {
		icon = "",
		name = "2技能",
		des = "琴里2技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070401] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070402] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070403] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070404] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070405] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070406] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070407] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070408] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070409] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070410] = {
		icon = "",
		name = "3技能",
		des = "琴里3技能10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070501] = {
		icon = "",
		name = "大招",
		des = "琴里大招1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070502] = {
		icon = "",
		name = "大招",
		des = "琴里大招2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070503] = {
		icon = "",
		name = "大招",
		des = "琴里大招3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070504] = {
		icon = "",
		name = "大招",
		des = "琴里大招4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070505] = {
		icon = "",
		name = "大招",
		des = "琴里大招5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070506] = {
		icon = "",
		name = "大招",
		des = "琴里大招6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070507] = {
		icon = "",
		name = "大招",
		des = "琴里大招7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070508] = {
		icon = "",
		name = "大招",
		des = "琴里大招8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070509] = {
		icon = "",
		name = "大招",
		des = "琴里大招9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070510] = {
		icon = "",
		name = "大招",
		des = "琴里大招10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070601] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070602] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070603] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070604] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070605] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070606] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070607] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070608] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070609] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070610] = {
		icon = "",
		name = "qte援护",
		des = "琴里qte援护10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070701] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070702] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070703] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070704] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070705] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070706] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070707] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070708] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070709] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070710] = {
		icon = "",
		name = "换人出场技",
		des = "琴里换人出场技10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070801] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070802] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070803] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070804] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070805] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070806] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070807] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070808] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070809] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070810] = {
		icon = "",
		name = "核心被动",
		des = "琴里核心被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401070901] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070902] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070903] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070904] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070905] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070906] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070907] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070908] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070909] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401070910] = {
		icon = "",
		name = "职业被动",
		des = "琴里职业被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401071001] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071002] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071003] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071004] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071005] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071006] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071007] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071008] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071009] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071010] = {
		icon = "",
		name = "队长被动",
		des = "琴里队长被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401071101] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071102] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071103] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071104] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071105] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071106] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071107] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071108] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071109] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071110] = {
		icon = "",
		name = "S被动",
		des = "琴里S被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401071201] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071202] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071203] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071204] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071205] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071206] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071207] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071208] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071209] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071210] = {
		icon = "",
		name = "SS被动",
		des = "琴里SS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401071301] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071302] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071303] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071304] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071305] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071306] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071307] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071308] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071309] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071310] = {
		icon = "",
		name = "SSS被动",
		des = "琴里SSS被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
	[401071401] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动1级",
		lock = 1,
		lockdes = "精灵等级达到1级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071402] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动2级",
		lock = 2,
		lockdes = "精灵等级达到2级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071403] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动3级",
		lock = 3,
		lockdes = "精灵等级达到3级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071404] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动4级",
		lock = 4,
		lockdes = "精灵等级达到4级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071405] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动5级",
		lock = 5,
		lockdes = "精灵等级达到5级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071406] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动6级",
		lock = 6,
		lockdes = "精灵等级达到6级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071407] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动7级",
		lock = 7,
		lockdes = "精灵等级达到7级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071408] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动8级",
		lock = 8,
		lockdes = "精灵等级达到8级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071409] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动9级",
		lock = 9,
		lockdes = "精灵等级达到9级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = false,
	},
	[401071410] = {
		icon = "",
		name = "EX被动",
		des = "琴里EX被动10级",
		lock = 10,
		lockdes = "精灵等级达到10级",
		consume = {
			[1] = {
				id = 10101,
				count = 1,
			},
			[2] = {
				id = 10102,
				count = 1000,
			},
		},
		max = true,
	},
}
