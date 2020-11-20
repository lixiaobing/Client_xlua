-- id                               int                              技能id
-- type                             int                              技能类型
-- type_tag                         int                              技能标签
-- lv                               int                              初始等级
-- limit_lv                         int                              等级上限
-- power_out                        tableString[k:#seq|v:#1(fixedint)]   能量产出
-- gas_out                          tableString[k:#seq|v:#1(fixedint)]   怒气产出
-- armor_damage                     tableString[k:#seq|v:#1(fixedint)]   霸体破坏值
-- damage_effect                    tableString[k:#seq|v:#1(int)]    包含的特效
-- hit_effect                       tableString[k:#seq|v:#1(int)]    包含的特效
-- normal_effect                    tableString[k:#seq|v:#1(int)]    包含的特效
-- cooldown                         tableString[k:#seq|v:#1(int)]    冷却

return {
	[40100111] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1647312896 --[[1571]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001111,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100112] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1647312896 --[[1571]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001121,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100113] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1647312896 --[[1571]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001131,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100114] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1647312896 --[[1571]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001141,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100115] = {
		type = 0,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1647312896 --[[1571]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001151,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100121] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001211,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100122] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001221,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100123] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001231,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100131] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001311,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100132] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001321,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100133] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001331,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100141] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001411,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100142] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001421,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100143] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001431,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100161] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 104857600 --[[100]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001611,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100171] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401001711,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100211] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 245366784 --[[234]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002111,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100212] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002121,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100213] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002131,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100214] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002141,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100215] = {
		type = 0,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 408944640 --[[390]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 125829120 --[[120]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002151,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100221] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002211,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100222] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002221,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100223] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002231,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100231] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002311,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100232] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002321,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100233] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002331,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100241] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002411,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100242] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002421,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100243] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002431,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100261] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 104857600 --[[100]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002611,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100271] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401002711,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100301] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003011,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100302] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 408944640 --[[390]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003021,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100303] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 408944640 --[[390]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 100663296 --[[96]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003031,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100304] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 490733568 --[[468]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 134217728 --[[128]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003041,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100311] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003111,
			[2] = 401003112,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100312] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003121,
			[2] = 401003122,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100313] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003131,
			[2] = 401003132,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100321] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003211,
		},
		hit_effect = nil,
		normal_effect = {
			[1] = 401003212,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100322] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003221,
		},
		hit_effect = nil,
		normal_effect = {
			[1] = 401003222,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100323] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003231,
		},
		hit_effect = nil,
		normal_effect = {
			[1] = 401003232,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100331] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003311,
			[2] = 401003312,
			[3] = 401003411,
			[4] = 401003412,
			[5] = 401003413,
			[6] = 401003414,
			[7] = 401003415,
			[8] = 401003416,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100332] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003321,
			[2] = 401003322,
			[3] = 401003411,
			[4] = 401003412,
			[5] = 401003413,
			[6] = 401003414,
			[7] = 401003415,
			[8] = 401003416,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100333] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003331,
			[2] = 401003332,
			[3] = 401003411,
			[4] = 401003412,
			[5] = 401003413,
			[6] = 401003414,
			[7] = 401003415,
			[8] = 401003416,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100361] = {
		type = 6,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 52428800 --[[50]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003611,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100371] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003711,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100381] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401003811,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100341] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100342] = {
		type = 5,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003421,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100343] = {
		type = 5,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003431,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100344] = {
		type = 5,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003441,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100345] = {
		type = 5,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003451,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100346] = {
		type = 5,
		type_tag = 6,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003461,
			[2] = 401003462,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100347] = {
		type = 5,
		type_tag = 7,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003471,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100351] = {
		type = 5,
		type_tag = 9,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401003511,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100401] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 163577856 --[[156]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 41943040 --[[40]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004011,
		},
		hit_effect = {
			[1] = 401004011,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100402] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 245366784 --[[234]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004021,
		},
		hit_effect = {
			[1] = 401004021,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100403] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 245366784 --[[234]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004031,
		},
		hit_effect = {
			[1] = 401004031,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100404] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 245366784 --[[234]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004041,
		},
		hit_effect = {
			[1] = 401004041,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100405] = {
		type = 0,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004031,
		},
		hit_effect = {
			[1] = 401004051,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100411] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 408944640 --[[390]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004111,
		},
		hit_effect = {
			[1] = 401004111,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100412] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004121,
		},
		hit_effect = {
			[1] = 401004121,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100413] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004131,
		},
		hit_effect = {
			[1] = 401004131,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100421] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004211,
		},
		hit_effect = {
			[1] = 401004211,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100422] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004221,
		},
		hit_effect = {
			[1] = 401004221,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100423] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004231,
		},
		hit_effect = {
			[1] = 401004231,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100431] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004311,
		},
		hit_effect = {
			[1] = 401004311,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100432] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004321,
		},
		hit_effect = {
			[1] = 401004321,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100433] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004331,
		},
		hit_effect = {
			[1] = 401004331,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100461] = {
		type = 6,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 52428800 --[[50]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004611,
		},
		hit_effect = {
			[1] = 401004611,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100471] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004711,
		},
		hit_effect = {
			[1] = 401004711,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100481] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004811,
		},
		hit_effect = {
			[1] = 401004811,
		},
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100441] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 41943040 --[[40]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004411,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100442] = {
		type = 5,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004421,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100443] = {
		type = 5,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004431,
			[2] = 401004432,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100444] = {
		type = 5,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004441,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100445] = {
		type = 5,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004451,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100446] = {
		type = 5,
		type_tag = 6,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004461,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100447] = {
		type = 5,
		type_tag = 7,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = {
			[1] = 401004471,
		},
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100501] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1656750080 --[[1580]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005011,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100502] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1656750080 --[[1580]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005021,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100503] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1656750080 --[[1580]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005031,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100504] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1656750080 --[[1580]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005041,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100505] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1656750080 --[[1580]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005051,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100506] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 1656750080 --[[1580]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 419430400 --[[400]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005061,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100511] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005111,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100512] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005121,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100513] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005131,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100521] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005211,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100522] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005221,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100523] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005231,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100531] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005311,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100532] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005321,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100533] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005331,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100561] = {
		type = 6,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 52428800 --[[50]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005611,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100571] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005711,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100581] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005811,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100541] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005411,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100542] = {
		type = 5,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005421,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100543] = {
		type = 5,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005431,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100544] = {
		type = 5,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005441,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100545] = {
		type = 5,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005451,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100546] = {
		type = 5,
		type_tag = 6,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005461,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100547] = {
		type = 5,
		type_tag = 7,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401005471,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100601] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 245366784 --[[234]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006011,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100602] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006021,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100603] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006031,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100604] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006041,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100605] = {
		type = 0,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 408944640 --[[390]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 125829120 --[[120]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004031,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100611] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006111,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100612] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006121,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100613] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006131,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100621] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006211,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100622] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006221,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100623] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006231,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100631] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006311,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100632] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006321,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100633] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006331,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100661] = {
		type = 6,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 52428800 --[[50]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006611,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100671] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006711,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100681] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401006811,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100641] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100642] = {
		type = 5,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100643] = {
		type = 5,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100644] = {
		type = 5,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100645] = {
		type = 5,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100646] = {
		type = 5,
		type_tag = 6,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100647] = {
		type = 5,
		type_tag = 7,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100701] = {
		type = 0,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 245366784 --[[234]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007011,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100702] = {
		type = 0,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 67108864 --[[64]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007021,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100703] = {
		type = 0,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007031,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100704] = {
		type = 0,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 327155712 --[[312]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 83886080 --[[80]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007041,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100705] = {
		type = 0,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 408944640 --[[390]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 125829120 --[[120]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401004031,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100711] = {
		type = 1,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007111,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100712] = {
		type = 1,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007121,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100713] = {
		type = 1,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007131,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100721] = {
		type = 2,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007211,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100722] = {
		type = 2,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007221,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100723] = {
		type = 2,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007231,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100731] = {
		type = 3,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 346030080 --[[330]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007311,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100732] = {
		type = 3,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 692060160 --[[660]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007321,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100733] = {
		type = 3,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 1048576000 --[[1000]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007331,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100761] = {
		type = 6,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 52428800 --[[50]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007611,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100771] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007711,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100781] = {
		type = 4,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 2097152000 --[[2000]],
			[2] = 0 --[[0]],
		},
		damage_effect = {
			[1] = 401007811,
		},
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100741] = {
		type = 5,
		type_tag = 1,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100742] = {
		type = 5,
		type_tag = 2,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100743] = {
		type = 5,
		type_tag = 3,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100744] = {
		type = 5,
		type_tag = 4,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100745] = {
		type = 5,
		type_tag = 5,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100746] = {
		type = 5,
		type_tag = 6,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
	[40100747] = {
		type = 5,
		type_tag = 7,
		lv = 1,
		limit_lv = 1,
		power_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		gas_out = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		armor_damage = {
			[1] = 0 --[[0]],
			[2] = 0 --[[0]],
		},
		damage_effect = nil,
		hit_effect = nil,
		normal_effect = nil,
		cooldown = {
			[1] = 0,
			[2] = 0,
		},
	},
}
