-- id                               int                              id（等阶+等级）
-- stage                            int                              等阶
-- level                            int                              等级
-- exp                              int                              升到下级所需经验总值
-- level_max                        bool                             是否满级
-- exp_upgrade                      int                              作为强化提供经验
-- resolve_item                     tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   分解材料

return {
	[101] = {
		id = 101,
		stage = 1,
		level = 1,
		exp = 100,
		level_max = false,
		exp_upgrade = 100,
		resolve_item = nil,
	},
	[102] = {
		id = 102,
		stage = 1,
		level = 2,
		exp = 150,
		level_max = false,
		exp_upgrade = 250,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[103] = {
		id = 103,
		stage = 1,
		level = 3,
		exp = 200,
		level_max = false,
		exp_upgrade = 450,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[104] = {
		id = 104,
		stage = 1,
		level = 4,
		exp = 250,
		level_max = false,
		exp_upgrade = 700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[105] = {
		id = 105,
		stage = 1,
		level = 5,
		exp = 300,
		level_max = false,
		exp_upgrade = 1000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[106] = {
		id = 106,
		stage = 1,
		level = 6,
		exp = 350,
		level_max = false,
		exp_upgrade = 1350,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[107] = {
		id = 107,
		stage = 1,
		level = 7,
		exp = 400,
		level_max = false,
		exp_upgrade = 1750,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[108] = {
		id = 108,
		stage = 1,
		level = 8,
		exp = 450,
		level_max = false,
		exp_upgrade = 2200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[109] = {
		id = 109,
		stage = 1,
		level = 9,
		exp = 500,
		level_max = false,
		exp_upgrade = 2700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[110] = {
		id = 110,
		stage = 1,
		level = 10,
		exp = 600,
		level_max = false,
		exp_upgrade = 3300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[111] = {
		id = 111,
		stage = 1,
		level = 11,
		exp = 700,
		level_max = false,
		exp_upgrade = 4000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[112] = {
		id = 112,
		stage = 1,
		level = 12,
		exp = 800,
		level_max = false,
		exp_upgrade = 4800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
		},
	},
	[113] = {
		id = 113,
		stage = 1,
		level = 13,
		exp = 900,
		level_max = false,
		exp_upgrade = 5700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 1,
			},
		},
	},
	[114] = {
		id = 114,
		stage = 1,
		level = 14,
		exp = 1000,
		level_max = false,
		exp_upgrade = 6700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 1,
			},
		},
	},
	[115] = {
		id = 115,
		stage = 1,
		level = 15,
		exp = 1200,
		level_max = false,
		exp_upgrade = 7900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 1,
			},
		},
	},
	[116] = {
		id = 116,
		stage = 1,
		level = 16,
		exp = 1400,
		level_max = false,
		exp_upgrade = 9300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 1,
			},
		},
	},
	[117] = {
		id = 117,
		stage = 1,
		level = 17,
		exp = 1600,
		level_max = false,
		exp_upgrade = 10900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 1,
			},
		},
	},
	[118] = {
		id = 118,
		stage = 1,
		level = 18,
		exp = 1800,
		level_max = false,
		exp_upgrade = 12700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 2,
			},
		},
	},
	[119] = {
		id = 119,
		stage = 1,
		level = 19,
		exp = 2000,
		level_max = false,
		exp_upgrade = 14700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 2,
			},
		},
	},
	[120] = {
		id = 120,
		stage = 1,
		level = 20,
		exp = -1,
		level_max = true,
		exp_upgrade = 14700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 2,
			},
		},
	},
	[201] = {
		id = 201,
		stage = 2,
		level = 1,
		exp = 100,
		level_max = false,
		exp_upgrade = 14800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 2,
			},
		},
	},
	[202] = {
		id = 202,
		stage = 2,
		level = 2,
		exp = 150,
		level_max = false,
		exp_upgrade = 14950,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 2,
			},
		},
	},
	[203] = {
		id = 203,
		stage = 2,
		level = 3,
		exp = 200,
		level_max = false,
		exp_upgrade = 15150,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 2,
			},
		},
	},
	[204] = {
		id = 204,
		stage = 2,
		level = 4,
		exp = 250,
		level_max = false,
		exp_upgrade = 15400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[205] = {
		id = 205,
		stage = 2,
		level = 5,
		exp = 300,
		level_max = false,
		exp_upgrade = 15700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[206] = {
		id = 206,
		stage = 2,
		level = 6,
		exp = 350,
		level_max = false,
		exp_upgrade = 16050,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[207] = {
		id = 207,
		stage = 2,
		level = 7,
		exp = 400,
		level_max = false,
		exp_upgrade = 16450,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[208] = {
		id = 208,
		stage = 2,
		level = 8,
		exp = 450,
		level_max = false,
		exp_upgrade = 16900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[209] = {
		id = 209,
		stage = 2,
		level = 9,
		exp = 500,
		level_max = false,
		exp_upgrade = 17400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[210] = {
		id = 210,
		stage = 2,
		level = 10,
		exp = 600,
		level_max = false,
		exp_upgrade = 18000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[211] = {
		id = 211,
		stage = 2,
		level = 11,
		exp = 700,
		level_max = false,
		exp_upgrade = 18700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[212] = {
		id = 212,
		stage = 2,
		level = 12,
		exp = 800,
		level_max = false,
		exp_upgrade = 19500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[213] = {
		id = 213,
		stage = 2,
		level = 13,
		exp = 900,
		level_max = false,
		exp_upgrade = 20400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 3,
			},
		},
	},
	[214] = {
		id = 214,
		stage = 2,
		level = 14,
		exp = 1000,
		level_max = false,
		exp_upgrade = 21400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 4,
			},
		},
	},
	[215] = {
		id = 215,
		stage = 2,
		level = 15,
		exp = 1200,
		level_max = false,
		exp_upgrade = 22600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 4,
			},
		},
	},
	[216] = {
		id = 216,
		stage = 2,
		level = 16,
		exp = 1400,
		level_max = false,
		exp_upgrade = 24000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 4,
			},
		},
	},
	[217] = {
		id = 217,
		stage = 2,
		level = 17,
		exp = 1600,
		level_max = false,
		exp_upgrade = 25600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 4,
			},
		},
	},
	[218] = {
		id = 218,
		stage = 2,
		level = 18,
		exp = 1800,
		level_max = false,
		exp_upgrade = 27400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 5,
			},
		},
	},
	[219] = {
		id = 219,
		stage = 2,
		level = 19,
		exp = 2000,
		level_max = false,
		exp_upgrade = 29400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 5,
			},
		},
	},
	[220] = {
		id = 220,
		stage = 2,
		level = 20,
		exp = 2200,
		level_max = false,
		exp_upgrade = 31600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 5,
			},
		},
	},
	[221] = {
		id = 221,
		stage = 2,
		level = 21,
		exp = 2600,
		level_max = false,
		exp_upgrade = 34200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 6,
			},
		},
	},
	[222] = {
		id = 222,
		stage = 2,
		level = 22,
		exp = 3000,
		level_max = false,
		exp_upgrade = 37200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 6,
			},
		},
	},
	[223] = {
		id = 223,
		stage = 2,
		level = 23,
		exp = 3400,
		level_max = false,
		exp_upgrade = 40600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 7,
			},
		},
	},
	[224] = {
		id = 224,
		stage = 2,
		level = 24,
		exp = 3800,
		level_max = false,
		exp_upgrade = 44400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 8,
			},
		},
	},
	[225] = {
		id = 225,
		stage = 2,
		level = 25,
		exp = 4200,
		level_max = false,
		exp_upgrade = 48600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 8,
			},
		},
	},
	[226] = {
		id = 226,
		stage = 2,
		level = 26,
		exp = 4800,
		level_max = false,
		exp_upgrade = 53400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 9,
			},
		},
	},
	[227] = {
		id = 227,
		stage = 2,
		level = 27,
		exp = 5400,
		level_max = false,
		exp_upgrade = 58800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 10,
			},
		},
	},
	[228] = {
		id = 228,
		stage = 2,
		level = 28,
		exp = 6000,
		level_max = false,
		exp_upgrade = 64800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 11,
			},
		},
	},
	[229] = {
		id = 229,
		stage = 2,
		level = 29,
		exp = 6600,
		level_max = false,
		exp_upgrade = 71400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 12,
			},
		},
	},
	[230] = {
		id = 230,
		stage = 2,
		level = 30,
		exp = -1,
		level_max = true,
		exp_upgrade = 71400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[301] = {
		id = 301,
		stage = 3,
		level = 1,
		exp = 100,
		level_max = false,
		exp_upgrade = 71500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[302] = {
		id = 302,
		stage = 3,
		level = 2,
		exp = 150,
		level_max = false,
		exp_upgrade = 71650,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[303] = {
		id = 303,
		stage = 3,
		level = 3,
		exp = 200,
		level_max = false,
		exp_upgrade = 71850,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[304] = {
		id = 304,
		stage = 3,
		level = 4,
		exp = 250,
		level_max = false,
		exp_upgrade = 72100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[305] = {
		id = 305,
		stage = 3,
		level = 5,
		exp = 300,
		level_max = false,
		exp_upgrade = 72400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[306] = {
		id = 306,
		stage = 3,
		level = 6,
		exp = 350,
		level_max = false,
		exp_upgrade = 72750,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[307] = {
		id = 307,
		stage = 3,
		level = 7,
		exp = 400,
		level_max = false,
		exp_upgrade = 73150,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[308] = {
		id = 308,
		stage = 3,
		level = 8,
		exp = 450,
		level_max = false,
		exp_upgrade = 73600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[309] = {
		id = 309,
		stage = 3,
		level = 9,
		exp = 500,
		level_max = false,
		exp_upgrade = 74100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[310] = {
		id = 310,
		stage = 3,
		level = 10,
		exp = 600,
		level_max = false,
		exp_upgrade = 74700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[311] = {
		id = 311,
		stage = 3,
		level = 11,
		exp = 700,
		level_max = false,
		exp_upgrade = 75400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 14,
			},
		},
	},
	[312] = {
		id = 312,
		stage = 3,
		level = 12,
		exp = 800,
		level_max = false,
		exp_upgrade = 76200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 15,
			},
		},
	},
	[313] = {
		id = 313,
		stage = 3,
		level = 13,
		exp = 900,
		level_max = false,
		exp_upgrade = 77100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 15,
			},
		},
	},
	[314] = {
		id = 314,
		stage = 3,
		level = 14,
		exp = 1000,
		level_max = false,
		exp_upgrade = 78100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 15,
			},
		},
	},
	[315] = {
		id = 315,
		stage = 3,
		level = 15,
		exp = 1200,
		level_max = false,
		exp_upgrade = 79300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 15,
			},
		},
	},
	[316] = {
		id = 316,
		stage = 3,
		level = 16,
		exp = 1400,
		level_max = false,
		exp_upgrade = 80700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 15,
			},
		},
	},
	[317] = {
		id = 317,
		stage = 3,
		level = 17,
		exp = 1600,
		level_max = false,
		exp_upgrade = 82300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 16,
			},
		},
	},
	[318] = {
		id = 318,
		stage = 3,
		level = 18,
		exp = 1800,
		level_max = false,
		exp_upgrade = 84100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 16,
			},
		},
	},
	[319] = {
		id = 319,
		stage = 3,
		level = 19,
		exp = 2000,
		level_max = false,
		exp_upgrade = 86100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 16,
			},
		},
	},
	[320] = {
		id = 320,
		stage = 3,
		level = 20,
		exp = 2200,
		level_max = false,
		exp_upgrade = 88300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 17,
			},
		},
	},
	[321] = {
		id = 321,
		stage = 3,
		level = 21,
		exp = 2600,
		level_max = false,
		exp_upgrade = 90900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 17,
			},
		},
	},
	[322] = {
		id = 322,
		stage = 3,
		level = 22,
		exp = 3000,
		level_max = false,
		exp_upgrade = 93900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 18,
			},
		},
	},
	[323] = {
		id = 323,
		stage = 3,
		level = 23,
		exp = 3400,
		level_max = false,
		exp_upgrade = 97300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 18,
			},
		},
	},
	[324] = {
		id = 324,
		stage = 3,
		level = 24,
		exp = 3800,
		level_max = false,
		exp_upgrade = 101100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 19,
			},
		},
	},
	[325] = {
		id = 325,
		stage = 3,
		level = 25,
		exp = 4200,
		level_max = false,
		exp_upgrade = 105300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 20,
			},
		},
	},
	[326] = {
		id = 326,
		stage = 3,
		level = 26,
		exp = 4800,
		level_max = false,
		exp_upgrade = 110100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 21,
			},
		},
	},
	[327] = {
		id = 327,
		stage = 3,
		level = 27,
		exp = 5400,
		level_max = false,
		exp_upgrade = 115500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 22,
			},
		},
	},
	[328] = {
		id = 328,
		stage = 3,
		level = 28,
		exp = 6000,
		level_max = false,
		exp_upgrade = 121500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 23,
			},
		},
	},
	[329] = {
		id = 329,
		stage = 3,
		level = 29,
		exp = 6600,
		level_max = false,
		exp_upgrade = 128100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 24,
			},
		},
	},
	[330] = {
		id = 330,
		stage = 3,
		level = 30,
		exp = 7200,
		level_max = false,
		exp_upgrade = 135300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 25,
			},
		},
	},
	[331] = {
		id = 331,
		stage = 3,
		level = 31,
		exp = 8200,
		level_max = false,
		exp_upgrade = 143500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 27,
			},
		},
	},
	[332] = {
		id = 332,
		stage = 3,
		level = 32,
		exp = 9200,
		level_max = false,
		exp_upgrade = 152700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 28,
			},
		},
	},
	[333] = {
		id = 333,
		stage = 3,
		level = 33,
		exp = 10200,
		level_max = false,
		exp_upgrade = 162900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 30,
			},
		},
	},
	[334] = {
		id = 334,
		stage = 3,
		level = 34,
		exp = 11200,
		level_max = false,
		exp_upgrade = 174100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 32,
			},
		},
	},
	[335] = {
		id = 335,
		stage = 3,
		level = 35,
		exp = 12200,
		level_max = false,
		exp_upgrade = 186300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 34,
			},
		},
	},
	[336] = {
		id = 336,
		stage = 3,
		level = 36,
		exp = 14200,
		level_max = false,
		exp_upgrade = 200500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 37,
			},
		},
	},
	[337] = {
		id = 337,
		stage = 3,
		level = 37,
		exp = 16200,
		level_max = false,
		exp_upgrade = 216700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 40,
			},
		},
	},
	[338] = {
		id = 338,
		stage = 3,
		level = 38,
		exp = 18200,
		level_max = false,
		exp_upgrade = 234900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 43,
			},
		},
	},
	[339] = {
		id = 339,
		stage = 3,
		level = 39,
		exp = 20200,
		level_max = false,
		exp_upgrade = 255100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 46,
			},
		},
	},
	[340] = {
		id = 340,
		stage = 3,
		level = 40,
		exp = -1,
		level_max = true,
		exp_upgrade = 255100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[401] = {
		id = 401,
		stage = 4,
		level = 1,
		exp = 100,
		level_max = false,
		exp_upgrade = 255200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[402] = {
		id = 402,
		stage = 4,
		level = 2,
		exp = 150,
		level_max = false,
		exp_upgrade = 255350,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[403] = {
		id = 403,
		stage = 4,
		level = 3,
		exp = 200,
		level_max = false,
		exp_upgrade = 255550,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[404] = {
		id = 404,
		stage = 4,
		level = 4,
		exp = 250,
		level_max = false,
		exp_upgrade = 255800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[405] = {
		id = 405,
		stage = 4,
		level = 5,
		exp = 300,
		level_max = false,
		exp_upgrade = 256100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[406] = {
		id = 406,
		stage = 4,
		level = 6,
		exp = 350,
		level_max = false,
		exp_upgrade = 256450,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[407] = {
		id = 407,
		stage = 4,
		level = 7,
		exp = 400,
		level_max = false,
		exp_upgrade = 256850,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[408] = {
		id = 408,
		stage = 4,
		level = 8,
		exp = 450,
		level_max = false,
		exp_upgrade = 257300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[409] = {
		id = 409,
		stage = 4,
		level = 9,
		exp = 500,
		level_max = false,
		exp_upgrade = 257800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[410] = {
		id = 410,
		stage = 4,
		level = 10,
		exp = 600,
		level_max = false,
		exp_upgrade = 258400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[411] = {
		id = 411,
		stage = 4,
		level = 11,
		exp = 700,
		level_max = false,
		exp_upgrade = 259100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[412] = {
		id = 412,
		stage = 4,
		level = 12,
		exp = 800,
		level_max = false,
		exp_upgrade = 259900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[413] = {
		id = 413,
		stage = 4,
		level = 13,
		exp = 900,
		level_max = false,
		exp_upgrade = 260800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 51,
			},
		},
	},
	[414] = {
		id = 414,
		stage = 4,
		level = 14,
		exp = 1000,
		level_max = false,
		exp_upgrade = 261800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 52,
			},
		},
	},
	[415] = {
		id = 415,
		stage = 4,
		level = 15,
		exp = 1200,
		level_max = false,
		exp_upgrade = 263000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 52,
			},
		},
	},
	[416] = {
		id = 416,
		stage = 4,
		level = 16,
		exp = 1400,
		level_max = false,
		exp_upgrade = 264400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 52,
			},
		},
	},
	[417] = {
		id = 417,
		stage = 4,
		level = 17,
		exp = 1600,
		level_max = false,
		exp_upgrade = 266000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 52,
			},
		},
	},
	[418] = {
		id = 418,
		stage = 4,
		level = 18,
		exp = 1800,
		level_max = false,
		exp_upgrade = 267800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 53,
			},
		},
	},
	[419] = {
		id = 419,
		stage = 4,
		level = 19,
		exp = 2000,
		level_max = false,
		exp_upgrade = 269800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 53,
			},
		},
	},
	[420] = {
		id = 420,
		stage = 4,
		level = 20,
		exp = 2200,
		level_max = false,
		exp_upgrade = 272000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 53,
			},
		},
	},
	[421] = {
		id = 421,
		stage = 4,
		level = 21,
		exp = 2600,
		level_max = false,
		exp_upgrade = 274600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 54,
			},
		},
	},
	[422] = {
		id = 422,
		stage = 4,
		level = 22,
		exp = 3000,
		level_max = false,
		exp_upgrade = 277600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 54,
			},
		},
	},
	[423] = {
		id = 423,
		stage = 4,
		level = 23,
		exp = 3400,
		level_max = false,
		exp_upgrade = 281000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 55,
			},
		},
	},
	[424] = {
		id = 424,
		stage = 4,
		level = 24,
		exp = 3800,
		level_max = false,
		exp_upgrade = 284800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 56,
			},
		},
	},
	[425] = {
		id = 425,
		stage = 4,
		level = 25,
		exp = 4200,
		level_max = false,
		exp_upgrade = 289000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 56,
			},
		},
	},
	[426] = {
		id = 426,
		stage = 4,
		level = 26,
		exp = 4800,
		level_max = false,
		exp_upgrade = 293800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 57,
			},
		},
	},
	[427] = {
		id = 427,
		stage = 4,
		level = 27,
		exp = 5400,
		level_max = false,
		exp_upgrade = 299200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 58,
			},
		},
	},
	[428] = {
		id = 428,
		stage = 4,
		level = 28,
		exp = 6000,
		level_max = false,
		exp_upgrade = 305200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 59,
			},
		},
	},
	[429] = {
		id = 429,
		stage = 4,
		level = 29,
		exp = 6600,
		level_max = false,
		exp_upgrade = 311800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 61,
			},
		},
	},
	[430] = {
		id = 430,
		stage = 4,
		level = 30,
		exp = 7200,
		level_max = false,
		exp_upgrade = 319000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 62,
			},
		},
	},
	[431] = {
		id = 431,
		stage = 4,
		level = 31,
		exp = 8200,
		level_max = false,
		exp_upgrade = 327200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 63,
			},
		},
	},
	[432] = {
		id = 432,
		stage = 4,
		level = 32,
		exp = 9200,
		level_max = false,
		exp_upgrade = 336400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 65,
			},
		},
	},
	[433] = {
		id = 433,
		stage = 4,
		level = 33,
		exp = 10200,
		level_max = false,
		exp_upgrade = 346600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 67,
			},
		},
	},
	[434] = {
		id = 434,
		stage = 4,
		level = 34,
		exp = 11200,
		level_max = false,
		exp_upgrade = 357800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 69,
			},
		},
	},
	[435] = {
		id = 435,
		stage = 4,
		level = 35,
		exp = 12200,
		level_max = false,
		exp_upgrade = 370000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 71,
			},
		},
	},
	[436] = {
		id = 436,
		stage = 4,
		level = 36,
		exp = 14200,
		level_max = false,
		exp_upgrade = 384200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 74,
			},
		},
	},
	[437] = {
		id = 437,
		stage = 4,
		level = 37,
		exp = 16200,
		level_max = false,
		exp_upgrade = 400400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 76,
			},
		},
	},
	[438] = {
		id = 438,
		stage = 4,
		level = 38,
		exp = 18200,
		level_max = false,
		exp_upgrade = 418600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 80,
			},
		},
	},
	[439] = {
		id = 439,
		stage = 4,
		level = 39,
		exp = 20200,
		level_max = false,
		exp_upgrade = 438800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 83,
			},
		},
	},
	[440] = {
		id = 440,
		stage = 4,
		level = 40,
		exp = 22200,
		level_max = false,
		exp_upgrade = 461000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 87,
			},
		},
	},
	[441] = {
		id = 441,
		stage = 4,
		level = 41,
		exp = 26200,
		level_max = false,
		exp_upgrade = 487200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 92,
			},
		},
	},
	[442] = {
		id = 442,
		stage = 4,
		level = 42,
		exp = 30200,
		level_max = false,
		exp_upgrade = 517400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 97,
			},
		},
	},
	[443] = {
		id = 443,
		stage = 4,
		level = 43,
		exp = 34200,
		level_max = false,
		exp_upgrade = 551600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 103,
			},
		},
	},
	[444] = {
		id = 444,
		stage = 4,
		level = 44,
		exp = 38200,
		level_max = false,
		exp_upgrade = 589800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 110,
			},
		},
	},
	[445] = {
		id = 445,
		stage = 4,
		level = 45,
		exp = 42200,
		level_max = false,
		exp_upgrade = 632000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 117,
			},
		},
	},
	[446] = {
		id = 446,
		stage = 4,
		level = 46,
		exp = 52200,
		level_max = false,
		exp_upgrade = 684200,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 126,
			},
		},
	},
	[447] = {
		id = 447,
		stage = 4,
		level = 47,
		exp = 62200,
		level_max = false,
		exp_upgrade = 746400,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 136,
			},
		},
	},
	[448] = {
		id = 448,
		stage = 4,
		level = 48,
		exp = 72200,
		level_max = false,
		exp_upgrade = 818600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 149,
			},
		},
	},
	[449] = {
		id = 449,
		stage = 4,
		level = 49,
		exp = 82200,
		level_max = false,
		exp_upgrade = 900800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 163,
			},
		},
	},
	[450] = {
		id = 450,
		stage = 4,
		level = 50,
		exp = -1,
		level_max = true,
		exp_upgrade = 900800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[501] = {
		id = 501,
		stage = 5,
		level = 1,
		exp = 100,
		level_max = false,
		exp_upgrade = 900900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[502] = {
		id = 502,
		stage = 5,
		level = 2,
		exp = 150,
		level_max = false,
		exp_upgrade = 901050,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[503] = {
		id = 503,
		stage = 5,
		level = 3,
		exp = 200,
		level_max = false,
		exp_upgrade = 901250,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[504] = {
		id = 504,
		stage = 5,
		level = 4,
		exp = 250,
		level_max = false,
		exp_upgrade = 901500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[505] = {
		id = 505,
		stage = 5,
		level = 5,
		exp = 300,
		level_max = false,
		exp_upgrade = 901800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[506] = {
		id = 506,
		stage = 5,
		level = 6,
		exp = 350,
		level_max = false,
		exp_upgrade = 902150,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[507] = {
		id = 507,
		stage = 5,
		level = 7,
		exp = 400,
		level_max = false,
		exp_upgrade = 902550,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[508] = {
		id = 508,
		stage = 5,
		level = 8,
		exp = 450,
		level_max = false,
		exp_upgrade = 903000,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[509] = {
		id = 509,
		stage = 5,
		level = 9,
		exp = 500,
		level_max = false,
		exp_upgrade = 903500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[510] = {
		id = 510,
		stage = 5,
		level = 10,
		exp = 600,
		level_max = false,
		exp_upgrade = 904100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[511] = {
		id = 511,
		stage = 5,
		level = 11,
		exp = 700,
		level_max = false,
		exp_upgrade = 904800,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[512] = {
		id = 512,
		stage = 5,
		level = 12,
		exp = 800,
		level_max = false,
		exp_upgrade = 905600,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 180,
			},
		},
	},
	[513] = {
		id = 513,
		stage = 5,
		level = 13,
		exp = 900,
		level_max = false,
		exp_upgrade = 906500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 181,
			},
		},
	},
	[514] = {
		id = 514,
		stage = 5,
		level = 14,
		exp = 1000,
		level_max = false,
		exp_upgrade = 907500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 181,
			},
		},
	},
	[515] = {
		id = 515,
		stage = 5,
		level = 15,
		exp = 1200,
		level_max = false,
		exp_upgrade = 908700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 181,
			},
		},
	},
	[516] = {
		id = 516,
		stage = 5,
		level = 16,
		exp = 1400,
		level_max = false,
		exp_upgrade = 910100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 181,
			},
		},
	},
	[517] = {
		id = 517,
		stage = 5,
		level = 17,
		exp = 1600,
		level_max = false,
		exp_upgrade = 911700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 182,
			},
		},
	},
	[518] = {
		id = 518,
		stage = 5,
		level = 18,
		exp = 1800,
		level_max = false,
		exp_upgrade = 913500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 182,
			},
		},
	},
	[519] = {
		id = 519,
		stage = 5,
		level = 19,
		exp = 2000,
		level_max = false,
		exp_upgrade = 915500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 182,
			},
		},
	},
	[520] = {
		id = 520,
		stage = 5,
		level = 20,
		exp = 2200,
		level_max = false,
		exp_upgrade = 917700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 183,
			},
		},
	},
	[521] = {
		id = 521,
		stage = 5,
		level = 21,
		exp = 2600,
		level_max = false,
		exp_upgrade = 920300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 183,
			},
		},
	},
	[522] = {
		id = 522,
		stage = 5,
		level = 22,
		exp = 3000,
		level_max = false,
		exp_upgrade = 923300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 184,
			},
		},
	},
	[523] = {
		id = 523,
		stage = 5,
		level = 23,
		exp = 3400,
		level_max = false,
		exp_upgrade = 926700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 184,
			},
		},
	},
	[524] = {
		id = 524,
		stage = 5,
		level = 24,
		exp = 3800,
		level_max = false,
		exp_upgrade = 930500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 185,
			},
		},
	},
	[525] = {
		id = 525,
		stage = 5,
		level = 25,
		exp = 4200,
		level_max = false,
		exp_upgrade = 934700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 186,
			},
		},
	},
	[526] = {
		id = 526,
		stage = 5,
		level = 26,
		exp = 4800,
		level_max = false,
		exp_upgrade = 939500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 186,
			},
		},
	},
	[527] = {
		id = 527,
		stage = 5,
		level = 27,
		exp = 5400,
		level_max = false,
		exp_upgrade = 944900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 187,
			},
		},
	},
	[528] = {
		id = 528,
		stage = 5,
		level = 28,
		exp = 6000,
		level_max = false,
		exp_upgrade = 950900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 188,
			},
		},
	},
	[529] = {
		id = 529,
		stage = 5,
		level = 29,
		exp = 6600,
		level_max = false,
		exp_upgrade = 957500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 190,
			},
		},
	},
	[530] = {
		id = 530,
		stage = 5,
		level = 30,
		exp = 7200,
		level_max = false,
		exp_upgrade = 964700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 191,
			},
		},
	},
	[531] = {
		id = 531,
		stage = 5,
		level = 31,
		exp = 8200,
		level_max = false,
		exp_upgrade = 972900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 192,
			},
		},
	},
	[532] = {
		id = 532,
		stage = 5,
		level = 32,
		exp = 9200,
		level_max = false,
		exp_upgrade = 982100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 194,
			},
		},
	},
	[533] = {
		id = 533,
		stage = 5,
		level = 33,
		exp = 10200,
		level_max = false,
		exp_upgrade = 992300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 196,
			},
		},
	},
	[534] = {
		id = 534,
		stage = 5,
		level = 34,
		exp = 11200,
		level_max = false,
		exp_upgrade = 1003500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 198,
			},
		},
	},
	[535] = {
		id = 535,
		stage = 5,
		level = 35,
		exp = 12200,
		level_max = false,
		exp_upgrade = 1015700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 200,
			},
		},
	},
	[536] = {
		id = 536,
		stage = 5,
		level = 36,
		exp = 14200,
		level_max = false,
		exp_upgrade = 1029900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 203,
			},
		},
	},
	[537] = {
		id = 537,
		stage = 5,
		level = 37,
		exp = 16200,
		level_max = false,
		exp_upgrade = 1046100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 205,
			},
		},
	},
	[538] = {
		id = 538,
		stage = 5,
		level = 38,
		exp = 18200,
		level_max = false,
		exp_upgrade = 1064300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 209,
			},
		},
	},
	[539] = {
		id = 539,
		stage = 5,
		level = 39,
		exp = 20200,
		level_max = false,
		exp_upgrade = 1084500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 212,
			},
		},
	},
	[540] = {
		id = 540,
		stage = 5,
		level = 40,
		exp = 22200,
		level_max = false,
		exp_upgrade = 1106700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 216,
			},
		},
	},
	[541] = {
		id = 541,
		stage = 5,
		level = 41,
		exp = 26200,
		level_max = false,
		exp_upgrade = 1132900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 221,
			},
		},
	},
	[542] = {
		id = 542,
		stage = 5,
		level = 42,
		exp = 30200,
		level_max = false,
		exp_upgrade = 1163100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 226,
			},
		},
	},
	[543] = {
		id = 543,
		stage = 5,
		level = 43,
		exp = 34200,
		level_max = false,
		exp_upgrade = 1197300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 232,
			},
		},
	},
	[544] = {
		id = 544,
		stage = 5,
		level = 44,
		exp = 38200,
		level_max = false,
		exp_upgrade = 1235500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 239,
			},
		},
	},
	[545] = {
		id = 545,
		stage = 5,
		level = 45,
		exp = 42200,
		level_max = false,
		exp_upgrade = 1277700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 247,
			},
		},
	},
	[546] = {
		id = 546,
		stage = 5,
		level = 46,
		exp = 52200,
		level_max = false,
		exp_upgrade = 1329900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 255,
			},
		},
	},
	[547] = {
		id = 547,
		stage = 5,
		level = 47,
		exp = 62200,
		level_max = false,
		exp_upgrade = 1392100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 265,
			},
		},
	},
	[548] = {
		id = 548,
		stage = 5,
		level = 48,
		exp = 72200,
		level_max = false,
		exp_upgrade = 1464300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 278,
			},
		},
	},
	[549] = {
		id = 549,
		stage = 5,
		level = 49,
		exp = 82200,
		level_max = false,
		exp_upgrade = 1546500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 292,
			},
		},
	},
	[550] = {
		id = 550,
		stage = 5,
		level = 50,
		exp = 92200,
		level_max = false,
		exp_upgrade = 1638700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 309,
			},
		},
	},
	[551] = {
		id = 551,
		stage = 5,
		level = 51,
		exp = 102200,
		level_max = false,
		exp_upgrade = 1740900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 327,
			},
		},
	},
	[552] = {
		id = 552,
		stage = 5,
		level = 52,
		exp = 112200,
		level_max = false,
		exp_upgrade = 1853100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 348,
			},
		},
	},
	[553] = {
		id = 553,
		stage = 5,
		level = 53,
		exp = 122200,
		level_max = false,
		exp_upgrade = 1975300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 370,
			},
		},
	},
	[554] = {
		id = 554,
		stage = 5,
		level = 54,
		exp = 132200,
		level_max = false,
		exp_upgrade = 2107500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 395,
			},
		},
	},
	[555] = {
		id = 555,
		stage = 5,
		level = 55,
		exp = 142200,
		level_max = false,
		exp_upgrade = 2249700,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 421,
			},
		},
	},
	[556] = {
		id = 556,
		stage = 5,
		level = 56,
		exp = 152200,
		level_max = false,
		exp_upgrade = 2401900,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 449,
			},
		},
	},
	[557] = {
		id = 557,
		stage = 5,
		level = 57,
		exp = 162200,
		level_max = false,
		exp_upgrade = 2564100,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 480,
			},
		},
	},
	[558] = {
		id = 558,
		stage = 5,
		level = 58,
		exp = 172200,
		level_max = false,
		exp_upgrade = 2736300,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 512,
			},
		},
	},
	[559] = {
		id = 559,
		stage = 5,
		level = 59,
		exp = 182200,
		level_max = false,
		exp_upgrade = 2918500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 547,
			},
		},
	},
	[560] = {
		id = 560,
		stage = 5,
		level = 60,
		exp = -1,
		level_max = true,
		exp_upgrade = 2918500,
		resolve_item = {
			[1] = {
				id = 10102,
				count = 100,
			},
			[2] = {
				id = 104004,
				count = 583,
			},
		},
	},
}
