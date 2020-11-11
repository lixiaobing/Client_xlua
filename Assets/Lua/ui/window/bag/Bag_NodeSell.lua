---@class Bag_NodeSell
local Bag_NodeSell = DClass("Bag_NodeSell", BaseComponent)
_G.Bag_NodeSell = Bag_NodeSell

function Bag_NodeSell:initData(window)
    self.mainWindow = window
end

function Bag_NodeSell:onAsset()
    --准备预加载的资源/窗口销毁后统一释放
    self.assetKeys = {
        "UI/Component/Bag/Bag_SellGain"
    }

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.prefabTap = obj
        end
    end
end

function Bag_NodeSell:ctor()
    self.messager = Messager.new(self)
    self.suitId = 0
end
function Bag_NodeSell:onStart()
    self:onInit()
    self:onAddListener()
end

function Bag_NodeSell:onInit()
    self:initNodeUI()
end

function Bag_NodeSell:onAddListener()
    self.messager:addListener(Msg.BAG_UPDATE_SELLNODE, self.onUpdateSellNode)
    self.messager:addListener(Msg.BAG_UPDATE_SELLCONTENT, self.setSellResolveUI)
    self.messager:addListener(Msg.BAG_UPDATE_ONEITEM, self.onUpdateOneItem)
    self.messager:addListener(Msg.BAG_UPDATE_OPENTAPID, self.onUpdateOpenTapId)
end

---@param _tap number 当前页签
function Bag_NodeSell:onUpdateOpenTapId(_tap)
    self.curOpenTapId = _tap
end

---刷新分解出售界面
---@param data Bag_ItemData
function Bag_NodeSell:onUpdateSellNode(data)
    ---@type Bag_ItemData
    self.curSelectItem = data
    self:initCountData(data.num, 1)
    self:updateSellCountUI()
    self:initGainView()
end

function Bag_NodeSell:onDispose()
    self.messager:dispose()
end

function Bag_NodeSell:initNodeUI()
    local nodeSellBg = self.transform:Find("Image_Bg")
    local nodeControlNum = nodeSellBg:Find("Image_Control/Image_Control")
    self.txtTitle = nodeSellBg:Find("Image_Show/Image_Title/Text_Title"):GetComponent(typeof(Text))
    self.txtCountShow = nodeSellBg:Find("Image_Control/Image_Title/Text_CountShow"):GetComponent(typeof(Text))
    self.txtCountLeft = nodeSellBg:Find("Image_Control/Text_LeftCount"):GetComponent(typeof(Text))
    self.txtCurSellCount = nodeControlNum:Find("Text_CurCount"):GetComponent(typeof(Text))

    local btnMin = nodeControlNum:Find("Button_Min"):GetComponent(typeof(Button))
    self:addEventHandler(
        btnMin.onClick,
        function()
            self.countSell = 1
            self:updateSellCountUI()
        end
    )
    local btnMax = nodeControlNum:Find("Button_Max"):GetComponent(typeof(Button))
    self:addEventHandler(
        btnMax.onClick,
        function()
            self.countSell = self.ownItemCount
            self:updateSellCountUI()
        end
    )
    local btnLost = nodeControlNum:Find("Button_Lost"):GetComponent(typeof(Button))
    self:addEventHandler(
        btnLost.onClick,
        function()
            if self.countSell > 1 then
                self.countSell = self.countSell - 1
                self:updateSellCountUI()
            end
        end
    )
    local btnAdd = nodeControlNum:Find("Button_Add"):GetComponent(typeof(Button))
    self:addEventHandler(
        btnAdd.onClick,
        function()
            if self.countSell < self.ownItemCount then
                self.countSell = self.countSell + 1
                self:updateSellCountUI()
            end
        end
    )

    local btnCannel = nodeSellBg:Find("Image_Control/Button_Cannel"):GetComponent(typeof(Button))
    self:addEventHandler(
        btnCannel.onClick,
        function()
            MsgCenter.sendMessage(Msg.BAG_UPDATE_MOVENODES, false)
        end
    )
    self.btnSell = nodeSellBg:Find("Image_Control/Button_Sell"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btnSell.onClick,
        function()
            self:onClick2Sell()
        end
    )
    self.btnResolve = nodeSellBg:Find("Image_Control/Button_Resolve"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btnResolve.onClick,
        function()
            self:onClick2Resolve()
        end
    )
    self.transform.gameObject:SetActive(false)

    self.listAllGains = {}
    self.listGains = {}
    self.gainContent =
        nodeSellBg:Find("Image_Show/GetView/Viewport/ContentV"):GetComponent(typeof(ScrollPoolHorizontal))
end

--点击出售道具
function Bag_NodeSell:onClick2Sell()
    Log("点击出售道具" .. tostring(self.ownItemCount))

    if self.ownItemCount <= 0 then
        MsgCenter.sendMessage(Msg.HINT_COMMON, Lang(GL_TIP_ITEMNUM_NOTENOUGH))
        return nil
    end
    --self:onSellItems(true)
    local data = {}
    data.title = Lang(GL_ITEM_SELL)
    data.content = Lang(GL_BUTTON_SURE) .. Lang(GL_ITEM_SELL)
    data.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
    data.buttonTypes = {1, 2}
    data.callback = function(sort)
        if sort == 1 then
            self:onSellItems(true)
        end
    end

    MsgCenter.sendMessage(Msg.NOTIFY, data)
end

---点击分解道具
function Bag_NodeSell:onClick2Resolve()
    Log("点击分解道具")
    if self.ownItemCount <= 0 then
        MsgCenter.sendMessage(Msg.HINT_COMMON, Lang(GL_TIP_ITEMNUM_NOTENOUGH))
        return nil
    end
    --self:onSellItems(false)

    local data = {}
    data.title = Lang(GL_ITEM_RESOLVE)
    data.content = Lang(GL_BUTTON_SURE) .. Lang(GL_ITEM_RESOLVE)
    data.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
    data.buttonTypes = {1, 2}
    data.callback = function(sort)
        if sort == 1 then
            self:onSellItems(false)
        end
    end
    MsgCenter.sendMessage(Msg.NOTIFY, data)
end

---发送出售分解消息
function Bag_NodeSell:onSellItems(isSell)
    if isSell then
        Log("确认出售弹框")
    else
        Log("确认分解弹框")
    end
    ---@type Bag_ItemData
    self.itemSelect = self.mainWindow:getSelectItem()
    local listGet = self:getItemSellList()
    ---@type BagMgr_BagItemInfo
    local itemSell = {}
    itemSell.bId = self.itemSelect.bId
    itemSell.gId = self.itemSelect.gId
    itemSell.cId = self.itemSelect.cId
    itemSell.num = self.countSell
    Log(dumpTable(itemSell, "发送要分解的道具信息："))
    BagMgr:sendTransformItem(
        itemSell,
        function()
        end
    )
end

---刷新单个道具
function Bag_NodeSell:onUpdateOneItem(data)
    local _bagId = self.curOpenTapId
    local _bId = -1
    if not self.itemSelect then
        _bId = data.bId
    else
        _bId = self.itemSelect.bId
    end
    local _count = BagMgr:getOwnBagItemCount(_bagId, _bId)
    if _count <= 0 then
        MsgCenter.sendMessage(Msg.BAG_UPDATE_MOVENODES, false)
        return nil
    end
    self:initCountData(_count, 1)
    self:updateSellCountUI()
end

function Bag_NodeSell:initCountData(ownCount, counSell)
    if ownCount < counSell then
        counSell = 1
    end
    self.ownItemCount = ownCount
    self.countSell = counSell
end

--刷新当前控制数量UI
function Bag_NodeSell:updateSellCountUI()
    --"剩余 "  1000011
    self.txtCountLeft.text = Lang(GL_TEXT_LEFT) .. tostring(self.ownItemCount - self.countSell)
    self.txtCurSellCount.text = tostring(self.countSell)

    if self.listGainsShow then
        for key, value in pairs(self.listGainsShow) do
            local gainCount = value.configCount * self.countSell
            value.txtCount.text = "×" .. tostring(gainCount)
        end
    end
end

---初始化出售功能分页
function Bag_NodeSell:setSellResolveUI(showSell, isEquip)
    self.isEquip = isEquip --是否是质点
    if showSell then
        self.txtTitle.text = Lang(GL_ITEM_SELL_GAIN) --"出售获得"
        self.txtCountShow.text = Lang(GL_ITEM_SELL_NUM) --"出售数量"
    else
        self.txtTitle.text = Lang(GL_ITEM_RESOLVE_GAIN) --"分解获得"
        self.txtCountShow.text = Lang(GL_ITEM_RESOLVE_NUM) --"分解数量"
    end
    self.btnSell.gameObject:SetActive(showSell)
    self.btnResolve.gameObject:SetActive(not showSell)
end

---初始化出售获得列表UI
function Bag_NodeSell:initGainView()
    local selectData = self.mainWindow:getSelectItem()
    local id = selectData.cId

    local config = BagManager.getItemConfigDataById(id)
    if config == nil then
        Log("Bag_NodeSell:initGainView()----" .. id)
    end
    local strGains = {}
    strGains = clone(config.resolve_item)

    if BagMgr:checkIsEquipByCid(id) then
        ---@type EquipMgr_EquipData
        local equipData = EquipMgr:getEquipDataByGid(selectData.gId)
        if equipData then
            local equipResolve = Config.EquipLevel[equipData.quality * 100 + equipData.lv]
            if equipResolve.resolve_item then
                for k, v in pairs(equipResolve.resolve_item) do
                    table.insert(strGains, v)
                end
            end
        else
            MsgCenter.sendMessage(Msg.BAG_UPDATE_MOVENODES,false)
        end

    end

    if strGains ~= nil and #strGains > 0 then
        self.listGainsShow = {}
        self.gainContent:InitPool(
            #strGains,
            function(index, obj)
                local value = strGains[index]
                local gainObj = obj
                local btn_Gain = gainObj.transform:GetComponent(typeof(Button))
                local img_bg = gainObj.transform:Find("Item/Item_Bg"):GetComponent(typeof(Image))
                local image_Icon = gainObj.transform:Find("Item/Item_Icon"):GetComponent(typeof(Image))
                local text_Name = gainObj.transform:Find("Label_Count"):GetComponent(typeof(Text))
                local id_gain = value.id
                local count_gain = value.count

                local gainConfig = BagManager.getItemConfigDataById(value.id)

                if gainConfig ~= nil then
                    local pathIcon = gainConfig.item_icon

                    gainObj.gameObject.name = gainConfig.name
                    gainObj.gameObject:SetActive(true)

                    self:setSprite(
                        img_bg,
                        string.format("%sQuality_Samll%02d", BagManager.pathItemQuality, gainConfig.item_bg)
                    )
                    self:setSprite(image_Icon, string.format("%s%s", BagManager.pathItemIcon, pathIcon))
                else
                    gainObj.gameObject:SetActive(false)
                end

                text_Name.text = "×" .. count_gain
                local gainItem = {}
                gainItem.id = id_gain
                gainItem.obj = gainObj
                gainItem.configCount = count_gain
                gainItem.txtCount = text_Name

                self:addEventHandler(
                    btn_Gain.onClick,
                    function()
                        MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, id_gain)
                    end
                )
                table.insert(self.listGainsShow, gainItem)
            end
        )
    end
end

function Bag_NodeSell:getItemSellList()
    local list = {}
    for key, value in pairs(self.listGainsShow) do
        ---@type BagMgr_RewardsMsg
        local itemGet = {}
        itemGet.cId = value.id
        itemGet.num = value.configCount * self.countSell
        table.insert(list, itemGet)
    end
    return list
end
