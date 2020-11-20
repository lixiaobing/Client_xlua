-- id                               int                              背包Id
-- bag_type                         int                              背包类型
-- type2                            int                              类型2
-- name                             lang                             背包名称
-- num_limit                        int                              背包格子上限
-- sell_des                         int                              分解描述
-- sort_type                        string                           背包排序方式(0默认1稀有度2时间3品质)

return {
	[0] = {
		id = 0,
		bag_type = 0,
		type2 = 0,
		name = "",
		num_limit = 999999,
		sell_des = 0,
		sort_type = "",
	},
	[1] = {
		id = 1,
		bag_type = 1,
		type2 = 1,
		name = "消耗物品",
		num_limit = 999,
		sell_des = 1,
		sort_type = "0,1,2",
	},
	[2] = {
		id = 2,
		bag_type = 1,
		type2 = 0,
		name = "基础物品",
		num_limit = 999,
		sell_des = 1,
		sort_type = "0,1,3",
	},
	[3] = {
		id = 3,
		bag_type = 1,
		type2 = 0,
		name = "质点",
		num_limit = 999,
		sell_des = 1,
		sort_type = "0,1,3",
	},
	[4] = {
		id = 4,
		bag_type = 1,
		type2 = 0,
		name = "碎片",
		num_limit = 999,
		sell_des = 0,
		sort_type = "0,1,3",
	},
	[5] = {
		id = 5,
		bag_type = 1,
		type2 = 0,
		name = "其他",
		num_limit = 999,
		sell_des = 0,
		sort_type = "0,1,3",
	},
	[11] = {
		id = 11,
		bag_type = 2,
		type2 = 0,
		name = "消耗物品",
		num_limit = 999,
		sell_des = 0,
		sort_type = "0,1,3",
	},
}
