---@class ShipMake_DetailPopup
local M = DClass("ShipMake_DetailPopup", BaseWindow)
_G.ShipMake_DetailPopup = M

function M:ctor(...)
    local data = ...
    self.idRoom = data[1]
    self.cfgRoom = Config.ShipBuilding[self.idRoom]
    self.dataRoom = ShipMgr:getRoomDataById(self.idRoom)
end

function M:onInit()
    self.coverCallBack = self.close
    self:addEventHandler(self.nodes.button_Close.onClick, self.close)

    self:onInitTimeMaxUI()
    self:onInitDropUI()
end

function M:onInitTimeMaxUI()
    local day, hour, min, sec, mil = TimeUtils.format(self.cfgRoom.time, true)
    self.nodes.text_Time.text = string.format("%s:%s", min, sec)
    self.nodes.text_Count.text = self.cfgRoom.max_num
end

function M:onInitDropUI()
    self:setDropsUI(self.nodes.image_High, 3)
    self:setDropsUI(self.nodes.image_Middle, 2)
    self:setDropsUI(self.nodes.image_Low, 1)
end

function M:setDropsUI(node, type)
    local listDrop = self.cfgRoom.drop_list
    local rate = 0
    local textT = node.transform:Find("Text_Odds"):GetComponent(typeof(Text))
    local str = ""
    if type == 1 then
        str = "低级"
        rate =
            1 -
            (self.dataRoom.attrs[ShipMgr.Ship_Attr.MIDDLE_LEVEL_PROBABILITY] / 100 +
                self.dataRoom.attrs[ShipMgr.Ship_Attr.HIGH_LEVEL_PROBABILITY] / 100)
    elseif type == 2 then
        str = "中级"
        rate = self.dataRoom.attrs[ShipMgr.Ship_Attr.MIDDLE_LEVEL_PROBABILITY] / 100
    elseif type == 3 then
        str = "高级"
        rate = self.dataRoom.attrs[ShipMgr.Ship_Attr.HIGH_LEVEL_PROBABILITY] / 100
    end

    local idDrop = listDrop[type]
    str = string.format("%s  %d", str, math.modf(rate * 100)) .. "%"
    textT.text = str

    local dropView = node.transform:Find("ScrollView").gameObject
    local listCellItems = {}
    for i = 1, 6 do
        local itemCell = node.transform:Find("Image_ItemCell" .. i).gameObject
        table.insert(listCellItems, itemCell)
    end
    local listDropDatas = BagManager.getDropItemsByDropId(idDrop)
    local isShowSix = #listDropDatas <= 6
    self:setDropExceedSix(dropView, listDropDatas, not isShowSix)
    self:setDropSix(listCellItems, listDropDatas, isShowSix)
end

function M:setDropSix(listItems, list, show)
    for key, value in pairs(listItems) do
        value:SetActive(false)
    end
    if not show then
        return
    end
    for index, value in ipairs(list) do
        local item = listItems[index]
        item:SetActive(true)
        self:setOneDropUI(item, value)
    end
end

function M:setDropExceedSix(nodeView, list, show)
    if not show then
        nodeView.gameObject:SetActive(false)
        return
    end

    local pool = nodeView.transform:Find("Content"):GetComponent(typeof(ScrollPoolHorizontal))
    pool:InitPool(
        #list,
        function(index, obj)
            self:setOneDropUI(obj, list[index])
        end
    )
end

function M:setOneDropUI(item, id)
    local imgIcon = item.transform:Find("Image_Icon"):GetComponent(typeof(Image))
    local imgQuality = item.transform:Find("Image_Quality"):GetComponent(typeof(Image))
    local nodeStar = item.transform:Find("Stars")
    local cfgItem = BagManager.getItemConfigDataById(id)
    BagManager.setItemIcon(self, imgIcon, id)
    local cQuality = cfgItem.star
    EquipManager:setQuility(self, imgQuality, cQuality, EquipManager.STAGE_TYPE.BG_CUBE)

    for i = 1, 6 do
        local objStar = nodeStar:Find("Star_" .. i)
        objStar.gameObject:SetActive(i <= cQuality)
    end

    local btn = item:GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, id)
        end
    )
end
