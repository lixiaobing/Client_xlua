--local breakSocketHandle,debugXpCall = require("LuaDebug")("localhost",7003)

function main()
    print("Game Start!")

    loadRequire()
end

local requireList = {}

function addRequire(file)
	table.insert(requireList, file)
end

function addUIRequire(file)
	table.insert(requireList, "ui/"..file)
end

function loadRequire()
    local ret, msg = pcall(require, "Require")
    if not ret then
        CS.GameLog.LogError(string.format("load require failed: \n%s", msg))
    end

	local total = #requireList

    -- local managers = require("manager/ManagerLoader")
	-- total = total + managers.total

	local uiBoot = CS.UIBoot.Instance

    uiBoot:SetLabel("正在进入游戏...")

	StartCoroutine(function()
		local index = 1;
		for idx, mod in ipairs(requireList) do
			local ret, msg = pcall(require, mod)

			if not ret then
				LogError(string.format("load require failed: %s\n%s", mod, msg))
			end
			
			index = index + 1;
			uiBoot:SetProgress(index/total)

			if index%5==0 then
				Yield(0)
			end
		end

		local function loadManager(file)
			return require(file):new();
		end
		local function _traceback_(msg)
			Log(msg);
			Log(debug.traceback)
		end
		-- for idx,mod in ipairs(managers.dataMgr) do
		-- 	ret,_G[mod.moduleName] = xpcall(loadManager,_traceback_,mod.fileName);
		-- 	--Log(_G[mod.moduleName])

		-- 	if not ret then
		-- 		LogError(string.format("load manager %s failed: \n%s", mod.moduleName, mod.fileName))
		-- 	end

		-- 	index = index + 1;
		-- 	uiBoot:SetProgress(index/total)

		-- 	if index%5==0 then
		-- 		Yield(0)
		-- 	end
		-- end

		Log("load require complete!")
		UIConfig.init()

		GameAsset.LoadSceneSingle("UI_Main", function()
            Log("enter game!")
            UIManager.openWindow("LoginWindow", function()
                GameObject.Destroy(BootScreen.Instance.gameObject)
            end)
        end)
	end)
end
