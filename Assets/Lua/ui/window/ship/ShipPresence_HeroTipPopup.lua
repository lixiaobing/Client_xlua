---@class ShipPresence_HeroTipPopup
local M = DClass("ShipPresence_HeroTipPopup", BaseWindow)
_G.ShipPresence_HeroTipPopup = M

function M:ctor(...)
    local data = ...
    self.idHero = data[1][1]
    self.idRoom = data[1][2]
    self.callBack = data[1][3]
end

function M:onInit()
    self.coverCallBack = self.close
    self:addEventHandler(self.nodes.button_Sure.onClick, self.onSureClick)
    self:addEventHandler(self.nodes.button_Cannel.onClick, self.close)
    self:addEventHandler(self.nodes.button_Close.onClick, self.close)
    self:onInitUI()
end

function M:onInitUI()
    EquipManager:setHeroIcon(self, self.nodes.image_Icon, self.idHero)
    ShipManager:setRoomIcon(self, self.nodes.image_RoomIcon, self.idRoom)
    self.nodes.text_Effect.text = ShipManager:getHeroBuildEffect(self.idHero)
    self.nodes.text_RoomName.text = Config.ShipBuilding[self.idRoom].name
end

function M:onSureClick()
    if self.callBack then
        self.callBack()
    end
    self:close()
end
