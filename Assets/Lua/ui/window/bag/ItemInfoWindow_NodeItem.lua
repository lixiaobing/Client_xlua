---@class ItemInfoWindow_NodeItem
---@field itemData Bag_ItemData
local ItemInfoWindow_NodeItem = DClass("ItemInfoWindow_NodeItem", BaseComponent)
_G.ItemInfoWindow_NodeItem = ItemInfoWindow_NodeItem

function ItemInfoWindow_NodeItem:ctor(data)
    self.messager = Messager.new(self)
end

function ItemInfoWindow_NodeItem:onInit()
end

function ItemInfoWindow_NodeItem:onDispose()
    self.messager:dispose()
end

function ItemInfoWindow_NodeItem:onAddListener()
    self.messager:addListener(Msg.BAG_UPDATE_ITEMDATA, self.onUpdateItemData)
    self.messager:addListener(Msg.BAG_UPDATE_ONEITEM, self.onUpdateItemData)
end

---@param data BagMgr_BagItemInfo
function ItemInfoWindow_NodeItem:onUpdateItemData(data)
    local curNum = 0
    if data then
        if data.cId ~= self.itemData.cId then
            return
        end
        curNum = data.num
    else
        local findData = BagMgr:getMinItemDataByCId(self.itemData.cId)
        if findData then
            curNum = findData.num
        end
    end
    if curNum <= 0 then
        UIManager.closeWindow("ItemInfoWindow")
        UIManager.closeWindow("ItemBoxUseWindow")
        return nil
    end
    self.itemData.num = curNum
    self:updateCount()
end

---@param data Bag_ItemData
---@param cpnParent table
function ItemInfoWindow_NodeItem:init(data, cpnParent)
    self:initUI()
    self:onAddListener()
    self:onUpdateData(data, cpnParent)
end

function ItemInfoWindow_NodeItem:initUI()
    self.img_BgLine = self.transform:Find("Item/Image_BgLine"):GetComponent(typeof(Image))
    self.img_BgLine.gameObject:SetActive(false)
    self.img_Bg = self.transform:Find("Item/Image_Bg"):GetComponent(typeof(Image))
    self.img_Icon = self.transform:Find("Item/Image_Icon"):GetComponent(typeof(Image))
    self.nodeTag = self.transform:Find("Image_Tag")
    self.txt_tag = self.transform:Find("Image_Tag/Text_Tag"):GetComponent(typeof(Text))
    self.prefab_Star = self.transform:Find("Image_StarBG")
    self.parent_Star = self.transform:Find("Stars")
    self.txt_OwnCount = self.transform:Find("Image_Count/Text_Count"):GetComponent(typeof(Text))
    self.txt_Name = self.transform:Find("Item/Text_Name"):GetComponent(typeof(Text))

    self.listAllStars = {}
end

---@param data Bag_ItemData
---@param cpnParent table
function ItemInfoWindow_NodeItem:onUpdateData(data, cpnParent)
    ---@type Bag_ItemData
    self.itemData = data
    self.cpnParent = cpnParent

    self:onUpdateUI()
end

function ItemInfoWindow_NodeItem:onUpdateUI()
    self:updateIcon()
    self:updateStars()
    self:updateTag()
    self:updateCount()
end

---拥有数量
function ItemInfoWindow_NodeItem:updateCount()
    self.txt_OwnCount.text = tostring(self.itemData.num)
end

---设置背景和Icon
function ItemInfoWindow_NodeItem:updateIcon()
    self.txt_Name.text = self.itemData.config.name
    local pathQualityLine =
        string.format("%sGoods_Quality%02d", BagManager.pathItemQuality, self.itemData.config.item_bg)
    self:setSprite(self.img_BgLine, pathQualityLine)

    local pathQuality = string.format("%sQuality_Big%02d", BagManager.pathItemQuality, self.itemData.config.item_bg)
    self:setSprite(self.img_Bg, pathQuality)
    self:setSprite(self.img_Icon, BagManager.pathItemIcon .. self.itemData.config.item_icon)
end

---显示星级
function ItemInfoWindow_NodeItem:updateStars()
    for key, value in pairs(self.listAllStars) do
        value.gameObject:SetActive(false)
    end

    for i = 1, self.itemData.config.star_max do
        local starShow = self:getStarObj(i)
        local star = starShow.transform:Find("Image_Star")
        star.gameObject:SetActive(self.itemData.config.star >= i)
    end
end

--获取可服用的星星
function ItemInfoWindow_NodeItem:getStarObj(index)
    if index > #self.listAllStars then
        local star = GameObject.Instantiate(self.prefab_Star, self.parent_Star.transform)
        star.transform.localScale = Vector2(1, 1)
        star.gameObject:SetActive(true)
        table.insert(self.listAllStars, star.gameObject)
        return star.gameObject
    else
        for key, value in pairs(self.listAllStars) do
            if not value.gameObject.activeSelf then
                value.gameObject:SetActive(true)
                return value.gameObject
            end
        end
    end
end

---设置标记
function ItemInfoWindow_NodeItem:updateTag()
    if self.itemData.config.ItemTag then
        self.nodeTag.gameObject:SetActive(true)
        self.txt_tag.text = self.itemData.config.item_tag
    else
        self.nodeTag.gameObject:SetActive(false)
    end
end
