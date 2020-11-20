-- id                               int                              陷阱ID
-- prefabPath                       string                           陷阱预制体
-- attackFilePath                   string                           攻击帧配置文件
-- camp                             int                              目标阵营
-- time                             fixed                            时间
-- interval                         fixed                            间隔
-- count                            fixed                            伤害次数
-- pullSetting                      dict[3]                          拉敌设置
--    toggle                        bool                             开关
--    distance                      fixed                            拉敌距离
--    speed                         fixed                            拉敌速度
-- moveSetting                      dict[4]                          移动设置
--    toggle                        bool                             开关
--    speed                         fixed                            速度
--    fixSpeed                      fixed                            方向矫正速度
--    paths                         tableString[k:#seq|v:#1(string)]   移动路径
-- effects                          dict[3]                          特效
--    appear                        string                           出现特效
--    continue                      string                           持续特效
--    disappear                     string                           消失特效

return {
	[1] = {
		id = 1,
		prefabPath = "Trap/Prefab/Ice_Trap",
		attackFilePath = "IceTrapData",
		camp = 1,
		time = 6291456 --[[6]],
		interval = 1572864 --[[1.5]],
		count = 4194304 --[[4]],
		pullSetting = {
			toggle = false,
			distance = fixed.zero,
			speed = fixed.zero,
		},
		moveSetting = {
			toggle = false,
			speed = fixed.zero,
			fixSpeed = fixed.zero,
			paths = nil,
		},
		effects = {
			appear = "",
			continue = "",
			disappear = "",
		},
	},
	[2] = {
		id = 2,
		prefabPath = "Trap/Prefab/Trap_Yuzuru_Skill2",
		attackFilePath = "TrapDate_Yuzuru_Skill2",
		camp = 1,
		time = 3145728 --[[3]],
		interval = 209716 --[[0.2]],
		count = 15728640 --[[15]],
		pullSetting = {
			toggle = false,
			distance = fixed.zero,
			speed = fixed.zero,
		},
		moveSetting = {
			toggle = true,
			speed = 10485760 --[[10]],
			fixSpeed = fixed.zero,
			paths = {
				[1] = "0-4",
				[2] = "2-2",
				[3] = "0-3",
			},
		},
		effects = {
			appear = "",
			continue = "",
			disappear = "",
		},
	},
}
