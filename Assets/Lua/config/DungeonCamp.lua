-- id                               int                              阵营ID
-- camp_relations                   tableString[k:#seq|v:#1(int)]    和阵营1关系(玩家)

return {
	[1] = {
		id = 1,
		camp_relations = {
			[1] = 2,
			[2] = 1,
			[3] = 0,
		},
	},
	[2] = {
		id = 2,
		camp_relations = {
			[1] = 1,
			[2] = 2,
			[3] = 0,
		},
	},
	[3] = {
		id = 3,
		camp_relations = {
			[1] = 0,
			[2] = 0,
			[3] = 2,
		},
	},
}
