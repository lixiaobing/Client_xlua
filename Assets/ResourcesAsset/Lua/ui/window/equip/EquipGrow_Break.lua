---@class EquipGrow_Break 突破 满级
---@field curEquipData EquipMgr_EquipData 当前质点信息
local EquipGrow_Break = DClass("EquipGrow_Break", BaseComponent)
_G.EquipGrow_Break = EquipGrow_Break

function EquipGrow_Break:ctor()
    self.messager = Messager.new(self)
end

function EquipGrow_Break:addListener()
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.onUpdateData)
end

function EquipGrow_Break:onDispose()
    self.messager:dispose()
end

function EquipGrow_Break:onStart()
    self:addListener()
    self:onInit()
end

function EquipGrow_Break:onInit()
    self:addEventHandler(self.nodes.btnBreak.onClick, self.onBreakClick)
end

function EquipGrow_Break:onInitUI()
    self:onUpdateUI()
end

---@param data EquipMgr_EquipData
function EquipGrow_Break:onUpdateData(data, updateUI)
    self.curEquipData = data
    if updateUI then
        self:onUpdateUI()
    end
end

---刷新UI
function EquipGrow_Break:onUpdateUI()
    self:updateConfigs()

    self:setQuility(self.nodes.nowQuility, self.curEquipData.quality)
    self:setQuility(self.nodes.afterQuility, self.curEquipData.quality + 1)

    self:onSetAttrCompare()

    self:setConditionDetails()

    self:itemCostBreak()
end

function EquipGrow_Break:updateConfigs()
    self.configEquip = Config.Equip[self.curEquipData.cId]
    self.configEquipGroup = Config.EquipStage[self.curEquipData.quality]
    self.configSuit = Config.EquipSuit[self.configEquip.type3]
    local keyAttr = self.configEquip.star * 10 + self.configEquip.item_position
    self.configAttr = Config.EquipAttr[keyAttr]
    local keyLv = self.curEquipData.quality * 100 + self.curEquipData.lv
    self.configLv = Config.EquipLevel[keyLv]
end

---设置品质显示
function EquipGrow_Break:setQuility(node, quility)
    EquipManager:setQuility(self, node, quility, EquipManager.STAGE_TYPE.ICON)
end

---显示突破前后的对比属性
function EquipGrow_Break:onSetAttrCompare()
    local tableCompare = {}

    local dataCompare = {}
    dataCompare.name = Lang(GL_EquipGrow_Break_DengJiShangXian)--"等级上限"
    dataCompare.current = self.configEquipGroup.maxlevel
    local configGroupNext = Config.EquipStage[self.curEquipData.quality + 1]
    dataCompare.next = configGroupNext.maxlevel

    table.insert(tableCompare, dataCompare)

    for index, value in ipairs(self.configAttr.show_attr) do
        local data0 = EquipManager:getEquipAttr(self.configAttr, self.configAttr.show_attr[index], self.curEquipData.quality, self.curEquipData.lv)
        local data1 = EquipManager:getEquipAttr(self.configAttr, self.configAttr.show_attr[index], self.curEquipData.quality + 1, 1)
        dataCompare = {}
        dataCompare.name = data0.name
        dataCompare.current = data0.num
        dataCompare.next = data1.num
        table.insert(tableCompare, dataCompare)
    end

    self.nodes.attrCompareContent:InitPool(
        #tableCompare,
        function(index, obj)
            local data = tableCompare[index]
            local txtName = obj.transform:Find("Text_Title"):GetComponent(typeof(Text))
            local txtFrom = obj.transform:Find("Text_From"):GetComponent(typeof(Text))
            local txtTo = obj.transform:Find("Text_To"):GetComponent(typeof(Text))
            txtName.text = data.name
            txtFrom.text = data.current
            txtTo.text = data.next
        end
    )
end

function EquipGrow_Break:setConditionDetails()
    if self.configEquipGroup.lockdes then
        local condition1 = self.nodes.conditionDes1.transform:Find("Text"):GetComponent(typeof(Text))
        condition1.text = self.configEquipGroup.lockdes
    end
    local condition2 = self.nodes.conditionDes2.transform:Find("Text"):GetComponent(typeof(Text))
    condition2.text = "" --暂定
end

function EquipGrow_Break:itemCostBreak()
    local listShow = self.configEquipGroup.consume
    self.nodes.itemCostContent:InitPool(
        #listShow,
        function(index, obj)
            local data = listShow[index]
            local imgBg = obj.transform:Find("Image_Item"):GetComponent(typeof(Image))
            local imgIcon = obj.transform:Find("Image_Item/Image_Icon"):GetComponent(typeof(Image))
            local txtCount = obj.transform:Find("Image_Count/Text_Count"):GetComponent(typeof(Text))
            local starContent = obj.transform:Find("starsView/Viewport/Content"):GetComponent(typeof(ScrollPoolHorizontal))
            local configItem = BagManager.getItemConfigDataById(data.id)

            BagManager.setItemIcon(self, imgIcon, data.id)
            EquipManager:setQuility(self, imgBg, configItem.star, EquipManager.STAGE_TYPE.BG_CUBE)
            starContent:InitPool(
                configItem.star,
                function(index, obj)
                end
            )
            local itemOwn = BagMgr:getItemDataByCId(data.id)
            txtCount.text =
                string.format(
                "<color=%s>%d</color>",
                itemOwn.num >= data.count and "white" or "red",
                itemOwn.num
                --,data.count
            )
        end
    )
end

function EquipGrow_Break:onBreakClick()
    
    EquipMgr:sendEquipBreakthrough(self.curEquipData.gId) --突破
end
