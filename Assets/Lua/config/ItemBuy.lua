-- id                               int                              道具id
-- title                            tableString[k:#1(int)|v:#table(id=#1(int),num=#2(int))]   兑换道具
-- show_bg                          int                              购买次数限制
-- item_consume                     int                              消耗道具
-- num_consume                      tableString[k:#seq|v:#1(int)]    消耗数量
-- num                              int                              购买数量
-- time                             int                              次数刷新时间

return {
	[10102] = {
		id = 10102,
		title = {
			[201001] = {
				id = 201001,
				num = 10,
			},
			[201002] = {
				id = 201002,
				num = 20,
			},
		},
		show_bg = 5,
		item_consume = 10101,
		num_consume = {
			[1] = 10,
			[2] = 20,
			[3] = 20,
			[4] = 30,
			[5] = 30,
		},
		num = 50,
		time = 1,
	},
	[10103] = {
		id = 10103,
		title = {
			[201003] = {
				id = 201003,
				num = 10,
			},
			[201004] = {
				id = 201004,
				num = 20,
			},
		},
		show_bg = 5,
		item_consume = 10101,
		num_consume = {
			[1] = 0,
			[2] = 20,
			[3] = 20,
			[4] = 30,
			[5] = 30,
		},
		num = 50,
		time = 1,
	},
}
