local setmetatable = setmetatable
local xpcall = xpcall
local pcall = pcall
local assert = assert
local rawget = rawget
local error = error
local print = print
local iList = iList

local _xpcall = {}

_xpcall.__call = function(self, ...)	
    local args = {...}

    if nil == self.obj then
        local func = function() self.func(table.unpack(args, 1, table.maxn(args))) end
        return xpcall(func, debug.traceback)					
    else		
        local func = function() self.func(self.obj, table.unpack(args, 1, table.maxn(args))) end
        return xpcall(func, debug.traceback)
    end
end

_xpcall.__eq = function(lhs, rhs)
	return lhs.func == rhs.func and lhs.obj == rhs.obj
end

local function xfunctor(func, obj)	
	return setmetatable({func = func, obj = obj}, _xpcall)			
end

local _pcall = {}

_pcall.__call = function(self, ...)
	if nil == self.obj then
		return pcall(self.func, ...)					
	else		
		return pcall(self.func, self.obj, ...)					
	end	
end

_pcall.__eq = function(lhs, rhs)
	return lhs.func == rhs.func and lhs.obj == rhs.obj
end

local function functor(func, obj)	
	return setmetatable({func = func, obj = obj}, _pcall)			
end
---@class event
local _event = {}
_event.__index = _event

--废弃
function _event:Add(func, obj)
	assert(func)		

	if self.keepSafe then			
		func = xfunctor(func, obj)
	else
		func = functor(func, obj)
	end	

	if self.lock then
		local node = {value = func, _prev = 0, _next = 0, removed = true}
		table.insert(self.opList, function() self.list:pushnode(node) end)			
		return node
	else
		return self.list:push(func)
	end	
end

--废弃
function _event:Remove(func, obj)	
	for i, v in ilist(self.list) do							
		if v.func == func and v.obj == obj then
			if self.lock then
				table.insert(self.opList, function() self.list:remove(i) end)				
			else
				self.list:remove(i)
			end
			break
		end
	end		
end

function _event:CreateListener(func, obj)
	if self.keepSafe then			
		func = xfunctor(func, obj)
	else
		func = functor(func, obj)
	end	
	
	return {value = func, _prev = 0, _next = 0, removed = true}		
end

function _event:AddListener(handle)	
	assert(handle)

	if self.lock then		
		table.insert(self.opList, function() self.list:pushnode(handle) end)		
	else
		self.list:pushnode(handle)
	end	
end

function _event:RemoveListener(handle)	
	assert(handle)	

	if self.lock then		
		table.insert(self.opList, function() self.list:remove(handle) end)				
	else
		self.list:remove(handle)
	end
end

function _event:Count()
	return self.list.length
end	

function _event:Clear()
	self.list:clear()
	self.opList = {}	
	self.lock = false
	self.keepSafe = false
	self.current = nil
end

function _event:Dump()
	local count = 0
	
	for _, v in ilist(self.list) do
		if v.obj then
			print("update function:", v.func, "object name:", v.obj.name)
		else
			print("update function: ", v.func)
		end
		
		count = count + 1
	end
	
	print("all function is:", count)
end

_event.__call = function(self, ...)			
	local _list = self.list	
	self.lock = true
	local ilist = ilist				

	for i, f in ilist(_list) do		
		self.current = i						
		local flag, msg = f(...)
		
		if not flag then			
			_list:remove(i)			
			self.lock = false		
			error(msg)				
		end
	end	

	local opList = self.opList	
	self.lock = false		

	for i, op in ipairs(opList) do									
		op()
		opList[i] = nil
	end
end

---@return event
function Event(name, safe)
	safe = safe or false
	return setmetatable({name = name, keepSafe = safe, lock = false, opList = {}, list = List:new()}, _event)				
end

UpdateBeat 		= Event("Update", true)
LateUpdateBeat	= Event("LateUpdate", true)
FixedUpdateBeat	= Event("FixedUpdate", true)

local Time = Time
local UpdateBeat = UpdateBeat
local LateUpdateBeat = LateUpdateBeat
local FixedUpdateBeat = FixedUpdateBeat

--逻辑update
function Update(deltaTime, unscaledDeltaTime)
	UpdateBeat()	
end

function LateUpdate()	
	LateUpdateBeat()				
end

--物理update
function FixedUpdate()
	FixedUpdateBeat()
end


CS.Framework.LuaLooper.Instance:Init()