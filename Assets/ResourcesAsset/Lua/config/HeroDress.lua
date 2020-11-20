-- id                               int                              精灵时装id
-- type1                            int                              道具大类
-- type2                            int                              道具子类
-- type3                            int                              道具细分
-- name                             lang                             时装名称
-- des                              int                              时装描述
-- model                            int                              时装模型
-- skill_show                       int                              技能表现参数
-- bg_des                           int                              道具背景描述
-- item_tag                         int                              道具角标
-- item_icon                        string                           道具图标
-- item_bg                          int                              道具背板
-- quality                          int                              道具品质
-- star                             int                              道具星级
-- summax                           int                              获取上限
-- gridmax                          int                              堆叠上限
-- jump_id                          tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   获取跳转
-- jump_des                         int                              无获取途径描述
-- resolveItem                      tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   分解道具
-- is_resolve                       bool                             是否可手动分解
-- bag_id                           int                              所属背包
-- max_way                          int                              获取上限处理方式
-- auto_use                         bool                             自使用
-- useprofit                        string                           自使用效果
-- show                             int                              获得方式展示

return {
	[140120101] = {
		id = 140120101,
		type1 = 14,
		type2 = 1,
		type3 = 2,
		name = "十香默认时装",
		des = 10001,
		model = 140120101,
		skill_show = 1,
		bg_des = 100001,
		item_tag = 1,
		item_icon = "10001",
		item_bg = 1,
		quality = 1,
		star = 1,
		summax = 1,
		gridmax = 1,
		jump_id = {
			[1] = {
				id = 1,
				count = 2,
			},
			[2] = {
				id = 3,
				count = 4,
			},
		},
		jump_des = 1000001,
		resolveItem = {
			[10101] = {
				id = 10101,
				count = 1,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		auto_use = false,
		useprofit = "",
		show = 0,
	},
	[140120102] = {
		id = 140120102,
		type1 = 14,
		type2 = 1,
		type3 = 2,
		name = "十香普通时装",
		des = 10002,
		model = 140120102,
		skill_show = 1,
		bg_des = 100002,
		item_tag = 1,
		item_icon = "10002",
		item_bg = 2,
		quality = 1,
		star = 2,
		summax = 1,
		gridmax = 1,
		jump_id = {
			[1] = {
				id = 1,
				count = 2,
			},
			[2] = {
				id = 3,
				count = 4,
			},
			[3] = {
				id = 5,
				count = 6,
			},
		},
		jump_des = 1000002,
		resolveItem = {
			[10101] = {
				id = 10101,
				count = 1,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		auto_use = false,
		useprofit = "",
		show = 0,
	},
	[140120103] = {
		id = 140120103,
		type1 = 14,
		type2 = 1,
		type3 = 2,
		name = "十香花嫁时装",
		des = 10002,
		model = 140120103,
		skill_show = 2,
		bg_des = 100002,
		item_tag = 1,
		item_icon = "10002",
		item_bg = 2,
		quality = 1,
		star = 2,
		summax = 1,
		gridmax = 1,
		jump_id = {
			[1] = {
				id = 1,
				count = 2,
			},
			[2] = {
				id = 3,
				count = 4,
			},
			[3] = {
				id = 5,
				count = 6,
			},
		},
		jump_des = 1000002,
		resolveItem = {
			[10101] = {
				id = 10101,
				count = 1,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		auto_use = false,
		useprofit = "",
		show = 0,
	},
	[140120201] = {
		id = 140120201,
		type1 = 14,
		type2 = 1,
		type3 = 2,
		name = "狂三默认时装",
		des = 10002,
		model = 140120201,
		skill_show = 1,
		bg_des = 100002,
		item_tag = 1,
		item_icon = "10002",
		item_bg = 2,
		quality = 1,
		star = 2,
		summax = 1,
		gridmax = 1,
		jump_id = {
			[1] = {
				id = 1,
				count = 2,
			},
			[2] = {
				id = 3,
				count = 4,
			},
			[3] = {
				id = 5,
				count = 6,
			},
		},
		jump_des = 1000002,
		resolveItem = {
			[10101] = {
				id = 10101,
				count = 1,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		auto_use = false,
		useprofit = "",
		show = 0,
	},
}
