---@class ShipPopup
local M = DClass("ShipPopup", BaseWindow)
_G.ShipPopup = M

function M:ctor(...)
end

function M:onInit()
    self.coverCallBack = self.close
    self:onInitTaps()
    self:onUpdatePhyPower()
end

function M:onUpdate()
    self:onSetPhyPower()
end

function M:onInitTaps()
    self.itemCpt = self:createComponent(self.nodes.nodeItem.gameObject, ShipPopup_Item)
    self.cardCpt = self:createComponent(self.nodes.nodeCard.gameObject, ShipPopup_Card)

    self:addEventHandler(
        self.nodes.toggle_1.onValueChanged,
        function(v)
            if v then
                self:onTapValueChanged(1)
            end
        end
    )
    self:addEventHandler(
        self.nodes.toggle_2.onValueChanged,
        function(v)
            if v then
                self:onTapValueChanged(2)
            end
        end
    )
    self:onTapValueChanged(1)
end

function M:onUpdatePhyPower()
    BagManager.setItemIcon(self, self.nodes.image_Icon, ItemType.PhyPower)
    self.maxPhyPower = ShipMgr:getPhyPowerUpperLimit()
    self.speedPhyPower = ShipMgr:getSpeedPhyPowerAdd()
    self.curPhyPower = ShipMgr:getCurPhyPower()

    self.timeLeft = TimeUtils.getLeftTime(BagMgr.powerPhyTime).tScond
end

---@param index number 1 = item , 2 =card
function M:onTapValueChanged(index)
    self.nodes.nodeItem.gameObject:SetActive(index == 1)
    self.nodes.nodeCard.gameObject:SetActive(index == 2)

    if index == 1 then
        self.itemCpt:onUpdateUI()
    end

    if index == 2 then
        self.cardCpt:onUpdateUI()
    end
end

function M:onSetPhyPower()
    if self.curPhyPower >= self.maxPhyPower then
        self.nodes.text_Count.text = string.format("%d/%d", self.curPhyPower, self.maxPhyPower)
        return
    end
    
    if self.timeLeft <= 0 then
        self.curPhyPower = ShipMgr:getCurPhyPower()
        self.timeLeft = TimeUtils.getLeftTime(BagMgr.powerPhyTime).tScond
    end
    self.timeLeft = self.timeLeft - Time.deltaTime
    local timeShow = self:getCountDownTime(self.timeLeft)
    self.nodes.text_Count.text =
        string.format("%d/%d(%s后恢复%d点)", self.curPhyPower, self.maxPhyPower, timeShow, self.speedPhyPower)
end

function M:getCountDownTime(_time)
    local day, hour, min, sec = TimeUtils.format(_time, false)
    local _hour = day * 24 + hour
    if _hour > 0 then
        return string.format("%d:%.2d:%.2d", _hour, min, sec)
    else
        return string.format("%.2d:%.2d", min, sec)
    end
end
