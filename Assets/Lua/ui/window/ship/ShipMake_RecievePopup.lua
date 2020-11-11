---@class ShipMake_RecievePopup 显示产物 弹框
---@field listProducts table<ShipMgr_Products>
local M = DClass("ShipMake_RecievePopup", BaseWindow)
_G.ShipMake_RecievePopup = M

function M:ctor(...)
    local data = ...
    self.listProducts = data[1]

end

function M:onInit()
    self.coverCallBack = self.close
    self:onInitUI()
end

function M:onInitUI()
    if not self.listProducts then
        self:close()
        return
    end

    self:handleShowProducts()

    self.nodes.text_High.text = string.format("·高级 %d", self.rates[3])
    self.nodes.text_Middle.text = string.format("·中级 %d", self.rates[2])
    self.nodes.text_Low.text = string.format("·低级 %d", self.rates[1])

    local listShowItems = {}
    local listShow = self.listShow
    self.nodes.content:InitPool(
        #listShow,
        function(index, obj)
            ---@type ShipMgr_Products
            local data = listShow[index]
            local idItem = data.id
            local numItem = data.num

            local item =
                table.findOne(
                listShowItems,
                function(d)
                    return d.id == data.id
                end
            )
            if not item then
                item = {}
                item.id = data.id
                item.num = data.num
                item.nodes = {}
                item.nodes.imgIcon = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
                item.nodes.imgQuality = obj.transform:Find("Image_Quality"):GetComponent(typeof(Image))
                item.nodes.textCount = obj.transform:Find("Text_Count"):GetComponent(typeof(Text))
                item.nodes.btn = obj.transform:GetComponent(typeof(Button))
                self:addEventHandler(
                    item.nodes.btn.onClick,
                    function()
                        MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, data.id)
                    end
                )
                table.insert(listShowItems, item)
            end

            local cfg = Config.Item[data.id]
            BagManager.setItemIcon(self, item.nodes.imgIcon, data.id)
            EquipManager:setQuility(self, item.nodes.imgQuality, cfg.star, EquipManager.STAGE_TYPE.BG_CUBE)
            item.nodes.textCount.text = data.num
        end
    )
end

function M:handleShowProducts()
    self.rates = {}
    self.listShow = {}
    for type = 1, 3 do --设置不同类型比例
        self.rates[type] = 0
    end
    
    if self.listProducts then
        for key, value in pairs(self.listProducts) do
            self.rates[value.grade] = value.num

            for k, v in pairs(value.product) do --归总道具信息
                local dataContains =
                    table.findOne(
                    self.listShow,
                    function(a)
                        return a.id == v.id
                    end
                )
                if dataContains then
                    dataContains.num = dataContains.num + v.num
                else
                    table.insert(self.listShow, v)
                end
            end
        end
        return {}
    end
end
