---@class ShipScience_Details
local M = DClass("ShipScience_Details", BaseComponent)
_G.ShipScience_Details = M

local ShipScience_Details_NodeState = {
    Active = 1,
    Up = 2,
    Max = 3
}

function M:Awake()
    self.curId = 0
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:onInit()
end

function M:onInit()
    self:addEventHandler(self.nodes.button_Active.onClick, self.onActiveClick)
    self:addEventHandler(self.nodes.button_Up.onClick, self.onUpClick)
end

function M:onUpdateUI(id)
    self.curId = id or self.curId
    self:updateData()
    self:setDetailsUI()
end

function M:updateData()
    self.curData = ShipMgr:getTalentDataById(self.curId)
end

---@param type number 1 激活 2升星
function M:checkCostLack(type)
    local isLack = self.numNeed > self.numOwn
    if isLack then
        local data = {}
        data.title = "提示"
        data.content = type == 1 and "道具不足，激活失败" or "道具不足，升级失败"
        data.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
        data.buttonTypes = {1, 2}
        data.callback = function(sort)
        end

        MsgCenter.sendMessage(Msg.NOTIFY, data)
    end
    return isLack
end

function M:onActiveClick()
    if self:checkCostLack(1) then
        return
    end
    self.curData:sendActive(
        function()
            self:updateData()
            self:setDetailsUI()
        end
    )
end

function M:onUpClick()
    if self:checkCostLack(2) then
        return
    end
    self.curData:sendUpLv(
        function()
            self:updateData()
            self:setDetailsUI()
        end
    )
end

function M:setDetailsUI()
    ShipManager:setTalentIcon(self, self.nodes.image_Icon, self.curData.config.icon)
    ShipManager:setTalentBg(self, self.nodes.image_IconBg, self.curData.config.icon_bg)
    self.nodes.text_Name.text = self.curData.config.name
    local isActived = self.curData.cLv > 0

    local isMax = self.curData.config.already_max
    self.nodes.text_Lv.gameObject:SetActive(isActived)
    if isActived then
        self.nodes.text_Lv.text =
            isMax and "Max" or string.format("%d/%d", self.curData.cLv, self.curData.config.level_max)
    end

    self.nodes.text_CurEffect.text = self.curData.config.des

    self.nodes.text_NextT:SetActive(true)
    if isMax or self.curData.cLv <= 0 then
        self.nodes.text_NextEffect.text = ""
        self.nodes.text_NextT:SetActive(false)
    else
        local nextCfg = Config.ShipTalent[self.curData.config.id + 1]
        self.nodes.text_NextEffect.text = nextCfg.des
    end

    self:resetNodes()
    self.listBefore = {}
    self.isAcitvable, self.listBefore = self.curData:getActivable()
    Log(dumpTable(self.listBefore,"显示当前不符合的条件："))
    if self.curData:checkActived() then --已经激活 显示升级节点
        self:checkOrSetLvUpState()
    else --显示未激活的节点
        self:checkOrSetActiveState()
    end

    self:setCostUI()
    self:setConditionUI()

    --return
    -- local showCondition = not (isActived and isMax)
    -- self.nodes.button_Active.gameObject:SetActive(not isActived)
    -- self.nodes.button_Up.gameObject:SetActive(isActived and not isMax)
    -- self.nodes.node_Cost:SetActive(showCondition)
    -- self.nodes.content.gameObject:SetActive(showCondition)

    -- if showCondition then
    --     local setCostFunc = function(id, needCount)
    --         BagManager.setItemIcon(self, self.nodes.image_CostIcon, id)
    --         local ownItem = BagMgr:getItemDataByCId(id)
    --         local ownCount = ownItem and ownItem.num or 0
    --         local strCount = ownCount >= needCount and "%d/%d" or "<color=red>%d</color>/%d"
    --         self.numNeed = needCount
    --         self.numOwn = ownCount
    --         self.nodes.text_Cost.text = string.format(strCount, ownCount, needCount)
    --     end

    --     for key, value in pairs(self.curData.config.consume) do
    --         setCostFunc(value.id, value.count)
    --         break
    --     end

    --     local list = self.curData.config.limit_des
    --     self.nodes.content:InitPool(
    --         #list,
    --         function(index, obj)
    --             local data = list[index]
    --             local txtDes = obj.transform:Find("Text_Condition"):GetComponent(typeof(Text))
    --             txtDes.text = string.format("<color=red>%s</color>",data)
    --         end
    --     )
    -- end
end

function M:setCostUI()
    local setCostFunc = function(id, needCount) --设置消耗品
        BagManager.setItemIcon(self, self.nodes.image_CostIcon, id)
        local ownItem = BagMgr:getItemDataByCId(id)
        local ownCount = ownItem and ownItem.num or 0
        local strCount = ownCount >= needCount and "%d/%d" or "<color=red>%d</color>/%d"
        self.numNeed = needCount
        self.numOwn = ownCount
        self.nodes.text_Cost.text = string.format(strCount, ownCount, needCount)
    end

    for key, value in pairs(self.curData.config.consume) do
        setCostFunc(value.id, value.count)
        break
    end
end

function M:setConditionUI()
    if not self.listBefore or #self.listBefore <= 0 then
        return
    end
    local list = self.listBefore --设置不满足条件
    
    self.nodes.content:InitPool(
        #list,
        function(index, obj)
            local data = list[index]
            local txtDes = obj.transform:Find("Text_Condition"):GetComponent(typeof(Text))
            txtDes.text = string.format("<color=red>%s</color>", data)
        end
    )
end

function M:resetNodes()
    self.nodes.button_Active.gameObject:SetActive(false)
    self.nodes.button_Up.gameObject:SetActive(false)
    self.nodes.button_DisActive:SetActive(false)
    self.nodes.button_DisUp:SetActive(false)

    self.nodes.node_Cost:SetActive(false)
    self.nodes.content.gameObject:SetActive(false)
end

---设置需要激活节点状态
function M:checkOrSetActiveState()
    self.nodes.button_Active.gameObject:SetActive(self.isAcitvable)
    self.nodes.button_DisActive:SetActive(not self.isAcitvable)

    self.nodes.node_Cost:SetActive(true)
    self.nodes.content.gameObject:SetActive(not self.isAcitvable)
    
end

---设置需要升级节点状态
function M:checkOrSetLvUpState()
    local isMax = self.curData:checkLvMax()
    local isUpdatable = self.curData:getUpable()

    if isMax then
    else
        self.nodes.button_Up.gameObject:SetActive(isUpdatable)
        self.nodes.button_DisUp.gameObject:SetActive(not isUpdatable)

        self.nodes.node_Cost:SetActive(true)
        self.nodes.content.gameObject:SetActive(false)
    end
end
