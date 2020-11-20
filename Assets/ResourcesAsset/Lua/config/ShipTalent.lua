-- id                               int                              科技id*10+等级
-- icon_bg                          int                              图标背景
-- icon                             int                              图标
-- name                             string                           名称
-- already_max                      bool                             是否满级
-- level_max                        int                              最大等级
-- talent_before                    tableString[k:#seq|v:#1(int)]    前置科技id
-- talent_after                     tableString[k:#seq|v:#1(int)]    后置科技id
-- before_des                       tableString[k:#seq|v:#1(string)]   前置条件描述
-- triger                           tableString[k:#seq|v:#1(int)]    开放门槛枚举
-- triger_para                      string                           枚举参数
-- limit_des                        tableString[k:#seq|v:#1(string)]   建筑门槛描述
-- building                         tableString[k:#1(int)|v:#1(int)]   生效建筑
-- effect                           tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   加成效果
-- des                              string                           加成描述
-- consume                          tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   消耗道具

return {
	[1010] = {
		id = 1010,
		icon_bg = 1,
		icon = 1,
		name = "科技1",
		already_max = false,
		level_max = 2,
		talent_before = nil,
		talent_after = {
			[1] = 1012,
		},
		before_des = nil,
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述1",
		consume = {
			[10102] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[1011] = {
		id = 1011,
		icon_bg = 2,
		icon = 2,
		name = "科技1",
		already_max = false,
		level_max = 2,
		talent_before = nil,
		talent_after = {
			[1] = 1012,
		},
		before_des = nil,
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述1",
		consume = {
			[10102] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[1012] = {
		id = 1012,
		icon_bg = 3,
		icon = 3,
		name = "科技2",
		already_max = true,
		level_max = 2,
		talent_before = {
			[1] = 1011,
		},
		talent_after = {
			[1] = 1021,
		},
		before_des = {
			[1] = "1011解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述2",
		consume = {
			[10102] = {
				id = 10102,
				count = 101,
			},
		},
	},
	[1020] = {
		id = 1020,
		icon_bg = 4,
		icon = 4,
		name = "科技3",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 1012,
		},
		talent_after = {
			[1] = 1031,
		},
		before_des = {
			[1] = "1012解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述3",
		consume = {
			[10102] = {
				id = 10102,
				count = 102,
			},
		},
	},
	[1021] = {
		id = 1021,
		icon_bg = 1,
		icon = 1,
		name = "科技3",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 1012,
		},
		talent_after = {
			[1] = 1031,
		},
		before_des = {
			[1] = "1012解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述3",
		consume = {
			[10102] = {
				id = 10102,
				count = 102,
			},
		},
	},
	[1030] = {
		id = 1030,
		icon_bg = 2,
		icon = 2,
		name = "科技4",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 1021,
		},
		talent_after = {
			[1] = 1041,
		},
		before_des = {
			[1] = "1021解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述4",
		consume = {
			[10102] = {
				id = 10102,
				count = 103,
			},
		},
	},
	[1031] = {
		id = 1031,
		icon_bg = 3,
		icon = 3,
		name = "科技4",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 1021,
		},
		talent_after = {
			[1] = 1041,
		},
		before_des = {
			[1] = "1021解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述4",
		consume = {
			[10102] = {
				id = 10102,
				count = 103,
			},
		},
	},
	[1040] = {
		id = 1040,
		icon_bg = 4,
		icon = 4,
		name = "科技5",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 1031,
		},
		talent_after = {
			[1] = 1051,
		},
		before_des = {
			[1] = "1031解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 10,
			},
		},
		des = "加成描述5",
		consume = {
			[10102] = {
				id = 10102,
				count = 104,
			},
		},
	},
	[1041] = {
		id = 1041,
		icon_bg = 1,
		icon = 1,
		name = "科技5",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 1031,
		},
		talent_after = {
			[1] = 1051,
		},
		before_des = {
			[1] = "1031解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述5",
		consume = {
			[10102] = {
				id = 10102,
				count = 104,
			},
		},
	},
	[1050] = {
		id = 1050,
		icon_bg = 2,
		icon = 2,
		name = "科技6",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 1041,
		},
		talent_after = {
			[1] = 2011,
		},
		before_des = {
			[1] = "1041解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述6",
		consume = {
			[10102] = {
				id = 10102,
				count = 105,
			},
		},
	},
	[1051] = {
		id = 1051,
		icon_bg = 3,
		icon = 3,
		name = "科技6",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 1041,
		},
		talent_after = {
			[1] = 2011,
		},
		before_des = {
			[1] = "1041解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述6",
		consume = {
			[10102] = {
				id = 10102,
				count = 105,
			},
		},
	},
	[2010] = {
		id = 2010,
		icon_bg = 4,
		icon = 4,
		name = "科技7",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 1051,
		},
		talent_after = {
			[1] = 2012,
		},
		before_des = {
			[1] = "1051解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述7",
		consume = {
			[10102] = {
				id = 10102,
				count = 106,
			},
		},
	},
	[2011] = {
		id = 2011,
		icon_bg = 1,
		icon = 1,
		name = "科技7",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 1051,
		},
		talent_after = {
			[1] = 2012,
		},
		before_des = {
			[1] = "1051解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述7",
		consume = {
			[10102] = {
				id = 10102,
				count = 106,
			},
		},
	},
	[2012] = {
		id = 2012,
		icon_bg = 2,
		icon = 2,
		name = "科技8",
		already_max = true,
		level_max = 2,
		talent_before = {
			[1] = 2011,
		},
		talent_after = {
			[1] = 2021,
		},
		before_des = {
			[1] = "2011解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述8",
		consume = {
			[10102] = {
				id = 10102,
				count = 107,
			},
		},
	},
	[2020] = {
		id = 2020,
		icon_bg = 3,
		icon = 3,
		name = "科技9",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 2012,
		},
		talent_after = {
			[1] = 2031,
		},
		before_des = {
			[1] = "2012解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述9",
		consume = {
			[10102] = {
				id = 10102,
				count = 108,
			},
		},
	},
	[2021] = {
		id = 2021,
		icon_bg = 4,
		icon = 4,
		name = "科技9",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 2012,
		},
		talent_after = {
			[1] = 2031,
		},
		before_des = {
			[1] = "2012解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述9",
		consume = {
			[10102] = {
				id = 10102,
				count = 108,
			},
		},
	},
	[2030] = {
		id = 2030,
		icon_bg = 1,
		icon = 1,
		name = "科技10",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 2021,
		},
		talent_after = {
			[1] = 2041,
		},
		before_des = {
			[1] = "2021解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述10",
		consume = {
			[10102] = {
				id = 10102,
				count = 109,
			},
		},
	},
	[2031] = {
		id = 2031,
		icon_bg = 2,
		icon = 2,
		name = "科技10",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 2021,
		},
		talent_after = {
			[1] = 2041,
		},
		before_des = {
			[1] = "2021解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述10",
		consume = {
			[10102] = {
				id = 10102,
				count = 109,
			},
		},
	},
	[2040] = {
		id = 2040,
		icon_bg = 3,
		icon = 3,
		name = "科技11",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 2031,
		},
		talent_after = {
			[1] = 2051,
		},
		before_des = {
			[1] = "2031解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述11",
		consume = {
			[10102] = {
				id = 10102,
				count = 110,
			},
		},
	},
	[2041] = {
		id = 2041,
		icon_bg = 4,
		icon = 4,
		name = "科技11",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 2031,
		},
		talent_after = {
			[1] = 2051,
		},
		before_des = {
			[1] = "2031解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述11",
		consume = {
			[10102] = {
				id = 10102,
				count = 110,
			},
		},
	},
	[2050] = {
		id = 2050,
		icon_bg = 1,
		icon = 1,
		name = "科技12",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 2041,
		},
		talent_after = {
			[1] = 3011,
		},
		before_des = {
			[1] = "2041解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述12",
		consume = {
			[10102] = {
				id = 10102,
				count = 111,
			},
		},
	},
	[2051] = {
		id = 2051,
		icon_bg = 2,
		icon = 2,
		name = "科技12",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 2041,
		},
		talent_after = {
			[1] = 3011,
		},
		before_des = {
			[1] = "2041解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述12",
		consume = {
			[10102] = {
				id = 10102,
				count = 111,
			},
		},
	},
	[3010] = {
		id = 3010,
		icon_bg = 3,
		icon = 3,
		name = "科技13",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 2051,
		},
		talent_after = {
			[1] = 3012,
		},
		before_des = {
			[1] = "2051解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述13",
		consume = {
			[10102] = {
				id = 10102,
				count = 112,
			},
		},
	},
	[3011] = {
		id = 3011,
		icon_bg = 4,
		icon = 4,
		name = "科技13",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 2051,
		},
		talent_after = {
			[1] = 3012,
		},
		before_des = {
			[1] = "2051解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述13",
		consume = {
			[10102] = {
				id = 10102,
				count = 112,
			},
		},
	},
	[3012] = {
		id = 3012,
		icon_bg = 1,
		icon = 1,
		name = "科技14",
		already_max = true,
		level_max = 2,
		talent_before = {
			[1] = 3011,
		},
		talent_after = {
			[1] = 3021,
		},
		before_des = {
			[1] = "3011解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述14",
		consume = {
			[10102] = {
				id = 10102,
				count = 113,
			},
		},
	},
	[3020] = {
		id = 3020,
		icon_bg = 2,
		icon = 2,
		name = "科技15",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 3012,
		},
		talent_after = {
			[1] = 3031,
		},
		before_des = {
			[1] = "3012解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述15",
		consume = {
			[10102] = {
				id = 10102,
				count = 114,
			},
		},
	},
	[3021] = {
		id = 3021,
		icon_bg = 3,
		icon = 3,
		name = "科技15",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 3012,
		},
		talent_after = {
			[1] = 3031,
		},
		before_des = {
			[1] = "3012解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述15",
		consume = {
			[10102] = {
				id = 10102,
				count = 114,
			},
		},
	},
	[3030] = {
		id = 3030,
		icon_bg = 4,
		icon = 4,
		name = "科技16",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 3021,
		},
		talent_after = {
			[1] = 3041,
		},
		before_des = {
			[1] = "3021解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述16",
		consume = {
			[10102] = {
				id = 10102,
				count = 115,
			},
		},
	},
	[3031] = {
		id = 3031,
		icon_bg = 1,
		icon = 1,
		name = "科技16",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 3021,
		},
		talent_after = {
			[1] = 3041,
		},
		before_des = {
			[1] = "3021解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述16",
		consume = {
			[10102] = {
				id = 10102,
				count = 115,
			},
		},
	},
	[3040] = {
		id = 3040,
		icon_bg = 2,
		icon = 2,
		name = "科技17",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 3031,
		},
		talent_after = {
			[1] = 3051,
		},
		before_des = {
			[1] = "3031解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述17",
		consume = {
			[10102] = {
				id = 10102,
				count = 116,
			},
		},
	},
	[3041] = {
		id = 3041,
		icon_bg = 3,
		icon = 3,
		name = "科技17",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 3031,
		},
		talent_after = {
			[1] = 3051,
		},
		before_des = {
			[1] = "3031解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述17",
		consume = {
			[10102] = {
				id = 10102,
				count = 116,
			},
		},
	},
	[3050] = {
		id = 3050,
		icon_bg = 4,
		icon = 4,
		name = "科技18",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 3041,
		},
		talent_after = {
			[1] = 4011,
		},
		before_des = {
			[1] = "3041解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述18",
		consume = {
			[10102] = {
				id = 10102,
				count = 117,
			},
		},
	},
	[3051] = {
		id = 3051,
		icon_bg = 1,
		icon = 1,
		name = "科技18",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 3041,
		},
		talent_after = {
			[1] = 4011,
		},
		before_des = {
			[1] = "3041解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述18",
		consume = {
			[10102] = {
				id = 10102,
				count = 117,
			},
		},
	},
	[4010] = {
		id = 4010,
		icon_bg = 2,
		icon = 2,
		name = "科技19",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 3051,
		},
		talent_after = {
			[1] = 4012,
		},
		before_des = {
			[1] = "3051解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述19",
		consume = {
			[10102] = {
				id = 10102,
				count = 118,
			},
		},
	},
	[4011] = {
		id = 4011,
		icon_bg = 3,
		icon = 3,
		name = "科技19",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 3051,
		},
		talent_after = {
			[1] = 4012,
		},
		before_des = {
			[1] = "3051解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述19",
		consume = {
			[10102] = {
				id = 10102,
				count = 118,
			},
		},
	},
	[4012] = {
		id = 4012,
		icon_bg = 4,
		icon = 4,
		name = "科技20",
		already_max = true,
		level_max = 2,
		talent_before = {
			[1] = 4011,
		},
		talent_after = {
			[1] = 4021,
		},
		before_des = {
			[1] = "4011解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述20",
		consume = {
			[10102] = {
				id = 10102,
				count = 119,
			},
		},
	},
	[4020] = {
		id = 4020,
		icon_bg = 1,
		icon = 1,
		name = "科技21",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 4012,
		},
		talent_after = {
			[1] = 4031,
		},
		before_des = {
			[1] = "4012解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述21",
		consume = {
			[10102] = {
				id = 10102,
				count = 120,
			},
		},
	},
	[4021] = {
		id = 4021,
		icon_bg = 2,
		icon = 2,
		name = "科技21",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 4012,
		},
		talent_after = {
			[1] = 4031,
		},
		before_des = {
			[1] = "4012解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述21",
		consume = {
			[10102] = {
				id = 10102,
				count = 120,
			},
		},
	},
	[4030] = {
		id = 4030,
		icon_bg = 3,
		icon = 3,
		name = "科技22",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 4021,
		},
		talent_after = {
			[1] = 4041,
		},
		before_des = {
			[1] = "4021解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述22",
		consume = {
			[10102] = {
				id = 10102,
				count = 121,
			},
		},
	},
	[4031] = {
		id = 4031,
		icon_bg = 4,
		icon = 4,
		name = "科技22",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 4021,
		},
		talent_after = {
			[1] = 4041,
		},
		before_des = {
			[1] = "4021解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述22",
		consume = {
			[10102] = {
				id = 10102,
				count = 121,
			},
		},
	},
	[4040] = {
		id = 4040,
		icon_bg = 1,
		icon = 1,
		name = "科技23",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 4031,
		},
		talent_after = {
			[1] = 4051,
		},
		before_des = {
			[1] = "4031解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述23",
		consume = {
			[10102] = {
				id = 10102,
				count = 122,
			},
		},
	},
	[4041] = {
		id = 4041,
		icon_bg = 2,
		icon = 2,
		name = "科技23",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 4031,
		},
		talent_after = {
			[1] = 4051,
		},
		before_des = {
			[1] = "4031解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述23",
		consume = {
			[10102] = {
				id = 10102,
				count = 122,
			},
		},
	},
	[4050] = {
		id = 4050,
		icon_bg = 3,
		icon = 3,
		name = "科技24",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 4041,
		},
		talent_after = {
			[1] = 5011,
		},
		before_des = {
			[1] = "4041解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述24",
		consume = {
			[10102] = {
				id = 10102,
				count = 123,
			},
		},
	},
	[4051] = {
		id = 4051,
		icon_bg = 4,
		icon = 4,
		name = "科技24",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 4041,
		},
		talent_after = {
			[1] = 5011,
		},
		before_des = {
			[1] = "4041解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述24",
		consume = {
			[10102] = {
				id = 10102,
				count = 123,
			},
		},
	},
	[5010] = {
		id = 5010,
		icon_bg = 1,
		icon = 1,
		name = "科技25",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 4051,
		},
		talent_after = {
			[1] = 5012,
		},
		before_des = {
			[1] = "4051解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述25",
		consume = {
			[10102] = {
				id = 10102,
				count = 124,
			},
		},
	},
	[5011] = {
		id = 5011,
		icon_bg = 2,
		icon = 2,
		name = "科技25",
		already_max = false,
		level_max = 2,
		talent_before = {
			[1] = 4051,
		},
		talent_after = {
			[1] = 5012,
		},
		before_des = {
			[1] = "4051解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述25",
		consume = {
			[10102] = {
				id = 10102,
				count = 124,
			},
		},
	},
	[5012] = {
		id = 5012,
		icon_bg = 3,
		icon = 3,
		name = "科技26",
		already_max = true,
		level_max = 2,
		talent_before = {
			[1] = 5011,
		},
		talent_after = {
			[1] = 5021,
		},
		before_des = {
			[1] = "5011解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述26",
		consume = {
			[10102] = {
				id = 10102,
				count = 125,
			},
		},
	},
	[5020] = {
		id = 5020,
		icon_bg = 4,
		icon = 4,
		name = "科技27",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 5012,
		},
		talent_after = {
			[1] = 5031,
		},
		before_des = {
			[1] = "5012解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述27",
		consume = {
			[10102] = {
				id = 10102,
				count = 126,
			},
		},
	},
	[5021] = {
		id = 5021,
		icon_bg = 1,
		icon = 1,
		name = "科技27",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 5012,
		},
		talent_after = {
			[1] = 5031,
		},
		before_des = {
			[1] = "5012解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[1] = 1,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 10,
			},
		},
		des = "加成描述27",
		consume = {
			[10102] = {
				id = 10102,
				count = 126,
			},
		},
	},
	[5030] = {
		id = 5030,
		icon_bg = 2,
		icon = 2,
		name = "科技28",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 5021,
		},
		talent_after = {
			[1] = 5041,
		},
		before_des = {
			[1] = "5021解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述28",
		consume = {
			[10102] = {
				id = 10102,
				count = 127,
			},
		},
	},
	[5031] = {
		id = 5031,
		icon_bg = 3,
		icon = 3,
		name = "科技28",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 5021,
		},
		talent_after = {
			[1] = 5041,
		},
		before_des = {
			[1] = "5021解锁",
		},
		triger = {
			[1] = 5001,
		},
		triger_para = "20",
		limit_des = {
			[1] = "精算能力值达到20以上",
		},
		building = {
			[3] = 3,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述28",
		consume = {
			[10102] = {
				id = 10102,
				count = 127,
			},
		},
	},
	[5040] = {
		id = 5040,
		icon_bg = 4,
		icon = 4,
		name = "科技29",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 5031,
		},
		talent_after = {
			[1] = 5051,
		},
		before_des = {
			[1] = "5031解锁",
		},
		triger = {
			[1] = 5002,
		},
		triger_para = "20",
		limit_des = {
			[1] = "分析能力值达到20以上",
		},
		building = {
			[4] = 4,
		},
		effect = {
			[5] = {
				id = 5,
				count = 1,
			},
		},
		des = "加成描述29",
		consume = {
			[10102] = {
				id = 10102,
				count = 128,
			},
		},
	},
	[5041] = {
		id = 5041,
		icon_bg = 1,
		icon = 1,
		name = "科技29",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 5031,
		},
		talent_after = {
			[1] = 5051,
		},
		before_des = {
			[1] = "5031解锁",
		},
		triger = {
			[1] = 5003,
		},
		triger_para = "20",
		limit_des = {
			[1] = "感应能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[1] = {
				id = 1,
				count = 10,
			},
			[2] = {
				id = 2,
				count = 14,
			},
		},
		des = "加成描述29",
		consume = {
			[10102] = {
				id = 10102,
				count = 128,
			},
		},
	},
	[5050] = {
		id = 5050,
		icon_bg = 2,
		icon = 2,
		name = "科技30",
		already_max = false,
		level_max = 1,
		talent_before = {
			[1] = 5031,
		},
		talent_after = nil,
		before_des = {
			[1] = "5031解锁",
		},
		triger = {
			[1] = 5004,
		},
		triger_para = "20",
		limit_des = {
			[1] = "共鸣能力值达到20以上",
		},
		building = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		effect = {
			[4] = {
				id = 4,
				count = 1,
			},
		},
		des = "加成描述30",
		consume = {
			[10102] = {
				id = 10102,
				count = 129,
			},
		},
	},
	[5051] = {
		id = 5051,
		icon_bg = 3,
		icon = 3,
		name = "科技30",
		already_max = true,
		level_max = 1,
		talent_before = {
			[1] = 5031,
		},
		talent_after = nil,
		before_des = {
			[1] = "5031解锁",
		},
		triger = {
			[1] = 5005,
		},
		triger_para = "20",
		limit_des = {
			[1] = "同步能力值达到20以上",
		},
		building = {
			[2] = 2,
		},
		effect = {
			[3] = {
				id = 3,
				count = 1,
			},
		},
		des = "加成描述30",
		consume = {
			[10102] = {
				id = 10102,
				count = 129,
			},
		},
	},
}
