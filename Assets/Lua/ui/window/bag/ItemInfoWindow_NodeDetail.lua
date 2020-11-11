---@class ItemInfoWindow_NodeDetail
---@field itemData Bag_ItemData
local ItemInfoWindow_NodeDetail = DClass("ItemInfoWindow_NodeDetail", BaseComponent)
_G.ItemInfoWindow_NodeDetail = ItemInfoWindow_NodeDetail

function ItemInfoWindow_NodeDetail:ctor(data)
end

function ItemInfoWindow_NodeDetail:onInit()
end

---@param data Bag_ItemData
---@param cpnParent table
function ItemInfoWindow_NodeDetail:init(data, cpnParent)
    self:initUI()

    self:updateData(data, cpnParent)
end

function ItemInfoWindow_NodeDetail:initUI()
    self.txt_DesTitle = self.transform:Find("Text_D"):GetComponent(typeof(Text))
    self.txt_Des = self.transform:Find("Text_D/Text_Des"):GetComponent(typeof(Text))
    self.btn_Get = self.transform:Find("Button_Get"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btn_Get.onClick,
        function()
            self:onClickGet()
        end
    )
    self.btn_Use = self.transform:Find("Button_Use"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btn_Use.onClick,
        function()
            self:onClickUse()
        end
    )
    self.btn_Detail = self.transform:Find("Button_Detail"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btn_Detail.onClick,
        function()
            self:onClickDetail()
        end
    )
end

---@param data Bag_ItemData
---@param cpnParent table
function ItemInfoWindow_NodeDetail:updateData(data, cpnParent)
    ---@type Bag_ItemData
    self.itemData = data
    self.cpnParent = cpnParent

    self:onUpdateUI()
end

function ItemInfoWindow_NodeDetail:onUpdateUI()
    self.txt_DesTitle.text = self.itemData.config.des
    self.txt_Des.text = tostring(self.itemData.config.bg_des)

    local config = BagManager.getItemConfigDataById(self.itemData.cId)

    Log("ItemInfoWindow_NodeDetail:onUpdateUI ------ " .. self.itemData.cId .. "  ***   " .. config.type3)
    self.itemType = config.type3

    self.btn_Detail.gameObject:SetActive(config.type1 == 2)
    self.btn_Use.gameObject:SetActive(config.type1 == 2)
end

function ItemInfoWindow_NodeDetail:onClickGet()
    Log("切换到获取界面.....")
    self.cpnParent:setNodeState(ItemInfoWindow.NodeState.Get)
end

function ItemInfoWindow_NodeDetail:onClickUse()
    Log("切换到使用界面.....")
    if self.itemType == 2 or self.itemType == 3 then
        self.cpnParent:setNodeState(ItemInfoWindow.NodeState.Use)
    elseif self.itemType == 1 then
        UIManager.openWindow("ItemBoxUseWindow", nil, self.itemData)
    end
end

function ItemInfoWindow_NodeDetail:onClickDetail()
    Log("切换到详情界面.....")
    UIManager.openWindow("ItemBoxDetialWindow", nil, self.itemData)
end
