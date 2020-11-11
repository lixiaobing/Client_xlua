---@class EquipGrow_AwakenSuccess
---@field curEquipData EquipMgr_EquipData 当前质点信息
local EquipGrow_AwakenSuccess = DClass("EquipGrow_AwakenSuccess", BaseComponent)
_G.EquipGrow_AwakenSuccess = EquipGrow_AwakenSuccess

function EquipGrow_AwakenSuccess:ctor()
    self.messager = Messager.new(self)
end

function EquipGrow_AwakenSuccess:addListener()
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.onUpdateData)
    self.messager:addListener(Msg.EQUIP_AWAKESLOT, self.setAwakeSlot)
end

function EquipGrow_AwakenSuccess:setAwakeSlot(slotId)
    self.slotId = slotId
end

function EquipGrow_AwakenSuccess:onDispose()
    self.messager:dispose()
end

function EquipGrow_AwakenSuccess:onStart()
    self:addListener()
    self:onInit()
end

function EquipGrow_AwakenSuccess:onInit()
end

---@param data EquipMgr_EquipData
function EquipGrow_AwakenSuccess:onUpdateData(data, updateUI)
    self.curEquipData = data

    if updateUI then
        self:onUpdateUI()
    end
end

function EquipGrow_AwakenSuccess:onUpdateUI()
    self.nodes.nodeSelectAttr.gameObject:SetActive(false)
    self.nodes.nodeShowAttr.gameObject:SetActive(false)
    if not self.curEquipData then
        return
    end
    local slotId = 0
    local skillId = 0
    local heroId = 0
    local oldHeroId = 0
    local oldSkillId = 0
    if EquipManager:checkSkillAwaked(self.curEquipData.skillsCache) then
        for key, value in pairs(self.curEquipData.skillsCache) do
            if value.skillId > 0 and value.slotId and value.slotId > 0 then
                slotId = value.slotId
                skillId = value.skillId
                heroId = value.heroId
                break
            end
        end
        for k,v in pairs(self.curEquipData.skills) do
            if v.slotId == slotId then
                slotId = v.slotId
                oldSkillId = v.skillId
                oldHeroId = v.heroId
                break
            end
        end

        self.nodes.nodeSelectAttr.gameObject:SetActive(true)
        self:setAttrUI(
            self.nodes.nodeNewAttr,
            function()
                EquipMgr:sendEuipAwakeSelect({equipId = self.curEquipData.gId, selectNew = true, slotId = slotId})
                MsgCenter.sendMessage(Msg.EQUIP_GROW_SHOWAWAKEN, false)
            end,
            skillId,
            heroId
        )
        self:setAttrUI(
            self.nodes.nodeOldAttr,
            function()
                EquipMgr:sendEuipAwakeSelect({equipId = self.curEquipData.gId, selectNew = false, slotId = slotId})
                MsgCenter.sendMessage(Msg.EQUIP_GROW_SHOWAWAKEN, false)
            end,
            oldSkillId,
            oldHeroId
        )
    else
        for key, value in pairs(self.curEquipData.skills) do
            if value.slotId == self.slotId then
                skillId = value.skillId
            end
        end
        self.nodes.nodeShowAttr.gameObject:SetActive(true)
        self:setAttrUI(
            self.nodes.nodeFirstAttr,
            function()
                MsgCenter.sendMessage(Msg.EQUIP_GROW_SHOWAWAKEN, false)
            end,
            skillId,
            heroId
        )
    end
end

function EquipGrow_AwakenSuccess:setAttrUI(node, btnClick, skillId, heroId)
    local imgIcon = node.transform:Find("Image_Icon"):GetComponent(typeof(Image))
    local txtName = node.transform:Find("Text_Name"):GetComponent(typeof(Text))
    local txtAttr = node.transform:Find("Text_Attr"):GetComponent(typeof(Text))
    local btn = node.transform:Find("Button"):GetComponent(typeof(Button))
    local nodeBinding = node.transform:Find("Image_Binding").gameObject
    local imgHeroIcon = nodeBinding.transform:Find("Image_Icon"):GetComponent(typeof(Image))

    nodeBinding:SetActive(heroId > 0)

    if heroId > 0 then
        EquipManager:setHeroIcon(self, imgHeroIcon, heroId)
    end
    local cfg = Config.EquipSkill[skillId]
    EquipManager:setSkillIcon(self, imgIcon, skillId)
    if cfg ~= nil then
        txtName.text = cfg.name
        txtAttr.text = cfg.Des
    end
    self:addEventHandler(btn.onClick, btnClick)
end
