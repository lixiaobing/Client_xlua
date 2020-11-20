---@class ShipScience_Cell
local M = DClass("ShipScience_Cell", BaseComponent)
_G.ShipScience_Cell = M

function M:Awake()
    self.messager = self:addPlugin(Messager.new(self))
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:addListeners()
    self:onInit()
end

function M:addListeners()
    self.messager:addListener(Msg.SHIP_TALENT_UPDATECELL, self.onSetUI)
end

function M:dispose()
    self.messager:dispose()
end

function M:onInit()
    self:addEventHandler(self.nodes.btnSelf.onClick, self.onClickSelf)
end

function M:onUpdateUI(id, onClick)
    self.curId = id
    self.nodes.image_Select:SetActive(false)
    self.funcClick = onClick

    self:onSetUI()
end

function M:onClickSelf()
    if self.funcClick then
        self.funcClick()
    end
end

function M:onClickCell(id)
    self.nodes.image_Select:SetActive(self.curId == id)
end

function M:onSetUI()
    ---@type ShipMgr_TalentData
    self.curData = ShipMgr:getTalentDataById(self.curId)
    self.nodes.text_Lv.text =
        self.curData.config.already_max and "Max" or self.curData.cLv .. "/" .. self.curData.config.level_max

    if self.curData.cLv > 0 then
        self.nodes.image_Icon.gameObject:SetActive(true)
        ShipManager:setTalentIcon(self, self.nodes.image_Icon, self.curData.config.icon)
        ShipManager:setTalentBg(self, self.nodes.image_Bg, self.curData.config.icon_bg)

        self.nodes.text_Lv.gameObject:SetActive(true)
        self.nodes.image_Lock:SetActive(false)
        self.nodes.image_Up:SetActive(self.curData:getUpable())
    else
        ShipManager:setTalentBg(self, self.nodes.image_Bg, nil)

        local active ,list = self.curData:getActivable()
        ---只判断前置关卡
        local isBefore = self.curData:checkActiveBefore()
        ---判断消耗品足够
        local isCost = self.curData:checkActiveCost()


        self.nodes.image_Icon.gameObject:SetActive(isBefore)
        self.nodes.text_Lv.gameObject:SetActive(isBefore)
        self.nodes.image_Lock:SetActive(not isBefore)
        self.nodes.image_Up:SetActive(active)
    end
end
