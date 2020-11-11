---@class GMWindow
---@field tabSelect number 当前选中的页签
local GMWindow = DClass("GMWindow", BaseWindow)
_G.GMWindow = GMWindow

function GMWindow:onAsset()
end

function GMWindow:onInit()
    self.coverCallBack = self.close
    self:addEventHandler(self.nodes.btn_ClossGM.onClick, self.close)
    self:initTab()
end

local tabNames = {
    "通用",
    "道具",
    "经济",
    "关卡",
    "装备",
    "信物",
}

function GMWindow:initTab()
    self.listTabs = {}

    self.nodes.tabContent:ReloadConfig()
    self.nodes.tabContent:InitPool(
        #tabNames,
        function(index, obj)
            local select = obj.transform:Find("Image_Select")
            local txtName = select.transform:Find("Text_TabName"):GetComponent(typeof(Text))
            local txtName0 = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local strName = tabNames[index]
            txtName.text = strName
            txtName0.text = strName
            select.gameObject:SetActive(false)

            local btn = obj.transform:GetComponent(typeof(Button))
            self:addEventHandler(
                btn.onClick,
                function()
                    self:onTabChanged(index)
                end
            )

            local tabItem = {}
            tabItem.index = index
            tabItem.select = select
            tabItem.name = strName

            table.insert(self.listTabs, tabItem)
        end
    )

    self.nodes.tabContent:OnInitFinish(
        function()
            self:initDefaultTab()
        end
    )
end

function GMWindow:initDefaultTab()
    self.tabSelect = 0
    for index, value in ipairs(self.listTabs) do
        value.select.gameObject:SetActive(value.index == 1)
    end
    self:onTabChanged(1)
end

function GMWindow:onTabChanged(index)
    if index == self.tabSelect then
        return
    end
    self.tabSelect = index
    for i, value in ipairs(self.listTabs) do
        value.select.gameObject:SetActive(value.index == index)
    end
    self:onCloseAllNodes()
    if index == 1 then
        self.nodes.node_Normal:SetActive(true)
        self:initNormalNode()
    elseif index == 2 or index == 5 or index == 6 then
        self.nodes.node_Item:SetActive(true)
        self:initItemNode(index)
    elseif index == 3 then
        self.nodes.node_Economics:SetActive(true)
        self:initEconomics()
    elseif index == 4 then
        self.nodes.node_Level:SetActive(true)
        self:initLevel()
    end
end

function GMWindow:onCloseAllNodes()
    for key, value in pairs(self.nodes) do
        if string.match(key, "node_") then
            value.gameObject:SetActive(false)
        end
    end
end

-----------------------------------通用----------------------------------------------

local gmOrders = {
    addItem = "./addItemList ",
    unlockLevel = "./unlockLevel "
}

function GMWindow:initNormalNode()
    self.nodes.ipt_Normal.text = ""
    self:addEventHandler(
        self.nodes.btn_SendNormal.onClick,
        function()
            local str = self.nodes.ipt_Normal.text
            if str and str ~= "" then
                self:sendGM(self.nodes.ipt_Normal.text)
            else
                Log("输入GM命令为空。。。")
            end
        end
    )
end
----------------------------------------------------------------------------------------

-----------------------------------道具----------------------------------------------

---@class GMWindow_ShowItemData
---@field id number
---@field name string

---@class GMWindow_SelectItemData
---@field id number
---@field count number
---@field select table
---@field ipt table

function GMWindow:initItemNode(index)
    self:addEventHandler(
        self.nodes.btn_SendItems.onClick,
        function()
            local strSub = self:subItems()
            if #self.listSelectItems > 0 then
                self:sendGM(strSub)
            else
                Log("没有要添加的道具...")
            end
        end
    )
    self.nodes.ipt_Filtrate.text = ""

    self:addEventHandler(self.nodes.ipt_Filtrate.onEndEdit, self.updateItemList)
    self:updateItemList()
end

function GMWindow:updateItemList()
    ---@type table<GMWindow_ShowItemData>
    local list = self:filtrateItemList()
    self:setItemList(list)
end

function GMWindow:filtrateItemList()
    local strIpt = self.nodes.ipt_Filtrate.text
    local isFiltrateId = false
    if tonumber(strIpt) then
        isFiltrateId = true
    end

    ---@type table<GMWindow_ShowItemData>
    local list = {}
    if self.tabSelect == 2 then --道具
        for index, value in ipairs(table.values(Config.Item)) do
            ---@type GMWindow_ShowItemData
            local data = {}
            data.id = value.id
            data.name = value.name
            if isFiltrateId then
                if string.match(tostring(data.id), strIpt) then
                    table.insert(list, data)
                end
            else
                if string.match(tostring(data.name), strIpt) then
                    table.insert(list, data)
                end
            end
            --table.insert(list, data)
        end
        for index, value in ipairs(table.values(Config.ItemBox)) do
            ---@type GMWindow_ShowItemData
            local data = {}
            data.id = value.id
            data.name = value.name
            if isFiltrateId then
                if string.match(tostring(data.id), strIpt) then
                    table.insert(list, data)
                end
            else
                if string.match(tostring(data.name), strIpt) then
                    table.insert(list, data)
                end
            end
            --table.insert(list, data)
        end
    elseif self.tabSelect == 5 then --装备
        for index, value in ipairs(table.values(Config.Equip)) do
            ---@type GMWindow_ShowItemData
            local data = {}
            data.id = value.id
            data.name = value.name
            if isFiltrateId then
                if string.match(tostring(data.id), strIpt) then
                    table.insert(list, data)
                end
            else
                if string.match(tostring(data.name), strIpt) then
                    table.insert(list, data)
                end
            end
            --table.insert(list, data)
        end
    elseif self.tabSelect == 6 then --信物
        for index, value in ipairs(table.values(Config.ShipItem)) do
            ---@type GMWindow_ShowItemData
            local data = {}
            data.id = value.id
            data.name = value.name
            if isFiltrateId then
                if string.match(tostring(data.id), strIpt) then
                    table.insert(list, data)
                end
            else
                if string.match(tostring(data.name), strIpt) then
                    table.insert(list, data)
                end
            end
            --table.insert(list, data)
        end
    end

    return list
end

function GMWindow:setItemList(list)
    self.listItems = {}
    self.listSelectItems = {}
    self.nodes.itemContent:ReloadConfig()
    self.nodes.itemContent:InitPool(
        #list,
        function(index, obj)
            ---@type GMWindow_ShowItemData
            local data = list[index]
            local txt_id = obj.transform:Find("Text_ItemId"):GetComponent(typeof(Text))
            local txt_Name = obj.transform:Find("Text_ItemName"):GetComponent(typeof(Text))
            local select = obj.transform:Find("Image_Select")
            local ipt_Count = select.transform:Find("InputField"):GetComponent(typeof(UIInput))
            txt_id.text = string.format("id:%d", data.id)
            txt_Name.text = string.format("name:%s", data.name)
            local count = 0
            local ownSelect = false
            for index, value in ipairs(self.listSelectItems) do
                if value.id == data.id then
                    count = value.count
                    ipt_Count.text = tostring(count)
                    select.gameObject:SetActive(true)
                    ownSelect = true
                    break
                end
            end
            if not ownSelect then
                ipt_Count.text = ""
                select.gameObject:SetActive(false)
            end

            local btn = obj.transform:GetComponent(typeof(Button))

            ---@type GMWindow_SelectItemData
            local item = {}
            item.id = data.id
            item.select = select
            item.ipt = ipt_Count
            item.count = count

            self:addEventHandler(
                btn.onClick,
                function()
                    self:onSelectItem(item)
                end
            )
            self:addEventHandler(
                ipt_Count.onEndEdit,
                function()
                    for index, value in ipairs(self.listSelectItems) do
                        if item.id == value.id then
                            value.count = tonumber(value.ipt.text) or 0
                        end
                    end
                end
            )
            table.insert(self.listItems, item)
        end
    )
end

---@param item GMWindow_SelectItemData
function GMWindow:onSelectItem(item)
    for key, value in pairs(self.listItems) do
        if value.id == item.id then
            value.ipt.text = ""
            if not value.select.gameObject.activeSelf then
                value.select.gameObject:SetActive(true)
                ---@type GMWindow_SelectItemData
                local data = {}
                data.id = value.id
                data.ipt = value.ipt
                data.count = value.count
                data.select = value.select
                table.insert(self.listSelectItems, data)
                return
            else
                value.select.gameObject:SetActive(false)
                for i, v in ipairs(self.listSelectItems) do
                    if v.id == value.id then
                        table.remove(self.listSelectItems, i)
                        return
                    end
                end
            end
        end
    end
end

function GMWindow:subItems()
    local strSub = gmOrders.addItem
    for index, value in ipairs(self.listSelectItems) do
        if value.count > 0 then
            strSub = string.format("%s%d:%d,", strSub, value.id, value.count)
        end
    end
    return strSub
end
----------------------------------------------------------------------------------------

------------------------------------经济-----------------------------------------
local economicsTypes = {
    "Gold",
    "Demond"
}

function GMWindow:initEconomics()
    self.nodes.economicsContent:ReloadConfig()
    self.nodes.economicsContent:InitPool(
        #economicsTypes,
        function(index, obj)
            local id = 0
            if economicsTypes[index] == "Gold" then
                id = ItemType.GOLD
            elseif economicsTypes[index] == "Demond" then
                id = ItemType.DIAMOND
            end

            local config = BagManager.getItemConfigDataById(id)
            local txt_Name = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local ipt = obj.transform:Find("InputField_Count"):GetComponent(typeof(UIInput))
            local txt_ipt = ipt.transform:Find("Placeholder"):GetComponent(typeof(Text))
            local btn = obj.transform:Find("Button_Send"):GetComponent(typeof(Button))
            ipt.text = ""
            txt_ipt.text = string.format("输入%s数量...", config.name)
            txt_Name.text = config.name
            self:addEventHandler(
                btn.onClick,
                function()
                    local num = tonumber(ipt.text) or 0
                    local str = string.format("%s %d:%d,", gmOrders.addItem, id, num)
                    if num > 0 then
                        self:sendGM(str)
                    else
                        Log("数量要大于0...")
                    end
                end
            )
        end
    )
end

----------------------------------------------------------------------------------------

------------------------------------解锁关卡-----------------------------------------

function GMWindow:initLevel()
    self.listLv = {}
    self.nodes.levelContent:ReloadConfig()
    self.nodes.levelContent:InitPool(
        2,
        function(index, obj)
            local txt_Name = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local ipt = obj.transform:Find("InputField_Count"):GetComponent(typeof(UIInput))
            local txt_ipt = ipt.transform:Find("Placeholder"):GetComponent(typeof(Text))
            local btn = obj.transform:Find("Button_Send"):GetComponent(typeof(Button))

            if index == 1 then
                txt_Name.text = "解锁关卡从"
                txt_ipt.text = "解锁起点"
            elseif index == 2 then
                txt_ipt.text = "解锁终点"
                txt_Name.text = "到"
            end

            self:addEventHandler(
                btn.onClick,
                function()
                    local strLv = gmOrders.unlockLevel
                    local lvRage = {}
                    for index, value in ipairs(self.listLv) do
                        if value and tonumber(value.ipt.text) then
                            local lv = tonumber(value.ipt.text) or 0
                            lvRage[index] = lv
                        end
                    end
                    strLv = string.format("%s%d,%d", gmOrders.unlockLevel, lvRage[1], lvRage[2])
                    self:sendGM(strLv)
                end
            )

            local data = {}
            data.ipt = ipt

            table.insert(self.listLv, data)
        end
    )
end

----------------------------------------------------------------------------------------

function GMWindow:sendGM(str)
    Log("发送GM---:" .. str)
    local tableGM = {}
    tableGM.channel = 1
    tableGM.fun = 1
    tableGM.content = str
    tableGM.playerId = 0
    NetWork:send(c2s.CHAT_REQ_CHAT, tableGM)
end
