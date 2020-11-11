---@class ShipWindow
local M = DClass("ShipWindow", BaseWindow)
_G.ShipWindow = M

function M:ctor(...)
end

function M:onInit()
    
    self.messager:addListener(Msg.SHIP_MAINATTRS, self.setAttrs)
    self.nodes.uiGesture:AddHandler(
        UIGestureType.All,
        function(e)
            self:onGestureHandler(e)
        end
    )
    self:addEventHandler(self.nodes.button_Token.onClick, self.onTokenClick)
    self:addEventHandler(self.nodes.button_Science.onClick, self.onScienceClick)
    self:addEventHandler(self.nodes.button_Make.onClick, self.onMakeClick)
    -- self:initModel()
    -- self:setRader()
    self:setAttrs()
end

function M:onOpen()
end

function M:onTokenClick()
    UIManager.openWindow("ShipTokenWindow")
end
function M:onScienceClick()
    UIManager.openWindow("ShipScienceWindow")
end
function M:onMakeClick()
    UIManager.openWindow("ShipMakeWindow")
end

function M:onGestureHandler(event)
    if event.type == UIGestureType.Click then
        --UIManager.openWindow("ShipPresenceWindow")
        Log("点击 手势事件----")
    end
end

function M:initModel()
    local path = "Model/Ship/Ship_1"
    self.nodes.uIModel:LoadModel(path, 1)
end

function M:setRader()
    local vRader, maxV = ShipMgr:getListAllShipItemAttrs()

    local lRader = {}
    for i = 1, 5 do
        local data = vRader[i]
        local text = self.nodes.image_Rader.transform:Find("Text" .. i):GetComponent(typeof(Text))
        text.text = data.des
        table.insert(lRader, data.val / maxV)
    end
    self.nodes.image_Rader:SetData(lRader, true)
end

function M:setAttrs()
    local vRader, maxV = ShipMgr:getListAllShipItemAttrs()

    local lRader = {}
    for i = 1, 5 do
        local data = vRader[i]
        local text = self.nodes.image_Attrs.transform:Find("Text" .. i):GetComponent(typeof(Text))
        text.text = data.des
    end
end
