---@class EquipSuitWindow
local EquipSuitWindow = DClass("EquipSuitWindow", BaseWindow)
_G.EquipSuitWindow = EquipSuitWindow

function EquipSuitWindow:ctor(data)
end

function EquipSuitWindow:addListeners()
    
end

function EquipSuitWindow:onAsset()
    
    
end

function EquipSuitWindow:onInit()
    self:addListeners()
    self.nodes.uiGesture:AddHandler(
        UIGestureType.All,
        function(e)
            if e.type == UIGestureType.Move then
                self.nodes.model:RotateModel(-e.deltaPosition.x)
            end
        end
    )

    self.cpt_Equip = self:createComponent(self.nodes.nodeEquip, EquipSuit_Equip)
    self.cpt_Suit = self:createComponent(self.nodes.nodeSuit, EquipSuit_Suit)
    self.cpt_Rename = self:createComponent(self.nodes.nodeRename, EquipSuit_Rename)
end
