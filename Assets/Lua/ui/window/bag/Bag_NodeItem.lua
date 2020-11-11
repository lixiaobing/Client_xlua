---@class Bag_NodeItem
local Bag_NodeItem = DClass("Bag_NodeItem", BaseComponent)
_G.Bag_NodeItem = Bag_NodeItem

function Bag_NodeItem:ctor()
    self.messager = Messager.new(self)
    self.suitId = 0
    self.listItems = {}
end

function Bag_NodeItem:onAddListener()
    self.messager:addListener(Msg.BAG_UPDATE_ITEMDATA, self.onUpdateItemData)
    self.messager:addListener(Msg.EQUIP_UPDATE_EQUIPDATAS, self.initItems)
    self.messager:addListener(Msg.BAG_UPDATE_SORTLIST, self.initSortList)
    self.messager:addListener(Msg.BAG_UPDATE_CHOICEUSABLEITEM, self.choiceUsableItem)
    self.messager:addListener(Msg.BAG_UPDATE_ONEITEM, self.onUpdateOneItem)
    self.messager:addListener(Msg.BAG_UPDATE_OPENTAPID, self.onUpdateOpenTapId)
    self.messager:addListener(Msg.BAG_UPDATE_ITEMOWNCOUNT, self.updateItemOwnText)
end

function Bag_NodeItem:onDispose()
    self.messager:dispose()
    self.listItems = nil
end

function Bag_NodeItem:onAsset()
    --准备预加载的资源/窗口销毁后统一释放
    self.assetKeys = {
        "UI/Component/Bag/Bag_SortBtn",
        "UI/Component/Bag/Bag_Cell"
    }

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.prefabSort = obj
        elseif index == 2 then
            self.prefabCell = obj
        end
    end
end

function Bag_NodeItem:initData(mainWindow)
    self.MainWindow = mainWindow
end

function Bag_NodeItem:onStart()
    --self:initNode()
    --self:onAddListener()
end

function Bag_NodeItem:onInitUI()
    self:initNode()
    self:onAddListener()
end

function Bag_NodeItem:onInit()
    --self:onInitUI()
end

---@param _tap number 当前页签
function Bag_NodeItem:onUpdateOpenTapId(_tap)
    self.curOpenTapId = _tap
end

---@param data BagMgr_BagItemInfo
function Bag_NodeItem:onUpdateOneItem(data)
    local config = BagManager.getItemConfigDataById(data.cId)
    if config.bag_id ~= self.curOpenTapId then
        return
    end
    for index, value in ipairs(self.listItems) do
        if value.bId == data.bId then
            value.com:updateUI(data)
        end
    end
end

function Bag_NodeItem:onUpdateItemData(suitId)
    if suitId and suitId >= 0 then
        Log("显示套装中的质点 suitId:" .. suitId)
        self.suitId = suitId
    end
    self:initItems()
end

function Bag_NodeItem:onDispose()
    self.messager:dispose()
end

function Bag_NodeItem:initNode()
    self.nodeNone = self.transform:Find("NodeNone")
    self.txtOwnTitle = self.transform:Find("Text_OwnTitle")
    self.txtOwnCount = self.txtOwnTitle:Find("Text_OwnCount"):GetComponent(typeof(Text))
    self.txtTotleCount = self.txtOwnTitle:Find("Text_TotleCount"):GetComponent(typeof(Text))

    self.nodeSort = self.transform:Find("Image_Sort")
    self.btnSort = self.nodeSort:Find("Button_Sort"):GetComponent(typeof(Button))
    self.txt_Sort = self.btnSort.transform:Find("Text"):GetComponent(typeof(Text))
    self:addEventHandler(
        self.btnSort.onClick,
        function()
            self:onSetSortView(not self.sortParent.gameObject.activeSelf)
        end
    )
    self:addEventHandler(
        self.MainWindow.nodes.btnCloseSort.onClick,
        function()
            self:onSetSortView(not self.sortParent.gameObject.activeSelf)
        end
    )

    self.listSortTypes = {}
    self.sortParent = self.nodeSort.transform:Find("SortView")
    self.sortView = self.nodeSort.transform:Find("SortView/Viewport/ContentV"):GetComponent(typeof(ScrollPoolVertical))

    self:onSetSortView(false)

    self.listItemObjs = {}
    ---@type table<Bag_ItemData>
    self.listItems = {}
    self.itemContent = self.transform:Find("ItemView/Viewport/Content"):GetComponent(typeof(ScrollPoolGrid))

    self.curSortType = 0
    self:onAddListener()
end

--管理排序弹框
function Bag_NodeItem:onSetSortView(open)
    self.sortParent.gameObject:SetActive(open)
    self.MainWindow.nodes.btnCloseSort.gameObject:SetActive(open)
end

---@class SortData
---@field type number
---@field name string

--- 根据配置文件初始化排序列表UI
function Bag_NodeItem:initSortList(config)
    self:onSetSortView(false)
    local sortTypes = Utils.splitString(config.sort_type, ",")
    self.curSortType = 0
    self.listSortTypes = {}
    self.sortView:InitPool(
        #sortTypes,
        function(index, obj)
            local type = tonumber(sortTypes[index])
            local prefab = obj

            local typeName = ItemSortName[type]
            local gameObjectSelect = obj.transform:Find("Image_Select")
            local text_Name = obj.transform:Find("Text"):GetComponent(typeof(Text))
            local btn = obj.transform:GetComponent(typeof(Button))
            text_Name.text = typeName

            gameObjectSelect.gameObject:SetActive(false)

            local item = {}
            item.type = type
            item.obj = obj
            item.gameObjectSelect = gameObjectSelect
            item.typeName = typeName
            self:addEventHandler(
                btn.onClick,
                function()
                    self:onClickSortItem(item)
                end
            )
            if index == 1 then --选中
                item.gameObjectSelect.gameObject:SetActive(true)
                self.curSortType = item.type
            end
            table.insert(self.listSortTypes, item)
        end
    )

    self:onSortChange()
    --刷新排序
end

---点击排序功能
function Bag_NodeItem:onClickSortItem(item)
    for k, v in pairs(self.listSortTypes) do
        v.gameObjectSelect.gameObject:SetActive(false)
    end
    item.gameObjectSelect.gameObject:SetActive(true)

    if self.curSortType ~= item.type then
        self.curSortType = item.type
        self:onSortChange()
    end
end

---顺序发生改变
function Bag_NodeItem:onSortChange()
    self:onSetSortView(false)
    self:initItems()
    self:choiceUsableItem(self.MainWindow:getShowUIState())
end

---刷新当前排序名字
function Bag_NodeItem:onUpdateSortName()
    local typeName = ItemSortName[self.curSortType]
    self.txt_Sort.text = typeName
end

---重新设置所有道具信息
function Bag_NodeItem:initItems()
    local curOpenId = self.curOpenTapId
    ---@type table<BagMgr_BagItemInfo>
    local listMsg = BagMgr:getItemsByBagid(curOpenId, self.suitId)
    listMsg = BagMgr:checkItemTimeOut(listMsg)
    if BagMgr:checkIsEquip(curOpenId) then
        self.ownCount = #listMsg
    else
        self.ownCount = self:getItemTypeCount(listMsg)
    end

    ---@type table<BagMgr_BagItemInfo>
    local listItemsData = listMsg

    listItemsData = self:getShowTapList(listItemsData)

    self:updateItemOwnText()

    table.sort(
        listItemsData,
        function(a, b)
            if curOpenId == 6 then
                if self.curSortType == ItemSortType.DEFAULT then
                    return a.cId > b.cId
                elseif self.curSortType == ItemSortType.QUALITY then
                    return a.quality > b.quality
                end
            else
                local config_a = BagManager.getItemConfigDataById(a.cId)
                local config_b = BagManager.getItemConfigDataById(b.cId)
                if self.curSortType == ItemSortType.DEFAULT then
                    return a.cId < b.cId
                elseif self.curSortType == ItemSortType.RAITY then
                    return config_a.star > config_b.star
                elseif self.curSortType == ItemSortType.TIME then
                    return a.outTime < b.outTime
                elseif self.curSortType == ItemSortType.QUALITY then
                    return config_a.quality > config_b.quality
                end
            end
        end
    )

    self:onUpdateSortName()
    for key, value in pairs(self.listItems) do
        value.com:onClear()
    end
    self.listItems = {}
    self.itemContent:InitPool(
        #listItemsData,
        function(index, obj)
            local objOnly = obj
            local oId = obj:GetInstanceID()

            ---@type Bag_ItemData
            local item = {}
            --     table.findOne(
            --     self.listItems,
            --     function(p)
            --         return p.oId == oId
            --     end
            -- )
            ---@type BagMgr_BagItemInfo
            local value = listItemsData[index]

            -- if not item then
            local item_Cpt = self:createComponent(obj, Bag_ItemCom) --Bag_ItemCom.new():initItem(obj, value, curOpenId)
            item = item_Cpt:initItem(obj, value, curOpenId)
            item.oId = oId
            -- end
            item.com:updateUI(value, curOpenId)

            -- table.removeOne(
            --     self.listItems,
            --     function(p)
            --         return p.oId == oId
            --     end
            -- )
            table.insert(self.listItems, item)

            local btn = obj:GetComponent(typeof(Button))
            self:addEventHandler(
                btn.onClick,
                function()
                    self:onSelectItem(item)
                end
            )
        end
    )
    self.itemContent:OnInitFinish(
        function()
            self:choiceUsableItem(self.MainWindow:getShowUIState())
        end
    )

    self.itemContent.transform.localPosition = Vector2(40, 0)
end

---获取列表中道具的种类个数
function Bag_NodeItem:getItemTypeCount(list)
    local count = 0
    local idLoop = -1
    for index, value in ipairs(list) do
        if value.cId ~= idLoop then
            count = count + 1
            idLoop = value.cId
        end
    end
    return count
end

---根据页签过滤显示道具list
function Bag_NodeItem:getShowTapList(list)
    local nList = {}
    local idTap = self.curOpenTapId
    for key, value in pairs(list) do
        table.insert(nList, value)
    end
    return nList
end

---选中道具
---@param item Bag_ItemData
function Bag_NodeItem:onSelectItem(item)
    local isEquip = BagMgr:checkIsEquip(self.curOpenTapId)
    if self.MainWindow:getShowUIState() then -- 点选道具 弹出详细信息
        self.curSelectItem = item
        if isEquip then
            local equipData = EquipMgr:getEquipDataByGid(item.gId)

            UIManager.openWindow("EquipGrowWindow", nil, {equipData}) --打开装备培养界面
        else
            self:onOpenItemInfoWindow(item)
        end
    else
        if isEquip then
            local dataEquip = EquipMgr:getEquipDataByGid(item.gId)
            if dataEquip.heroId > 0 then
                return nil
            end
        else
            if not item.config.is_resolve then
                return nil
            end
        end

        self.curSelectItem = item
        for key, value in pairs(self.listItems) do
            value.com:onClickSelf(item)
        end
        --刷新出售信息
        self:setSellItemData()
    end
end

---打开道具详细信息 itemData Bag_ItemCom
---@param itemData Bag_ItemData
function Bag_NodeItem:onOpenItemInfoWindow(itemData)
    ---@type Bag_ItemData
    local data = {}
    data.gId = itemData.gId
    data.bId = itemData.bId
    data.cId = itemData.cId
    data.num = itemData.num
    data.config = itemData.config
    data.outTime = itemData.outTime
    data.state = itemData.state
    UIManager.openWindow("ItemInfoWindow", nil, data)
end

--刷新当前页签的道具数量
function Bag_NodeItem:updateItemOwnText()
    local config = Config.BagList[self.curOpenTapId]

    self.maxBagCount = config.num_limit

    self.txtTotleCount.text = string.format("<size=36>%s</size>/%d", tostring(self.ownCount), self.maxBagCount)
    if self.ownCount == 0 then
        self.nodeNone.gameObject:SetActive(true)
        self.txtOwnTitle.gameObject:SetActive(false)
        self.nodeSort.gameObject:SetActive(false)
    else
        self.nodeNone.gameObject:SetActive(false)
        self.txtOwnTitle.gameObject:SetActive(self.suitId <= 0)
        self.nodeSort.gameObject:SetActive(true)
    end
    return self.ownCount
end

---根据需求选中默认道具
function Bag_NodeItem:choiceUsableItem(selectNone)
    if selectNone then
        self.curSelectItem = nil

        for k, v in pairs(self.listItems) do
            v.com:onClickSelf(nil)
            v.com:onSelectDefault(false)
        end
        return nil
    end
    local isSelected = false
    for key, value in pairs(self.listItems) do
        if BagMgr:checkIsEquipByCid(value.cId) then
            local equipData = EquipMgr:getEquipDataByGid(value.gId)
            if not isSelected and equipData.heroId <= 0 then
                value.com:onClickSelf(value)
                self.curSelectItem = value
                isSelected = true
            end
        else
            if not isSelected and value.config.is_resolve then
                value.com:onClickSelf(value)
                self.curSelectItem = value
                isSelected = true
            end
        end
        -- if not isSelected and value.config.is_resolve then
        --     value.com:onClickSelf(value)
        --     self.curSelectItem = value
        --     isSelected = true
        -- end
        value.com:onSelectDefault(true)
    end
    self:setSellItemData()
end

--根据选中的道具信息 初始化出售UI
function Bag_NodeItem:setSellItemData()
    if self.curSelectItem then
        MsgCenter.sendMessage(Msg.BAG_UPDATE_SELLNODE, self.curSelectItem)
    else
        MsgCenter.sendMessage(Msg.HINT_COMMON, "没有符合条件的道具")
    end
end
