---@class ItemBoxUseWindow
local ItemBoxUseWindow = DClass("ItemBoxUseWindow", BaseWindow)
_G.ItemBoxUseWindow = ItemBoxUseWindow

function ItemBoxUseWindow:ctor(data)
    ---@type Bag_ItemData
    self.itemData = data[1]
end

function ItemBoxUseWindow:onInit()
    self.coverCallBack = self.close

    local nodeTitle = self.transform:Find("Image_BG/NodeTitle")
    self.txt_Name = self.nodes.txt_Name 
    self.txt_Des = self.nodes.txt_Des 
    self.txt_CountShow = self.nodes.txt_CountShow 

    local nodeControl = self.transform:Find("Image_BG/NodeControl/Image_Control")
    self.txt_CurCount = self.nodes.txt_CurCount 
    local btn = self.nodes.btnMin 
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickMin()
        end
    )
    btn = self.nodes.btnMax 
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickMax()
        end
    )
    btn = self.nodes.btnAdd 
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickAdd()
        end
    )
    btn = self.nodes.btnLost 
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickLost()
        end
    )
    btn = self.nodes.btnSure 
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickSure()
        end
    )

    self:onUpdateUI()
end

function ItemBoxUseWindow:onCloseWindow()
    UIManager.closeWindow("ItemBoxUseWindow")
end

function ItemBoxUseWindow:onUpdateUI()
    self.countControl = 1
    self.itemConfig = BagManager.getItemConfigDataById(self.itemData.cId)
    self:onSetView()
    self:onSetTitle()
    self:onSetControl()
end

function ItemBoxUseWindow:onSetTitle()
    self.txt_Name.text = self.itemConfig.name

    self.txt_CountShow.text = "1/" .. tostring(#BagManager.getDropItemsByCId(self.itemConfig.id))
end

function ItemBoxUseWindow:onSetView()
    local list = BagManager.getDropItemsByCId(self.itemConfig.id)
    self.listShow = {}
    self.nodes.content:InitPool(
        #list,
        function(index, obj)
            local value = list[index]
            local gainObj = obj
            local config = Config.Item[value]
            local count = 1
            local img_Bg = gainObj.transform:Find("Image_Bg"):GetComponent(typeof(Image))
            local image_Icon = gainObj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local txt_Count = gainObj.transform:Find("Text_Count"):GetComponent(typeof(Text))
            local txt_Name = gainObj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local img_Select = gainObj.transform:Find("Image_Select")

            local pathIcon = config.item_icon

            local pathQuality = string.format("%sQuality_Big%02d", BagManager.pathItemQuality, config.item_bg)

            self:setSprite(img_Bg, pathQuality)
            self:setSprite(image_Icon, BagManager.pathItemIcon .. pathIcon)
            txt_Count.transform.gameObject:SetActive(false)
            txt_Count.text = "×" .. tostring(count)
            txt_Name.text = config.name

            local gainItem = {}
            gainItem.obj = gainObj
            gainItem.select = img_Select
            gainItem.count = count
            gainItem.configCount = 1
            gainItem.id = value
            gainItem.txtCount = txt_Count

            local btn_Obj = gainObj:GetComponent(typeof(Button))
            self:addEventHandler(
                btn_Obj.onClick,
                function()
                    self:onSelectOne(gainItem)
                end
            )

            if index == 1 then
                self.selectItemId = value
            end
            img_Select.gameObject:SetActive(index == 1)
            table.insert(self.listShow, gainItem)
        end
    )
end

function ItemBoxUseWindow:onSelectOne(item)
    self.selectItemId = item.id
    for key, value in pairs(self.listShow) do
        value.select.gameObject:SetActive(value.id == item.id)
    end
end

function ItemBoxUseWindow:onSetControl()
    self.txt_CurCount.text = tostring(self.countControl)
    for index, value in ipairs(self.listShow) do
        value.count = value.configCount * self.countControl
        value.txtCount.text = tostring(value.count)
    end
end

function ItemBoxUseWindow:onClickMin()
    self.countControl = 1
    self:onSetControl()
end

function ItemBoxUseWindow:onClickMax()
    self.countControl = self.itemData.num
    self:onSetControl()
end

function ItemBoxUseWindow:onClickAdd()
    if self.countControl + 1 > self.itemData.num then
        return nil
    end
    self.countControl = self.countControl + 1
    self:onSetControl()
end

function ItemBoxUseWindow:onClickLost()
    if self.countControl <= 1 then
        return nil
    end
    self.countControl = self.countControl - 1
    self:onSetControl()
end

function ItemBoxUseWindow:onClickSure()
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
    BagMgr:sendUseItem(
        data,
        function()
        end
    )
end
