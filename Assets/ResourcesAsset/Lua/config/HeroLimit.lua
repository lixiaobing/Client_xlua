-- id                               int                              限定精灵id
-- hero_id                          int                              精灵id
-- level                            int                              精灵等级
-- star                             int                              精灵星级
-- group                            int                              等阶
-- skill                            tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   技能

return {
	[20010] = {
		id = 20010,
		hero_id = 40101,
		level = 10,
		star = 2,
		group = 2,
		skill = {
			[4010101] = {
				id = 4010101,
				count = 10,
			},
			[4010102] = {
				id = 4010102,
				count = 10,
			},
			[4010103] = {
				id = 4010103,
				count = 10,
			},
			[4010104] = {
				id = 4010104,
				count = 10,
			},
			[4010105] = {
				id = 4010105,
				count = 10,
			},
			[4010106] = {
				id = 4010106,
				count = 10,
			},
			[4010107] = {
				id = 4010107,
				count = 10,
			},
		},
	},
	[20020] = {
		id = 20020,
		hero_id = 40102,
		level = 20,
		star = 3,
		group = 3,
		skill = {
			[4010201] = {
				id = 4010201,
				count = 10,
			},
		},
	},
	[20030] = {
		id = 20030,
		hero_id = 40103,
		level = 30,
		star = 4,
		group = 4,
		skill = {
			[4010301] = {
				id = 4010301,
				count = 10,
			},
		},
	},
}
