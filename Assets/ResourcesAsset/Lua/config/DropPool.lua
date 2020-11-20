-- id                               int                              id
-- type                             int                              类型
-- content                          tableString[k:#seq|v:#table(id=#1(int),weight=#2(int),min=#3(int),max=#4(int))]   内容
-- mode                             int                              掉落方式
-- totoal_weight                    int                              总概率

return {
	[1] = {
		type = 1,
		content = {
			[1] = {
				id = 104001,
				weight = 1,
				min = 1,
				max = 5,
			},
			[2] = {
				id = 10101,
				weight = 1,
				min = 1,
				max = 5,
			},
			[3] = {
				id = 104002,
				weight = 1,
				min = 1,
				max = 5,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[2] = {
		type = 2,
		content = {
			[1] = {
				id = 40100401,
				weight = 1,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 40100402,
				weight = 1,
				min = 1,
				max = 1,
			},
			[3] = {
				id = 40100403,
				weight = 1,
				min = 1,
				max = 1,
			},
			[4] = {
				id = 40100404,
				weight = 1,
				min = 1,
				max = 1,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[3] = {
		type = 3,
		content = {
			[1] = {
				id = 1,
				weight = 1,
				min = 100,
				max = 200,
			},
			[2] = {
				id = 2,
				weight = 1,
				min = 10,
				max = 20,
			},
			[3] = {
				id = 3,
				weight = 1,
				min = 10,
				max = 20,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[4] = {
		type = 4,
		content = nil,
		mode = nil,
		totoal_weight = nil,
	},
	[5] = {
		type = 1,
		content = {
			[1] = {
				id = 104001,
				weight = 1,
				min = 1,
				max = 5,
			},
			[2] = {
				id = 10101,
				weight = 1,
				min = 1,
				max = 5,
			},
			[3] = {
				id = 104002,
				weight = 1,
				min = 1,
				max = 5,
			},
		},
		mode = 2,
		totoal_weight = 5,
	},
	[6] = {
		type = 2,
		content = {
			[1] = {
				id = 40100401,
				weight = 1,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 40100402,
				weight = 1,
				min = 1,
				max = 1,
			},
			[3] = {
				id = 40100403,
				weight = 1,
				min = 1,
				max = 1,
			},
			[4] = {
				id = 40100404,
				weight = 1,
				min = 1,
				max = 1,
			},
		},
		mode = 2,
		totoal_weight = 5,
	},
	[7] = {
		type = 3,
		content = {
			[1] = {
				id = 1,
				weight = 1,
				min = 100,
				max = 200,
			},
			[2] = {
				id = 2,
				weight = 1,
				min = 10,
				max = 20,
			},
			[3] = {
				id = 3,
				weight = 1,
				min = 10,
				max = 20,
			},
		},
		mode = 2,
		totoal_weight = 5,
	},
	[8] = {
		type = 4,
		content = nil,
		mode = nil,
		totoal_weight = nil,
	},
	[9] = {
		type = 1,
		content = {
			[1] = {
				id = 10101,
				weight = 100,
				min = 10,
				max = 50,
			},
		},
		mode = 1,
		totoal_weight = 100,
	},
	[201001] = {
		type = 1,
		content = {
			[1] = {
				id = 10401,
				weight = 100,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 10501,
				weight = 100,
				min = 2,
				max = 2,
			},
			[3] = {
				id = 10502,
				weight = 100,
				min = 3,
				max = 3,
			},
		},
		mode = 2,
		totoal_weight = 100,
	},
	[201007] = {
		type = 1,
		content = {
			[1] = {
				id = 10501,
				weight = 10,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 10502,
				weight = 50,
				min = 2,
				max = 2,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[201008] = {
		type = 1,
		content = {
			[1] = {
				id = 10503,
				weight = 10,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 10601,
				weight = 10,
				min = 2,
				max = 2,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[201014] = {
		type = 1,
		content = {
			[1] = {
				id = 10503,
				weight = 100,
				min = 1,
				max = 1,
			},
		},
		mode = 2,
		totoal_weight = 100,
	},
	[201015] = {
		type = 1,
		content = {
			[1] = {
				id = 10601,
				weight = 30,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 10401,
				weight = 30,
				min = 1,
				max = 1,
			},
		},
		mode = 2,
		totoal_weight = 100,
	},
	[201016] = {
		type = 1,
		content = {
			[1] = {
				id = 10501,
				weight = 100,
				min = 1,
				max = 1,
			},
		},
		mode = 2,
		totoal_weight = 100,
	},
	[3000] = {
		type = 2,
		content = {
			[1] = {
				id = 404011,
				weight = 1,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 404012,
				weight = 1,
				min = 1,
				max = 1,
			},
			[3] = {
				id = 404021,
				weight = 1,
				min = 1,
				max = 1,
			},
			[4] = {
				id = 404022,
				weight = 1,
				min = 1,
				max = 1,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[300001] = {
		type = 1,
		content = {
			[1] = {
				id = 201001,
				weight = 60,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 201007,
				weight = 30,
				min = 1,
				max = 1,
			},
			[3] = {
				id = 201014,
				weight = 10,
				min = 1,
				max = 1,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
	[300002] = {
		type = 1,
		content = {
			[1] = {
				id = 201001,
				weight = 10,
				min = 1,
				max = 1,
			},
			[2] = {
				id = 201007,
				weight = 40,
				min = 1,
				max = 1,
			},
			[3] = {
				id = 201014,
				weight = 50,
				min = 1,
				max = 1,
			},
		},
		mode = 1,
		totoal_weight = nil,
	},
}
