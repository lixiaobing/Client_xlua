---@class ShipPopup_Card
local M = DClass("ShipPopup_Card", BaseComponent)
_G.ShipPopup_Card = M

function M:Awake()
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:onInit()
end

function M:onInit()
    self:addEventHandler(self.nodes.button_Exchange.onClick, self.onExchangeClick)
end

function M:onExchangeClick()
    Log("兑换" .. self.countExchage)
end

function M:onUpdateUI()
    self.curTimesExchanged = ShipMgr:getCurTimesExchanged()
    self.maxTimesExchange = ShipMgr:getMaxTimesExchange()

    local isEnoughTimes = self.curTimesExchanged >= self.maxTimesExchange
    self.nodes.nodeLimitTimes.gameObject:SetActive(isEnoughTimes)

    self:setExchangeUI()
end

function M:setExchangeUI()
    self.nodes.text_Times.text = string.format("今日还可兑换%d/%d次", self.curTimesExchanged, self.maxTimesExchange)

    local ownCount = BagMgr:getDemondCount()
    BagManager.setItemIcon(self, self.nodes.image_Icon, ItemType.DIAMOND)
    BagManager.setItemIcon(self, self.nodes.image_PowerIcon, ItemType.PhyPower)

    --从配置文件中获得
    self.countExchage = ShipManager:getBlackCardCountByTimes(self.curTimesExchanged)
    --从配置文件中获得
    local countGet = ShipManager:getPhyPowerCountByBCnum()

    self.nodes.text_Count.text = self.countExchage
    self.nodes.text_PowerCount.text = countGet

    self.nodes.text_ExchangCount.text =
        string.format(
        ownCount >= self.countExchage and "%d/%d" or "<color=red>%d/%d</color>",
        ownCount,
        self.countExchage
    )
end
