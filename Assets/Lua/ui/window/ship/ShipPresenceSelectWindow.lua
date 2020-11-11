---@class ShipPresenceSelectWindow
local M = DClass("ShipPresenceSelectWindow", BaseWindow)
_G.ShipPresenceSelectWindow = M

function M:ctor(...)
    local data = ...
    self.curIdRoom = data[1][1]
    self.curIndexCell = data[1][2]
    local dataRoom = ShipMgr:getRoomDataById(self.curIdRoom)
    self.curIdHero = dataRoom.cHeros[self.curIndexCell] or 0

    self.curSelectHero = self.curIdHero
    self.listRoomItems = {}
    self.listHeroItems = {}
end

function M:onInit()
    self.nodes.uiGesture:AddHandler(
        UIGestureType.All,
        function(e)
            self:onGestureHandler(e)
        end
    )
    
    self:addEventHandler(self.nodes.button_Presence.onClick, self.onClickPresence)

    self:onUpdateSelectedHero()
    self:onUpdatePresenceBtn()
    self:onUpdateSelectRoomHeros()
end

function M:onClickPresence()
    local dataRoom = ShipMgr:getRoomDataById(self.curIdRoom)
    local dRoom = ShipMgr:getHeroPresenceRoomId(0, self.curSelectHero)
    local sendPresence = function()
        dataRoom:sendPresenceHero(
            self.curIndexCell,
            self.curSelectHero,
            function()
                self.curIdHero = self.curSelectHero
                self:onUpdateSelectedHero()
                self.listHeroItems = {}
                self:onUpdateSelectRoomHeros()
                UIGlobal.topBanner:doBack()
            end
        )
    end
    if dRoom and dRoom.cId > 0 then
        local dataTip = {
            self.curSelectHero,
            dRoom.cId,
            sendPresence
        }
        UIManager.openWindow("ShipPresence_HeroTipPopup", nil, dataTip)
    else
        sendPresence()
    end
end

function M:openSortRoom()
    
end

function M:onUpdatePresenceBtn()
    local nameRoom = Config.ShipBuilding[self.curIdRoom].name
    self.nodes.text_CurSelectName.text = nameRoom
    self.nodes.text_RoomName.text = nameRoom
    UIGlobal.topBanner:setTitleName(nameRoom)
    
    local dataHero = HeroMgr:getHero(self.curIdHero, false)
    if not dataHero then
        self.nodes.button_Presence.gameObject:SetActive(false)
    else
        ---@type ShipMgr_RoomData
        local dataRoom = ShipMgr:getRoomDataById(self.curIdRoom)
        local idHeroInIndex = dataRoom.cHeros[self.curIndexCell] or 0
        
        self.nodes.button_Presence.gameObject:SetActive(idHeroInIndex ~= self.curIdHero)
    end
end

function M:onUpdateSelectRoomHeros()
    local listHeros = Config.ShipBuilding[self.curIdRoom].hero
    local listHeros =
        table.findAll(
        listHeros,
        function(a)
            local hero = HeroMgr:getHero(a, false)
            if hero then
                return true
            end
            return false
        end
    )
    listHeros = ShipManager:sortShipHeroList(listHeros, self.curIdRoom, self.curIdHero)
    self.nodes.contentHeros:InitPool(
        #listHeros,
        function(index, obj)
            local data = listHeros[index]
            local item =
                table.findOne(
                self.listHeroItems,
                function(a)
                    return a.index == index
                end
            )

            if not item then
                item = {}
                item.index = index
                item.id = data
                item.nodes = {}
                item.nodes.imgBg = obj.transform:Find("Image_Bg"):GetComponent(typeof(Image))
                item.nodes.icon = obj.transform:Find("Image_HeroIcon"):GetComponent(typeof(Image))
                item.nodes.current = obj.transform:Find("Text_Current").gameObject
                item.nodes.select = obj.transform:Find("Image_Select").gameObject
                item.nodes.using = obj.transform:Find("Image_Using").gameObject
                item.nodes.btn = obj.transform:GetComponent(typeof(Button))
                table.insert(self.listHeroItems, item)
                self:addEventHandler(
                    item.nodes.btn.onClick,
                    function()
                        self.curSelectHero = data
                        self.curIdHero = data --
                        self:onUpdateSelectedHero() --
                        for key, value in pairs(self.listHeroItems) do
                            value.nodes.select:SetActive(value.index == index)
                        end
                    end
                )
            end

            local dataInRoom = ShipMgr:getHeroPresenceRoomId(self.curIdRoom, data)
            local idHeroInRoom = dataInRoom and dataInRoom.cId or 0
            item.nodes.current:SetActive(data == self.curIdHero)
            item.nodes.select:SetActive(data == self.curSelectHero)

            item.nodes.using:SetActive(idHeroInRoom > 0 and data ~= self.curIdHero)

            EquipManager:setHeroIcon(self, item.nodes.icon, data)
            ShipManager:setHeroBg(self, item.nodes.imgBg, data)
        end
    )
end

function M:onUpdateSelectedHero()
    local dataHero = HeroMgr:getHero(self.curIdHero, false)
    if not dataHero then
        self.nodes.nodeSelectedInfo:SetActive(false)
        self.nodes.nodeNone:SetActive(true)
        return
    end

    self:onUpdatePresenceBtn()
    self:onSetHeroMode()
    self.nodes.nodeSelectedInfo:SetActive(true)
    self.nodes.nodeNone:SetActive(false)

    --EquipManager:setHeroIcon(self, self.nodes.image_HeroIcon, self.curIdHero)
    local cfgHero = Config.HeroDefend[self.curIdHero * 10 + dataHero.star]
    self.nodes.text_Name.text = dataHero.config.name
    self.nodes.text_Details.text = ShipManager:getHeroBuildEffect(self.curIdHero)
end


function M:onSetHeroMode()
    local config = Config.Hero[self.curIdHero]
    if not self.nodes.uIModel then
        Log("self.nodes.model is nil--------")
    end
    self.nodes.uIModel:LoadModel("Model/" .. config.model_info.path, config.model_info.height)
end

function M:onGestureHandler(event)
    if event.type == UIGestureType.Move then
        self.nodes.uIModel:RotateModel(-event.deltaPosition.x)
    elseif event.type == UIGestureType.Click then
    end
end
