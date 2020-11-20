-- @brief: LuaComponent映射类
-- @version: 1.0.0
-- @author lanqibo
-- @date: 8/8/2019
-- All rights reserved
---@class MonoComponent
local MonoComponent = DClass("MonoComponent")
_G.MonoComponent = MonoComponent

function MonoComponent:AddLuaComponent(obj)
    self.gameObject = obj
    self.transform = obj.transform
   
    local comp = LuaComponent.Bind(obj, self)
    self.mono = comp
    
    if comp and self.Awake then
        self:Awake()
    end
 
	return comp
end

function MonoComponent:OnDestroy()

end

function MonoComponent:clearMembers()
    for k,v in pairs(self) do
        local t = type(v)
        if t == "userdata" then
            self[k] = nil
        elseif t == "table" and not getmetatable(v) then
            self:clearTable(v, 0)
        end
    end
end

function MonoComponent:clearTable(tab, layers)
    local layer_count = layers + 1
    if layer_count > 2 then return end

    for k,v in pairs(tab) do
        if type(v) == "table" and not getmetatable(v) then
            self:clearTable(v, layer_count)
        elseif type(v) == "userdata" then
            tab[k] = nil
        end
    end
end

function MonoComponent:addUpdate()
    self:removeUpdate()
    if self.onUpdate then
        UpdateBeat:Add(self.onUpdate, self)
    end
    if self.onLateUpdate then
        LateUpdateBeat:Add(self.onLateUpdate, self)
    end
    if self.onFixedUpdate then
        FixedUpdateBeat:Add(self.onFixedUpdate, self)
    end
end

function MonoComponent:removeUpdate()
    if self.onUpdate then
        UpdateBeat:Remove(self.onUpdate, self)
    end
    if self.onLateUpdate then
        LateUpdateBeat:Remove(self.onLateUpdate, self)
    end
    if self.onFixedUpdate then
        FixedUpdateBeat:Remove(self.onFixedUpdate, self)
    end
end

