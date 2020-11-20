-- id                               int                              建筑id
-- positon                          int                              建筑位置编号
-- name                             lang                             名称
-- icon                             int                              缩略图
-- drop_list                        tableString[k:#seq|v:#1(int)]    制造池
-- droplimt                         int                              制造掉落内容限制
-- icon_show                        int                              制造展示图标
-- time                             int                              制造基础时间(秒）
-- max_num                          int                              初始制造上限数量
-- rate_high                        int                              初始制造概率（高）
-- rate_middle                      int                              初始制造概率（中）
-- triger                           tableString[k:#seq|v:#1(int)]    建筑开放条件枚举
-- triger_para                      string                           开放条件枚举
-- limit_des                        tableString[k:#seq|v:#1(string)]   建筑门槛描述
-- defend_max                       int                              入驻栏位上限数
-- defend                           int                              初始入驻栏位开放数量
-- hero                             tableString[k:#seq|v:#1(int)]    适配精灵

return {
	[1] = {
		id = 1,
		positon = 1,
		name = "",
		icon = 1,
		drop_list = {
			[1] = 201001,
			[2] = 201007,
			[3] = 201014,
		},
		droplimt = 1,
		icon_show = 10001,
		time = 10,
		max_num = 20,
		rate_high = 10,
		rate_middle = 30,
		triger = {
			[1] = 5001,
		},
		triger_para = "10",
		limit_des = {
			[1] = "精算能力值达到10以上",
		},
		defend_max = 3,
		defend = 1,
		hero = {
			[1] = 40101,
			[2] = 40102,
		},
	},
	[2] = {
		id = 2,
		positon = 2,
		name = "",
		icon = 2,
		drop_list = {
			[1] = 201001,
			[2] = 201007,
			[3] = 201014,
		},
		droplimt = 1,
		icon_show = 10002,
		time = 10,
		max_num = 21,
		rate_high = 10,
		rate_middle = 30,
		triger = {
			[1] = 5002,
		},
		triger_para = "10",
		limit_des = {
			[1] = "分析能力值达到10以上",
		},
		defend_max = 3,
		defend = 1,
		hero = {
			[1] = 40102,
			[2] = 40103,
		},
	},
	[3] = {
		id = 3,
		positon = 3,
		name = "",
		icon = 3,
		drop_list = {
			[1] = 201001,
			[2] = 201007,
			[3] = 201014,
		},
		droplimt = 1,
		icon_show = 10001,
		time = 10,
		max_num = 22,
		rate_high = 10,
		rate_middle = 30,
		triger = {
			[1] = 5003,
		},
		triger_para = "10",
		limit_des = {
			[1] = "感应能力值达到10以上",
		},
		defend_max = 3,
		defend = 1,
		hero = {
			[1] = 40103,
			[2] = 40104,
		},
	},
	[4] = {
		id = 4,
		positon = 4,
		name = "",
		icon = 4,
		drop_list = {
			[1] = 201001,
			[2] = 201007,
			[3] = 201014,
		},
		droplimt = 1,
		icon_show = 10002,
		time = 10,
		max_num = 23,
		rate_high = 10,
		rate_middle = 30,
		triger = {
			[1] = 5004,
		},
		triger_para = "10",
		limit_des = {
			[1] = "共鸣能力值达到10以上",
		},
		defend_max = 3,
		defend = 1,
		hero = {
			[1] = 40103,
			[2] = 40104,
		},
	},
	[5] = {
		id = 5,
		positon = 5,
		name = "",
		icon = 5,
		drop_list = {
			[1] = 201001,
			[2] = 201007,
			[3] = 201014,
		},
		droplimt = 1,
		icon_show = 10003,
		time = 10,
		max_num = 24,
		rate_high = 10,
		rate_middle = 30,
		triger = {
			[1] = 5005,
		},
		triger_para = "10",
		limit_des = {
			[1] = "同步能力值达到10以上",
		},
		defend_max = 3,
		defend = 1,
		hero = {
			[1] = 40103,
			[2] = 40104,
		},
	},
}
