---@class ShipPopup_Item
local M = DClass("ShipPopup_Item", BaseComponent)
_G.ShipPopup_Item = M

function M:Awake()
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:onInit()
end

function M:onInit()
    self:addEventHandler(self.nodes.button_Use.onClick, self.onUseClick)
end

function M:onUseClick()
    Log("点击使用" .. self.curSelect)
end

function M:onUpdateUI()
    local listShow = BagMgr:getItemsByType(1)
    local isNone = false
    if not listShow then
        isNone = true
    else
        if #listShow <= 0 then
            isNone = true
        end
    end

    self.nodes.nodeNoItem.gameObject:SetActive(isNone)
    if not isNone then
        self.curSelect = listShow[1].cId
        BagManager.setItemIcon(self, self.nodes.image_Icon, ItemType.PhyPower)
        self:setItemUI(listShow)
    end
end

function M:setItemUI(list)
    self.listItems = {}

    self.nodes.content:InitPool(
        #list,
        function(index, obj)
            local data = list[index]
            local cpt = self:createComponent(obj.gameObject, Bag_ItemCom, 1)
            local item = cpt:initItem(obj, data, 1)
            item.com:updateUI(data)
            local btn = obj:GetComponent(typeof(Button))

            self:addEventHandler(
                btn.onClick,
                function()
                    local cId = data.cId
                    self:setSelectItemUI(cId)
                end
            )

            local itemObj = {}
            itemObj.cId = data.cId
            itemObj.select = item.com.gameObjectSelect
            table.insert(self.listItems, itemObj)

            if data.cId == self.curSelect then
                self:setSelectItemUI(data.cId)
            end
        end
    )
end

function M:setSelectItemUI(cId)
    local cfg = BagManager.getItemConfigDataById(cId)
    self.nodes.text_Count.text = cfg.resolve_item[1].count
    self.curSelect = cId
    for key, value in pairs(self.listItems) do
        value.select.gameObject:SetActive(value.cId == self.curSelect)
    end
end
