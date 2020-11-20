---@class ShipMake_Room
local M = DClass("ShipMake_Room", BaseComponent)
_G.ShipMake_Room = M

function M:Awake()
    self.messager = self:addPlugin(Messager.new(self))
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onUpdate()
    self:onShowMaking()
end

function M:addListeners()
    self.messager:addListener(Msg.SHIP_MAKE_UPDATEROOMDATA, self.onUpdateUI)
end

function M:dispose()
    self.messager:dispose()
end

function M:onStart()
    self.timeShow = 0
    self.valueFill = 0
    self:addListeners()
    self:onInit()
end
function M:onInit()
    self:addEventHandler(self.nodes.btnSelf.onClick, self.onClickSelf)
end

function M:onUpdateUI(id, clickRoom)
    id = id or self.curId
    clickRoom = clickRoom or self.clickRoomCallBack
    self.curId = id
    self.clickRoomCallBack = clickRoom
    self:onSetUI()
end

function M:onClickSelf()
    Log("点击Room进入 id：" .. self.curId)
    if self.clickRoomCallBack then
        self.clickRoomCallBack()
    end
end

function M:onSetUI()
    ---@type ShipMgr_RoomData
    local dataRoom = ShipMgr:getRoomDataById(self.curId)
    if not dataRoom then
        self.nodes.open:SetActive(false)
        return
    end
    self.nodes.open:SetActive(true)
    local isRoomLock = dataRoom.numOpen <= 0
    ShipManager:setRoomIcon(self, self.nodes.image_Icon, dataRoom.configRoom.icon)
    self.nodes.text_Name.text = dataRoom.configRoom.name
    self.nodes.image_Lock:SetActive(isRoomLock)
    self.nodes.text_Num.gameObject:SetActive(not isRoomLock)
    self.nodes.text_State.gameObject:SetActive(not isRoomLock)
    self.nodes.image_Maked:SetActive(not isRoomLock)
    if isRoomLock then
        self.nodes.text_Lock.text = dataRoom.configRoom.limit_des[1] ---
        return
    end

    self.nodes.image_StateIng:SetActive(false)
    self.nodes.image_StateOver:SetActive(false)
    self.nodes.image_Making.gameObject:SetActive(false)
    self.nodes.text_Num.text = string.format("%d/%d", dataRoom:getHeroCount(), dataRoom.configRoom.defend_max)
    local maxCreate = dataRoom.maxCreateNum
    self.isMaking = dataRoom.itemCreateNum < maxCreate
    if self.isMaking then
        self.nodes.text_State.text = "制造中"
        -- self.nodes.image_StateIng:SetActive(true)
        self.nodes.image_Making.gameObject:SetActive(true)
        self.showMakingTime = 3
    else
        -- self.nodes.image_StateOver:SetActive(true)
        self.nodes.text_State.text = "已饱和"
    end
    --BagManager.setItemIcon(self, self.nodes.image_MakeIcon, dataRoom.configRoom.icon_show)
    ShipManager:setCreateItemIcon(self, self.nodes.image_MakeIcon, dataRoom.configRoom.icon_show)
    self.nodes.text_MakeNum.text = dataRoom.itemCreateNum
end

function M:onShowMaking()
    if not self.isMaking then
        return
    end
    self.timeShow = self.timeShow + Time.deltaTime
    if self.timeShow >= 3 then
        self.timeShow = 0
        self.nodes.image_Making.fillAmount = 0
    end
    local valueUpdate = self.timeShow / 3
    self.nodes.image_Making.fillAmount = Mathf.Lerp(self.valueFill,valueUpdate,0.1)
    self.valueFill = valueUpdate
end