---@class ShipPresenceWindow
local M = DClass("ShipPresenceWindow", BaseWindow)
_G.ShipPresenceWindow = M

function M:ctor(...)
    local data = {...}
    self.curSelectId = data[1][1]
end

function M:onInit()
    --self:onSetRoomsHeroUI()
end

function M:onOpen()
    self:onSetRoomsHeroUI()
    self:initRoomsUI()
end

function M:onSetRoomsHeroUI()
    ---@type ShipMgr_RoomData
    self.curRoomData = ShipMgr:getRoomDataById(self.curSelectId)

    local listRoomItems = {}
    local startIndex = 0
    for index, value in ipairs(Config.ShipBuilding) do
        if value.id == self.curSelectId then
            startIndex = index
            break
        end
    end
    self.nodes.contentRooms:InitPool(
        #Config.ShipBuilding,
        function(index, obj)
            local idRoom = Config.ShipBuilding[index].id
            ---@type ShipMgr_RoomData
            local dataRoom = ShipMgr:getRoomDataById(idRoom)
            local item = {}
            item =
                table.findOne(
                listRoomItems,
                function(i)
                    return i.index == index
                end
            )
            if not item then
                item = {}
                item.idRoom = idRoom
                item.index = index
                item.nodes = {}
                item.nodes.contentHeros = obj.transform:Find("Button_Presence/Content").gameObject
                item.nodes.cptHeros = self:createComponent(item.nodes.contentHeros, ShipPresence_Heros)
                item.nodes.select = obj.transform:Find("Image_Select").gameObject
                item.nodes.nodeLock = obj.transform:Find("Image_Lock").gameObject
                item.nodes.textName = obj.transform:Find("Image_Room/Text_RoomName"):GetComponent(typeof(Text))
                item.nodes.btnRoom = obj.transform:GetComponent(typeof(Button))
                self:addEventHandler(
                    item.nodes.btnRoom.onClick,
                    function()
                        self:onChangeSelectRoom(idRoom)
                        for key, value in pairs(listRoomItems) do
                            value.nodes.select:SetActive(idRoom == value.idRoom)
                        end
                    end
                )
                table.insert(listRoomItems, item)
            end

            item.nodes.select:SetActive(idRoom == self.curSelectId)
            if idRoom == self.curSelectId then
                self:onChangeSelectRoom(idRoom)
            end
            if dataRoom then
                item.nodes.nodeLock:SetActive(dataRoom.numOpen <= 0)

                if dataRoom.numOpen <= 0 then
                else
                    item.nodes.cptHeros:setPrescenceUI(
                        idRoom,
                        function(...)
                            self:onEnterHero(...)
                        end
                    )
                    item.nodes.textName.text = dataRoom.configRoom.name
                end
            else
                item.nodes.nodeLock:SetActive(true)
            end
        end,
        startIndex
    )
end

function M:onEnterHero(...)
    UIManager.openWindow("ShipPresenceSelectWindow", nil, ...)
end

function M:onChangeSelectRoom(id)
    self.curSelectId = id
    self.curRoomData = ShipMgr:getRoomDataById(id)
    self:setRoomHerosEffect()
    self:setRoomPosition()
end

function M:setRoomHerosEffect()
    ShipManager:setRoomIcon(self, self.nodes.image_Ship, self.curRoomData.configRoom.icon)

    local tShowHeros = self.curRoomData:getHeros()
    local showHeros = {}
    for key, value in pairs(tShowHeros) do
        if value ~= 0 then
            table.insert(showHeros, value)
        end
    end
    if #showHeros <= 0 then
        self.nodes.text_EffectsT:SetActive(false)
        return
    end

    local listHeroItems = {}
    self.nodes.text_EffectsT:SetActive(true)
    self.nodes.contentHeros:InitPool(
        #showHeros,
        function(index, obj)
            local idHero = showHeros[index]
            local cfgHero = Config.Hero[idHero]
            local item = {}
            item =
                table.findOne(
                listHeroItems,
                function(i)
                    return i.index == index
                end
            )
            if not item then
                item = {}
                item.index = index
                item.nodes = {}
                item.nodes.image_Icon = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
                item.nodes.text_Name = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
                item.nodes.text_Effect = obj.transform:Find("Text_Effect"):GetComponent(typeof(Text))
                table.insert(listHeroItems, item)
            end

            EquipManager:setHeroIcon(self, item.nodes.image_Icon, idHero)
            item.nodes.text_Name.text = cfgHero.name
            item.nodes.text_Effect.text = ShipManager:getHeroBuildEffect(idHero)
        end
    )
end

function M:initRoomsUI()
    self.listRoomPosition = {}
    for i = 1, self.nodes.nodeRooms.childCount do
        local childObj = self.nodes.nodeRooms.transform:GetChild(i - 1)
        local strObjStart = "Room_"
        if string.sub(childObj.name, 1, 5) == strObjStart then
            local strId = string.gsub(childObj.name, strObjStart, "", 1)
            local id = tonumber(strId)

            local cfgRoom = Config.ShipBuilding[id]
            local imgIcon = childObj.transform:GetComponent(typeof(Image))
            ShipManager:setRoomIcon(self, imgIcon, cfgRoom.icon)
            childObj.gameObject:SetActive(id == self.curSelectId)
            self.listRoomPosition[id] = childObj
        end
    end
end

function M:setRoomPosition()
    if not self.listRoomPosition then
        self:initRoomsUI()
        return
    end
    for key, value in pairs(self.listRoomPosition) do
        value.gameObject:SetActive(key == self.curSelectId)
    end
end
