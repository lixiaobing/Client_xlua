---@class Bag_ItemCom
local Bag_ItemCom = DClass("Bag_ItemCom", BaseComponent)
_G.Bag_ItemCom = Bag_ItemCom

---@class Bag_ItemData
---@field state number
---@field gId number
---@field bId number
---@field cId number
---@field num number
---@field config table
---@field obj Transform
---@field gameObjectSelect Transform
---@field com Bag_ItemCom
---@field outTime number

local showTimeOut = false
function Bag_ItemCom:ctor()
    self:addUpdate()
end

---初始化面板组件节点(只在创建时调用)
---@param obj Transform
---@param ItemData BagMgr_BagItemInfo
function Bag_ItemCom:initItem(obj, ItemData, bagId)
    self.itemData = {}
    self.bagId = bagId

    self.gameObjectSelect = obj.transform:Find("Item_Select")
    self.nodeDisable = obj.transform:Find("Item_Disable")
    self.nodeDisable.gameObject:SetActive(false)

    self.img_Icon = obj.transform:Find("Item_Icon"):GetComponent(typeof(Image))
    self.img_IconBg = obj.transform:Find("Item_Bg"):GetComponent(typeof(Image))
    self.text_Count = obj.transform:Find("Label_Count"):GetComponent(typeof(Text))
    self.Img_Back = obj.transform:Find("Image_Bg"):GetComponent(typeof(Image))

    self.starsScroll = obj.transform:Find("StarsView/Viewport/Content"):GetComponent(typeof(ScrollPoolGrid))
    self.nodeTop = obj.transform:Find("Node_Top")
    self.txt_Time = self.nodeTop.transform:Find("Text_Time"):GetComponent(typeof(Text))
    self.nodeLimit = obj.transform:Find("Image_Limit")
    self.txt_NumLimit = obj.transform:Find("Image_Limit/Text_Limit"):GetComponent(typeof(Text))

    self.nodeEquip = obj.transform:Find("NodeEquip").gameObject
    self.nodeEquip.gameObject:SetActive(BagMgr:checkIsEquip(self.bagId))
    if BagMgr:checkIsEquip(self.bagId) then
        self.nodeEquiped = self.nodeEquip.transform:Find("Image_Equiped").gameObject
        self.equipPlace = self.nodeEquip.transform:Find("Image_PlaceBg/Image_Place"):GetComponent(typeof(Image))
        self.equipSkill1 = self.nodeEquip.transform:Find("Image_Skill1").gameObject
        self.equipSkill2 = self.nodeEquip.transform:Find("Image_Skill2").gameObject
        self.equipLocked = self.nodeEquip.transform:Find("Image_Lock").gameObject
        self.equipStage = self.nodeEquip.transform:Find("Image_Stage"):GetComponent(typeof(Image))
        self.equipLv = self.nodeEquip.transform:Find("Text_Lv"):GetComponent(typeof(Text))
    end

    self.gameObjectSelect.gameObject:SetActive(false)

    self.listAllStars = {}

    ---@type EquipMgr_EquipData
    self.equipData = {}
    ---@class Bag_ItemData
    local item = {}
    item.state = ItemData.state
    item.bId = ItemData.bId
    item.cId = ItemData.cId
    item.gId = ItemData.gId
    item.num = ItemData.num
    item.outTime = ItemData.outTime

    self.itemData.config = BagManager.getItemConfigDataById(ItemData.cId)
    item.obj = obj
    item.gameObjectSelect = self.gameObjectSelect
    item.com = self

    self.itemData = item
    obj.transform.gameObject.name = string.format("%d", item.cId)
    return item
end

--重置数据（复用时调用）
---@param data BagMgr_BagItemInfo
function Bag_ItemCom:resetItemData(data, bagId)
    self.equipData = {}
    self.bagId = bagId
    self.itemData.bId = data.bId
    self.itemData.cId = data.cId
    self.itemData.num = data.num
    self.itemData.outTime = data.outTime

    self.itemData.config = BagManager.getItemConfigDataById(data.cId)
    self.itemData.obj.gameObject.name = string.format("%d", self.itemData.cId)
    self.itemData.com = self
    self.itemData.obj = self.gameObject
    self.itemData.gameObjectSelect = self.gameObjectSelect
    self.transform.gameObject.name = string.format("%d", data.cId)
end

--刷新显示信息
function Bag_ItemCom:updateUI(data, bagId)
    showTimeOut = false
    self:resetItemData(data, bagId)
    self:updateStars()
    self:updateCount()
    self:updateIcon()
    self:updateState()
    self:updateTop()
    self:updateEquipUI()
    return self.itemData
end

function Bag_ItemCom:onClear()
    showTimeOut = false
    self.itemData = nil
end

---刷新限时道具
function Bag_ItemCom:onUpdate()
    self:checkingTimeOut()
end

function Bag_ItemCom:checkTimeOut()
    local timeData = TimeUtils.getLeftTime(self.itemData.outTime)
    if self.itemData and self.itemData.outTime > 0 and timeData.tScond <= 0 then
        BagMgr:removeOneItem(self.itemData.cId)
    end
end

function Bag_ItemCom:checkingTimeOut()
    if not self.itemData or not self.itemData.cId or not showTimeOut or self.itemData.outTime <= 0 then
        return
    end
    local _leftTime = TimeUtils.getLeftTime(self.itemData.outTime).tScond
    if _leftTime <= 0 then
        local cid = 0
        cid = self.itemData.cId
        showTimeOut = false
        if cid then
            BagMgr:removeOneItem(cid)
        end
    end
end

---显示限时提示
function Bag_ItemCom:setLeftOutTime()
    local timeData = TimeUtils.getLeftTime(self.itemData.outTime)

    if timeData.tScond > 0 then
        showTimeOut = true
        self.nodeTop.gameObject:SetActive(true)
        --"后过期"
        local day, hour, min, sec = TimeUtils.format(self.itemData.outTime, true)
        day = timeData.tDay
        hour = timeData.tHour
        min = timeData.tMinute
        sec = timeData.tScond
        local date = ""
        local minuteOut = false
        if tonumber(day) >= 2 then
            date = string.format("%d%s", tonumber(day), Lang(GL_TIME_DAY))
        else
            if tonumber(hour) > 0 then
                date = string.format("%d%s", tonumber(hour), Lang(GL_TIME_HOUR))
            else
                if tonumber(min) > 0 then
                    date = string.format("%d%s", tonumber(min), Lang(GL_TIME_MINUTE))
                else
                    if tonumber(sec) > 0 then
                        date = string.format("%d%s", tonumber(sec), Lang(GL_TIME_SECOND))
                        minuteOut = true
                    end
                end
            end
        end
        if not minuteOut then
            self.txt_Time.text = string.format("%s%s", date, Lang(GL_TIME_OUT))
        else
            self.txt_Time.text = Lang(GL_TIME_MINNUTE_OUT)
        end
    else
        showTimeOut = false
        self.nodeTop.gameObject:SetActive(false)
        self.txt_Time.text = ""
    end
end

---显示数量上限提示
function Bag_ItemCom:setLimitCount()
    if BagMgr:checkIsEquipByCid(self.itemData.cId) then
        self.nodeLimit.gameObject:SetActive(false)
        return
    end
    local config = BagManager.getItemConfigDataById(self.itemData.cId)
    local dataServer = BagMgr:getItemDataByGid(self.itemData.gId)
    if dataServer.num >= config.summax then
        self.nodeLimit.gameObject:SetActive(true)
        --"已达上限"
        self.txt_NumLimit.text = Lang(GL_NUMBER_LIMIT)
    else
        self.nodeLimit.gameObject:SetActive(false)
        self.txt_NumLimit.text = ""
    end
end

---显示道具Top
function Bag_ItemCom:updateTop()
    self:setLeftOutTime()
    self:setLimitCount()
end

---显示星级
function Bag_ItemCom:updateStars()
    local starShow = 0
    local cfg = BagManager.getItemConfigDataById(self.itemData.cId)
    starShow = cfg.star
    self.starsScroll:InitPool(
        starShow,
        function(index, obj)
            if self.itemData then
                local star = obj.transform:Find("Image_Star")
                star.gameObject:SetActive(starShow >= index)
            end
        end
    )
end
---刷新当前数量
function Bag_ItemCom:updateCount()
    local isEquip = BagMgr:checkIsEquipByCid(self.itemData.cId)

    self.text_Count.gameObject:SetActive(not isEquip)
    self.text_Count.text = self.itemData.num --"×" ..
end

---设置背景和Icon
function Bag_ItemCom:updateIcon()
    local pathQuality = string.format("%sGoods_Quality%02d", BagManager.pathItemQuality, self.itemData.config.item_bg)

    local pathBackQuality = string.format("%sGoods_Back%02d", BagManager.pathItemQuality, self.itemData.config.item_bg)

    self:setSprite(self.Img_Back, pathBackQuality)
    self:setSprite(self.img_IconBg, pathQuality)
    if BagMgr:checkIsEquipByCid(self.itemData.cId) then
        EquipManager:setEquipIcon(self, self.img_Icon, self.itemData.cId)
    else
        self:setSprite(self.img_Icon, BagManager.pathItemIcon .. self.itemData.config.item_icon)
    end
end

function Bag_ItemCom:updateState()
end

---点击道具 (TODO 修改为事件)
function Bag_ItemCom:onClickSelf(clickItem, openSell)
    if clickItem then
        if clickItem.bId == self.itemData.bId then
            if  BagMgr:checkIsEquipByCid(clickItem.cId) then
                local dataEquip = EquipMgr:getEquipDataByGid(self.itemData.gId)
                if dataEquip.heroId > 0 then
                    MsgCenter.sendMessage(Msg.HINT_COMMON, "当前道具不能选中出售或分解")
                    return nil
                end
            else
                if not self.itemData.config.is_resolve then
                    MsgCenter.sendMessage(Msg.HINT_COMMON, "当前道具不能选中出售或分解")
                    return nil
                end
            end
        end
        self.itemData.gameObjectSelect.gameObject:SetActive(self.itemData.bId == clickItem.bId)
    else
        self.itemData.gameObjectSelect.gameObject:SetActive(false)
    end
end

---刷新道具是否被出售分解
function Bag_ItemCom:onSelectDefault(showSell)
    if showSell then
        if BagMgr:checkIsEquipByCid(self.itemData.cId) then
            self.nodeDisable.gameObject:SetActive(self.equipData.heroId > 0)
        else
            self.nodeDisable.gameObject:SetActive(not self.itemData.config.is_resolve)
        end
    else
        self.nodeDisable.gameObject:SetActive(false)
    end
end

---刷新装备UI
function Bag_ItemCom:updateEquipUI()
    if not BagMgr:checkIsEquipByCid(self.itemData.cId) then
        return
    end
    self.equipData = EquipMgr:getEquipDataByGid(self.itemData.gId)
    EquipManager:setEquipPosition(self, self.equipPlace, self.equipData.cId)

    local skillsNum = 0
    if self.equipData.skills then
        for key, value in pairs(self.equipData.skills) do
            if value.skillId > 0 then
                skillsNum = skillsNum + 1
            end
        end
    end
    self.nodeEquiped:SetActive(self.equipData.heroId > 0)

    self.equipSkill1:SetActive(skillsNum >= 1)
    self.equipSkill2:SetActive(skillsNum >= 2)

    self.equipLocked:SetActive(self.equipData.locked)
    self.equipLv.text = "Lv." .. self.equipData.lv
    EquipManager:setQuility(self, self.equipStage, self.equipData.quality, EquipManager.STAGE_TYPE.ICON)
end
