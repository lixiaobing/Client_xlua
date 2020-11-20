---@class ShipMakeWindow
local M = DClass("ShipMakeWindow", BaseWindow)
_G.ShipMakeWindow = M

function M:ctor(...)
end

function M:onOpen()
    self:checkNodesState()
end

function M:checkNodesState()
    if self.nodes.nodeRoom.gameObject.activeSelf then
        self:setTopBackFunc()

        self.cpt_Room:onUpdateUI(self.curSelectId)
    end
end

function M:onInit()
    self:onInitRoomNodes()
    self:resetContentPos()
    self:onInitRoomsUI()
end

function M:resetContentPos()
    self.nodes.content.transform.localPosition = Vector3(0, 0, 0)
end

function M:onInitRoomNodes()
    self.nodeRoomsView = self.nodes.content.transform.parent.gameObject
    self.cpt_Room = self:createComponent(self.nodes.nodeRoom.gameObject, ShipMake_RoomDetail)
    self:onEnterRoom(0)
end

function M:onInitRoomsUI()
    self.tableAllRoom = {}
    for i = 1, self.nodes.content.transform.childCount do
        local childObj = self.nodes.content:GetChild(i - 1)
        local strObjStart = "Room_"
        if string.sub(childObj.name, 1, 5) == strObjStart then
            local strId = string.gsub(childObj.name, strObjStart, "", 1)
            local id = tonumber(strId)
            local cpt = self:createComponent(childObj.gameObject, ShipMake_Room)
            cpt:onUpdateUI(
                id,
                function()
                    self:onEnterRoom(id)
                end
            )
            local item = {}
            item.id = id
            item.cpt = cpt
            table.insert(self.tableAllRoom, item)
        end
    end
end

function M:onUpdateRooms()
    for key, value in pairs(self.tableAllRoom) do
        value.cpt:onUpdateUI(
            value.id,
            function()
                self:onEnterRoom(value.id)
            end
        )
    end
end

function M:onEnterRoom(id)
    self.nodes.nodeRoom:SetActive(id > 0)
    self.nodeRoomsView:SetActive(id <= 0)
    if id > 0 then
        self.curSelectId = id
        self.cpt_Room:onUpdateUI(id)
        self:setTopBackFunc()
    end
end

function M:setTopBackFunc()
    UIGlobal.topBanner:setBackHandler(
        function()
            self:onEnterRoom(0)
            self:onUpdateRooms()
            for key, value in pairs(self.tableAllRoom) do
                value.cpt:onUpdateUI(
                    value.id,
                    function()
                        self:onEnterRoom(value.id)
                    end
                )
            end
            UIGlobal.topBanner:setBackHandler(nil)
        end
    )
end
