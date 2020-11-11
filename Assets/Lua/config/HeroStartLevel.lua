-- id                               int                              id（精灵id*100+编号2位
-- hero_id                          int                              精灵id
-- num                              int                              稀有度小段编号
-- pos                              tableString[k:#seq|v:#table(x=#1(int),y=#2(int))]   激活点X坐标（坐标/100,不支持浮点数）
-- consume                          tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   提升所需道具
-- name                             lang                             小段名称
-- icon                             int                              小段图标
-- des                              lang                             小段描述
-- attribute                        tableString[k:#seq|v:#table(id=#1(int),count=#2(int))]   小段属性
-- locktriger                       tableString[k:#seq|v:#1(int)]    小段解锁条件
-- lockvalue                        tableString[k:#seq|v:#1(int)]    小段解锁参数
-- lockdes                          tableString[k:#seq|v:#1(int)]    小段解锁描述

return {
	[4010101] = {
		id = 4010101,
		hero_id = 40101,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010102] = {
		id = 4010102,
		hero_id = 40101,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010103] = {
		id = 4010103,
		hero_id = 40101,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010104] = {
		id = 4010104,
		hero_id = 40101,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010105] = {
		id = 4010105,
		hero_id = 40101,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010106] = {
		id = 4010106,
		hero_id = 40101,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010107] = {
		id = 4010107,
		hero_id = 40101,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010108] = {
		id = 4010108,
		hero_id = 40101,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010109] = {
		id = 4010109,
		hero_id = 40101,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010110] = {
		id = 4010110,
		hero_id = 40101,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010111] = {
		id = 4010111,
		hero_id = 40101,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010112] = {
		id = 4010112,
		hero_id = 40101,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010113] = {
		id = 4010113,
		hero_id = 40101,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010114] = {
		id = 4010114,
		hero_id = 40101,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010115] = {
		id = 4010115,
		hero_id = 40101,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010116] = {
		id = 4010116,
		hero_id = 40101,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010117] = {
		id = 4010117,
		hero_id = 40101,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010118] = {
		id = 4010118,
		hero_id = 40101,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010119] = {
		id = 4010119,
		hero_id = 40101,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010120] = {
		id = 4010120,
		hero_id = 40101,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010121] = {
		id = 4010121,
		hero_id = 40101,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010122] = {
		id = 4010122,
		hero_id = 40101,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010123] = {
		id = 4010123,
		hero_id = 40101,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010124] = {
		id = 4010124,
		hero_id = 40101,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010125] = {
		id = 4010125,
		hero_id = 40101,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010126] = {
		id = 4010126,
		hero_id = 40101,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010127] = {
		id = 4010127,
		hero_id = 40101,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010128] = {
		id = 4010128,
		hero_id = 40101,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010129] = {
		id = 4010129,
		hero_id = 40101,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010130] = {
		id = 4010130,
		hero_id = 40101,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010131] = {
		id = 4010131,
		hero_id = 40101,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010132] = {
		id = 4010132,
		hero_id = 40101,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010133] = {
		id = 4010133,
		hero_id = 40101,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010134] = {
		id = 4010134,
		hero_id = 40101,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010135] = {
		id = 4010135,
		hero_id = 40101,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010136] = {
		id = 4010136,
		hero_id = 40101,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010137] = {
		id = 4010137,
		hero_id = 40101,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010138] = {
		id = 4010138,
		hero_id = 40101,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010139] = {
		id = 4010139,
		hero_id = 40101,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010140] = {
		id = 4010140,
		hero_id = 40101,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010141] = {
		id = 4010141,
		hero_id = 40101,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010142] = {
		id = 4010142,
		hero_id = 40101,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010143] = {
		id = 4010143,
		hero_id = 40101,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010144] = {
		id = 4010144,
		hero_id = 40101,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010145] = {
		id = 4010145,
		hero_id = 40101,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010146] = {
		id = 4010146,
		hero_id = 40101,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010147] = {
		id = 4010147,
		hero_id = 40101,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010148] = {
		id = 4010148,
		hero_id = 40101,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010149] = {
		id = 4010149,
		hero_id = 40101,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010150] = {
		id = 4010150,
		hero_id = 40101,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010201] = {
		id = 4010201,
		hero_id = 40102,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010202] = {
		id = 4010202,
		hero_id = 40102,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010203] = {
		id = 4010203,
		hero_id = 40102,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010204] = {
		id = 4010204,
		hero_id = 40102,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010205] = {
		id = 4010205,
		hero_id = 40102,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010206] = {
		id = 4010206,
		hero_id = 40102,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010207] = {
		id = 4010207,
		hero_id = 40102,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010208] = {
		id = 4010208,
		hero_id = 40102,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010209] = {
		id = 4010209,
		hero_id = 40102,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010210] = {
		id = 4010210,
		hero_id = 40102,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010211] = {
		id = 4010211,
		hero_id = 40102,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010212] = {
		id = 4010212,
		hero_id = 40102,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010213] = {
		id = 4010213,
		hero_id = 40102,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010214] = {
		id = 4010214,
		hero_id = 40102,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010215] = {
		id = 4010215,
		hero_id = 40102,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010216] = {
		id = 4010216,
		hero_id = 40102,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010217] = {
		id = 4010217,
		hero_id = 40102,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010218] = {
		id = 4010218,
		hero_id = 40102,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010219] = {
		id = 4010219,
		hero_id = 40102,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010220] = {
		id = 4010220,
		hero_id = 40102,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010221] = {
		id = 4010221,
		hero_id = 40102,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010222] = {
		id = 4010222,
		hero_id = 40102,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010223] = {
		id = 4010223,
		hero_id = 40102,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010224] = {
		id = 4010224,
		hero_id = 40102,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010225] = {
		id = 4010225,
		hero_id = 40102,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010226] = {
		id = 4010226,
		hero_id = 40102,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010227] = {
		id = 4010227,
		hero_id = 40102,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010228] = {
		id = 4010228,
		hero_id = 40102,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010229] = {
		id = 4010229,
		hero_id = 40102,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010230] = {
		id = 4010230,
		hero_id = 40102,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010231] = {
		id = 4010231,
		hero_id = 40102,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010232] = {
		id = 4010232,
		hero_id = 40102,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010233] = {
		id = 4010233,
		hero_id = 40102,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010234] = {
		id = 4010234,
		hero_id = 40102,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010235] = {
		id = 4010235,
		hero_id = 40102,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010236] = {
		id = 4010236,
		hero_id = 40102,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010237] = {
		id = 4010237,
		hero_id = 40102,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010238] = {
		id = 4010238,
		hero_id = 40102,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010239] = {
		id = 4010239,
		hero_id = 40102,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010240] = {
		id = 4010240,
		hero_id = 40102,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010241] = {
		id = 4010241,
		hero_id = 40102,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010242] = {
		id = 4010242,
		hero_id = 40102,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010243] = {
		id = 4010243,
		hero_id = 40102,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010244] = {
		id = 4010244,
		hero_id = 40102,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010245] = {
		id = 4010245,
		hero_id = 40102,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010246] = {
		id = 4010246,
		hero_id = 40102,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010247] = {
		id = 4010247,
		hero_id = 40102,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010248] = {
		id = 4010248,
		hero_id = 40102,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010249] = {
		id = 4010249,
		hero_id = 40102,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010250] = {
		id = 4010250,
		hero_id = 40102,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010301] = {
		id = 4010301,
		hero_id = 40103,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010302] = {
		id = 4010302,
		hero_id = 40103,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010303] = {
		id = 4010303,
		hero_id = 40103,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010304] = {
		id = 4010304,
		hero_id = 40103,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010305] = {
		id = 4010305,
		hero_id = 40103,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010306] = {
		id = 4010306,
		hero_id = 40103,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010307] = {
		id = 4010307,
		hero_id = 40103,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010308] = {
		id = 4010308,
		hero_id = 40103,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010309] = {
		id = 4010309,
		hero_id = 40103,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010310] = {
		id = 4010310,
		hero_id = 40103,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010311] = {
		id = 4010311,
		hero_id = 40103,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010312] = {
		id = 4010312,
		hero_id = 40103,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010313] = {
		id = 4010313,
		hero_id = 40103,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010314] = {
		id = 4010314,
		hero_id = 40103,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010315] = {
		id = 4010315,
		hero_id = 40103,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010316] = {
		id = 4010316,
		hero_id = 40103,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010317] = {
		id = 4010317,
		hero_id = 40103,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010318] = {
		id = 4010318,
		hero_id = 40103,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010319] = {
		id = 4010319,
		hero_id = 40103,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010320] = {
		id = 4010320,
		hero_id = 40103,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010321] = {
		id = 4010321,
		hero_id = 40103,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010322] = {
		id = 4010322,
		hero_id = 40103,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010323] = {
		id = 4010323,
		hero_id = 40103,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010324] = {
		id = 4010324,
		hero_id = 40103,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010325] = {
		id = 4010325,
		hero_id = 40103,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010326] = {
		id = 4010326,
		hero_id = 40103,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010327] = {
		id = 4010327,
		hero_id = 40103,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010328] = {
		id = 4010328,
		hero_id = 40103,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010329] = {
		id = 4010329,
		hero_id = 40103,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010330] = {
		id = 4010330,
		hero_id = 40103,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010331] = {
		id = 4010331,
		hero_id = 40103,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010332] = {
		id = 4010332,
		hero_id = 40103,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010333] = {
		id = 4010333,
		hero_id = 40103,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010334] = {
		id = 4010334,
		hero_id = 40103,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010335] = {
		id = 4010335,
		hero_id = 40103,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010336] = {
		id = 4010336,
		hero_id = 40103,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010337] = {
		id = 4010337,
		hero_id = 40103,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010338] = {
		id = 4010338,
		hero_id = 40103,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010339] = {
		id = 4010339,
		hero_id = 40103,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010340] = {
		id = 4010340,
		hero_id = 40103,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010341] = {
		id = 4010341,
		hero_id = 40103,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010342] = {
		id = 4010342,
		hero_id = 40103,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010343] = {
		id = 4010343,
		hero_id = 40103,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010344] = {
		id = 4010344,
		hero_id = 40103,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010345] = {
		id = 4010345,
		hero_id = 40103,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010346] = {
		id = 4010346,
		hero_id = 40103,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010347] = {
		id = 4010347,
		hero_id = 40103,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010348] = {
		id = 4010348,
		hero_id = 40103,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010349] = {
		id = 4010349,
		hero_id = 40103,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010350] = {
		id = 4010350,
		hero_id = 40103,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010401] = {
		id = 4010401,
		hero_id = 40104,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010402] = {
		id = 4010402,
		hero_id = 40104,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010403] = {
		id = 4010403,
		hero_id = 40104,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010404] = {
		id = 4010404,
		hero_id = 40104,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010405] = {
		id = 4010405,
		hero_id = 40104,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010406] = {
		id = 4010406,
		hero_id = 40104,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010407] = {
		id = 4010407,
		hero_id = 40104,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010408] = {
		id = 4010408,
		hero_id = 40104,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010409] = {
		id = 4010409,
		hero_id = 40104,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010410] = {
		id = 4010410,
		hero_id = 40104,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010411] = {
		id = 4010411,
		hero_id = 40104,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010412] = {
		id = 4010412,
		hero_id = 40104,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010413] = {
		id = 4010413,
		hero_id = 40104,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010414] = {
		id = 4010414,
		hero_id = 40104,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010415] = {
		id = 4010415,
		hero_id = 40104,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010416] = {
		id = 4010416,
		hero_id = 40104,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010417] = {
		id = 4010417,
		hero_id = 40104,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010418] = {
		id = 4010418,
		hero_id = 40104,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010419] = {
		id = 4010419,
		hero_id = 40104,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010420] = {
		id = 4010420,
		hero_id = 40104,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010421] = {
		id = 4010421,
		hero_id = 40104,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010422] = {
		id = 4010422,
		hero_id = 40104,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010423] = {
		id = 4010423,
		hero_id = 40104,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010424] = {
		id = 4010424,
		hero_id = 40104,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010425] = {
		id = 4010425,
		hero_id = 40104,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010426] = {
		id = 4010426,
		hero_id = 40104,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010427] = {
		id = 4010427,
		hero_id = 40104,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010428] = {
		id = 4010428,
		hero_id = 40104,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010429] = {
		id = 4010429,
		hero_id = 40104,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010430] = {
		id = 4010430,
		hero_id = 40104,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010431] = {
		id = 4010431,
		hero_id = 40104,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010432] = {
		id = 4010432,
		hero_id = 40104,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010433] = {
		id = 4010433,
		hero_id = 40104,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010434] = {
		id = 4010434,
		hero_id = 40104,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010435] = {
		id = 4010435,
		hero_id = 40104,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010436] = {
		id = 4010436,
		hero_id = 40104,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010437] = {
		id = 4010437,
		hero_id = 40104,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010438] = {
		id = 4010438,
		hero_id = 40104,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010439] = {
		id = 4010439,
		hero_id = 40104,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010440] = {
		id = 4010440,
		hero_id = 40104,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010441] = {
		id = 4010441,
		hero_id = 40104,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010442] = {
		id = 4010442,
		hero_id = 40104,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010443] = {
		id = 4010443,
		hero_id = 40104,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010444] = {
		id = 4010444,
		hero_id = 40104,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010445] = {
		id = 4010445,
		hero_id = 40104,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010446] = {
		id = 4010446,
		hero_id = 40104,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010447] = {
		id = 4010447,
		hero_id = 40104,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010448] = {
		id = 4010448,
		hero_id = 40104,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010449] = {
		id = 4010449,
		hero_id = 40104,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010450] = {
		id = 4010450,
		hero_id = 40104,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010501] = {
		id = 4010501,
		hero_id = 40105,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010502] = {
		id = 4010502,
		hero_id = 40105,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010503] = {
		id = 4010503,
		hero_id = 40105,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010504] = {
		id = 4010504,
		hero_id = 40105,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010505] = {
		id = 4010505,
		hero_id = 40105,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010506] = {
		id = 4010506,
		hero_id = 40105,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010507] = {
		id = 4010507,
		hero_id = 40105,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010508] = {
		id = 4010508,
		hero_id = 40105,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010509] = {
		id = 4010509,
		hero_id = 40105,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010510] = {
		id = 4010510,
		hero_id = 40105,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010511] = {
		id = 4010511,
		hero_id = 40105,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010512] = {
		id = 4010512,
		hero_id = 40105,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010513] = {
		id = 4010513,
		hero_id = 40105,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010514] = {
		id = 4010514,
		hero_id = 40105,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010515] = {
		id = 4010515,
		hero_id = 40105,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010516] = {
		id = 4010516,
		hero_id = 40105,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010517] = {
		id = 4010517,
		hero_id = 40105,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010518] = {
		id = 4010518,
		hero_id = 40105,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010519] = {
		id = 4010519,
		hero_id = 40105,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010520] = {
		id = 4010520,
		hero_id = 40105,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010521] = {
		id = 4010521,
		hero_id = 40105,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010522] = {
		id = 4010522,
		hero_id = 40105,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010523] = {
		id = 4010523,
		hero_id = 40105,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010524] = {
		id = 4010524,
		hero_id = 40105,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010525] = {
		id = 4010525,
		hero_id = 40105,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010526] = {
		id = 4010526,
		hero_id = 40105,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010527] = {
		id = 4010527,
		hero_id = 40105,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010528] = {
		id = 4010528,
		hero_id = 40105,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010529] = {
		id = 4010529,
		hero_id = 40105,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010530] = {
		id = 4010530,
		hero_id = 40105,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010531] = {
		id = 4010531,
		hero_id = 40105,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010532] = {
		id = 4010532,
		hero_id = 40105,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010533] = {
		id = 4010533,
		hero_id = 40105,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010534] = {
		id = 4010534,
		hero_id = 40105,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010535] = {
		id = 4010535,
		hero_id = 40105,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010536] = {
		id = 4010536,
		hero_id = 40105,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010537] = {
		id = 4010537,
		hero_id = 40105,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010538] = {
		id = 4010538,
		hero_id = 40105,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010539] = {
		id = 4010539,
		hero_id = 40105,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010540] = {
		id = 4010540,
		hero_id = 40105,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010541] = {
		id = 4010541,
		hero_id = 40105,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010542] = {
		id = 4010542,
		hero_id = 40105,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010543] = {
		id = 4010543,
		hero_id = 40105,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010544] = {
		id = 4010544,
		hero_id = 40105,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010545] = {
		id = 4010545,
		hero_id = 40105,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010546] = {
		id = 4010546,
		hero_id = 40105,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010547] = {
		id = 4010547,
		hero_id = 40105,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010548] = {
		id = 4010548,
		hero_id = 40105,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010549] = {
		id = 4010549,
		hero_id = 40105,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010550] = {
		id = 4010550,
		hero_id = 40105,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010601] = {
		id = 4010601,
		hero_id = 40106,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010602] = {
		id = 4010602,
		hero_id = 40106,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010603] = {
		id = 4010603,
		hero_id = 40106,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010604] = {
		id = 4010604,
		hero_id = 40106,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010605] = {
		id = 4010605,
		hero_id = 40106,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010606] = {
		id = 4010606,
		hero_id = 40106,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010607] = {
		id = 4010607,
		hero_id = 40106,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010608] = {
		id = 4010608,
		hero_id = 40106,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010609] = {
		id = 4010609,
		hero_id = 40106,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010610] = {
		id = 4010610,
		hero_id = 40106,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010611] = {
		id = 4010611,
		hero_id = 40106,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010612] = {
		id = 4010612,
		hero_id = 40106,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010613] = {
		id = 4010613,
		hero_id = 40106,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010614] = {
		id = 4010614,
		hero_id = 40106,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010615] = {
		id = 4010615,
		hero_id = 40106,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010616] = {
		id = 4010616,
		hero_id = 40106,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010617] = {
		id = 4010617,
		hero_id = 40106,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010618] = {
		id = 4010618,
		hero_id = 40106,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010619] = {
		id = 4010619,
		hero_id = 40106,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010620] = {
		id = 4010620,
		hero_id = 40106,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010621] = {
		id = 4010621,
		hero_id = 40106,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010622] = {
		id = 4010622,
		hero_id = 40106,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010623] = {
		id = 4010623,
		hero_id = 40106,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010624] = {
		id = 4010624,
		hero_id = 40106,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010625] = {
		id = 4010625,
		hero_id = 40106,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010626] = {
		id = 4010626,
		hero_id = 40106,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010627] = {
		id = 4010627,
		hero_id = 40106,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010628] = {
		id = 4010628,
		hero_id = 40106,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010629] = {
		id = 4010629,
		hero_id = 40106,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010630] = {
		id = 4010630,
		hero_id = 40106,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010631] = {
		id = 4010631,
		hero_id = 40106,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010632] = {
		id = 4010632,
		hero_id = 40106,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010633] = {
		id = 4010633,
		hero_id = 40106,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010634] = {
		id = 4010634,
		hero_id = 40106,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010635] = {
		id = 4010635,
		hero_id = 40106,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010636] = {
		id = 4010636,
		hero_id = 40106,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010637] = {
		id = 4010637,
		hero_id = 40106,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010638] = {
		id = 4010638,
		hero_id = 40106,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010639] = {
		id = 4010639,
		hero_id = 40106,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010640] = {
		id = 4010640,
		hero_id = 40106,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010641] = {
		id = 4010641,
		hero_id = 40106,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010642] = {
		id = 4010642,
		hero_id = 40106,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010643] = {
		id = 4010643,
		hero_id = 40106,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010644] = {
		id = 4010644,
		hero_id = 40106,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010645] = {
		id = 4010645,
		hero_id = 40106,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010646] = {
		id = 4010646,
		hero_id = 40106,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010647] = {
		id = 4010647,
		hero_id = 40106,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010648] = {
		id = 4010648,
		hero_id = 40106,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010649] = {
		id = 4010649,
		hero_id = 40106,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010650] = {
		id = 4010650,
		hero_id = 40106,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010701] = {
		id = 4010701,
		hero_id = 40107,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010702] = {
		id = 4010702,
		hero_id = 40107,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010703] = {
		id = 4010703,
		hero_id = 40107,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010704] = {
		id = 4010704,
		hero_id = 40107,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010705] = {
		id = 4010705,
		hero_id = 40107,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010706] = {
		id = 4010706,
		hero_id = 40107,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010707] = {
		id = 4010707,
		hero_id = 40107,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010708] = {
		id = 4010708,
		hero_id = 40107,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010709] = {
		id = 4010709,
		hero_id = 40107,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010710] = {
		id = 4010710,
		hero_id = 40107,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 1,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010711] = {
		id = 4010711,
		hero_id = 40107,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010712] = {
		id = 4010712,
		hero_id = 40107,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010713] = {
		id = 4010713,
		hero_id = 40107,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010714] = {
		id = 4010714,
		hero_id = 40107,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010715] = {
		id = 4010715,
		hero_id = 40107,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010716] = {
		id = 4010716,
		hero_id = 40107,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010717] = {
		id = 4010717,
		hero_id = 40107,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010718] = {
		id = 4010718,
		hero_id = 40107,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010719] = {
		id = 4010719,
		hero_id = 40107,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010720] = {
		id = 4010720,
		hero_id = 40107,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 2,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010721] = {
		id = 4010721,
		hero_id = 40107,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010722] = {
		id = 4010722,
		hero_id = 40107,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010723] = {
		id = 4010723,
		hero_id = 40107,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010724] = {
		id = 4010724,
		hero_id = 40107,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010725] = {
		id = 4010725,
		hero_id = 40107,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010726] = {
		id = 4010726,
		hero_id = 40107,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010727] = {
		id = 4010727,
		hero_id = 40107,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010728] = {
		id = 4010728,
		hero_id = 40107,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010729] = {
		id = 4010729,
		hero_id = 40107,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010730] = {
		id = 4010730,
		hero_id = 40107,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 3,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010731] = {
		id = 4010731,
		hero_id = 40107,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010732] = {
		id = 4010732,
		hero_id = 40107,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010733] = {
		id = 4010733,
		hero_id = 40107,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010734] = {
		id = 4010734,
		hero_id = 40107,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010735] = {
		id = 4010735,
		hero_id = 40107,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010736] = {
		id = 4010736,
		hero_id = 40107,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010737] = {
		id = 4010737,
		hero_id = 40107,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010738] = {
		id = 4010738,
		hero_id = 40107,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010739] = {
		id = 4010739,
		hero_id = 40107,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010740] = {
		id = 4010740,
		hero_id = 40107,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 9,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010741] = {
		id = 4010741,
		hero_id = 40107,
		num = 1,
		pos = {
			[1] = {
				x = -23200,
				y = -14000,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010742] = {
		id = 4010742,
		hero_id = 40107,
		num = 2,
		pos = {
			[1] = {
				x = -20030,
				y = -18350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010743] = {
		id = 4010743,
		hero_id = 40107,
		num = 3,
		pos = {
			[1] = {
				x = -15860,
				y = -21780,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010744] = {
		id = 4010744,
		hero_id = 40107,
		num = 4,
		pos = {
			[1] = {
				x = -11260,
				y = -24350,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·生命",
		icon = 1,
		des = "生命提升51点",
		attribute = {
			[1] = {
				id = 1,
				count = 51,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010745] = {
		id = 4010745,
		hero_id = 40107,
		num = 5,
		pos = {
			[1] = {
				x = 16500,
				y = -21500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010746] = {
		id = 4010746,
		hero_id = 40107,
		num = 6,
		pos = {
			[1] = {
				x = 20600,
				y = -17500,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·攻击",
		icon = 2,
		des = "攻击提升5点",
		attribute = {
			[1] = {
				id = 2,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010747] = {
		id = 4010747,
		hero_id = 40107,
		num = 7,
		pos = {
			[1] = {
				x = 18800,
				y = 19510,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·防御",
		icon = 3,
		des = "防御提升5点",
		attribute = {
			[1] = {
				id = 3,
				count = 5,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010748] = {
		id = 4010748,
		hero_id = 40107,
		num = 8,
		pos = {
			[1] = {
				x = -16900,
				y = 21700,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴击",
		icon = 4,
		des = "暴击提升6点",
		attribute = {
			[1] = {
				id = 6,
				count = 6,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010749] = {
		id = 4010749,
		hero_id = 40107,
		num = 9,
		pos = {
			[1] = {
				x = -19800,
				y = 18600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
	[4010750] = {
		id = 4010750,
		hero_id = 40107,
		num = 10,
		pos = {
			[1] = {
				x = -22800,
				y = 14600,
			},
		},
		consume = {
			[1] = {
				id = 10102,
				count = 18,
			},
		},
		name = "属性·暴抗",
		icon = 4,
		des = "暴抗提升9点",
		attribute = {
			[1] = {
				id = 5,
				count = 9,
			},
		},
		locktriger = nil,
		lockvalue = nil,
		lockdes = nil,
	},
}
