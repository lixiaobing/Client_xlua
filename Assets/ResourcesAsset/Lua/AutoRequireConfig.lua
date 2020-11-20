Config = {}
Config.CombineFiles = require("config/CombineFiles")
Config.FuncCombine = function(name)
	local configCombine = {}
	local function _addConfig(path)
		local config = require(path)
		if config then
			table.insert(configCombine, config)
		end
	end
	_addConfig(name)
	local combines = Config.CombineFiles[string.gsub(name,"config/","")]
	if combines then
		for index, value in ipairs(combines) do
			local _path = string.format("%s_%s", name, value)
			_addConfig(_path)
		end
	end
	return configCombine[1]
end

Config.Language = {}
