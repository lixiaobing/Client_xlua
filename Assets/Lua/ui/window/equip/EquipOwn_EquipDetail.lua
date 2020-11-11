---@class EquipOwn_EquipDetail
local EquipOwn_EquipDetail = DClass("EquipOwn_EquipDetail", BaseComponent)
_G.EquipOwn_EquipDetail = EquipOwn_EquipDetail

function EquipOwn_EquipDetail:ctor()
    self.messager = Messager.new(self)
end

function EquipOwn_EquipDetail:addListener()
end

function EquipOwn_EquipDetail:onDispose()
    self.messager:dispose()
end

function EquipOwn_EquipDetail:onStart()
    self:onInit()
end

function EquipOwn_EquipDetail:onInit()
    self:addEventHandler(self.nodes.btnClose.onClick, self.onCloseClick)

    self:setBaseAttrUI()

    self:setSuitSkillUI()

    self:setAwakenSkillUI()
end

function EquipOwn_EquipDetail:onCloseClick()
    MsgCenter.sendMessage(Msg.EQUIP_SHOW_EQUIPINFO, {Equip_PopupDetail.TYPESHOW.NONE, nil})
end

function EquipOwn_EquipDetail:setBaseAttrUI()
    local listEquipeds = EquipMgr:getEquipingEquips()
    local data = {}
    data.atk = 0
    data.health = 0
    data.def = 0
    data.crit_per = 0

    for key, value in pairs(listEquipeds) do
        local baseData = EquipManager:getEquipSuitAttr(value.gId)
        data.atk = data.atk + baseData.atk
        data.health = data.health + baseData.health
        data.def = data.def + baseData.def
        data.crit_per = data.crit_per + baseData.crit_per
    end

    self.nodes.txt_AttackValue.text = data.atk
    self.nodes.txt_DefenseValue.text = data.def
    self.nodes.txt_LifeValue.text = data.health
    self.nodes.txt_HeartValue.text = data.crit_per
end

function EquipOwn_EquipDetail:setSuitSkillUI()
    local listEquiped = {}
    local listEquipeds = EquipMgr:getEquipingEquips()
    for i = 1, 5 do
        if listEquipeds[i] then
            table.insert(listEquiped, listEquipeds[i].cId)
        end
    end

    local des = {}
    des = EquipManager:getSuitSkill(listEquiped)
    local str = ""
    for i = 1, #des do
        if i == #des then
            str = str .. des[i]
        else
            str = str .. des[i] .. "\n"
        end
    end
    self.nodes.txt_SuitSkills.text = str

    self.nodes.middleTitle:SetActive(#des > 0)
end

function EquipOwn_EquipDetail:setAwakenSkillUI()
    local listEquiped = {}
    local listEquipeds = EquipMgr:getEquipingEquips()
    for key, value in pairs(listEquipeds) do
        table.insert(listEquiped, value.gId)
    end
    local skillDes = EquipManager:getSuitAwakenSkills(listEquiped)
    local str = ""
    for i = 1, #skillDes do
        if i == #skillDes then
            str = str .. skillDes[i]
        else
            str = str .. skillDes[i] .. "\n"
        end
    end
    self.nodes.txtAwakeSkill.text = str
    self.nodes.nodeAwakenSkill:SetActive(#skillDes > 0)
end
