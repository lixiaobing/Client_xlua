-- id                               int                              评价id
-- name                             string                           评价名称
-- award                            tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   额外奖励

return {
	[1] = {
		id = 1,
		name = "B",
		award = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
	},
	[2] = {
		id = 2,
		name = "A",
		award = {
			[1] = {
				id = 10102,
				count = 10,
			},
		},
	},
	[3] = {
		id = 3,
		name = "S",
		award = {
			[1] = {
				id = 10102,
				count = 15,
			},
		},
	},
	[4] = {
		id = 4,
		name = "SS",
		award = {
			[1] = {
				id = 10102,
				count = 20,
			},
		},
	},
	[5] = {
		id = 5,
		name = "SSS",
		award = {
			[1] = {
				id = 10102,
				count = 50,
			},
		},
	},
}
