---@class ItemBoxDetialWindow
local ItemBoxDetialWindow = DClass("ItemBoxDetialWindow", BaseWindow)
_G.ItemBoxDetialWindow = ItemBoxDetialWindow

function ItemBoxDetialWindow:ctor(data)
    ---@type Bag_ItemData
    self.itemData = data[1]
end

function ItemBoxDetialWindow:onInit()
    self.coverCallBack = self.close

    self.txt_Des = self.nodes.txt_Des 

    local btn = self.nodes.btnSure 
    self:addEventHandler(
        btn.onClick,
        function()
            self:onClickSure()
        end
    )

    self.listAllItems = {}
    self.content = self.nodes.content 

    self:onUpdateUI()
end

function ItemBoxDetialWindow:onCloseWindow()
    UIManager.closeWindow("ItemBoxDetialWindow")
end

function ItemBoxDetialWindow:onUpdateUI()
    self:onSetView()
end

function ItemBoxDetialWindow:onSetView()
    Log(self.itemData)
    local listDrop = BagManager.getDropItemsByCId(self.itemData.cId)

    self.listShow = {}
    self.content:InitPool(
        #listDrop,
        function(index, obj)
            local value =listDrop[index]

            local img_Icon = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local img_Bg = obj.transform:GetComponent(typeof(Image))
            local btn_self = obj.transform:GetComponent(typeof(Button))

            local config = BagManager.getItemConfigDataById(value)
            if config ~= nil then
                local pathIcon = config.item_icon
                local pathQuality = string.format("%sQuality_Big%02d", BagManager.pathItemQuality, config.item_bg)

                self:setSprite(img_Bg, pathQuality)
                self:setSprite(img_Icon, BagManager.pathItemIcon .. pathIcon)
            end

            local item = {}
            item.id = value
            item.obj = obj

            self:addEventHandler(
                btn_self.onClick,
                function()
                    Log(string.format("查看选中道具信息；id : %d", item.id))
                    MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, item.id)
                end
            )
            table.insert(self.listShow, item)
        end
    )
end

function ItemBoxDetialWindow:onClickSure()
    Log("确认使用道具.....")
    UIManager.closeWindow("ItemBoxDetialWindow")
end
