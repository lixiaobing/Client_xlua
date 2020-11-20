-- id                               int                              关卡ID
-- attackNum                        tableString[k:#1(int)|v:#2(int)]   怪物种类区分

return {
	[1] = {
		id = 1,
		attackNum = {
			[0] = 2,
			[1] = 2,
			[2] = 5,
		},
	},
	[2] = {
		id = 2,
		attackNum = {
			[1] = 2,
			[2] = 1,
		},
	},
}
