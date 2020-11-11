-- id                               int                              id
-- mode                             int                              类型
-- pool                             tableString[k:#seq|v:#table(poolid=#1(int),weight=#2(int))]   对应池子id
-- totoal_weight                    int                              总概率
-- times                            int                              每次循环次数

return {
	[100] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 1,
				weight = 50,
			},
			[2] = {
				poolid = 2,
				weight = 20,
			},
			[3] = {
				poolid = 3,
				weight = 50,
			},
			[4] = {
				poolid = 4,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[200] = {
		mode = 2,
		pool = {
			[1] = {
				poolid = 1,
				weight = 50,
			},
			[2] = {
				poolid = 2,
				weight = 20,
			},
			[3] = {
				poolid = 3,
				weight = 50,
			},
			[4] = {
				poolid = 4,
				weight = 20,
			},
		},
		totoal_weight = 100,
		times = 1,
	},
	[300] = {
		mode = 3,
		pool = {
			[1] = {
				poolid = 1,
				weight = 50,
			},
			[2] = {
				poolid = 2,
				weight = 20,
			},
			[3] = {
				poolid = 3,
				weight = 50,
			},
			[4] = {
				poolid = 4,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[400] = {
		mode = 4,
		pool = {
			[1] = {
				poolid = 1,
				weight = 50,
			},
			[2] = {
				poolid = 2,
				weight = 20,
			},
			[3] = {
				poolid = 3,
				weight = 50,
			},
			[4] = {
				poolid = 4,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[500] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 5,
				weight = 50,
			},
			[2] = {
				poolid = 6,
				weight = 20,
			},
			[3] = {
				poolid = 7,
				weight = 50,
			},
			[4] = {
				poolid = 8,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[600] = {
		mode = 2,
		pool = {
			[1] = {
				poolid = 5,
				weight = 50,
			},
			[2] = {
				poolid = 6,
				weight = 20,
			},
			[3] = {
				poolid = 7,
				weight = 50,
			},
			[4] = {
				poolid = 8,
				weight = 20,
			},
		},
		totoal_weight = 100,
		times = 1,
	},
	[700] = {
		mode = 3,
		pool = {
			[1] = {
				poolid = 5,
				weight = 50,
			},
			[2] = {
				poolid = 6,
				weight = 20,
			},
			[3] = {
				poolid = 7,
				weight = 50,
			},
			[4] = {
				poolid = 8,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[800] = {
		mode = 4,
		pool = {
			[1] = {
				poolid = 5,
				weight = 50,
			},
			[2] = {
				poolid = 6,
				weight = 20,
			},
			[3] = {
				poolid = 7,
				weight = 50,
			},
			[4] = {
				poolid = 8,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[1000] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 1,
				weight = 50,
			},
			[2] = {
				poolid = 2,
				weight = 20,
			},
			[3] = {
				poolid = 3,
				weight = 50,
			},
			[4] = {
				poolid = 4,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 5,
	},
	[2000] = {
		mode = 3,
		pool = {
			[1] = {
				poolid = 1,
				weight = 50,
			},
			[2] = {
				poolid = 2,
				weight = 20,
			},
			[3] = {
				poolid = 3,
				weight = 50,
			},
			[4] = {
				poolid = 4,
				weight = 20,
			},
		},
		totoal_weight = nil,
		times = 6,
	},
	[201001] = {
		mode = 4,
		pool = {
			[1] = {
				poolid = 201001,
				weight = 100,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[201007] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 201007,
				weight = 100,
			},
			[2] = {
				poolid = 201008,
				weight = 100,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[201014] = {
		mode = 2,
		pool = {
			[1] = {
				poolid = 201014,
				weight = 30,
			},
			[2] = {
				poolid = 201015,
				weight = 30,
			},
			[3] = {
				poolid = 201016,
				weight = 100,
			},
		},
		totoal_weight = 100,
		times = 1,
	},
	[3000] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 3000,
				weight = 100,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[4000] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 9,
				weight = 50,
			},
		},
		totoal_weight = 100,
		times = 1,
	},
	[300001] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 300001,
				weight = 100,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
	[300002] = {
		mode = 1,
		pool = {
			[1] = {
				poolid = 300002,
				weight = 100,
			},
		},
		totoal_weight = nil,
		times = 1,
	},
}
