---@class ShipToken_SuccessPopup
local M = DClass("ShipToken_SuccessPopup", BaseWindow)
_G.ShipToken_SuccessPopup = M

function M:ctor(...)
    local data = ...
    Log(dumpTable(data, "打开信物成功界面："))
    self.curData = data[1]
    self.timeCount = 5
end

function M:onInit()
    self.coverCallBack = self.close
    self:onInitUI()
end

function M:onUpdate()
    self:countDownTime()
end

function M:countDownTime()
    if self.timeCount <= 0 then
        self:close()
        return
    end
    self.timeCount = self.timeCount - Time.deltaTime
    local timeShow = math.ceil(self.timeCount)
    self.nodes.text_ShowClose.text = string.format("点击任意位置关闭(%d%s", timeShow, "s)")
end

function M:onInitUI()
    BagManager.setItemIcon(self, self.nodes.image_Icon, self.curData.cId)

    ShipManager:setTokenStars(self.nodes.stars, self.curData)

    local cfgAttr = self.curData.configAttr
    local listAttr = cfgAttr.attr
    for i, value in ipairs(listAttr) do
        local txtAttr = self.nodes[string.format("text_Attr%d", i)]
        local numAdd = self.curData:getAddAttr(value.id)
        local isActive = value.count == numAdd
        local strAddAttr = isActive and tostring(numAdd) or string.format("+%d", numAdd)
        local strFormat = isActive and "%s: %d%s"
        txtAttr.text =
            isActive and string.format("%s: %s", ShipManager.ShipItemAttr_Name[value.id], strAddAttr) or
            string.format("%s: %d%s", ShipManager.ShipItemAttr_Name[value.id], (value.count - numAdd), strAddAttr)
    end

    local cfgSkill = self.curData.configSkill
    self.nodes.text_Effects.text = cfgSkill and cfgSkill.Des or ""
end
