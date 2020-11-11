---@class ShipToken_Details
local M = DClass("ShipToken_Details", BaseComponent)
_G.ShipToken_Details = M

function M:Awake()
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:onInit()
end

function M:onUpdate()
end

function M:onDispose()
    UIGlobal.topBanner:setBackHandler(nil)
end

function M:setBannerBackFunc()
    UIGlobal.topBanner:setBackHandler(
        function()
            MsgCenter.sendMessage(Msg.SHIP_NODECHANGE, 1)
            UIGlobal.topBanner:setBackHandler(nil)
        end
    )

    self:addEventHandler(self.nodes.button_UpStar.onClick, self.onUpStarClick)
    self:addEventHandler(self.nodes.button_Active.onClick, self.onActiveClick)
end

---@param type number 1 激活 2升星
function M:checkCostLack(type)
    local isLack = self.numNeed > self.numOwn
    if isLack then
        local data = {}
        data.title = "提示"
        data.content = type == 1 and "道具不足，激活失败" or "道具不足，升星失败"
        data.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
        data.buttonTypes = {1, 2}
        data.callback = function(sort)
        end

        MsgCenter.sendMessage(Msg.NOTIFY, data)
    end
    return isLack
end

function M:onActiveClick()
    Log("发送请求激活")
    if self:checkCostLack(1) then
        return
    end
    self.curData:sendActive(
        function()
            self.curData = ShipMgr:getTokenDataById(self.curId)
            self:startShowUpNode()
            UIManager.openWindow("ShipToken_SuccessPopup", nil, self.curData)
            Log(string.format("当前星级  %d", self.curData.cStar))
        end
    )
end

function M:onUpStarClick()
    Log("发送请求升星")
    if self:checkCostLack(2) then
        return
    end
    self.curData:sendUpStar(
        function()
            self.curData = ShipMgr:getTokenDataById(self.curId)
            self:startShowUpNode()
            UIManager.openWindow("ShipToken_SuccessPopup", nil, self.curData)
            Log(string.format("当前星级  %d", self.curData.cStar))
        end
    )
end

function M:startShowUpNode()
    self.curData = ShipMgr:getTokenDataById(self.curId)
    self:setNodes()
    self:setBaseInfo()
    self:setAttrInfo()
    self:setCostUI()
end

function M:onCloseShowUped()
    self:onUpdateUI()
end

function M:onCloseStarClick()
    self:onCloseShowUped()
end

function M:onInit()
    self.curId = 0
    self.curData = {}
end

function M:onOpen(cId)
    self.curId = cId
    self.curData = ShipMgr:getTokenDataById(self.curId)
    self:setBannerBackFunc()
    self:onUpdateUI()
end

function M:onUpdateUI()
    self:setNodes()
    self:setBaseInfo()
    self:setAttrInfo()
    self:setCostUI()
end

function M:setNodes()
    self.nodes.nodeActive:SetActive(false)
    self.nodes.nodeUpable:SetActive(false)

    if self.curData:getActivable() then
        self:setActivableUI()
    else
        self:setUpableUI()
    end
end

function M:setUpableUI()
    self.nodes.nodeUpable:SetActive(true)
    local showUp = self.curData.cStar < self.curData.config.star
    self.nodes.button_UpStar.gameObject:SetActive(showUp)
    self.nodes.image_Cost.gameObject:SetActive(showUp)
end

function M:setActivableUI()
    self.nodes.nodeActive:SetActive(true)
end

function M:setBaseInfo()
    BagManager.setItemIcon(self, self.nodes.image_Icon, self.curData.cId)
    local cfg = BagManager.getItemConfigDataById(self.curData.cId)
    self.nodes.text_Name.text = cfg.name
    self.nodes.text_DesBg.text = cfg.bg_des
    ShipManager:setTokenStars(self.nodes.stars, self.curData)

    self:setRaderUI()
end

function M:setRaderUI()
    local vRader = {}
    local cfgAttr = self.curData.configAttr
    local listAttr = cfgAttr.attr
    table.sort(
        listAttr,
        function(a, b)
            return a.id <= b.id
        end
    )
    local strAttr = ""
    local strColor = ""
    local strAddAttr = ""
    for i, value in ipairs(listAttr) do
        local txtAttr = self.nodes.image_Attrs.transform:Find("Text" .. value.id):GetComponent(typeof(Text))
        strColor = cfgAttr.Main == value.id and "<color=white>%s</color>" or "%s"
        strAttr = string.format("%s%s", strColor, strAddAttr)
        txtAttr.text = string.format("%s\n\t%d", ShipManager.ShipItemAttr_Name[value.id], value.count)
        local sortIndex = ShipManager:getAttrSortByAttrId(value.id)
        vRader[sortIndex] = value.count / listAttr[cfgAttr.Main].count
    end
end

function M:setAttrInfo()
    local cfgSkill = self.curData.configSkill
    if cfgSkill then
        self.nodes.text_Effects.text = cfgSkill.Des
        self.nodes.image_Effect.gameObject:SetActive(true)
        self.nodes.text_Effects.gameObject:SetActive(true)
    else
        self.nodes.image_Effect.gameObject:SetActive(false)
        self.nodes.text_Effects.gameObject:SetActive(false)
    end
end

function M:setCostUI()
    local isActive = self.curData:getActivable()
    local setCostFunc = function(iconId, countNeed, countOwn)
        BagManager.setItemIcon(self, self.nodes.image_CostIcon, iconId)
        local isEnough = countOwn >= countNeed and true or false
        local strColor = isEnough and "%s/%s" or "<color=red>%s</color>/%s"
        self.nodes.text_CostCount.text = string.format(strColor, countOwn, countNeed)
    end

    self.numNeed = 0
    self.numOwn = 0
    if isActive then ---设置激活消耗
        local cfg = self.curData.config
        local itemData = BagMgr:getItemDataByCId(cfg.chip)
        self.numNeed = cfg.chip_num
        self.numOwn = itemData.num
        setCostFunc(cfg.chip, self.numNeed, self.numOwn)
    else ---设置升星消耗
        local cfgAttr = self.curData.configAttr
        for key, value in pairs(cfgAttr.num) do
            local itemData = BagMgr:getItemDataByCId(value.id)
            self.numNeed = value.count
            self.numOwn = itemData.num
            setCostFunc(value.id, self.numNeed, self.numOwn)
            break
        end
    end
end
