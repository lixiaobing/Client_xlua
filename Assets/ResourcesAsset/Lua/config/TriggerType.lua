-- id                               int                              触发类型
-- type                             int                              条件所属
-- limt                             int                              条件限制（条件数据类型）
-- condition                        tableString[k:#seq|v:#1(String)]   触发参数配置
-- count                            int                              判断目标

return {
	[1001] = {
		id = 1001,
		type = 1,
		limt = 1,
		condition = {
			[1] = "levelid",
		},
		count = 1,
	},
	[2001] = {
		id = 2001,
		type = 2,
		limt = 1,
		condition = {
			[1] = "roleid；levelid",
		},
		count = 2,
	},
	[2002] = {
		id = 2002,
		type = 2,
		limt = 1,
		condition = {
			[1] = "roleid；startid",
		},
		count = 2,
	},
	[2003] = {
		id = 2003,
		type = 2,
		limt = 1,
		condition = {
			[1] = "roleid；groupid",
		},
		count = 2,
	},
	[2004] = {
		id = 2004,
		type = 2,
		limt = 2,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[3001] = {
		id = 3001,
		type = 3,
		limt = 1,
		condition = {
			[1] = "Dungeonid",
		},
		count = 1,
	},
	[4001] = {
		id = 4001,
		type = 4,
		limt = 1,
		condition = {
			[1] = "Taskid",
		},
		count = 1,
	},
	[4002] = {
		id = 4002,
		type = 4,
		limt = 1,
		condition = {
			[1] = "taskid",
			[2] = "number",
		},
		count = 2,
	},
	[5001] = {
		id = 5001,
		type = 5,
		limt = 1,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[5002] = {
		id = 5002,
		type = 5,
		limt = 1,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[5003] = {
		id = 5003,
		type = 5,
		limt = 1,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[5004] = {
		id = 5004,
		type = 5,
		limt = 1,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[5005] = {
		id = 5005,
		type = 5,
		limt = 1,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[2005] = {
		id = 2005,
		type = 2,
		limt = 1,
		condition = {
			[1] = "number",
			[2] = "star",
			[3] = "stage",
			[4] = "level",
		},
		count = 1,
	},
	[2006] = {
		id = 2006,
		type = 2,
		limt = 1,
		condition = {
			[1] = "heroid",
			[2] = "star",
		},
		count = 1,
	},
	[2007] = {
		id = 2007,
		type = 2,
		limt = 1,
		condition = {
			[1] = "number",
		},
		count = 1,
	},
	[9] = {
		id = 9,
		type = 99,
		limt = 1,
		condition = {
			[1] = "bool",
		},
		count = 1,
	},
}
