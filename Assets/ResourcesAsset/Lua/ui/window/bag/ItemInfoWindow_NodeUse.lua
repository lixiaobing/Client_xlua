---@class ItemInfoWindow_NodeUse
---@field itemData Bag_ItemData
local ItemInfoWindow_NodeUse = DClass("ItemInfoWindow_NodeUse", BaseComponent)
_G.ItemInfoWindow_NodeUse = ItemInfoWindow_NodeUse

function ItemInfoWindow_NodeUse:ctor(data)
end

function ItemInfoWindow_NodeUse:onInit()
end

---@param data Bag_ItemData
---@param cpnParent table
function ItemInfoWindow_NodeUse:init(data, cpnParent)
    self:initUI()

    self:UpdateData(data, cpnParent)
end

function ItemInfoWindow_NodeUse:initUI()
    self.txt_OwnCount = self.transform:Find("Text_Sure"):GetComponent(typeof(Text))

    local nodeControl = self.transform:Find("Image_Control")
    self.txt_CurCount = nodeControl:Find("Text_CurCount"):GetComponent(typeof(Text))
    local btn = nodeControl:Find("Button_Min"):GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickMin()
        end
    )
    btn = nodeControl:Find("Button_Max"):GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickMax()
        end
    )
    btn = nodeControl:Find("Button_Add"):GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickAdd()
        end
    )
    btn = nodeControl:Find("Button_Lost"):GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickLost()
        end
    )
    btn = self.transform:Find("Button_Sure"):GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickSure()
        end
    )
    btn = self.transform:Find("Button_Detail"):GetComponent(typeof(Button))
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickDetail()
        end
    )
end

---@param data Bag_ItemData
---@param cpnParent table
function ItemInfoWindow_NodeUse:UpdateData(data, cpnParent)
    ---@type Bag_ItemData
    self.itemData = data
    self.cpnParent = cpnParent
    self.countControl = 1
    self:onUpdateUI()
end

function ItemInfoWindow_NodeUse:onUpdateUI()
    self.txt_OwnCount.text =
        Lang(GL_BUTTON_USE_SURE) .. tostring(self.countControl) .. Lang(GL_TEXT_COUNT) .. self.itemData.config.name .. "？"
    -- "确认使用" .. tostring(self.countControl) .. "个" .. self.itemData.config.Name .. "？"
    self.txt_CurCount.text = tostring(self.countControl)
end

function ItemInfoWindow_NodeUse:onClickMin()
    self.countControl = 1
    self:onUpdateUI()
end

function ItemInfoWindow_NodeUse:onClickMax()
    self.countControl = self.itemData.num
    self:onUpdateUI()
end

function ItemInfoWindow_NodeUse:onClickAdd()
    if self.countControl + 1 > self.itemData.num then
        return nil
    end
    self.countControl = self.countControl + 1
    self:onUpdateUI()
end

function ItemInfoWindow_NodeUse:onClickLost()
    if self.countControl <= 1 then
        return nil
    end
    self.countControl = self.countControl - 1
    self:onUpdateUI()
end

function ItemInfoWindow_NodeUse:onClickSure()
    if self.itemData.num < self.countControl then
        MsgCenter.sendMessage(Msg.HINT_COMMON, Lang(GL_TIP_ITEMNUM_NOTENOUGH))
        return nil
    end

    ---@type BagMgr_BagItemInfo
    local data = {}
    data.bId = self.itemData.bId
    data.gId = self.itemData.gId
    data.cId = self.itemData.cId
    data.num = self.countControl

    BagMgr:sendUseItem(data,function() 
        
    end)
end


function ItemInfoWindow_NodeUse:onClickDetail()
    self.cpnParent:setNodeState(ItemInfoWindow.NodeState.Detial)
end
