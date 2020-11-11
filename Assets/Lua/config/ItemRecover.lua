-- id                               int                              道具id
-- cooldown                         int                              自动恢复时间间隔
-- recover_count                    int                              恢复数量
-- maxRecover                       int                              恢复最大上限

return {
	[10102] = {
		id = 10102,
		cooldown = 30,
		recover_count = 100,
		maxRecover = 500,
	},
	[10103] = {
		id = 10103,
		cooldown = 60,
		recover_count = 1,
		maxRecover = 1000,
	},
}
