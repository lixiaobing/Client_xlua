-- id                               int                              区域ID
-- area_list                        int                              区域排序字段
-- area_name                        lang                             区域名称
-- level_id                         tableString[k:#seq|v:#1(int)]    区域所包含的关卡ID
-- area_limit                       int                              探索开放条件
-- limit_para                       tableString[k:#seq|v:#1(int)]    探索开放条件参数
-- task                             tableString[k:#seq|v:#1(int)]    支线任务集合
-- box                              tableString[k:#seq|v:#1(int)]    宝箱集合
-- exhibit                          tableString[k:#seq|v:#1(int)]    收藏品集合
-- event                            tableString[k:#seq|v:#1(int)]    事件集合
-- search_num                       int                              区域探索次数
-- event_max                        int                              区域事件上限数
-- event_time                       tableString[k:#seq|v:#table(min=#1(int),max=#2(int),chance=#3(int))]   事件随机时机和概率

return {
	[1] = {
		id = 1,
		area_list = 1,
		area_name = "抵挡AST的进攻",
		level_id = {
			[1] = 201001,
		},
		area_limit = nil,
		limit_para = nil,
		task = nil,
		box = nil,
		exhibit = nil,
		event = {
			[1] = 9001,
			[2] = 9002,
			[3] = 9003,
			[4] = 9004,
			[5] = 9005,
		},
		search_num = 20,
		event_max = 3,
		event_time = {
			[1] = {
				min = 1,
				max = 10,
				chance = 50,
			},
			[2] = {
				min = 10,
				max = 15,
				chance = 50,
			},
			[3] = {
				min = 16,
				max = 20,
				chance = 50,
			},
		},
	},
	[2] = {
		id = 2,
		area_list = 2,
		area_name = "抵挡AST的进攻",
		level_id = {
			[1] = 201002,
		},
		area_limit = nil,
		limit_para = nil,
		task = nil,
		box = nil,
		exhibit = nil,
		event = {
			[1] = 9001,
			[2] = 9002,
			[3] = 9003,
			[4] = 9004,
			[5] = 9005,
		},
		search_num = 20,
		event_max = 3,
		event_time = {
			[1] = {
				min = 1,
				max = 10,
				chance = 50,
			},
			[2] = {
				min = 10,
				max = 15,
				chance = 50,
			},
			[3] = {
				min = 16,
				max = 20,
				chance = 50,
			},
		},
	},
	[3] = {
		id = 3,
		area_list = 3,
		area_name = "抵挡AST的进攻",
		level_id = {
			[1] = 201003,
		},
		area_limit = nil,
		limit_para = nil,
		task = nil,
		box = nil,
		exhibit = nil,
		event = {
			[1] = 9001,
			[2] = 9002,
			[3] = 9003,
			[4] = 9004,
			[5] = 9005,
		},
		search_num = 20,
		event_max = 3,
		event_time = {
			[1] = {
				min = 1,
				max = 10,
				chance = 50,
			},
			[2] = {
				min = 10,
				max = 15,
				chance = 50,
			},
			[3] = {
				min = 16,
				max = 20,
				chance = 50,
			},
		},
	},
	[4] = {
		id = 4,
		area_list = 1,
		area_name = "抵挡AST的进攻",
		level_id = {
			[1] = 202001,
			[2] = 202002,
		},
		area_limit = nil,
		limit_para = nil,
		task = nil,
		box = nil,
		exhibit = nil,
		event = {
			[1] = 9001,
			[2] = 9002,
			[3] = 9003,
			[4] = 9004,
			[5] = 9005,
		},
		search_num = 20,
		event_max = 3,
		event_time = {
			[1] = {
				min = 1,
				max = 10,
				chance = 50,
			},
			[2] = {
				min = 10,
				max = 15,
				chance = 50,
			},
			[3] = {
				min = 16,
				max = 20,
				chance = 50,
			},
		},
	},
	[5] = {
		id = 5,
		area_list = 1,
		area_name = "抵挡AST的进攻",
		level_id = {
			[1] = 301001,
		},
		area_limit = nil,
		limit_para = nil,
		task = nil,
		box = nil,
		exhibit = nil,
		event = {
			[1] = 9001,
			[2] = 9002,
			[3] = 9003,
			[4] = 9004,
			[5] = 9005,
		},
		search_num = 20,
		event_max = 3,
		event_time = {
			[1] = {
				min = 1,
				max = 10,
				chance = 50,
			},
			[2] = {
				min = 10,
				max = 15,
				chance = 50,
			},
			[3] = {
				min = 16,
				max = 20,
				chance = 50,
			},
		},
	},
}
