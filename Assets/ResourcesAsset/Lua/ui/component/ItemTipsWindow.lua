---@class ItemTipsWindow
local ItemTipsWindow = DClass("ItemTipsWindow", BaseWindow)
_G.ItemTipsWindow = ItemTipsWindow

function ItemTipsWindow:ctor(data)
    self.messager = Messager.new(self)
end

function ItemTipsWindow:onAddListener()
    self.messager:addListener(Msg.BAG_INIT_ITEMTIPS, self.initItemDatas)
    self.coverCallBack = function()
        if self.callback then
            self.callback()
        end
        self:close()
        MsgCenter.sendMessage(Msg.ITEMTIPS, nil)
    end
end

function ItemTipsWindow:initItemDatas(data)
    ---@type table<BagMgr_RewardsMsg>
    self.itemDatas = data[1]
    self.typeShow = data[2]
    self.callback = data[3] --窗口关闭回调

    self:onUpdateUI()
end

function ItemTipsWindow:onDispose()
    self.messager:dispose()
end

function ItemTipsWindow:onInit()
    self:onAddListener()

    self.txt_Des = self.nodes.txt_Des

    self.tipLeft = self.nodes.tipLeft
    self.tipRight = self.nodes.tipRight

    self.content = self.nodes.contentRect
end

function ItemTipsWindow:onClose()
    self.tipLeft.gameObject:SetActive(false)
    self.tipRight.gameObject:SetActive(false)
end

function ItemTipsWindow:onCloseWindow()
    self:close()
end

function ItemTipsWindow:onUpdateUI()
    self:onSetView()
    self:initDes()
end

function ItemTipsWindow:initDes()
    self.nodes.bgDecompose:SetActive(false)
    self.nodes.bgGet:SetActive(false)
    if self.typeShow == 0 then
        self.txt_Des.text = Lang(GL_TIP_AUTO_RESOLVE) --"以下道具已经失效,将自动分解"
        self.nodes.bgDecompose:SetActive(true)
    elseif self.typeShow == 1 then
        self.txt_Des.text = Lang(GL_TIP_CONGRATULATION_OBTAIN) --"恭喜获得"
        self.nodes.bgGet:SetActive(true)
    end
end

function ItemTipsWindow:onSetView()
    self:onInitScrollList()
end

function ItemTipsWindow:onInitScrollList()
    self.listShow = {}
    
    self.nodes.content:InitPool(
        #self.itemDatas,
        function(index, obj)
            ---@type BagMgr_RewardsMsg
            local value = self.itemDatas[index]

            --兼容服务器名称
            value.cId = value.cId or value.id

            local gainObj = obj
            local config = BagManager.getItemConfigDataById(value.cId)
            local count = value.num
            local btn_Item = gainObj.transform:GetComponent(typeof(Button))
            local img_Bg = gainObj.transform:GetComponent(typeof(Image))
            local image_Icon = gainObj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local txt_Count = gainObj.transform:Find("Text_Count"):GetComponent(typeof(Text))
            local image_Tag = gainObj.transform:Find("Image_Tag")
            local txt_Tag = image_Tag.transform:Find("Text_Tag"):GetComponent(typeof(Text))

            image_Tag.gameObject:SetActive(self.typeShow == 0)

            local pathQuality = string.format("%sQuality_Big%02d", BagManager.pathItemQuality, config.item_bg)
            self:setSprite(img_Bg, pathQuality)
            local pathIcon = config.item_icon

            self:setSprite(image_Icon, BagManager.pathItemIcon .. pathIcon)

            txt_Count.text = "×" .. tostring(count)
            local gainItem = {}
            gainItem.obj = gainObj
            gainItem.count = count
            gainItem.id = value.cId

            self:addEventHandler(
                btn_Item.onClick,
                function()
                    MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, gainItem.id)
                end
            )
            table.insert(self.listShow, gainItem)
        end
    )
end
