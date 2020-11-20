-- id                               int                              id（精灵id*10+等阶）
-- icon                             int                              等阶图标
-- consume                          tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   升阶所需道具
-- maxtip                           bool                             是否满阶
-- level                            int                              最大等级上限
-- locktriger                       int                              升阶限制条件
-- lockvalue                        int                              升阶限制参数
-- lockdes                          lang                             升阶限制描述
-- des                              tableString[k:#seq|v:#1(lang)]   升阶描述

return {
	[401011] = {
		id = 401011,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401012] = {
		id = 401012,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401013] = {
		id = 401013,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401014] = {
		id = 401014,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401015] = {
		id = 401015,
		icon = 4,
		consume = nil,
		maxtip = true,
		level = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401021] = {
		id = 401021,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401022] = {
		id = 401022,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401023] = {
		id = 401023,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401024] = {
		id = 401024,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401025] = {
		id = 401025,
		icon = 4,
		consume = nil,
		maxtip = true,
		level = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401031] = {
		id = 401031,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401032] = {
		id = 401032,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401033] = {
		id = 401033,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401034] = {
		id = 401034,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401035] = {
		id = 401035,
		icon = 4,
		consume = nil,
		maxtip = true,
		level = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401041] = {
		id = 401041,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401042] = {
		id = 401042,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401043] = {
		id = 401043,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401044] = {
		id = 401044,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401045] = {
		id = 401045,
		icon = 4,
		consume = nil,
		maxtip = true,
		level = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401051] = {
		id = 401051,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401052] = {
		id = 401052,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401053] = {
		id = 401053,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401054] = {
		id = 401054,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401055] = {
		id = 401055,
		icon = 4,
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
		maxtip = true,
		level = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401061] = {
		id = 401061,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401062] = {
		id = 401062,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401063] = {
		id = 401063,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401064] = {
		id = 401064,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401065] = {
		id = 401065,
		icon = 4,
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
		maxtip = true,
		level = 60,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401071] = {
		id = 401071,
		icon = 1,
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
		level = 20,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401072] = {
		id = 401072,
		icon = 2,
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
		level = 30,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401073] = {
		id = 401073,
		icon = 3,
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
		level = 40,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401074] = {
		id = 401074,
		icon = 4,
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
		level = 50,
		locktriger = nil,
		lockvalue = nil,
		lockdes = "",
		des = {
			[1] = "解锁被动技能",
			[2] = "属性成长率提升1.5",
			[3] = "基础属性提升10%",
		},
	},
	[401075] = {
		id = 401075,
		icon = 4,
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
		maxtip = true,
		level = 60,
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
