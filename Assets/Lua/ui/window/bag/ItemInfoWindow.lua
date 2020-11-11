---@class ItemInfoWindow
---@field itemData Bag_ItemData
local ItemInfoWindow = DClass("ItemInfoWindow", BaseWindow)
_G.ItemInfoWindow = ItemInfoWindow

function ItemInfoWindow:ctor(data)
    ---@type Bag_ItemData
    self.itemData = data[1]
end

function ItemInfoWindow:onInit()
    self.coverCallBack = self.close

    local objNodes = self.transform:Find("Image_BG")
    self.CpnItem = self:createComponent(objNodes:Find("NodeItem").gameObject, ItemInfoWindow_NodeItem)
    self.CpnItem:init(self.itemData, self)
    self.CpnSpecial = self:createComponent(objNodes:Find("NodeSpecial").gameObject, ItemInfoWindow_NodeSpecial)
    self.CpnSpecial:init(self.itemData, self)
    self.CpnDetail = self:createComponent(objNodes:Find("NodeDetail").gameObject, ItemInfoWindow_NodeDetail)
    self.CpnDetail:init(self.itemData, self)
    self.CpnGet = self:createComponent(objNodes:Find("NodeGet").gameObject, ItemInfoWindow_NodeGet)
    self.CpnUse = self:createComponent(objNodes:Find("NodeUse").gameObject, ItemInfoWindow_NodeUse)

    self:initUI()
end

function ItemInfoWindow:initUI()
    self:setNodeState(ItemInfoWindow.NodeState.Detial)
end

function ItemInfoWindow:onCloseWindow()
    UIManager.closeWindow("ItemInfoWindow")
end

local NodeState = {
    Detial  = 1,    --详情
    Get     = 2,    --跳转
    Use     = 3     --使用
}

ItemInfoWindow.NodeState = NodeState

---@param stateNode ItemInfoWindow.NodeState
function ItemInfoWindow:setNodeState(stateNode)
    if stateNode == NodeState.Detial then
        self.nodes.groupDetail.gameObject:SetActive(true)
        self.nodes.groupGet.gameObject:SetActive(false)
        self.nodes.groupUse.gameObject:SetActive(false)
        self.CpnDetail:init(self.itemData, self)
    elseif stateNode == NodeState.Get then
        self.nodes.groupDetail.gameObject:SetActive(false)
        self.nodes.groupGet.gameObject:SetActive(true)
        self.nodes.groupUse.gameObject:SetActive(false)
        self.CpnGet:init(self.itemData, self)
    elseif stateNode == NodeState.Use then
        self.nodes.groupDetail.gameObject:SetActive(false)
        self.nodes.groupGet.gameObject:SetActive(false)
        self.nodes.groupUse.gameObject:SetActive(true)
        self.CpnUse:init(self.itemData, self)
    end
end
