-- id                               int                              关卡ID
-- name                             lang                             障碍物名称
-- model_info                       dict[6]                          模型配置
--    path                          string                           模型路径
--    scale                         fixedfloat                       缩放
--    height                        fixedfloat                       模型身高
--    radius                        fixedfloat                       模型半径
--    collision_height              fixedfloat                       碰撞高度
--    collision_radius              fixedfloat                       碰撞宽度
-- finish_task                      int                              进行攻击需要完成的任务
-- state                            int                              初始默认状态
-- is_attack                        bool                             是否能攻击
-- attack_time                      int                              受击次数
-- is_save                          bool                             是否需要记录状态
-- drop_id                          int                              掉落的道具
-- droplimt                         tableString[k:#1(int)|v:#1(int)]   掉落内容限制

return {
	[1] = {
		id = 1,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti01_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[2] = {
		id = 2,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti02_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[3] = {
		id = 3,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti03_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[4] = {
		id = 4,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti01_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[5] = {
		id = 5,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti02_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[6] = {
		id = 6,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti03_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[7] = {
		id = 7,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti04_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[8] = {
		id = 8,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti05_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 1,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[9] = {
		id = 9,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti06_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 2,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[10] = {
		id = 10,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti06_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 2,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
	[11] = {
		id = 11,
		name = "折纸",
		model_info = {
			path = "Dungeon/Common/Obj_obstacle/shiyanshi_jingti06_po",
			scale = 1048576 --[[1]],
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			collision_height = 1656751 --[[1.58]],
			collision_radius = 524288 --[[0.5]],
		},
		finish_task = nil,
		state = 1,
		is_attack = true,
		attack_time = 2,
		is_save = false,
		drop_id = 4000,
		droplimt = {
			[1] = 1,
		},
	},
}
