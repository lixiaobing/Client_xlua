-- id                               int                              精灵id
-- type1                            int                              道具大类
-- type2                            int                              道具子类
-- type3                            int                              道具细分
-- name                             lang                             精灵名称
-- cv_name                          lang                             精灵CV
-- des                              lang                             精灵描述
-- icon                             int                              精灵头像
-- hero_type                        int                              精灵职业
-- elements                         tableString[k:#seq|v:#1(int)]    精灵定位
-- hero_radar                       tableString[k:#seq|v:#1(string)]   定位六维雷达图
-- hero_radar_per                   tableString[k:#seq|v:#1(int)]    定位六维雷达图百分比
-- default_star                     int                              初始稀有度
-- default_level                    int                              初始等级
-- default_group                    int                              初始等阶
-- weapon_model                     string                           武器模型
-- default_dress                    int                              初始时装
-- search_range                     fixedfloat                       寻怪范围
-- skill_powerout                   tableString[k:#seq|v:#1(int)]    技能产气
-- skill_max                        tableString[k:#seq|v:#1(bool)]   技能满气特殊技
-- normal_skillnum                  int                              普通攻击段数
-- normal_skill                     tableString[k:#seq|v:#1(int)]    普通攻击技能id
-- powermax                         fixedint                         技能释放要求
-- gasmax                           fixedint                         怒气最大值
-- skills                           dict[4]                          技能释放要求
--    skill1                        tableString[k:#seq|v:#1(int)]    技能-1数值
--    skill2                        tableString[k:#seq|v:#1(int)]    技能-2数值
--    skill3                        tableString[k:#seq|v:#1(int)]    技能-3数值
--    skill4                        int                              技能-4数值
-- skill_map                        tableString[k:#1(string)|v:#2(int)]   替换技能的字段
-- passive_skill                    tableString[k:#seq|v:#1(int)]    初始被动携带技能
-- qte                              tableString[k:#seq|v:#1(int)]    QTE技能
-- avoid_skill                      int                              闪避技能
-- model_info                       dict[7]                          模型配置
--    path                          string                           模型路径
--    speed                         tableString[k:#seq|v:#1(fixedfloat)]   奔跑速度
--    height                        fixedfloat                       模型身高
--    radius                        fixedfloat                       模型半径
--    scale                         fixedfloat                       缩放比例
--    flowup_rate                   fixedfloat                       浮空比例
--    hp_display                    fixedfloat                       血显偏移
-- controllers                      tableString[k:#seq|v:#1(string)]   动画状态机（1：常规 2：变形）
-- hero_chip                        int                              对应碎片id
-- hero_chip_num                    int                              合成碎片数量
-- bg_des                           int                              道具背景描述
-- item_tag                         int                              道具角标
-- item_icon                        int                              道具图标
-- item_bg                          int                              道具背板
-- quality                          int                              道具品质
-- star                             int                              道具星级
-- sum_max                          int                              获取上限
-- grid_max                         int                              堆叠上限
-- jump_id                          tableString[k:#seq|v:#table(jumpid=#1(int),count=#2(int))]   获取跳转
-- jump_des                         lang                             无获取途径描述
-- resolve_item                     tableString[k:#1(int)|v:#table(id=#1(int),count=#2(int))]   分解道具
-- is_resolve                       bool                             是否可手动分解
-- bag_id                           int                              所属背包
-- max_way                          int                              获取上限处理方式
-- autouse                          bool                             自使用
-- useprofit                        string                           自使用效果
-- show                             int                              获得方式展示
-- userui                           tableString[k:#seq|v:#1(string)]   预加载资源
-- rush_effect                      string                           模型路径
-- hitpoint                         int                              打击点组ID
-- behavior                         int                              行为组ID

return {
	[40101] = {
		id = 40101,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "夜刀神十香",
		cv_name = "CV：井上麻里奈",
		des = "　　识别代号<b>公主（Princess）</b>\n　　与迷团般的大爆炸一并现身于五河士道前的少女，拥有一头及膝的黑色长发与水晶般不可思议色彩的眼睛。",
		icon = 10001,
		hero_type = 1,
		elements = {
			[1] = 0,
		},
		hero_radar = {
			[1] = "B",
			[2] = "A",
			[3] = "B",
			[4] = "A",
			[5] = "D",
			[6] = "C",
		},
		hero_radar_per = {
			[1] = 60,
			[2] = 80,
			[3] = 60,
			[4] = 80,
			[5] = 20,
			[6] = 40,
		},
		default_star = 2,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120101,
		search_range = 6291456 --[[6]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 5,
		normal_skill = {
			[1] = 40100111,
			[2] = 40100112,
			[3] = 40100113,
			[4] = 40100114,
			[5] = 40100115,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100121,
				[2] = 40100122,
				[3] = 40100123,
			},
			skill2 = {
				[1] = 40100131,
				[2] = 40100132,
				[3] = 40100133,
			},
			skill3 = {
				[1] = 40100141,
				[2] = 40100142,
				[3] = 40100143,
			},
			skill4 = 40100171,
		},
		skill_map = {
			Change = 40100111,
		},
		passive_skill = nil,
		qte = {
			[1] = 40100161,
		},
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Tohka_01",
			speed = {
				[1] = 4194304 --[[4]],
				[2] = 8388608 --[[8]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 1048576 --[[1]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Tohka_01",
		},
		hero_chip = 10501,
		hero_chip_num = 60,
		bg_des = 100001,
		item_tag = 1,
		item_icon = 10001,
		item_bg = 1,
		quality = 1,
		star = 1,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 3,
				count = 4,
			},
		},
		jump_des = "返回",
		resolve_item = {
			[10501] = {
				id = 10501,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = nil,
		rush_effect = "",
		hitpoint = 10003,
		behavior = 101,
	},
	[40102] = {
		id = 40102,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "时崎狂三",
		cv_name = "CV：真田麻美",
		des = "　　识别代号<b>梦魇（Nightmare）</b>\n　　突然转入来禅高中的转校生，转学来时就对五河士道十分亲密，目的是为了和他“合为一体”。",
		icon = 10002,
		hero_type = 2,
		elements = {
			[1] = 0,
		},
		hero_radar = {
			[1] = "A",
			[2] = "A",
			[3] = "A",
			[4] = "A",
			[5] = "A",
			[6] = "A",
		},
		hero_radar_per = {
			[1] = 80,
			[2] = 80,
			[3] = 80,
			[4] = 80,
			[5] = 80,
			[6] = 80,
		},
		default_star = 3,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120201,
		search_range = 6291456 --[[6]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 5,
		normal_skill = {
			[1] = 40100211,
			[2] = 40100212,
			[3] = 40100213,
			[4] = 40100214,
			[5] = 40100215,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100221,
				[2] = 40100222,
				[3] = 40100223,
			},
			skill2 = {
				[1] = 40100231,
				[2] = 40100232,
				[3] = 40100233,
			},
			skill3 = {
				[1] = 40100241,
				[2] = 40100242,
				[3] = 40100243,
			},
			skill4 = 40100271,
		},
		skill_map = {
			Change = 40100211,
		},
		passive_skill = nil,
		qte = {
			[1] = 40100261,
		},
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Tokisaki_02",
			speed = {
				[1] = 5242880 --[[5]],
				[2] = 10485760 --[[10]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 1048576 --[[1]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Tokisaki_01",
		},
		hero_chip = 10502,
		hero_chip_num = 60,
		bg_des = 100002,
		item_tag = 1,
		item_icon = 10002,
		item_bg = 2,
		quality = 3,
		star = 3,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 1,
				count = 3,
			},
		},
		jump_des = "分解",
		resolve_item = {
			[10502] = {
				id = 10502,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = nil,
		rush_effect = "",
		hitpoint = 10001,
		behavior = 101,
	},
	[40103] = {
		id = 40103,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "四糸乃",
		cv_name = "CV：野水伊织",
		des = "　　识别代号<b>隐居者（Hermit）</b>\n　　长相宛若法国娃娃般美丽的蓝发少女，有着梦幻般的外貌和娇小的身材，外表年纪与五河琴里相近。",
		icon = 10003,
		hero_type = 3,
		elements = {
			[1] = 2,
			[2] = 0,
		},
		hero_radar = {
			[1] = "B",
			[2] = "A",
			[3] = "A",
			[4] = "C",
			[5] = "C",
			[6] = "D",
		},
		hero_radar_per = {
			[1] = 60,
			[2] = 80,
			[3] = 80,
			[4] = 40,
			[5] = 40,
			[6] = 20,
		},
		default_star = 1,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120201,
		search_range = 13631488 --[[13]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 4,
		normal_skill = {
			[1] = 40100301,
			[2] = 40100302,
			[3] = 40100303,
			[4] = 40100304,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100311,
				[2] = 40100312,
				[3] = 40100313,
			},
			skill2 = {
				[1] = 40100321,
				[2] = 40100322,
				[3] = 40100323,
			},
			skill3 = {
				[1] = 40100331,
				[2] = 40100332,
				[3] = 40100333,
			},
			skill4 = 40100371,
		},
		skill_map = {
			Change = 40100311,
		},
		passive_skill = {
			[1] = 40100341,
			[2] = 40100342,
			[3] = 40100343,
			[4] = 40100344,
			[5] = 40100345,
			[6] = 40100346,
			[7] = 40100347,
			[8] = 40100351,
		},
		qte = {
			[1] = 40100361,
		},
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Yoshino_01",
			speed = {
				[1] = 5242880 --[[5]],
				[2] = 10485760 --[[10]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 975176 --[[0.93]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Yoshino_01",
		},
		hero_chip = 10503,
		hero_chip_num = 60,
		bg_des = 100002,
		item_tag = 1,
		item_icon = 10002,
		item_bg = 2,
		quality = 1,
		star = 1,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 1,
				count = 3,
			},
		},
		jump_des = "分解",
		resolve_item = {
			[10503] = {
				id = 10503,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = nil,
		rush_effect = "",
		hitpoint = 10002,
		behavior = 101,
	},
	[40104] = {
		id = 40104,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "五河琴里",
		cv_name = "CV：竹达彩奈",
		des = "　　识别代号<b>炎魔（Efreet)</b>\n　　通过变换黑白两色的发带来改变性格：白色发带为粘人爱哭的“妹妹模式”；黑色发带为抖S、毒舌的“司令官模式”。",
		icon = 10004,
		hero_type = 3,
		elements = {
			[1] = 2,
			[2] = 0,
		},
		hero_radar = {
			[1] = "B",
			[2] = "A",
			[3] = "A",
			[4] = "C",
			[5] = "C",
			[6] = "D",
		},
		hero_radar_per = {
			[1] = 60,
			[2] = 80,
			[3] = 80,
			[4] = 40,
			[5] = 40,
			[6] = 20,
		},
		default_star = 1,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120201,
		search_range = 6291456 --[[6]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 4,
		normal_skill = {
			[1] = 40100501,
			[2] = 40100502,
			[3] = 40100503,
			[4] = 40100504,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100411,
				[2] = 40100412,
				[3] = 40100413,
			},
			skill2 = {
				[1] = 40100421,
				[2] = 40100422,
				[3] = 40100423,
			},
			skill3 = {
				[1] = 40100431,
				[2] = 40100432,
				[3] = 40100433,
			},
			skill4 = 40100471,
		},
		skill_map = {
			AttackS = 40100405,
		},
		passive_skill = {
			[1] = 40100441,
		},
		qte = {
			[1] = 40100461,
		},
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Kotori_01",
			speed = {
				[1] = 5242880 --[[5]],
				[2] = 10485760 --[[10]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 975176 --[[0.93]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Kotori_01",
		},
		hero_chip = 10503,
		hero_chip_num = 60,
		bg_des = 100002,
		item_tag = 1,
		item_icon = 10002,
		item_bg = 2,
		quality = 1,
		star = 1,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 1,
				count = 3,
			},
		},
		jump_des = "分解",
		resolve_item = {
			[10503] = {
				id = 10503,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = {
			[1] = "FocusUIKotori",
			[2] = "GunProgress",
		},
		rush_effect = "Effect/H_Kotori_01/H_Kotori_01_SuperRush",
		hitpoint = 10005,
		behavior = 101,
	},
	[40105] = {
		id = 40105,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "八舞夕弦",
		cv_name = "CV：布里德卡特·塞拉·惠美",
		des = "　　识别代号<b>炎魔（Efreet)</b>\n　　通过变换黑白两色的发带来改变性格：白色发带为粘人爱哭的“妹妹模式”；黑色发带为抖S、毒舌的“司令官模式”。",
		icon = 10005,
		hero_type = 2,
		elements = {
			[1] = 3,
			[2] = 0,
		},
		hero_radar = {
			[1] = "A",
			[2] = "B",
			[3] = "A",
			[4] = "B",
			[5] = "B",
			[6] = "B",
		},
		hero_radar_per = {
			[1] = 60,
			[2] = 80,
			[3] = 80,
			[4] = 40,
			[5] = 40,
			[6] = 20,
		},
		default_star = 2,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120201,
		search_range = 6291456 --[[6]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 5,
		normal_skill = {
			[1] = 40100501,
			[2] = 40100502,
			[3] = 40100503,
			[4] = 40100504,
			[5] = 40100505,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100311,
				[2] = 40100312,
				[3] = 40100313,
			},
			skill2 = {
				[1] = 40100321,
				[2] = 40100322,
				[3] = 40100323,
			},
			skill3 = {
				[1] = 40100331,
				[2] = 40100332,
				[3] = 40100333,
			},
			skill4 = 40100371,
		},
		skill_map = {
			Change = 40100311,
		},
		passive_skill = nil,
		qte = nil,
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Yuzuru_01",
			speed = {
				[1] = 5242880 --[[5]],
				[2] = 10485760 --[[10]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 975176 --[[0.93]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Yuzuru_01",
		},
		hero_chip = 10505,
		hero_chip_num = 60,
		bg_des = 100002,
		item_tag = 1,
		item_icon = 10002,
		item_bg = 2,
		quality = 1,
		star = 1,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 1,
				count = 3,
			},
		},
		jump_des = "分解",
		resolve_item = {
			[10505] = {
				id = 10505,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = nil,
		rush_effect = "",
		hitpoint = 10004,
		behavior = 101,
	},
	[40106] = {
		id = 40106,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "八舞耶俱矢",
		cv_name = "CV：内田真礼",
		des = "　　识别代号<b>狂战士（Berserk</b>\n　　总是一种女王般高高在上高傲强势的态度，还会用一种像戏剧般的措辞说话，在情绪激动时会变回普通的说话方式，兴奋时有“～da shi”作为语尾的口癖。",
		icon = 10001,
		hero_type = 2,
		elements = {
			[1] = 3,
			[2] = 0,
		},
		hero_radar = {
			[1] = "A",
			[2] = "B",
			[3] = "A",
			[4] = "B",
			[5] = "B",
			[6] = "B",
		},
		hero_radar_per = {
			[1] = 60,
			[2] = 80,
			[3] = 80,
			[4] = 40,
			[5] = 40,
			[6] = 20,
		},
		default_star = 2,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120201,
		search_range = 6291456 --[[6]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 5,
		normal_skill = {
			[1] = 40100601,
			[2] = 40100602,
			[3] = 40100603,
			[4] = 40100604,
			[5] = 40100605,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100311,
				[2] = 40100312,
				[3] = 40100313,
			},
			skill2 = {
				[1] = 40100321,
				[2] = 40100322,
				[3] = 40100323,
			},
			skill3 = {
				[1] = 40100331,
				[2] = 40100332,
				[3] = 40100333,
			},
			skill4 = 40100371,
		},
		skill_map = {
			Change = 40100311,
		},
		passive_skill = nil,
		qte = nil,
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Kaguya_01",
			speed = {
				[1] = 5242880 --[[5]],
				[2] = 10485760 --[[10]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 1048576 --[[1]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Kaguya_01",
		},
		hero_chip = 10506,
		hero_chip_num = 60,
		bg_des = 100002,
		item_tag = 1,
		item_icon = 10002,
		item_bg = 2,
		quality = 1,
		star = 1,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 1,
				count = 3,
			},
		},
		jump_des = "分解",
		resolve_item = {
			[10505] = {
				id = 10505,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = nil,
		rush_effect = "",
		hitpoint = 10001,
		behavior = 101,
	},
	[40107] = {
		id = 40107,
		type1 = 4,
		type2 = 1,
		type3 = 1,
		name = "",
		cv_name = "",
		des = "",
		icon = 10001,
		hero_type = 2,
		elements = {
			[1] = 3,
			[2] = 0,
		},
		hero_radar = {
			[1] = "A",
			[2] = "B",
			[3] = "A",
			[4] = "B",
			[5] = "B",
			[6] = "B",
		},
		hero_radar_per = {
			[1] = 60,
			[2] = 80,
			[3] = 80,
			[4] = 40,
			[5] = 40,
			[6] = 20,
		},
		default_star = 2,
		default_level = 1,
		default_group = 1,
		weapon_model = "A_Tokisaki_01",
		default_dress = 140120201,
		search_range = 6291456 --[[6]],
		skill_powerout = {
			[1] = 10,
			[2] = 10,
			[3] = 10,
		},
		skill_max = {
			[1] = false,
			[2] = false,
			[3] = false,
		},
		normal_skillnum = 5,
		normal_skill = {
			[1] = 40100701,
			[2] = 40100702,
			[3] = 40100703,
			[4] = 40100704,
			[5] = 40100705,
		},
		powermax = 1572864000 --[[1500]],
		gasmax = 524288000 --[[500]],
		skills = {
			skill1 = {
				[1] = 40100311,
				[2] = 40100312,
				[3] = 40100313,
			},
			skill2 = {
				[1] = 40100321,
				[2] = 40100322,
				[3] = 40100323,
			},
			skill3 = {
				[1] = 40100331,
				[2] = 40100332,
				[3] = 40100333,
			},
			skill4 = 40100371,
		},
		skill_map = {
			Change = 40100311,
		},
		passive_skill = nil,
		qte = nil,
		avoid_skill = nil,
		model_info = {
			path = "Hero/H_Ellen_01",
			speed = {
				[1] = 5242880 --[[5]],
				[2] = 10485760 --[[10]],
			},
			height = 1656751 --[[1.58]],
			radius = 524288 --[[0.5]],
			scale = 1048576 --[[1]],
			flowup_rate = 1048576 --[[1]],
			hp_display = 1048576 --[[1]],
		},
		controllers = {
			[1] = "H_Ellen_01",
		},
		hero_chip = 10506,
		hero_chip_num = 60,
		bg_des = 100002,
		item_tag = 1,
		item_icon = 10002,
		item_bg = 2,
		quality = 1,
		star = 1,
		sum_max = 1,
		grid_max = 1,
		jump_id = {
			[1] = {
				jumpid = 1,
				count = 2,
			},
			[2] = {
				jumpid = 1,
				count = 3,
			},
		},
		jump_des = "分解",
		resolve_item = {
			[10505] = {
				id = 10505,
				count = 60,
			},
		},
		is_resolve = false,
		bag_id = 0,
		max_way = 1,
		autouse = true,
		useprofit = "",
		show = 0,
		userui = nil,
		rush_effect = "",
		hitpoint = 10001,
		behavior = 101,
	},
}
