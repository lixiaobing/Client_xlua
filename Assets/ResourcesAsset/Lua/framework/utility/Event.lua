local Event = {}
_G.Event = Event

Event.__index = function(t, k)
    local var = rawget(Event, k)
    return var
end

Event.__call = function(t, name)
    return Event.New(name)
end

function Event.New(name)
    local event = {}
    event.name = name
    event.list = {}
    return setmetatable(event, Event)
end

function Event:Invoke()
    for i,handle in ipairs(self.list) do
        local ok, err = pcall(handle.func, handle.body)
        if not ok then
            LogError(self.name.." Error:"..err)
        end
    end
end

function Event:Add(func, body)
    local handle = {}
    handle.func = func
    handle.body = body

    table.insert(self.list, handle)

    return handle
end

function Event:Remove(handle)
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
	UpdateBeat()	
end

function LateUpdate()	
	LateUpdateBeat()		
	CoUpdateBeat()
end

--物理update
function FixedUpdate(fixedDeltaTime)
	FixedUpdateBeat()
end

function PrintEvents()
	UpdateBeat:Dump()
	FixedUpdateBeat:Dump()
end

CS.Framework.LuaLooper.Instance:Init()