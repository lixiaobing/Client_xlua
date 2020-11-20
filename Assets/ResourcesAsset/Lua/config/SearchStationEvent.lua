-- id                               int                              事件id
-- name                             string                           事件名称
-- des                              string                           事件描述
-- award_type                       int                              事件类型
-- award                            tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   事件参数
-- time                             int                              事件出现时间（秒）
-- chance                           int                              可重复次数
-- weight                           int                              事件基础权重
-- weight_add                       int                              权重加成
-- luck                             int                              事件基础幸运值
-- luck_add                         int                              幸运值加成

return {
	[1] = {
		id = 1,
		name = "驻守奖励",
		des = "驻守奖励描述",
		award_type = 1,
		award = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		time = 60,
		chance = 5,
		weight = 100,
		weight_add = 10,
		luck = 50,
		luck_add = 100,
	},
	[2] = {
		id = 2,
		name = "驻守奖励",
		des = "驻守奖励描述",
		award_type = 1,
		award = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		time = 120,
		chance = 5,
		weight = 101,
		weight_add = 10,
		luck = 60,
		luck_add = 11,
	},
	[3] = {
		id = 3,
		name = "驻守奖励",
		des = "驻守奖励描述",
		award_type = 1,
		award = {
			[1] = {
				id = 10103,
				count = 1,
			},
		},
		time = 180,
		chance = 5,
		weight = 102,
		weight_add = 10,
		luck = 70,
		luck_add = 12,
	},
	[4] = {
		id = 4,
		name = "驻守战斗",
		des = "驻守战斗描述",
		award_type = 1,
		award = {
			[1] = {
				id = 10201,
				count = 1,
			},
		},
		time = 240,
		chance = 5,
		weight = 103,
		weight_add = 10,
		luck = 80,
		luck_add = 13,
	},
	[5] = {
		id = 5,
		name = "驻守战斗",
		des = "驻守战斗描述",
		award_type = 1,
		award = {
			[1] = {
				id = 10301,
				count = 1,
			},
		},
		time = 300,
		chance = 5,
		weight = 104,
		weight_add = 10,
		luck = 90,
		luck_add = 14,
	},
}
