local util = require "xlua.util"

local runner = LuaManager.Instance.coroutine

StartCoroutine = function(...)
    local func = util.cs_generator(...)
    local co = runner:StartCoroutine(CS.Framework.XIEnumerator(func))
    return co
end

StopCoroutine = function(co)
	runner:StopCoroutine(co)
end

Yield = function(t)
    local wait = true
    runner:YieldShell(t, function()
        wait = false
    end)
    while wait do
        coroutine.yield()
    end
end

WaitForSeconds = function(t)
    coroutine.yield(CS.UnityEngine.WaitForSeconds(t))
end