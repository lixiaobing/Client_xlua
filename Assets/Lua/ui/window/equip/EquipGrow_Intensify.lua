---@class EquipGrow_Intensify 强化 非满级
---@field curEquipData EquipMgr_EquipData 当前质点信息
---@field curCostGold number 当前消耗金币数量
---@field isMaxLv boolean 已经达到最高级

local EquipGrow_Intensify = DClass("EquipGrow_Intensify", BaseComponent)
_G.EquipGrow_Intensify = EquipGrow_Intensify

function EquipGrow_Intensify:ctor()
    self.messager = Messager.new(self)
    self.listItem = {}
    --self.listSelectingItem = {}
end

function EquipGrow_Intensify:addListener()
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.onUpdateData)
    self.messager:addListener(Msg.EQUIP_UPDATE_EQUIPDATAS, self.updateShowListUI)
end

function EquipGrow_Intensify:onDispose()
    self.messager:dispose()
end

function EquipGrow_Intensify:onStart()
    self:addListener()
    self:onInit()
end

function EquipGrow_Intensify:onInit()
    --self.listSelectingItem = {}
    self:addEventHandler(self.nodes.btnOnceAll.onClick, self.onOnceAll)
    self:addEventHandler(self.nodes.btnIntensify.onClick, self.onClickIntensify)

    self:addEventHandler(self.nodes.btnEquipTab.onClick, self.onClickEquipTab)
    self:addEventHandler(self.nodes.btnItemTab.onClick, self.onClickItemTab)
    self:addEventHandler(self.nodes.btnSort.onClick, self.onClickSort)

    --self:onInitUI()
end

function EquipGrow_Intensify:onInitUI()
    self.nodes.sortNode:SetActive(false)
    self.isShowEquip = false
    self:onTabChanged(true)
end

---@param data EquipMgr_EquipData
function EquipGrow_Intensify:onUpdateData(data, updateUI)
    self.curEquipData = data

    if updateUI then
        local configEquipGroup = Config.EquipStage[self.curEquipData.quality]
        local isMaxLv = self.curEquipData.lv >= configEquipGroup.maxlevel
        if isMaxLv then
            MsgCenter.sendMessage(Msg.EQUIPGROW_CHANGE_NODESTATE, EquipGrowWindow.NODE_STATE.BREAK)
        else
            self:onUpdateUI()
        end
    end
end

function EquipGrow_Intensify:onUpdateUI()
    self:updateConfigs()

    self:setQuilityUI()

    self:setLvExpUI()

    self:setEquipBaseUI(0)
end

function EquipGrow_Intensify:updateConfigs()
    self.configEquip = Config.Equip[self.curEquipData.cId]
    self.configEquipGroup = Config.EquipStage[self.curEquipData.quality]
    self.configSuit = Config.EquipSuit[self.configEquip.type3]
    local keyAttr = self.configEquip.star * 10 + self.configEquip.item_position
    self.configAttr = Config.EquipAttr[keyAttr]
    local keyLv = self.curEquipData.quality * 100 + self.curEquipData.lv
    self.configLv = Config.EquipLevel[keyLv]
end

function EquipGrow_Intensify:setLvExpUI()
    self.isMaxLv = self.configLv.exp == -1
    if self.isMaxLv then
        MsgCenter.sendMessage(Msg.EQUIPGROW_CHANGE_NodesState, EquipGrowWindow.NODE_STATE.BREAK)
        return
    end

    self.preLv = self.curEquipData.lv
    self.preExp = self.curEquipData.exp

    self.nodes.txtCurLv.text = self.curEquipData.lv
    self.nodes.txtMaxLv.text = string.format("/%d", self.configEquipGroup.maxlevel)
    self.nodes.txtExp.text = self.isMaxLv and "Max" or string.format("%d/%d", self.curEquipData.exp, self.configLv.exp)
    self.nodes.imgCurExp.gameObject:SetActive(true)
    self.nodes.imgCurExp.fillAmount = self.curEquipData.exp / self.configLv.exp
    self.nodes.imgAddExp.fillAmount = 0
    self:setIntensifyCost(0)
end

function EquipGrow_Intensify:setQuilityUI()
    EquipManager:setQuility(self, self.nodes.imgStage, self.curEquipData.quality, EquipManager.STAGE_TYPE.ICON)
end

function EquipGrow_Intensify:setEquipBaseUI(addLv, isPre)
    local listAttr = self.configAttr.show_attr

    local funcAttr = function(index, obj)
        local data =
            EquipManager:getEquipAttr(self.configAttr, listAttr[index], self.curEquipData.quality, self.curEquipData.lv)
        local txtName = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
        local txtAdd = obj.transform:Find("Text_AddNum"):GetComponent(typeof(Text))
        local txtNum = txtAdd.transform:Find("Text_CurNum"):GetComponent(typeof(Text))
        txtName.text = data.name
        txtNum.text = data.num
        local ndata =
            EquipManager:getEquipAttr(
            self.configAttr,
            listAttr[index],
            self.curEquipData.quality,
            self.curEquipData.lv + addLv
        )
        txtAdd.text = string.format(isPre and "<color=yellow>(+%d)</color>" or "(+%d)", ndata.addNumLv - data.addNumLv)
    end

    funcAttr(1, self.nodes.attrShow1)
    funcAttr(2, self.nodes.attrShow2)
end

---一键填充
function EquipGrow_Intensify:onOnceAll()
    if self.isShowEquip then
        self:addOnceAllEquips()
    else
        self:addOnceAllItems()
    end
end

function EquipGrow_Intensify:addOnceAllItems()
    --local list = table.deepclone(self.listItem)
    for key, value in pairs(self.listShowItems) do
        value.num = 0
        local item =
            table.findOne(
            self.listItem,
            function(o)
                return o.cId == value.itemData.cId
            end
        )
        if item then
            item.txtNum.text = value.num
        end
        self:updataItemAddExp()
    end
    table.sort(
        self.listShowItems,
        function(a, b)
            return a.itemData.cId < b.itemData.cId
        end
    )
    for key, value in pairs(self.listShowItems) do
        if self.isMaxLv then
            break
        end
        local ownCount = BagMgr:getItemDataByCId(value.itemData.cId).num
        local count = self:getAddItemMaxCount(value.itemData.addExp, ownCount)
        value.num = count
        local item =
            table.findOne(
            self.listItem,
            function(o)
                return o.cId == value.itemData.cId
            end
        )
        if item then
            item.txtNum.text = value.num
        end

        self:updataItemAddExp()
    end
end

function EquipGrow_Intensify:addOnceAllEquips()
    -- local listShow = EquipMgr:getEquipsExceptEquiped(EquipMgr:getAllEquipDatas())
    -- table.removeAll(
    --     listShow,
    --     function(e)
    --         local cfg = Config.Equip[e.cId]
    --         return e.locked or cfg.star >= EquipManager:getIntensifyOnceStar()
    --     end
    -- )
    -- table.sort(
    --     listShow,
    --     function(a, b)
    --         local configA = Config.Equip[a.cId]
    --         local configB = Config.Equip[b.cId]
    --         return configA.star < configB.star
    --     end
    -- )
    -- local preLv = self.curEquipData.lv
    -- local exp = self.curEquipData.exp
    -- local lvMax = Config.EquipStage[self.curEquipData.quality].maxlevel

    -- for index, value in ipairs(listShow) do
    --     if preLv >= lvMax then
    --         break
    --     else
    --         local selectData = EquipMgr:getEquipDataByGid(value.gId)
    --         local config = Config.Equip[selectData.cId]
    --         local configLv = Config.EquipLevel[selectData.quality * 100 + selectData.lv]
    --         local addExp = config.exp + configLv.exp_upgrade
    --         exp = exp + addExp
    --         local _exp, _lv, _isUp = self:onCheckPreExp(exp, preLv)
    --         if _isUp then
    --             preLv = _lv
    --             exp = _exp
    --         end
    --     end
    --     self:onSelectEquipExp(value.gId)
    -- end

    local listGid = self:getOnceAllEquips()
    -- for key, value in pairs(listGid) do
    --     self:onSelectEquipExp(value)
    -- end
    self:onSelectEquipExp()
end

---强化
function EquipGrow_Intensify:onClickIntensify()
    ---@type HERO_REQ_STRENGTHEN_EQUIP
    local data = {}
    data.equipId = self.curEquipData.gId
    data.consumeEquipIds = {}

    local listGid = self:getCurSelectedEquips()--使用装备强化
    for key, value in pairs(listGid) do
        table.insert(data.consumeEquipIds, value)
    end
    data.itemData = {}
    ---@type EquipMgr_ItemData
    local _iData = {}
    if self.listShowItems then---使用道具强化
        for key, value in pairs(self.listShowItems) do
            if value.num > 0 then
                _iData = {}
                _iData.itemId = value.itemData.cId
                _iData.itemNum = value.num
                table.insert(data.itemData, _iData)
            end
        end
    end

    -- _iData = {}
    -- _iData.itemId = 104005 --ItemType.GOLD
    -- _iData.itemNum = 1
    -- table.insert(data.itemData, _iData)

    if self.curCostGold > BagMgr:getGoldCount() then
        MsgCenter.sendMessage(Msg.HINT_COMMON, Lang(GL_EquipGrow_Intensify_JinBiBuZu))
        --"金币不足"
        return
    end
    EquipMgr:sendStrengthenEquip(data) --强化装备
end

---用质点强化
function EquipGrow_Intensify:onClickEquipTab()
    self:resetSelectItems()
    self:updataItemAddExp()
    self:onTabChanged(true)
end
---用道具强化
function EquipGrow_Intensify:onClickItemTab()
    self:resetSelectedEquips()
    self:updateEquipAddExp()
    self:onTabChanged(false)
end
---排序
function EquipGrow_Intensify:onClickSort()
    self:setSortView()
end

function EquipGrow_Intensify:onTabChanged(showEquip)
    if self.isShowEquip == showEquip then
        return
    end

    self.isShowEquip = showEquip

    local equipActive = self.nodes.btnEquipTab.transform:Find("Image").gameObject
    local itemActive = self.nodes.btnItemTab.transform:Find("Image").gameObject
    equipActive:SetActive(showEquip)
    itemActive:SetActive(not showEquip)

    self.nodes.equipsView.transform.parent.parent.gameObject:SetActive(showEquip)
    self.nodes.itemView.transform.parent.parent.gameObject:SetActive(not showEquip)
    if self.isShowEquip then
        self:onShowEquipsView()
    else
        self:onShowItemsView()
    end
end

function EquipGrow_Intensify:onShowEquipsView()
    self.listEquipItem = {}
    --self.listSelectingItem = {}
    local listShow = EquipMgr:getEquipsExceptEquiped(EquipMgr:getAllEquipDatas())

    self.listShowEquipDatas = {}
    ---@class EquipGrow_Intensify_DataSelectEquip
    ---@field isSelect boolean
    ---@field equipData EquipMgr_EquipData
    for k, v in pairs(listShow) do
        ---@type EquipGrow_Intensify_DataSelectEquip
        local d = {}
        d.equipData = v
        d.isSelect = false
        table.insert(self.listShowEquipDatas, d)
    end
    table.removeOne(
        self.listShowEquipDatas,
        function(data)
            if self.curEquipData then
                return self.curEquipData.gId == data.equipData.gId
            end
        end
    )
    table.sort(
        self.listShowEquipDatas,
        function(a, b)
            if self.curSortState == 2 then --等级
                return a.equipData.lv < b.equipData.lv
            else --星级级
                local configA = Config.Equip[a.equipData.cId]
                local configB = Config.Equip[b.equipData.cId]
                return configA.star < configB.star
            end
        end
    )

    self.nodes.equipsView:InitPool(
        #self.listShowEquipDatas,
        function(index, obj)
            ---@type EquipGrow_Intensify_DataSelectEquip
            local data = self.listShowEquipDatas[index]
            local imgSelect = obj.transform:Find("Image_Select").gameObject
            local btnSelf = obj:GetComponent(typeof(Button))

            imgSelect:SetActive(data.isSelect)
            -- for key, value in pairs(self.listSelectingItem) do
            --     if value.gId == data.equipData.gId then
            --         imgSelect:SetActive(true)
            --         break
            --     end
            -- end
            local cpt_Equip = self:createComponent(obj.gameObject, Equip_ItemCell)
            cpt_Equip:onUpdateUI(data.equipData)
            local item = {}
            item.gId = data.equipData.gId
            item.data = data.equipData
            item.select = imgSelect
            item.cpt = cpt_Equip

            self:addEventHandler(
                btnSelf.onClick,
                function()
                    local isLockStar, des = EquipManager:checkEquipLockOrStar(data.equipData)
                    if not item.isSelect and isLockStar ~= 0 then
                        local tData = {}
                        tData.title = ""
                        tData.content = string.format(Lang(GL_EquipGrow_Intensify_QueRenXiao), des)
                        --"确认消耗%s的装备吗？"
                        tData.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
                        tData.buttonTypes = {1, 2}
                        tData.callback = function(sort)
                            if sort == 1 then
                                self:updateShowEquipDatas(item, not data.isSelect)
                            end
                        end

                        MsgCenter.sendMessage(Msg.NOTIFY, tData)
                    else
                        self:updateShowEquipDatas(item, not data.isSelect)
                    end
                end
            )
            if data.equipData.gId then
                local contains = 0
                for key, value in pairs(self.listEquipItem) do
                    if value.gId == data.equipData.gId then
                        contains = contains + 1
                    end
                end
                if contains <= 0 then
                    table.insert(self.listEquipItem, item)
                end
            end
        end
    )
end

function EquipGrow_Intensify:updateShowEquipDatas(item, select)
    if select then
        if self.isMaxLv then
            Log("已经达到最大等级")
            return
        end
    else
    end
    item.select.gameObject:SetActive(select)
    for key, value in pairs(self.listShowEquipDatas) do
        if value.equipData.gId == item.gId then
            value.isSelect = select
        end
    end

    self:onSelectEquipExp(item.gId)
end

---选择消耗的装备
function EquipGrow_Intensify:onSelectEquipExp(gId)
    -- for key, value in pairs(self.listEquipItem) do
    --     if gId == value.gId then
    --         local indexRm = 0
    --         for index, v in ipairs(self.listSelectingItem) do
    --             if v.gId == value.gId then
    --                 indexRm = index
    --             end
    --         end
    --         if indexRm ~= 0 then
    --             table.remove(self.listSelectingItem, indexRm)
    --         else
    --             if self.isMaxLv then
    --                 Log("已经达到最大等级")
    --                 return
    --             end
    --             table.insert(self.listSelectingItem, value)
    --         end
    --         value.select.gameObject:SetActive(indexRm == 0)
    --         ---添加刷新 经验条---
    --         self:updateEquipAddExp()
    --     end
    -- end

    ---添加刷新 经验条---
    self:updateEquipAddExp()
end

---消耗装备添加的经验
function EquipGrow_Intensify:updateEquipAddExp()
    local _listSelectedEquip = self:getSelectedEquips()
    if not _listSelectedEquip or #_listSelectedEquip <= 0 then
        self:setLvExpUI()
        self:setEquipBaseUI(0, false)
        return
    end
    local addExp = 0
    local addCost = 0
    for key, value in pairs(_listSelectedEquip) do
        local selectData = EquipMgr:getEquipDataByGid(value.equipData.gId)
        local config = Config.Equip[selectData.cId]
        local configLv = Config.EquipLevel[value.equipData.quality * 100 + selectData.lv]
        addExp = addExp + config.exp + configLv.exp_upgrade
        addCost = addCost + config.gold
    end

    self:onShowPreData(addExp, addCost)
end

---查看预显示升级属性
function EquipGrow_Intensify:onShowPreData(addExp, addCost)
    local maxLv = self.configEquipGroup.maxlevel
    local totleExp = self.curEquipData.exp + addExp
    local curLv = self.curEquipData.lv

    local isUpable = false
    local leftExp, preLv, isUpgrade = self:onCheckPreExp(totleExp, curLv)
    isUpable = isUpgrade
    while preLv < maxLv and leftExp > 0 and isUpgrade do
        local _exp, _lv, _isUped = self:onCheckPreExp(leftExp, preLv)
        if _isUped then
            leftExp, preLv, isUpgrade = self:onCheckPreExp(leftExp, preLv)
        else
            isUpgrade = false
        end
    end

    local addLv = preLv - self.curEquipData.lv
    self:updateAddExpUI(leftExp, preLv, addLv > 0)
    self:setEquipBaseUI(addLv + 1, true)
    self:setIntensifyCost(addCost)
end

---刷新添加的经验
function EquipGrow_Intensify:updateAddExpUI(exp, lv, isUped)
    local configLv = Config.EquipLevel[self.curEquipData.quality * 100 + lv]
    local configStage = Config.EquipStage[self.curEquipData.quality]

    self.preLv = lv
    self.preExp = exp

    self.isMaxLv = configLv.exp == -1
    self.nodes.txtCurLv.text = string.format("<color=yellow>%d</color>", lv)
    self.nodes.txtMaxLv.text = string.format("/%d", configStage.maxlevel)
    self.nodes.txtExp.text =
        self.isMaxLv and "<color=yellow>Max</color>" or string.format("<color=yellow>%d</color>/%d", exp, configLv.exp)
    self.nodes.imgCurExp.gameObject:SetActive(not isUped)
    self.nodes.imgCurExp.fillAmount = self.curEquipData.exp / configLv.exp
    self.nodes.imgAddExp.fillAmount = exp / configLv.exp
end

---设置强化需要消耗的数量
function EquipGrow_Intensify:setIntensifyCost(cost)
    local txtCost = self.nodes.btnIntensify.transform:Find("Image/Text_Num"):GetComponent(typeof(Text))
    local imgIcon = self.nodes.btnIntensify.transform:Find("Image/Image_Icon"):GetComponent(typeof(Image))
    local ownGold = BagMgr:getGoldCount()
    txtCost.text =
        cost >= ownGold and string.format("<color=red>%d</color>", cost) or
        string.format("<color=white>%d</color>", cost)
    self.curCostGold = cost

    BagManager.setItemIcon(self, imgIcon, ItemType.GOLD)
end

---检测 预显示 使用exp升级后  lv为当前等级
function EquipGrow_Intensify:onCheckPreExp(exp, lv)
    local leftExp = exp
    local preLv = lv
    local isUpgrade = false

    ---当前经验满条
    local curTotleMaxExp = Config.EquipLevel[self.curEquipData.quality * 100 + preLv].exp

    local _leftExp = leftExp - curTotleMaxExp
    if leftExp > 0 and _leftExp >= 0 then
        leftExp = _leftExp

        preLv = preLv + 1
        isUpgrade = true
    else
        isUpgrade = false
    end

    return leftExp, preLv, isUpgrade
end

function EquipGrow_Intensify:updateShowListUI()
    self:onShowEquipsView()
    self:onShowItemsView()
end

function EquipGrow_Intensify:onShowItemsView()
    self.listItem = {}
    local _listShowItems = EquipManager:getIntensifyItems()

    ---@class EquipGrow_Intensify_ItemData
    ---@field itemData EquipMgr_IntersifyItemData
    ---@field num number

    self.listShowItems = {}
    for key, value in pairs(_listShowItems) do
        ---@type EquipGrow_Intensify_ItemData
        local data = {}
        data.itemData = value
        data.num = 0
        table.insert(self.listShowItems, data)
    end

    self.nodes.itemView:InitPool(
        #self.listShowItems,
        function(index, obj)
            ---@type EquipGrow_Intensify_ItemData
            local data = self.listShowItems[index]
            local configItem = Config.Item[data.itemData.cId]
            ---@type BagMgr_BagItemInfo
            local itemBagData = BagMgr:getItemDataByCId(data.itemData.cId)
            local imgBg = obj.transform:Find("IconNode/Image_Bg"):GetComponent(typeof(Image))
            local imgIcon = obj.transform:Find("IconNode/Image_Icon"):GetComponent(typeof(Image))
            local txtPlace = obj.transform:Find("IconNode/Image/Text_Place"):GetComponent(typeof(Text))
            local txtName = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local txtNum = obj.transform:Find("Text_Num"):GetComponent(typeof(Text))

            local btnMin = obj.transform:Find("Image_Control/Button_Min"):GetComponent(typeof(Button))
            local btnMax = obj.transform:Find("Image_Control/Button_Max"):GetComponent(typeof(Button))
            local btnLost = obj.transform:Find("Image_Control/Button_Lost"):GetComponent(typeof(Button))
            local btnAdd = obj.transform:Find("Image_Control/Button_Add"):GetComponent(typeof(Button))
            local txtCurCount = obj.transform:Find("Image_Control/Image/Text_CurCount"):GetComponent(typeof(Text))
            local ctrlNum = data.num

            txtPlace.transform.parent.gameObject:SetActive(false)

            txtName.text = configItem.name
            txtNum.text = string.format("×%d", itemBagData.num)
            EquipManager:setQuility(self, imgBg, configItem.star, EquipManager.STAGE_TYPE.BG_CUBE)
            BagManager.setItemIcon(self, imgIcon, data.itemData.cId)

            for i = 1, 6 do
                local starObj = obj.transform:Find("IconNode/Stars/Star" .. i).gameObject
                starObj:SetActive(i <= configItem.star)
            end

            txtCurCount.text = ctrlNum

            local item = {}
            item.cId = data.itemData.cId
            item.data = data.itemData
            item.ownNum = itemBagData.num
            item.txtNum = txtCurCount

            table.insert(self.listItem, item)
            self:addEventHandler(
                btnMin.onClick,
                function()
                    for key, value in pairs(self.listItem) do
                        if value.cId == item.cId then
                            data.num = 0

                            value.txtNum.text = data.num
                            self:updataItemAddExp()
                        end
                    end
                end
            )
            self:addEventHandler(
                btnMax.onClick,
                function()
                    if self.isMaxLv then
                        Log("已经达到最大等级")
                        return
                    end
                    local count = self:getAddItemMaxCount(item.data.addExp, item.ownNum)

                    for key, value in pairs(self.listItem) do
                        if value.cId == item.cId then
                            data.num = count
                            value.txtNum.text = count

                            self:updataItemAddExp()
                        end
                    end
                end
            )
            self:addEventHandler(
                btnLost.onClick,
                function()
                    for key, value in pairs(self.listItem) do
                        if value.cId == item.cId then
                            if data.num > 0 then
                                data.num = data.num - 1

                                value.txtNum.text = data.num
                                self:updataItemAddExp()
                            end
                        end
                    end
                end
            )
            self:addEventHandler(
                btnAdd.onClick,
                function()
                    for key, value in pairs(self.listItem) do
                        if value.cId == item.cId then
                            if data.num < value.ownNum then
                                if self.isMaxLv then
                                    Log("已经达到最大等级")
                                    return
                                end
                                data.num = data.num + 1

                                value.txtNum.text = data.num

                                self:updataItemAddExp()
                            end
                        end
                    end
                end
            )

            -- table.removeOne(
            --     self.listItem,
            --     function(itemObj)
            --         return itemObj.gId == item.gId
            --     end
            -- )
        end
    )
end

function EquipGrow_Intensify:getAddItemMaxCount(addExp, maxNum)
    local exp = addExp

    local lackExp = EquipMgr:getEquipMaxExpNeed(self.preExp, self.preLv, self.curEquipData)

    local countNeed = math.ceil(lackExp / exp)
    return countNeed >= maxNum and maxNum or countNeed
end

---刷新道具添加的经验
function EquipGrow_Intensify:updataItemAddExp()
    local addExp = 0
    local addCost = 0
    for key, value in pairs(self.listShowItems) do
        if value.num > 0 then
            addExp = addExp + value.num * value.itemData.addExp
            addCost = addCost + value.num * value.itemData.addCost
        end
    end
    if addExp == 0 then
        self:setLvExpUI()
        self:setEquipBaseUI(0, false)
        return
    end
    self:onShowPreData(addExp, addCost)
end

function EquipGrow_Intensify:setSortView()
    local sortState = not self.nodes.sortNode.activeSelf
    self.nodes.sortNode:SetActive(sortState)
    if sortState then
        local listSort = {Lang(51030004), Lang(51030042)}
        --{"星级", "等级"}
        self.listSortItem = {}
        if not self.curSortState then
            self.curSortState = 1
        end
        self.nodes.sortView:InitPool(
            #listSort,
            function(index, obj)
                local data = listSort[index]
                local txtName = obj.transform:Find("Text"):GetComponent(typeof(Text))
                local imgSelect = obj.transform:Find("Image_Select").gameObject
                local btnSort = obj.transform:GetComponent(typeof(Button))
                imgSelect:SetActive(self.curSortState == data)
                txtName.text = data

                local item = {}
                item.data = index
                item.select = imgSelect
                table.insert(self.listSortItem, item)

                self:addEventHandler(
                    btnSort.onClick,
                    function()
                        for key, value in pairs(self.listSortItem) do
                            value.select:SetActive(value.data == index)
                        end
                        local txtSortBtn = self.nodes.btnSort.transform:Find("Text"):GetComponent(typeof(Text))
                        txtSortBtn.text = data
                        self.curSortState = index
                        self:setSortView()

                        self:onShowEquipsView()
                    end
                )
            end
        )
    end
end

---获取可以一键填充的装备gid list
function EquipGrow_Intensify:getOnceAllEquips()
    ---@type table<number>
    local listOnceAll = {}
    self:resetSelectedEquips()
    local lackExp = EquipMgr:getEquipMaxExpNeed(self.curEquipData.exp, self.curEquipData.lv, self.curEquipData)
    if lackExp <= 0 then
        return listOnceAll
    end

    local expMax = false
    for index, value in ipairs(self.listShowEquipDatas) do
        local config = Config.Equip[value.equipData.cId]
        local cfgLv = Config.EquipLevel[value.equipData.quality * 100 + value.equipData.lv]
        local addExp = config.exp + cfgLv.exp_upgrade
        value.isSelect = true
        table.insert(listOnceAll, value.equipData.gId)
        lackExp = lackExp - addExp
        if lackExp > 0 then
        else
            break
        end
    end
    Log(dumpTable(listOnceAll, "EquipGrow_Intensify:getOnceAllEquips()---"))

    for key, value in pairs(self.listShowEquipDatas) do
        local item =
            table.findOne(
            self.listEquipItem,
            function(a)
                return a.gId == value.equipData.gId
            end
        )
        if item then
            item.select.gameObject:SetActive(value.isSelect)
        end
    end
    return listOnceAll
end

---获取选中的装备
function EquipGrow_Intensify:getSelectedEquips()
    local select =
        table.findAll(
        self.listShowEquipDatas,
        function(d)
            return d.isSelect
        end
    )
    return select
end

function EquipGrow_Intensify:resetSelectedEquips()
    for key, value in pairs(self.listShowEquipDatas) do
        value.isSelect = false
    end
end

function EquipGrow_Intensify:getCurSelectedEquips()
    local list = {}
    for key, value in pairs(self.listShowEquipDatas) do
        if value.isSelect then
            table.insert(list, value.equipData.gId)
        end
    end
    return list
end

function EquipGrow_Intensify:resetSelectItems()
    for key, value in pairs(self.listShowItems) do
        value.num = 0
    end
end
