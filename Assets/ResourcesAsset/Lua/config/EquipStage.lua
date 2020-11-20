-- id                               int                              等阶id
-- consume                          tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   升阶所需道具
-- maxtip                           bool                             是否满阶
-- icon                             int                              等阶图标
-- maxlevel                         int                              最大等级
-- locktriger                       int                              升阶限制条件
-- lockvalue                        int                              升阶限制参数
-- lockdes                          lang                             升阶限制描述
-- des                              tableString[k:#seq|v:#1(lang)]   升阶描述

return {
	[1] = {
		id = 1,
		consume = {
			[1] = {
				id = 10401,
				count = 200,
			},
			[2] = {
				id = 10102,
				count = 10000,
			},
		},
		maxtip = false,
		icon = 1,
		maxlevel = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[2] = {
		id = 2,
		consume = {
			[1] = {
				id = 10401,
				count = 400,
			},
			[2] = {
				id = 10102,
				count = 20000,
			},
		},
		maxtip = false,
		icon = 2,
		maxlevel = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[3] = {
		id = 3,
		consume = {
			[1] = {
				id = 10401,
				count = 600,
			},
			[2] = {
				id = 10402,
				count = 1000,
			},
			[3] = {
				id = 10102,
				count = 40000,
			},
		},
		maxtip = false,
		icon = 3,
		maxlevel = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[4] = {
		id = 4,
		consume = {
			[1] = {
				id = 10401,
				count = 800,
			},
			[2] = {
				id = 10402,
				count = 1200,
			},
			[3] = {
				id = 10102,
				count = 80000,
			},
		},
		maxtip = false,
		icon = 4,
		maxlevel = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[5] = {
		id = 5,
		consume = nil,
		maxtip = true,
		icon = 4,
		maxlevel = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
}
