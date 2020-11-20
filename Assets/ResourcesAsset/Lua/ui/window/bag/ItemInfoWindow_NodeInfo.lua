---@class ItemInfoWindow_NodeInfo
---@field itemData Bag_ItemData
local ItemInfoWindow_NodeInfo = DClass("ItemInfoWindow_NodeInfo",BaseComponent)
_G.ItemInfoWindow_NodeInfo = ItemInfoWindow_NodeInfo

function ItemInfoWindow_NodeInfo:ctor()
end

function ItemInfoWindow_NodeInfo:onInit()
    
end

function ItemInfoWindow_NodeInfo:init(itemData, cpnParent)
    self.txtName = self.transform:Find("Text_Name"):GetComponent(typeof(Text))
    self.txtName.text = itemData.config.name
end
