-- id                               string                           界面idid
-- title                            lang                             标题
-- show_bg                          bool                             显示背景
-- show_btnback                     bool                             显示返回按钮
-- show_btnmain                     bool                             显示主界面按钮
-- show_title                       bool                             显示标题
-- show_datas                       tableString[k:#seq|v:#table(id=#1(int),type=#2(int))]   显示货币

return {
	["MainWindow"] = {
		id = "MainWindow",
		title = "",
		show_bg = false,
		show_btnback = false,
		show_btnmain = false,
		show_title = false,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["BagMainWindow"] = {
		id = "BagMainWindow",
		title = "仓库",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterWindow"] = {
		id = "ChapterWindow",
		title = "主线剧情",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterDetailWindow"] = {
		id = "ChapterDetailWindow",
		title = "作战中心",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterGarrisonWindow"] = {
		id = "ChapterGarrisonWindow",
		title = "作战中心",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterTopInfoWindow"] = {
		id = "ChapterTopInfoWindow",
		title = "作战中心",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterTopShopWindow"] = {
		id = "ChapterTopShopWindow",
		title = "作战中心",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterTopAreaWindow"] = {
		id = "ChapterTopAreaWindow",
		title = "作战中心",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ChapterTaskWindow"] = {
		id = "ChapterTaskWindow",
		title = "任务",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["TaskWindow"] = {
		id = "TaskWindow",
		title = "任务",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["HeroWindow"] = {
		id = "HeroWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["HeroSelectWindow"] = {
		id = "HeroSelectWindow",
		title = "角色选择",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["FormationWindow"] = {
		id = "FormationWindow",
		title = "队伍",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["EquipWindow"] = {
		id = "EquipWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["EquipSuitWindow"] = {
		id = "EquipSuitWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["EquipGrowWindow"] = {
		id = "EquipGrowWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShipWindow"] = {
		id = "ShipWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShipTokenWindow"] = {
		id = "ShipTokenWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShipScienceWindow"] = {
		id = "ShipScienceWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShipMakeWindow"] = {
		id = "ShipMakeWindow",
		title = "",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShipPresenceWindow"] = {
		id = "ShipPresenceWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShipPresenceSelectWindow"] = {
		id = "ShipPresenceSelectWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
	["ShopWindow"] = {
		id = "ShopWindow",
		title = "精灵",
		show_bg = true,
		show_btnback = true,
		show_btnmain = true,
		show_title = true,
		show_datas = {
			[1] = {
				id = 10103,
				type = 1,
			},
			[2] = {
				id = 10102,
				type = 0,
			},
			[3] = {
				id = 10101,
				type = 2,
			},
		},
	},
}
