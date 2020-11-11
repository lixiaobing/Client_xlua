---@class Equip_OwnEquip
local Equip_OwnEquip = DClass("Equip_OwnEquip", BaseComponent)
_G.Equip_OwnEquip = Equip_OwnEquip

function Equip_OwnEquip:ctor()
    self.messager = Messager.new(self)
end

function Equip_OwnEquip:addListener()
end

function Equip_OwnEquip:onDispose()
    self.messager:dispose()
end

function Equip_OwnEquip:onStart()
    self:addListener()
    self:onInit()
end

function Equip_OwnEquip:onInit()
    self.cpn_Change = self:createComponent(self.nodes.nodeChange, EquipOwn_Change)
end

function Equip_OwnEquip:onOpen()
    self.cpn_Change:onOpen()
end
