-- id                               int                              事件id
-- name                             string                           事件名称
-- des                              string                           事件描述
-- icon                             int                              事件icon
-- pro_task                         int                              进度任务
-- triger_task                      int                              触发前置条件
-- loop_num                         int                              需完成次数
-- chance                           int                              可重复次数
-- award_type                       int                              事件奖励类型
-- award                            tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   奖励内容
-- weight                           int                              事件基础权重
-- weight_add                       int                              权重加成
-- luck                             int                              事件基础幸运值
-- luck_add                         int                              幸运值加成

return {
	[9001] = {
		id = 9001,
		name = "事件1",
		des = "事件1描述",
		icon = 1,
		pro_task = 9101,
		triger_task = 9001,
		loop_num = 1,
		chance = 5,
		award_type = 1,
		award = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		weight = 100,
		weight_add = 10,
		luck = 50,
		luck_add = 10,
	},
	[9002] = {
		id = 9002,
		name = "事件2",
		des = "事件2描述",
		icon = 2,
		pro_task = 9102,
		triger_task = 9002,
		loop_num = 2,
		chance = 5,
		award_type = 1,
		award = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		weight = 101,
		weight_add = 10,
		luck = 60,
		luck_add = 11,
	},
	[9003] = {
		id = 9003,
		name = "事件3",
		des = "事件3描述",
		icon = 3,
		pro_task = 9103,
		triger_task = 9003,
		loop_num = 3,
		chance = 5,
		award_type = 1,
		award = {
			[1] = {
				id = 10103,
				count = 1,
			},
		},
		weight = 102,
		weight_add = 10,
		luck = 70,
		luck_add = 12,
	},
	[9004] = {
		id = 9004,
		name = "事件4",
		des = "事件4描述",
		icon = 4,
		pro_task = 9104,
		triger_task = 9004,
		loop_num = 4,
		chance = 5,
		award_type = 1,
		award = {
			[1] = {
				id = 10201,
				count = 1,
			},
		},
		weight = 103,
		weight_add = 10,
		luck = 80,
		luck_add = 13,
	},
	[9005] = {
		id = 9005,
		name = "事件5",
		des = "事件5描述",
		icon = 5,
		pro_task = 9105,
		triger_task = 9005,
		loop_num = 5,
		chance = 5,
		award_type = 1,
		award = {
			[1] = {
				id = 10301,
				count = 1,
			},
		},
		weight = 104,
		weight_add = 10,
		luck = 90,
		luck_add = 14,
	},
}
