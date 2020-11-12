---@class EquipGrowWindow 质点成长界面
---@field nodeState number 当前节点状态
---@field tabState number 当前分页状态
---@field rawModelState number 当前模型显示状态
---@field equipData EquipMgr_EquipData
local EquipGrowWindow = DClass("EquipGrowWindow", BaseWindow)
_G.EquipGrowWindow = EquipGrowWindow

EquipGrowWindow.RAWMODEL_STATE = {
    NONE = 1, -- 关闭
    BROWSE = 2, -- 浏览 位于中央
    EXHIBITION = 3 -- 展示 在偏左位置
}

EquipGrowWindow.NODE_STATE = {
    NONE = 1,
    DETAILS = 2,
    INTENSIFY = 3,
    BREAK = 4,
    AWAKEN = 5,
    AWAKEN_SUCCESS = 6
}

EquipGrowWindow.TAB_STATE = {
    NONE = 1,
    DETAILS = 2,
    INTENSIFY = 3,
    AWAKEN = 4
}

EquipGrowWindow.POS_EQUIPICON = {
    Vector2(0, 0),
    Vector2(-160, 0)
}

function EquipGrowWindow:ctor(data)
    ---@type EquipMgr_EquipData
    self.equipData = data[1][1]
end

EquipGrowWindow.equipCell = {}
function EquipGrowWindow:onAsset()
    self.assetKeys = {
        "UI/Component/EquipInfoCell"
    }
    self.assetComplete = function(index, obj)
        if index == 1 then
            self.equipCell = obj.gameObject
        end
    end
end

function EquipGrowWindow:addListeners()
    --self.messager:addListener(Msg.EQUIP_OPEN_SELECTSUIT, self.openSelectSuit)
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.updateEquipData)
    self.messager:addListener(Msg.EQUIP_GROW_LOOK, self.onLookEquip)
    self.messager:addListener(Msg.EQUIP_GROW_SHOWAWAKEN, self.onSetAwakenSuccess)
    self.messager:addListener(Msg.EQUIPGROW_CHANGE_NODESTATE, self.setGrowNodesState)
end

function EquipGrowWindow:updateEquipData(data)
    self.equipData = data
end

function EquipGrowWindow:onDispose()
    self.cpt_BaseInfo:onDispose()
    self.cpt_Details:onDispose()
    self.cpt_Intensify:onDispose()
    self.cpt_Break:onDispose()
    self.cpt_Awaken:onDispose()
    self.cpt_AwakenSuccess:onDispose()
    self.messager:dispose()
end

function EquipGrowWindow:onAsset()
end

function EquipGrowWindow:onInit()
    self:addListeners()

    self:addEventHandler(self.nodes.btnDetails.onClick, self.onClickDetails)
    self:addEventHandler(self.nodes.btnIntensify.onClick, self.onClickIntensify)
    self:addEventHandler(self.nodes.btnAwaken.onClick, self.onClickAwaken)
    self:addEventHandler(self.nodes.btnLookBack.onClick, self.onLookBack)
    self:addEventHandler(self.nodes.btnAwakenBack.onClick, self.onAwakenBack)
    self.nodes.btnLookBack.gameObject:SetActive(false)

    self.cpt_BaseInfo = self:createComponent(self.nodes.nodeBaseInfo.gameObject, EquipGrow_BaseInfo)
    self.cpt_Details = self:createComponent(self.nodes.nodeDetails.gameObject, EquipGrow_Details)
    self.cpt_Intensify = self:createComponent(self.nodes.nodeIntensify.gameObject, EquipGrow_Intensify)
    self.cpt_Break = self:createComponent(self.nodes.nodeBreak.gameObject, EquipGrow_Break)
    self.cpt_Awaken = self:createComponent(self.nodes.nodeAwaken.gameObject, EquipGrow_Awaken)
    self.cpt_AwakenSuccess = self:createComponent(self.nodes.nodeAwakenSuccess.gameObject, EquipGrow_AwakenSuccess)

    MsgCenter.sendMessage(Msg.EQUIP_GROW_EQUIPDATA, self.equipData)

    self:setGrowNodesState(self.NODE_STATE.DETAILS)
    self:setTabsState(self.TAB_STATE.DETAILS)

    self:onSetEquipIcon()
end

---点击关闭浏览
function EquipGrowWindow:onLookBack()
    self:onLookEquip(false)
end

---点击详情
function EquipGrowWindow:onClickDetails()
    self:setGrowNodesState(self.NODE_STATE.DETAILS)
    self:setTabsState(self.TAB_STATE.DETAILS)
end
---点击强化
function EquipGrowWindow:onClickIntensify()
    local configEquipGroup = Config.EquipStage[self.equipData.quality]
    local isMaxLv = self.equipData.lv >= configEquipGroup.maxlevel
    --isMaxLv = true --
    if isMaxLv then
        self:setGrowNodesState(self.NODE_STATE.BREAK)
    else
        self:setGrowNodesState(self.NODE_STATE.INTENSIFY)
    end
    self:setTabsState(self.TAB_STATE.INTENSIFY)
end
---点击觉醒
function EquipGrowWindow:onClickAwaken()
    self:setGrowNodesState(self.NODE_STATE.AWAKEN)
    self:setTabsState(self.TAB_STATE.AWAKEN)
end

function EquipGrowWindow:setTabsState(btn)
    if self.tabState == btn then
        return
    end
    self.tabState = btn

    self.nodes.btnDetails.transform:Find("Image_active").gameObject:SetActive(btn == self.TAB_STATE.DETAILS)
    self.nodes.btnIntensify.transform:Find("Image_active").gameObject:SetActive(btn == self.TAB_STATE.INTENSIFY)
    self.nodes.btnAwaken.transform:Find("Image_active").gameObject:SetActive(btn == self.TAB_STATE.AWAKEN)

    self.nodes.btnAwaken.gameObject:SetActive(EquipManager:checkSkillHasSlot(self.equipData.skills))
end

function EquipGrowWindow:onSetEquipIcon()
    EquipManager:setEquipIcon(self, self.nodes.rawModel.transform:GetComponent(typeof(Image)), self.equipData.cId)
end

---设置model显示的位置
---@param state number self.RAWMODEL_STATE
function EquipGrowWindow:setRawModelState(state)
    if self.rawModelState == state then
        return
    end
    self.rawModelState = state

    if state == self.RAWMODEL_STATE.NONE then
        self.nodes.nodeTabs.gameObject:SetActive(false)
        self.nodes.rawModel.gameObject:SetActive(false)
    elseif state == self.RAWMODEL_STATE.BROWSE then
        self.nodes.rawModel.gameObject:SetActive(true)
        self.nodes.rawModel.transform.localPosition = self.POS_EQUIPICON[1]
        self.nodes.nodeTabs.gameObject:SetActive(false)
    elseif state == self.RAWMODEL_STATE.EXHIBITION then
        self.nodes.rawModel.gameObject:SetActive(true)
        self.nodes.rawModel.transform.localPosition = self.POS_EQUIPICON[2]
        self.nodes.nodeTabs.gameObject:SetActive(true)
    end
end

---设置质点培养所有节点状态
---@param state number self.NODE_STATE
function EquipGrowWindow:setGrowNodesState(state)
    if self.nodeState == state then
        return
    end
    self.nodeState = state

    self.nodes.nodeBaseInfo.gameObject:SetActive(false)
    self.nodes.nodeDetails.gameObject:SetActive(false)
    self.nodes.nodeIntensify.gameObject:SetActive(false)
    self.nodes.nodeBreak.gameObject:SetActive(false)
    self.nodes.nodeAwaken.gameObject:SetActive(false)
    self.nodes.nodeAwakenSuccess.gameObject:SetActive(false)

    self:setRawModelState(self.RAWMODEL_STATE.EXHIBITION)
    MsgCenter.sendMessage(Msg.SHOW_TOPBANNER, true)
    if state == self.NODE_STATE.NONE then
        self:setRawModelState(self.RAWMODEL_STATE.NONE)
    elseif state == self.NODE_STATE.DETAILS then
        self.nodes.nodeDetails.gameObject:SetActive(true)
        self.nodes.nodeBaseInfo.gameObject:SetActive(true)
        self.cpt_Details:onUpdateUI()
    elseif state == self.NODE_STATE.INTENSIFY then
        self.nodes.nodeIntensify.gameObject:SetActive(true)
        self.cpt_Intensify:onInitUI()
        self.cpt_Intensify:onUpdateUI()
    elseif state == self.NODE_STATE.BREAK then
        self.nodes.nodeBreak.gameObject:SetActive(true)
        self.nodes.nodeBaseInfo.gameObject:SetActive(true)
        self.cpt_Break:onInitUI()
    elseif state == self.NODE_STATE.AWAKEN then
        self.nodes.nodeAwaken.gameObject:SetActive(true)
        self.nodes.nodeBaseInfo.gameObject:SetActive(true)
        self.cpt_Awaken:onUpdateUI()
    elseif state == self.NODE_STATE.AWAKEN_SUCCESS then
        MsgCenter.sendMessage(Msg.SHOW_TOPBANNER, false)
        self:setRawModelState(self.RAWMODEL_STATE.BROWSE)
        self.nodes.nodeAwakenSuccess.gameObject:SetActive(true)
        self.cpt_AwakenSuccess:onUpdateUI()
    end
end

---浏览质点
function EquipGrowWindow:onLookEquip(show)
    self.nodes.btnLookBack.gameObject:SetActive(show)
    self.nodes.imgIconBg:SetActive(not show)
    MsgCenter.sendMessage(Msg.SHOW_TOPBANNER,not show)
    if show then
        self:setGrowNodesState(self.NODE_STATE.NONE)
        self:setRawModelState(self.RAWMODEL_STATE.BROWSE)
    else
        self:setGrowNodesState(self.NODE_STATE.DETAILS)
        self:setRawModelState(self.RAWMODEL_STATE.EXHIBITION)
    end
end

---觉醒界面返回
function EquipGrowWindow:onAwakenBack()
    --self:onSetAwakenSuccess(false)
end

---设置觉醒成功界面
function EquipGrowWindow:onSetAwakenSuccess(show)
    self.nodes.btnAwakenBack.gameObject:SetActive(show)
    if show then
        self:setGrowNodesState(self.NODE_STATE.AWAKEN_SUCCESS)
    else
        self:setGrowNodesState(self.NODE_STATE.AWAKEN)
    end
end
