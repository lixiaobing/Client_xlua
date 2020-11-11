---@class EquipSuit_Details 显示当前选中套装的详细信息
local EquipSuit_Details = DClass("EquipSuit_Details", BaseComponent)
_G.EquipSuit_Details = EquipSuit_Details

function EquipSuit_Details:ctor()
    self.messager = Messager.new(self)
end

function EquipSuit_Details:addListener()
    self.messager:addListener(Msg.EQUIP_SUIT_CHANGE, self.updateSuitUI)
end

function EquipSuit_Details:dispose()
    self.messager:dispose()
end

function EquipSuit_Details:onStart()
    self:addListener()
    self:onInit()
end

function EquipSuit_Details:onInit()
    --self:updateSuitUI(self.curSuitId)
end

function EquipSuit_Details:updateSuitUI(suitId, isCustem)
    if self.curSuitId == suitId then
        return
    end
    self.curSuitId = suitId
    if suitId == 0 then
        self.equipedEquips = EquipMgr:getEquipingEquips()
    else
        self.equipedEquips = EquipMgr:getSuitDatas(suitId, isCustem)
    end

    self:setBaseAttrUI()

    self:setSuitSkillUI()

    self:setAwakenSkillUI()
end

function EquipSuit_Details:setBaseAttrUI()
    --local listEquipeds = EquipMgr:getEquipingEquips()

    local data = {}
    data.atk = 0
    data.health = 0
    data.def = 0
    data.crit_per = 0

    for key, value in pairs(self.equipedEquips) do
        if EquipMgr:getEquipDataByGid(value.gId) then
            local baseData = EquipManager:getEquipSuitAttr(value.gId)
            data.atk = data.atk + baseData.atk
            data.health = data.health + baseData.health
            data.def = data.def + baseData.def
            data.crit_per = data.crit_per + baseData.crit_per
            break
        end
    end

    self.nodes.txt_AttackValue.text = data.atk
    self.nodes.txt_DefenseValue.text = data.def
    self.nodes.txt_LifeValue.text = data.health
    self.nodes.txt_HeartValue.text = data.crit_per
end

function EquipSuit_Details:setSuitSkillUI()
    local listEquiped = {}
    for i = 1, 5 do
        if self.equipedEquips[i] then
            table.insert(listEquiped, self.equipedEquips[i].cId)
        end
    end

    local des = {}
    des = EquipManager:getSuitSkill(listEquiped)
    local str = ""
    for i = 1, #des do
        if i == #des then
            str = str .. des[i]
        else
            str = str .. des[i] .. "\n\t"
        end
    end
    self.nodes.txt_SuitSkills.text = str

    self.nodes.middleTitle:SetActive(#des > 0)
end

function EquipSuit_Details:setAwakenSkillUI()
    local listEquiped = {}
    --local listEquipeds = EquipMgr:getEquipingEquips()
    for key, value in pairs(self.equipedEquips) do
        if EquipMgr:getEquipDataByGid(value.gId) then
            table.insert(listEquiped, value.gId)
        end
    end
    local skillDes = EquipManager:getSuitAwakenSkills(listEquiped)

    self.nodes.contentAwakenSkill:InitPool(
        #skillDes,
        function(index, obj)
            local txt = obj.transform:GetComponent(typeof(Text))
            txt.text = skillDes[index]
        end
    )

    self.nodes.nodeAwakenSkill:SetActive(#skillDes > 0)
end
