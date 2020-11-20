-- id                               int                              唯一id
-- skilltype                        tableString[k:#seq|v:#1(int)]    包含技能类型（1为普攻，2为方形技能，3为圆形技能，4为三角技能，5为大招，6为qte援护，7为换人出场技，8为核心被动，9为职业被动，10为队长被动，11为S被动，12为SS被动，13为SSS被动，14为EX被动）
-- icon                             int                              类型图标
-- name                             lang                             类型名称
-- tip_name                         lang                             标签名称
-- tip_icon                         int                              标签图标

return {
	[1] = {
		id = 1,
		skilltype = {
			[1] = 1,
			[2] = 2,
			[3] = 3,
			[4] = 4,
		},
		icon = 1,
		name = "基础技能",
		tip_name = "攻",
		tip_icon = 1,
	},
	[2] = {
		id = 2,
		skilltype = {
			[1] = 5,
			[2] = 6,
			[3] = 7,
		},
		icon = 2,
		name = "组合技能",
		tip_name = "连",
		tip_icon = 2,
	},
	[3] = {
		id = 3,
		skilltype = {
			[1] = 8,
			[2] = 9,
			[3] = 10,
		},
		icon = 3,
		name = "辅助技能",
		tip_name = "辅",
		tip_icon = 3,
	},
	[4] = {
		id = 4,
		skilltype = {
			[1] = 11,
			[2] = 12,
			[3] = 13,
			[4] = 14,
		},
		icon = 4,
		name = "专属技能",
		tip_name = "特",
		tip_icon = 4,
	},
}
