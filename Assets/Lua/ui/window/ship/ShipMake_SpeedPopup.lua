---@class ShipMake_SpeedPopup
local M = DClass("ShipMake_SpeedPopup", BaseWindow)
_G.ShipMake_SpeedPopup = M

local timeUpCfg = 0
local idItemTimeUp = 0
local timeRoomCreate = 0
local timeCoolDown = 0
function M:ctor(...)
    local data = ...
    self.idRoom = data[1]
    self.cfgRoom = Config.ShipBuilding[self.idRoom]
    self.numControl = 1
    self.numUsingItem = 1

    timeUpCfg = ShipManager:getTimeUpTime()
    idItemTimeUp = ShipManager:getTimeUpCostItemId()
    timeRoomCreate = self.cfgRoom.time
end

function M:onUpdate()
    self:onUpdateTime()
end

function M:onInit()
    self.coverCallBack = self.close

    self:addEventHandler(self.nodes.button_Min.onClick, self.onMinClick)
    self:addEventHandler(self.nodes.button_Max.onClick, self.onMaxClick)
    self:addEventHandler(self.nodes.button_Lost.onClick, self.onLostClick)
    self:addEventHandler(self.nodes.button_Add.onClick, self.onAddClick)
    self:addEventHandler(self.nodes.button_SpeedUp.onClick, self.onSpeedUpClick)
    self:addEventHandler(self.nodes.button_Close.onClick, self.close)

    self:onUpdateUI()
end

function M:onUpdateUI()
    ---@type ShipMgr_RoomData
    self.roomData = ShipMgr:getRoomDataById(self.idRoom)
    timeCoolDown = self.roomData:getCoolDownTime()

    self:updateFinishTime()
    self:onUpdateCostNum()
end

function M:updateFinishTime()
    self.timeFinish = self.roomData:getFinishTime()
    local timeShow = TimeUtils.getLeftTime(self.timeFinish)
    self.timeLeft = timeShow.tScond <= 0 and 0 or timeShow.tScond
end

function M:onUpdateCostNum()
    local dur = self.timeLeft <= 0 and 0 or 1
    self.timeUp = (self.numControl - dur) * timeRoomCreate * timeCoolDown + self.timeLeft
    BagManager.setItemIcon(self, self.nodes.image_IconCost, idItemTimeUp)
    ShipManager:setCreateItemIcon(self, self.nodes.image_Icon, self.roomData.configRoom.icon_show)
    local temp0 = math.ceil(self.timeUp)
    local leftCount = temp0 % timeUpCfg
    local temp = self.timeUp / timeUpCfg
    self.needCount = math.floor(temp)
    self.needCount = self.needCount + (leftCount > 0 and 1 or 0)
    local dataItem = BagMgr:getItemDataByCId(idItemTimeUp)
    self.countOwn = dataItem and dataItem.num or 0

    local tempCount = (self.countOwn * timeUpCfg - self.timeLeft) / (timeRoomCreate * timeCoolDown)
    self.numCreatMax = math.floor(tempCount) + dur

    local isLack = self.countOwn < self.needCount
    local strFormat = isLack and "<color=red>%d</color>/%d" or "%d/%d"
    self.nodes.text_Cost.text = string.format(strFormat, self.countOwn, self.needCount)
    self.nodes.text_CurCount.text = self.numControl
end

function M:onUpdateTime()
    if self.roomData.itemCreateNum >= self.roomData.maxCreateNum then
        self.nodes.text_Timing.text = "00:00:00"
        self.nodes.text_UpTime.text = ShipManager:getTimeShow(self.timeUp)
        return
    end
    if self.timeLeft <= 0 then
        self:updateFinishTime()
        self:onUpdateCostNum()
        return
    end
    self.timeLeft = self.timeLeft - Time.deltaTime
    self.timeUp = (self.numControl - 1) * timeUpCfg + self.timeLeft
    self.nodes.text_Timing.text = ShipManager:getTimeShow(self.timeLeft)
    self.nodes.text_UpTime.text = ShipManager:getTimeShow(self.timeUp)
end

function M:onMinClick()
    self.numControl = 1
    self:onUpdateCostNum()
end
function M:onMaxClick()
    self.numControl = self.numCreatMax <= 1 and 1 or self.numCreatMax
    self:onUpdateCostNum()
end
function M:onLostClick()
    if self.numControl <= 1 then
        return
    end
    self.numControl = self.numControl - 1
    self:onUpdateCostNum()
end
function M:onAddClick()
    if self.numControl >= self.numCreatMax then
        return
    end
    self.numControl = self.numControl + 1
    self:onUpdateCostNum()
end
function M:onSpeedUpClick()
    Log("发送加速 制造个数：" .. self.numControl)
    if self.countOwn < self.needCount then
        local data = {}
        data.title = "提示"
        data.content = "道具不足，加速失败"
        data.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
        data.buttonTypes = {1, 2}
        data.callback = function(sort)
            
        end

        MsgCenter.sendMessage(Msg.NOTIFY, data)

        return
    end
    self.roomData:sendSpeedUp(
        self.numControl,
        function()
            self:onUpdateUI()
        end
    )
end
