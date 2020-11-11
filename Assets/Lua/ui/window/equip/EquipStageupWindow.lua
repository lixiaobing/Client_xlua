---@class EquipStageupWindow
local EquipStageupWindow = DClass("EquipStageupWindow", BaseWindow)
_G.EquipStageupWindow = EquipStageupWindow

function EquipStageupWindow:ctor(data)
    ---@type EquipMgr_EquipData
    self.curEquipData = data[1]
    ---@type EquipMgr_EquipData
    self.lastEquipData = data[2]

    Log(dumpTable(data," EquipStageupWindow:ctor ----"))
end

function EquipStageupWindow:onInit()
    self.countdown = 15
    self:onInitUI()
end

function EquipStageupWindow:onInitUI()
    self:addEventHandler(self.nodes.btnClose.onClick, self.onCloseClick)

    EquipManager:setQuility(self, self.nodes.imgNextStage, self.curEquipData.quality, EquipManager.STAGE_TYPE.ICON)
    EquipManager:setQuility(self, self.nodes.imgLastStage, self.lastEquipData.quality, EquipManager.STAGE_TYPE.ICON)
    EquipManager:setEquipIcon(self, self.nodes.imgIcon, self.lastEquipData.cId)

    local cfgStage = Config.EquipStage[self.curEquipData.quality]
    for i = 1, #cfgStage.des do
        self.nodes["txtDes" .. i].text = cfgStage.des[i]
    end
end

function EquipStageupWindow:onUpdate()
    self:onCountingDown()
end

function EquipStageupWindow:onCountingDown()
    self.countdown = self.countdown - Time.deltaTime
    local intCountdown = math.floor(self.countdown)
    if intCountdown < 0 then
        self:onCloseClick()
        return
    else
        self.nodes.txtCountDown.text = string.format(Lang(1401014), intCountdown)
    end
end

function EquipStageupWindow:onCloseClick()
    UIManager.back()
end
