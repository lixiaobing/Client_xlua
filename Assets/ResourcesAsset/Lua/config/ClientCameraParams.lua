-- id                               int                              参数ID
-- prefabPath                       string                           陷阱预制体
-- attackFilePath                   string                           攻击帧配置文件
-- camp                             int                              目标阵营
-- time                             float                            时间
-- interval                         float                            间隔
-- count                            int                              伤害次数

return {
	[1] = {
		id = 1,
		prefabPath = "Trap/Prefab/Ice_Trap",
		attackFilePath = "Trap/Data/IceTrapData",
		camp = 1,
		time = 6,
		interval = 1.5,
		count = 4,
	},
	[2] = {
		id = 2,
		prefabPath = "",
		attackFilePath = "",
		camp = nil,
		time = nil,
		interval = nil,
		count = nil,
	},
	[3] = {
		id = 3,
		prefabPath = "",
		attackFilePath = "",
		camp = nil,
		time = nil,
		interval = nil,
		count = nil,
	},
}
