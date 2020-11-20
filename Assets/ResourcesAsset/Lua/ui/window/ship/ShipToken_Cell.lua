---@class ShipToken_Cell
local M = DClass("ShipToken_Cell", BaseComponent)
_G.ShipToken_Cell = M

function M:Awake()
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self.curId = 0
    self:onInit()
end

function M:onInit()
    self:addEventHandler(self.nodes.btnSelf.onClick, self.onClickSelf)
end

function M:onUpdateUI(id)
    self.curId = id
    ---@type ShipMgr_TokenData
    self.curDataToken = ShipMgr:getTokenDataById(self.curId)
    self:setItemIcon()
    self:setStars()
    self:setItemUpable()
    self:setActivable()
end

function M:setItemIcon()
    BagManager.setItemIcon(self, self.nodes.image_Icon, self.curId)
    ShipManager:setTokenQualityIcon(self, self.nodes.image_Quality, self.curDataToken.config.quality)
end

function M:setStars()
    local curData = ShipMgr:getTokenDataById(self.curId)
    ShipManager:setTokenStars(self.nodes.stars, curData)
end

function M:setItemUpable()
    if self.curDataToken:getActivable() then
        self.nodes.image_TipUp:SetActive(false)
        return
    end
    self.nodes.image_TipUp:SetActive(self.curDataToken:getStarUpable())
end

function M:setActivable()
    self.nodes.image_Active:SetActive(self.curDataToken:getActivable())
end

function M:onClickSelf()
    MsgCenter.sendMessage(Msg.SHIP_SHOWTOKEN, self.curId)
end
