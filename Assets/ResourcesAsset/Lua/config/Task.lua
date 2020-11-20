-- id                               int                              任务id
-- type                             int                              任务类型
-- take                             bool                             自动接取
-- name                             string                           任务名称
-- triger                           tableString[k:#seq|v:#1(int)]    触发条件枚举
-- triger_para                      string                           触发条件枚举
-- triger_finish                    tableString[k:#seq|v:#1(int)]    完成条件枚举
-- triger_para_finish               string                           完成条件参数
-- des                              string                           完成条件描述
-- reward                           tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   完成奖励
-- Expire                           date                             任务过期
-- reset                            int                              任务重置
-- list                             int                              任务排序
-- is_show                          bool                             是否显示
-- task_share                       int                              任务数据关联

return {
	[1001] = {
		id = 1001,
		type = 1,
		take = true,
		name = "日常任务1",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2001,
		},
		triger_para_finish = "40102,10",
		des = "狂三等级达到10级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = "2021-08-21 08:00:00",
		reset = 0,
		list = 1,
		is_show = true,
		task_share = nil,
	},
	[1002] = {
		id = 1002,
		type = 1,
		take = true,
		name = "日常任务2",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2002,
		},
		triger_para_finish = "40102,4",
		des = "狂三稀有度达到SS级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 1,
		list = 2,
		is_show = true,
		task_share = nil,
	},
	[1003] = {
		id = 1003,
		type = 1,
		take = true,
		name = "日常任务3",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2003,
			[2] = 2004,
		},
		triger_para_finish = "40102,2|5",
		des = "狂三等阶达到2阶并且今日进行5次精灵升级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 2,
		list = 3,
		is_show = false,
		task_share = nil,
	},
	[2001] = {
		id = 2001,
		type = 1,
		take = true,
		name = "周常任务1",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2001,
		},
		triger_para_finish = "40102,10",
		des = "狂三等级达到10级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = "2021-08-21 08:00:00",
		reset = 0,
		list = 1,
		is_show = true,
		task_share = nil,
	},
	[2002] = {
		id = 2002,
		type = 1,
		take = true,
		name = "周常任务2",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2002,
		},
		triger_para_finish = "40102,4",
		des = "狂三稀有度达到SS级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 1,
		list = 2,
		is_show = true,
		task_share = nil,
	},
	[2003] = {
		id = 2003,
		type = 1,
		take = true,
		name = "周常任务3",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2003,
			[2] = 2004,
		},
		triger_para_finish = "40102,2|5",
		des = "狂三等阶达到2阶并且今日进行5次精灵升级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 2,
		list = 3,
		is_show = false,
		task_share = nil,
	},
	[9001] = {
		id = 9001,
		type = 9,
		take = true,
		name = "事件任务1",
		triger = {
			[1] = 9,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2001,
		},
		triger_para_finish = "40102,10",
		des = "狂三等级达到10级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 0,
		list = 1,
		is_show = false,
		task_share = nil,
	},
	[9002] = {
		id = 9002,
		type = 9,
		take = true,
		name = "事件任务2",
		triger = {
			[1] = 9,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2002,
		},
		triger_para_finish = "40102,4",
		des = "狂三稀有度达到SS级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 0,
		list = 2,
		is_show = false,
		task_share = nil,
	},
	[9003] = {
		id = 9003,
		type = 9,
		take = true,
		name = "事件任务3",
		triger = {
			[1] = 9,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2003,
			[2] = 2004,
		},
		triger_para_finish = "40102,2|5",
		des = "狂三等阶达到2阶并且今日进行5次精灵升级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 0,
		list = 3,
		is_show = false,
		task_share = nil,
	},
	[9004] = {
		id = 9004,
		type = 9,
		take = true,
		name = "事件任务4",
		triger = {
			[1] = 9,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2001,
		},
		triger_para_finish = "40102,10",
		des = "狂三等级达到10级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 0,
		list = 1,
		is_show = false,
		task_share = nil,
	},
	[9005] = {
		id = 9005,
		type = 9,
		take = true,
		name = "事件任务5",
		triger = {
			[1] = 9,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 2002,
		},
		triger_para_finish = "40102,4",
		des = "狂三稀有度达到SS级",
		reward = {
			[10102] = {
				id = 10102,
				count = 10,
			},
		},
		Expire = nil,
		reset = 0,
		list = 2,
		is_show = false,
		task_share = nil,
	},
	[9101] = {
		id = 9101,
		type = 10,
		take = true,
		name = "事件总任务1",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 4002,
		},
		triger_para_finish = "9001,1",
		des = "完成9001任务1次",
		reward = {
			[10102] = {
				id = 10102,
				count = 1,
			},
		},
		Expire = nil,
		reset = 10,
		list = 1,
		is_show = false,
		task_share = nil,
	},
	[9102] = {
		id = 9102,
		type = 10,
		take = true,
		name = "事件总任务2",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 4002,
		},
		triger_para_finish = "9002,2",
		des = "完成9002任务2次",
		reward = {
			[10102] = {
				id = 10102,
				count = 1,
			},
		},
		Expire = nil,
		reset = 10,
		list = 2,
		is_show = false,
		task_share = nil,
	},
	[9103] = {
		id = 9103,
		type = 10,
		take = true,
		name = "事件总任务3",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 4002,
		},
		triger_para_finish = "9003,3",
		des = "完成9003任务3次",
		reward = {
			[10103] = {
				id = 10103,
				count = 1,
			},
		},
		Expire = nil,
		reset = 10,
		list = 3,
		is_show = false,
		task_share = nil,
	},
	[9104] = {
		id = 9104,
		type = 10,
		take = true,
		name = "事件总任务4",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 4002,
		},
		triger_para_finish = "9004,4",
		des = "完成9004任务4次",
		reward = {
			[10201] = {
				id = 10201,
				count = 1,
			},
		},
		Expire = "2021-08-21 08:00:00",
		reset = 10,
		list = 1,
		is_show = false,
		task_share = nil,
	},
	[9105] = {
		id = 9105,
		type = 10,
		take = true,
		name = "事件总任务5",
		triger = {
			[1] = 1001,
		},
		triger_para = "1",
		triger_finish = {
			[1] = 4002,
		},
		triger_para_finish = "9005,5",
		des = "完成9005任务5次",
		reward = {
			[10301] = {
				id = 10301,
				count = 1,
			},
		},
		Expire = nil,
		reset = 10,
		list = 2,
		is_show = false,
		task_share = nil,
	},
}
