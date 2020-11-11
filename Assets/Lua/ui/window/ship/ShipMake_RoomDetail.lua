---@class ShipMake_RoomDetail
local M = DClass("ShipMake_RoomDetail", BaseComponent)
_G.ShipMake_RoomDetail = M

function M:Awake()
    self.messager = self:addPlugin(Messager.new(self))
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:addListeners()
    self.messager:addListener(Msg.SHIP_MAKE_UPDATEROOMDATA, self.onUpdateUI)
end

function M:dispose()
    self.messager:dispose()
end

function M:onStart()
    self:addListeners()
    self:onInit()
end

function M:onUpdate()
    self:checkCreateTime()
end

function M:onInit()
    self:addEventHandler(self.nodes.button_Look.onClick, self.onClickLook)
    self:addEventHandler(self.nodes.button_BackControl.onClick, self.onBackControl)
    self:addEventHandler(self.nodes.button_MakeDetail.onClick, self.onClickMakeDetail)
    self:addEventHandler(self.nodes.button_SpeedUp.onClick, self.onClickSpeedUp)
    self:addEventHandler(self.nodes.button_Recieve.onClick, self.onClickRecieve)
    self:addEventHandler(self.nodes.button_Presence.onClick, self.onClickPresence)
end

function M:onClickLook()
    Log("切换到浏览界面。。")
    self:onSetNodeControl(false)
end

function M:onBackControl()
    self:onSetNodeControl(true)
end

function M:onSetNodeControl(show)
    self.nodes.nodeControl:SetActive(show)
    self.nodes.button_BackControl.gameObject:SetActive(not show)
    MsgCenter.sendMessage(Msg.SHOW_TOPBANNER, show) --隐藏topbanner
end

function M:onClickMakeDetail()
    UIManager.openWindow("ShipMake_DetailPopup", nil, self.curId)
end
function M:onClickSpeedUp()
    UIManager.openWindow("ShipMake_SpeedPopup", nil, self.curId)
end
function M:onClickRecieve()
    local dataRoom = clone(self.roomData)
    self.roomData:sendTakeProduct(
        function()
            UIManager.openWindow("ShipMake_RecievePopup", nil, dataRoom:getRecieveData())
        end
    )

    Log("发送收取信息。。")
end
function M:onClickPresence()
    self:enterPrecenseWindow()
    Log("点击进入入驻界面")
end

local curRoomId = 0
function M:enterPrecenseWindow(...)
    UIGlobal.topBanner:setBackHandler(nil)
    UIManager.openWindow("ShipPresenceWindow", nil, curRoomId)
end

function M:onUpdateUI(id)
    id = id or self.curId
    curRoomId = id
    self.curId = id
    self:onSetUI()
end

function M:onSetUI()
    ---@type ShipMgr_RoomData
    self.roomData = ShipMgr:getRoomDataById(self.curId)
    if not self.roomData then
        return
    end
    self.timeRun = 0
    self:setMakeDetailUI()
    self:setPrescenceUI()
end

function M:setMakeDetailUI()
    -- BagManager.setItemIcon(self, self.nodes.image_CreateItemIcon, self.roomData.configRoom.icon_show)
    -- local configItem = BagManager.getItemConfigDataById(self.roomData.configRoom.icon_show)
    -- self.nodes.text_ItemName.text = configItem.name

    local maxCreateNum = self.roomData.maxCreateNum
    if self.roomData:checkIsCreating() then
        self.nodes.text_MakeState.text = "制造中"
        self.nodes.text_MakeCount.text = string.format("%d/%d", self.roomData.itemCreateNum, maxCreateNum)
        self.nodes.image_Progress.fillAmount = self.roomData.itemCreateNum / maxCreateNum
    else
        self.nodes.text_MakeState.text = "已饱和"
        self.nodes.text_MakeCount.text = string.format("%d/%d", maxCreateNum, maxCreateNum)
        self.nodes.image_Progress.fillAmount = 1
    end
end

function M:checkCreateTime()
    if not self.roomData then
        return
    end
    local timeShow = TimeUtils.getLeftTime(self.roomData:getFinishTime())
    if timeShow.tScond <= 0 then
        self.nodes.text_Time.text = "已完成"
        return
    end
    self.timeRun = self.timeRun + Time.deltaTime
    self.nodes.text_Time.text = TimeUtils.getNormalTimeStyle(self.roomData:getFinishTime())
end

function M:setPrescenceUI()
    local listHeroItems = {}
    local cptHeros = self:createComponent(self.nodes.content.gameObject, ShipPresence_Heros)
    cptHeros:setPrescenceUI(self.curId, self.enterPrecenseWindow)
end
