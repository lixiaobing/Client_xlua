-- id                               int                              界面id
-- file_name                        int                              界面文件名
-- title                            string                           界面标题
-- icon                             string                           标题衬图
-- ishelp                           int                              是否显示帮助
-- help_id                          int                              帮助id
-- isres                            string                           是否显示资源条
-- res                              tableString[k:#seq|v:#1(int)]    资源条内容
-- ismain                           int                              是否显示返回主界面
-- isback                           int                              是否显示返回

return {
	[1] = {
		id = 1,
		file_name = nil,
		title = "背包",
		icon = "",
		ishelp = 1,
		help_id = 1,
		isres = "1",
		res = {
			[1] = 1,
			[2] = 2,
		},
		ismain = 1,
		isback = 1,
	},
	[2] = {
		id = 2,
		file_name = nil,
		title = "精灵",
		icon = "",
		ishelp = 1,
		help_id = 2,
		isres = "1",
		res = {
			[1] = 1,
			[2] = 2,
		},
		ismain = 1,
		isback = 1,
	},
	[3] = {
		id = 3,
		file_name = nil,
		title = "看板娘",
		icon = "",
		ishelp = 1,
		help_id = 3,
		isres = "1",
		res = {
			[1] = 1,
			[2] = 2,
		},
		ismain = 1,
		isback = 1,
	},
}
