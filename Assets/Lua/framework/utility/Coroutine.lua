local util = require "xlua.util"

local runner = LuaManager.Instance.coroutine

StartCoroutine = function(func)
    -- local co = runner:StartCoroutine(util.cs_generator(...))
    local co = coroutine.create(func)
    coroutine.resume(co)
    return co
end

StopCoroutine = function(co)
	runner.StopCoroutine(co)
end

Yield = util.async_to_sync(function(to_yield, cb)
    runner:YieldAndCallback(to_yield, cb)
end)

WaitForSeconds = function(t)
    return Yield(CS.UnityEngine.WaitForSeconds(t))
end


