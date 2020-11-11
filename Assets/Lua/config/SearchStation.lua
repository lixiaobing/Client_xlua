-- id                               int                              驻守id
-- hero_num                         int                              驻守栏位数
-- event_id                         tableString[k:#seq|v:#1(int)]    驻守事件池
-- triger                           tableString[k:#seq|v:#1(int)]    驻守需求达到条件
-- triger_para                      string                           达到条件参数
-- triger_des1                      string                           条件描述
-- show_item                        tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   奖励预览

return {
	[1] = {
		id = 1,
		hero_num = 3,
		event_id = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		triger = {
			[1] = 2005,
			[2] = 2006,
			[3] = 2007,
		},
		triger_para = "1,3,1,1|40102,1|2",
		triger_des1 = "至少上阵1个S级英雄|上阵狂三且稀有度达到B级|至少上阵2个英雄",
		show_item = {
			[10101] = {
				id = 10101,
				count = 31,
			},
			[10102] = {
				id = 10102,
				count = 30,
			},
			[10201] = {
				id = 10201,
				count = 29,
			},
			[10301] = {
				id = 10301,
				count = 28,
			},
			[10401] = {
				id = 10401,
				count = 27,
			},
			[10601] = {
				id = 10601,
				count = 11,
			},
		},
	},
	[2] = {
		id = 2,
		hero_num = 3,
		event_id = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		triger = {
			[1] = 2005,
			[2] = 2006,
			[3] = 2007,
		},
		triger_para = "1,3,1,1",
		triger_des1 = "至少上阵1个S级英雄",
		show_item = {
			[10101] = {
				id = 10101,
				count = 31,
			},
			[10102] = {
				id = 10102,
				count = 30,
			},
			[10201] = {
				id = 10201,
				count = 29,
			},
			[10301] = {
				id = 10301,
				count = 28,
			},
			[10401] = {
				id = 10401,
				count = 27,
			},
			[10601] = {
				id = 10601,
				count = 11,
			},
		},
	},
	[3] = {
		id = 3,
		hero_num = 3,
		event_id = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		triger = {
			[1] = 2005,
			[2] = 2006,
			[3] = 2007,
		},
		triger_para = "40102,1",
		triger_des1 = "上阵狂三且稀有度达到B级",
		show_item = {
			[10101] = {
				id = 10101,
				count = 31,
			},
			[10102] = {
				id = 10102,
				count = 30,
			},
			[10201] = {
				id = 10201,
				count = 29,
			},
			[10301] = {
				id = 10301,
				count = 28,
			},
			[10401] = {
				id = 10401,
				count = 27,
			},
			[10601] = {
				id = 10601,
				count = 11,
			},
		},
	},
	[4] = {
		id = 4,
		hero_num = 3,
		event_id = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		triger = {
			[1] = 2005,
			[2] = 2006,
			[3] = 2007,
		},
		triger_para = "2",
		triger_des1 = "至少上阵2个英雄",
		show_item = {
			[10101] = {
				id = 10101,
				count = 31,
			},
			[10102] = {
				id = 10102,
				count = 30,
			},
			[10201] = {
				id = 10201,
				count = 29,
			},
			[10301] = {
				id = 10301,
				count = 28,
			},
			[10401] = {
				id = 10401,
				count = 27,
			},
			[10601] = {
				id = 10601,
				count = 11,
			},
		},
	},
	[5] = {
		id = 5,
		hero_num = 3,
		event_id = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
			[5] = 5,
		},
		triger = {
			[1] = 2005,
			[2] = 2006,
			[3] = 2007,
		},
		triger_para = "1,3,1,1|40102,1|2",
		triger_des1 = "至少上阵1个S级英雄|至少上个B级以上狂三|至少上阵2个英雄",
		show_item = {
			[10101] = {
				id = 10101,
				count = 31,
			},
			[10102] = {
				id = 10102,
				count = 30,
			},
			[10201] = {
				id = 10201,
				count = 29,
			},
			[10301] = {
				id = 10301,
				count = 28,
			},
			[10401] = {
				id = 10401,
				count = 27,
			},
			[10601] = {
				id = 10601,
				count = 11,
			},
		},
	},
}
