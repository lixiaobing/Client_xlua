local util = require 'xlua.util'

local gameobject = CS.UnityEngine.GameObject('LuaCoroutine')
CS.UnityEngine.Object.DontDestroyOnLoad(gameobject)
local luaCoroutine = gameobject:AddComponent(typeof(CS.Framework.LuaCoroutine))

function StartCoroutine(...)
    return luaCoroutine:StartCoroutine(util.cs_generator(...))
end

function StopCoroutine(coroutine)
    luaCoroutine:StopCoroutine(coroutine)
end

function WaitForSeconds(second)
    return CS.UnityEngine.WaitForSeconds(second)
end

function Yield(re)
    return coroutine.yield(re)
end