---@class ShipPresence_Heros
local M = DClass("ShipPresence_Heros", BaseComponent)
_G.ShipPresence_Heros = M

function M:Awake()
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:onInit()
end

function M:onUpdate()
end

function M:onInit()
end

-- function M:setPrescenceUI(id, callBack)
--     self.roomData = ShipMgr:getRoomDataById(id)
--     local listHeroItems = {}
--     self.nodes.content:InitPool(
--         self.roomData.configRoom.defend_max,
--         function(index, obj)
--             local cHeros = self.roomData:getHeros()
--             local idHero = cHeros[index]
--             local item = {}
--             item =
--                 table.findOne(
--                 listHeroItems,
--                 function(i)
--                     return i.index == index
--                 end
--             )
--             local isOpened = index <= self.roomData.numOpen
--             if not item then
--                 item = {}
--                 item.index = index
--                 item.nodes = {}
--                 item.nodes.nodeLock = obj.transform:Find("Image_Lock").gameObject
--                 item.nodes.img_Icon = obj.transform:Find("Image_HeroIcon"):GetComponent(typeof(Image))
--                 item.nodes.btnHero = obj.transform:GetComponent(typeof(Button))
--                 self:addEventHandler(
--                     item.nodes.btnHero.onClick,
--                     function()
--                         if isOpened and callBack then
--                             callBack({id, index})
--                         end
--                     end
--                 )
--                 table.insert(listHeroItems, item)
--             end

--             item.nodes.nodeLock:SetActive(not isOpened)
--             if idHero and idHero > 0 then
--                 item.nodes.img_Icon.gameObject:SetActive(true)
--                 EquipManager:setHeroIcon(self, item.nodes.img_Icon, idHero)
--             else
--                 item.nodes.img_Icon.gameObject:SetActive(false)
--             end
--         end
--     )
-- end

function M:setPrescenceUI(id, callBack)
    self.id = id
    self.callBack = callBack

    self.listHeroItems = {}
    self.roomData = ShipMgr:getRoomDataById(id)

    for i = 1, self.roomData.configRoom.defend_max do
        local child = self.transform:Find(string.format("Image_Hero%d", i))
        self:setHeroUI(i, child.gameObject)
    end
end

function M:setHeroUI(index, obj)
    local cHeros = self.roomData:getHeros()
    local idHero = cHeros[index]
    local item = {}
    item =
        table.findOne(
        self.listHeroItems,
        function(i)
            return i.index == index
        end
    )
    local isOpened = index <= self.roomData.numOpen
    if not item then
        item = {}
        item.index = index
        item.nodes = {}
        item.nodes.nodeLock = obj.transform:Find("Image_Lock").gameObject
        item.nodes.img_Icon = obj.transform:Find("Image_HeroIcon"):GetComponent(typeof(Image))
        item.nodes.img_Bg = obj.transform:Find("Image_Bg"):GetComponent(typeof(Image))

        item.nodes.btnHero = obj.transform:GetComponent(typeof(Button))
        self:addEventHandler(
            item.nodes.btnHero.onClick,
            function()
                if isOpened and self.callBack then
                    self.callBack({self.id, index})
                end
            end
        )
        table.insert(self.listHeroItems, item)
    end

    item.nodes.nodeLock:SetActive(not isOpened)
    if idHero and idHero > 0 then
        item.nodes.img_Icon.gameObject:SetActive(true)
        item.nodes.img_Bg.gameObject:SetActive(true)
        EquipManager:setHeroIcon(self, item.nodes.img_Icon, idHero)
        ShipManager:setHeroBg(self, item.nodes.img_Bg, idHero)
    else
        item.nodes.img_Icon.gameObject:SetActive(false)
        item.nodes.img_Bg.gameObject:SetActive(false)
    end
end
