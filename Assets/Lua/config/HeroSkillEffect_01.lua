-- id                               int                              特效id
-- effects                          dict[3]                          特效表现
--    execute                       string                           执行特效
--    continue                      string                           持续特效
--    disappear                     string                           消失特效
-- start_lv                         int                              需求等级
-- instead_lv                       tableString[k:#seq|v:#1(int)]    替换等级
-- check_points                     tableString[k:#seq|v:#1(int)]    检查点
-- chance                           fixedint                         检查概率
-- conditions                       dict[3]                          检查条件
--    condition1                    tableString[k:#seq|v:#1(fixedfloat)]   条件一
--    condition2                    tableString[k:#seq|v:#1(fixedfloat)]   条件二
--    condition3                    tableString[k:#seq|v:#1(fixedfloat)]   条件三
-- range                            tableString[k:#seq|v:#1(fixedfloat)]   目标选择
-- delay                            int                              延迟施放
-- type                             int                              特效类型
-- type_sub                         int                              类型子类
-- type_content                     tableString[k:#seq|v:#1(fixedint)]   类型具体内容
-- parameter1                       tableString[k:#seq|v:#1(fixedfloat)]   特殊参数1
-- parameter2                       tableString[k:#seq|v:#1(fixedfloat)]   特殊参数2
-- parameter3                       tableString[k:#seq|v:#1(fixedfloat)]   特殊参数3
-- buff_icon                        string                           buff图标
-- turn                             tableString[k:#seq|v:#1(fixedfloat)]   持续时间
-- number                           tableString[k:#seq|v:#1(fixedfloat)]   次数持续
-- tags                             tableString[k:#seq|v:#1(int)]    标签

return {
	[404011] = {
		effects = {
			execute = "",
			continue = "",
			disappear = "",
		},
		start_lv = 1,
		instead_lv = nil,
		check_points = {
			[1] = 5,
		},
		chance = 104857600 --[[100]],
		conditions = {
			condition1 = {
				[1] = 0 --[[0]],
				[2] = 3145728 --[[3]],
				[3] = 0 --[[0]],
				[4] = 42991616 --[[41]],
			},
			condition2 = nil,
			condition3 = nil,
		},
		range = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		delay = nil,
		type = 40,
		type_sub = 2,
		type_content = {
			[1] = 31457280000 --[[30000]],
			[2] = 0 --[[0]],
		},
		parameter1 = nil,
		parameter2 = nil,
		parameter3 = nil,
		buff_icon = "",
		turn = nil,
		number = nil,
		tags = nil,
	},
	[404012] = {
		effects = {
			execute = "",
			continue = "Effect/Buffs/Yoshino_PassiveSS",
			disappear = "Effect/Buffs/Yoshino_PassiveSS_01",
		},
		start_lv = 1,
		instead_lv = nil,
		check_points = {
			[1] = 5,
		},
		chance = 104857600 --[[100]],
		conditions = {
			condition1 = {
				[1] = 0 --[[0]],
				[2] = 3145728 --[[3]],
				[3] = 0 --[[0]],
				[4] = 4194304 --[[4]],
			},
			condition2 = nil,
			condition3 = nil,
		},
		range = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		delay = nil,
		type = 552,
		type_sub = nil,
		type_content = {
			[1] = 41943040 --[[40]],
			[2] = 0 --[[0]],
		},
		parameter1 = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		parameter2 = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		parameter3 = nil,
		buff_icon = "attr_icon",
		turn = {
			[1] = -1048576 --[[-1]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
			[4] = 0 --[[0]],
		},
		number = {
			[1] = 2097152 --[[2]],
			[2] = 104857600 --[[100]],
			[3] = 0 --[[0]],
			[4] = 0 --[[0]],
		},
		tags = {
			[1] = 1,
			[2] = 1,
		},
	},
	[404021] = {
		effects = {
			execute = "",
			continue = "",
			disappear = "",
		},
		start_lv = 1,
		instead_lv = nil,
		check_points = {
			[1] = 5,
		},
		chance = 104857600 --[[100]],
		conditions = {
			condition1 = {
				[1] = 0 --[[0]],
				[2] = 3145728 --[[3]],
				[3] = 0 --[[0]],
				[4] = 4194304 --[[4]],
			},
			condition2 = nil,
			condition3 = nil,
		},
		range = {
			[1] = 0 --[[0]],
			[2] = 10485760000 --[[10000]],
			[3] = 1048576 --[[1]],
		},
		delay = nil,
		type = 10,
		type_sub = nil,
		type_content = {
			[1] = 10485760 --[[10]],
			[2] = 0 --[[0]],
		},
		parameter1 = nil,
		parameter2 = nil,
		parameter3 = nil,
		buff_icon = "",
		turn = nil,
		number = nil,
		tags = nil,
	},
	[404022] = {
		effects = {
			execute = "",
			continue = "",
			disappear = "",
		},
		start_lv = 1,
		instead_lv = nil,
		check_points = {
			[1] = 0,
		},
		chance = 104857600 --[[100]],
		conditions = {
			condition1 = nil,
			condition2 = nil,
			condition3 = nil,
		},
		range = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		delay = nil,
		type = 1001,
		type_sub = nil,
		type_content = {
			[1] = -41943040 --[[-40]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
			[4] = 0 --[[0]],
		},
		parameter1 = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		parameter2 = {
			[1] = 3145728 --[[3]],
			[2] = 0 --[[0]],
		},
		parameter3 = nil,
		buff_icon = "attr_icon",
		turn = {
			[1] = 209715200 --[[200]],
			[2] = 0 --[[0]],
			[3] = 209715200 --[[200]],
			[4] = 0 --[[0]],
		},
		number = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		tags = {
			[1] = 5,
			[2] = 1,
		},
	},
	[404031] = {
		effects = {
			execute = "",
			continue = "",
			disappear = "",
		},
		start_lv = 1,
		instead_lv = nil,
		check_points = {
			[1] = 0,
		},
		chance = 104857600 --[[100]],
		conditions = {
			condition1 = nil,
			condition2 = nil,
			condition3 = nil,
		},
		range = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		delay = nil,
		type = 40,
		type_sub = 0,
		type_content = {
			[1] = 31457280000 --[[30000]],
			[2] = 0 --[[0]],
		},
		parameter1 = nil,
		parameter2 = nil,
		parameter3 = nil,
		buff_icon = "",
		turn = nil,
		number = nil,
		tags = nil,
	},
	[404032] = {
		effects = {
			execute = "",
			continue = "",
			disappear = "",
		},
		start_lv = 1,
		instead_lv = nil,
		check_points = {
			[1] = 0,
		},
		chance = 104857600 --[[100]],
		conditions = {
			condition1 = nil,
			condition2 = nil,
			condition3 = nil,
		},
		range = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		delay = nil,
		type = 551,
		type_sub = nil,
		type_content = {
			[1] = 10485760 --[[10]],
			[2] = 0 --[[0]],
		},
		parameter1 = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		parameter2 = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		parameter3 = nil,
		buff_icon = "attr_icon",
		turn = {
			[1] = -1048576 --[[-1]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
			[4] = 0 --[[0]],
		},
		number = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
			[3] = 0 --[[0]],
		},
		tags = {
			[1] = 1,
			[2] = 1,
		},
	},
}
