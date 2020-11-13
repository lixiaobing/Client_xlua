local Event = {}
_G.Event = Event

Event.__index = function(t, k)
    local var = rawget(Event, k)

    if var == nil then
        var = rawget(get, k)
        if var ~= nil then
            return var(t)
        end
    end
    return var
end

Event.__call = function(t, name)
    return Event.new(name)
end

function Event.new(name)
    local event = {}
    event.name = name
    event.list = {}
    return setmetatable(event, Event)
end

function Event:invoke()
    for i,handle in ipairs(self.list) do
        local ok, err = pcall(handle.func, handle.body)
        if not ok then
            LogError(self.name.." Error:"..err)
        end
    end
end

function Event:add(func, body)
    local handle = {}
    handle.func = func
    handle.body = body

    table.insert(self.list, handle)

    return handle
end

function Event:remove(handle)
	for i, h in ipairs(self.list) do							
		if h == handle then
			table.remove(self.list, i)
			break
		end
	end	
end

setmetatable(Event, Event)

UpdateBeat 		= Event("Update")
LateUpdateBeat	= Event("LateUpdate")
FixedUpdateBeat	= Event("FixedUpdate")
CoUpdateBeat	= Event("CoUpdate")

local Time = Time
local UpdateBeat = UpdateBeat
local LateUpdateBeat = LateUpdateBeat
local FixedUpdateBeat = FixedUpdateBeat
local CoUpdateBeat = CoUpdateBeat

--逻辑update
function Update(deltaTime, unscaledDeltaTime)
    LogError(deltaTime)
    LogError(unscaledDeltaTime)

	Time:SetDeltaTime(deltaTime, unscaledDeltaTime)				
	UpdateBeat()	
end

function LateUpdate()	
	LateUpdateBeat()		
	CoUpdateBeat()		
	Time:SetFrameCount()		
end

--物理update
function FixedUpdate(fixedDeltaTime)
	Time:SetFixedDelta(fixedDeltaTime)
	FixedUpdateBeat()
end

function PrintEvents()
	UpdateBeat:Dump()
	FixedUpdateBeat:Dump()
end

CS.Framework.LuaLooper.Instance:Init()