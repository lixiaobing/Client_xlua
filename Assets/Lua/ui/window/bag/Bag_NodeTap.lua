---@class Bag_NodeTap
local Bag_NodeTap = DClass("Bag_NodeTap", BaseComponent)
_G.Bag_NodeTap = Bag_NodeTap

function Bag_NodeTap:onAsset()
    --准备预加载的资源/窗口销毁后统一释放
    self.assetKeys = {
        "UI/Component/TapShow"
    }

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.prefabTap = obj
        end
    end
end

function Bag_NodeTap:ctor()
    self.messager = Messager.new(self)
    self.suitId = 0
end

function Bag_NodeTap:onStart()
    self:onAddListener()
    self:onInit()
end

function Bag_NodeTap:onInit()
    self:initNodeUI()
    self:onAddListener()
end

function Bag_NodeTap:onAddListener()
    self.messager:addListener(Msg.BAG_UPDATE_CLOSESELLBTN, self.onCloseTapSellBtns)
    self.messager:addListener(Msg.BAG_UPDATE_ITEMDATA, self.updateSuitId)
end

function Bag_NodeTap:updateSuitId(suitId)
    self.suitId = suitId
    local txtSuitName = self.btnEquip.transform:Find("Text"):GetComponent(typeof(Text))
    txtSuitName.text = suitId == 0 and "全部" or Config.EquipSuit[suitId].suit
end

function Bag_NodeTap:onDispose()
    self.messager:dispose()
end

function Bag_NodeTap:initNodeUI()
    self.btnOpenSell = self.transform:Find("Button_Sell"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btnOpenSell.onClick,
        function()
            self:onClickOpenSell()
        end
    )
    self.btnOpenResolve = self.transform:Find("Button_Resolve"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btnOpenResolve.onClick,
        function()
            self:onClickOpenResolve()
        end
    )
    self.btnEquip = self.transform:Find("Button_Equip"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btnEquip.onClick,
        function()
            UIManager.openWindow("EquipSuitInBagWindow")
        end
    )
    self.suitId = 0
    self.items = {}
    self.listView = self.transform.parent:Find("TapView/Viewport/ContentV"):GetComponent(typeof(ScrollPoolVertical))
    self:initList()
    self:updateSuitId(0)
end

---根据配置初始化页签列表
function Bag_NodeTap:initList()
    self.openTapID = 1
    MsgCenter.sendMessage(Msg.BAG_UPDATE_OPENTAPID, self.openTapID)
    local showBagList = table.values(Config.BagList)
    local configBagList = {}
    for index, value in ipairs(showBagList) do
        if value.bag_type == 1 then
            table.insert(configBagList, value)
        end
    end
    table.sort(
        configBagList,
        function(a, b)
            return a.id < b.id
        end
    )

    self.listView:InitPool(
        #configBagList,
        function(index, obj)
            local value = configBagList[index]
            local config = Config.BagList[value.id]
            local content = obj.transform:Find("Background")
            local gameObjectSelect = content:Find("Checkmark")
            local text_nameDisable = content:Find("Label"):GetComponent(typeof(Text))
            local text_nameEnable = gameObjectSelect.transform:Find("Labelmark"):GetComponent(typeof(Text))
            local btnObj = obj.transform:GetComponent(typeof(Button))

            text_nameDisable.text = config.name
            text_nameEnable.text = config.name

            local item = {}
            item.id = value.id
            item.obj = obj
            item.content = content
            item.gameObjectSelect = gameObjectSelect

            item.gameObjectSelect.gameObject:SetActive(self.openTapID == value.id)
            self:addEventHandler(
                btnObj.onClick,
                function()
                    self:onClickItem(item)
                end
            )
            table.insert(self.items, item)
        end
    )

    self:onTapChange()
end

--刷新页签
function Bag_NodeTap:onClickItem(item)
    self:setTapState(item.id)
    item.gameObjectSelect.gameObject:SetActive(true)
end

---设置页签状态
---@param isTap boolean 是否是页签切换
function Bag_NodeTap:setTapState(tapId)
    for k, v in pairs(self.items) do
        v.gameObjectSelect.gameObject:SetActive(false)
    end

    if self.openTapID ~= tapId then
        self.openTapID = tapId

        MsgCenter.sendMessage(Msg.BAG_UPDATE_OPENTAPID, self.openTapID)
        MsgCenter.sendMessage(Msg.BAG_UPDATE_MOVENODES, false)
        self:onTapChange()
    end
end

--页签变化 刷新
function Bag_NodeTap:onTapChange()
    local config = Config.BagList[self.openTapID]
    self.maxBagCount = config.num_limit

    self.ownCount = #BagMgr:getItemsByBagid(self.openTapID, self.suitId)

    if config.sell_des == 0 then
        self.btnOpenSell.gameObject:SetActive(false)
        self.btnOpenResolve.gameObject:SetActive(self:checkHasSelectableItem())
    else
        self.btnOpenSell.gameObject:SetActive(self:checkHasSelectableItem())
        self.btnOpenResolve.gameObject:SetActive(false)
    end
    if self.ownCount <= 0 then
        self:onCloseTapSellBtns()
    end
    self.btnEquip.gameObject:SetActive(config.type2 == 1)
    MsgCenter.sendMessage(Msg.BAG_UPDATE_SORTLIST, config)
    MsgCenter.sendMessage(Msg.BAG_UPDATE_CHOICEUSABLEITEM, true)
end

function Bag_NodeTap:onCloseTapSellBtns()
    self.btnOpenSell.gameObject:SetActive(false)
    self.btnOpenResolve.gameObject:SetActive(false)
end

---点击切换到出售功能
function Bag_NodeTap:onClickOpenSell()
    if not self:checkHasSelectableItem() then
        MsgCenter.sendMessage(Msg.HINT_COMMON, "没有符合条件的道具")
        return nil
    end
    MsgCenter.sendMessage(Msg.BAG_UPDATE_MOVENODES, true)
    MsgCenter.sendMessage(Msg.BAG_UPDATE_SELLCONTENT, true, BagMgr:checkIsEquip(self.openTapID))
end

---点击切换到分解功能
function Bag_NodeTap:onClickOpenResolve()
    if not self:checkHasSelectableItem() then
        MsgCenter.sendMessage(Msg.HINT_COMMON, "没有符合条件的道具")
        return nil
    end
    MsgCenter.sendMessage(Msg.BAG_UPDATE_MOVENODES, true)
    MsgCenter.sendMessage(Msg.BAG_UPDATE_SELLCONTENT, false, BagMgr:checkIsEquip(self.openTapID))
end

function Bag_NodeTap:checkHasSelectableItem()
    if BagMgr:checkIsEquip(self.openTapID) then
        return true
    end
    local list = BagMgr:getItemsByBagid(self.openTapID, self.suitId)
    for index, value in ipairs(list) do
        local config = BagManager.getItemConfigDataById(value.cId)
        if config.is_resolve then
            return true
        end
    end
    return false
end
