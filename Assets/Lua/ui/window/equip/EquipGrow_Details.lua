---@class EquipGrow_Details
---@field curEquipData EquipMgr_EquipData 当前质点信息
local EquipGrow_Details = DClass("EquipGrow_Details", BaseComponent)
_G.EquipGrow_Details = EquipGrow_Details

function EquipGrow_Details:ctor()
    self.messager = Messager.new(self)
end

function EquipGrow_Details:addListener()
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.onUpdateData)
end

function EquipGrow_Details:onDispose()
    self.messager:dispose()
end

function EquipGrow_Details:onStart()
    self:addListener()
    self:onInit()
end

function EquipGrow_Details:onInit()
    self:addEventHandler(self.nodes.btnLook.onClick, self.onLookClick)
    self:addEventHandler(self.nodes.btnLock.onClick, self.onLockClick)
end

function EquipGrow_Details:onLookClick()
    MsgCenter.sendMessage(Msg.EQUIP_GROW_LOOK, true)
end

function EquipGrow_Details:onLockClick()
    self.curEquipData.locked = not self.curEquipData.locked
    self.nodes.showLock:SetActive(self.curEquipData.locked)
    ---通知EquipMgr 修改对应质点 锁定状态---

    EquipMgr:sendSetEquipLock({equipId = self.curEquipData.gId, lock = self.curEquipData.locked}) --发送锁定标记
end

---@param data EquipMgr_EquipData
function EquipGrow_Details:onUpdateData(data, updateUI)
    self.curEquipData = data
    if updateUI then
        self:onUpdateUI()
    end
end

function EquipGrow_Details:onUpdateUI()
    local configEquip = Config.Equip[self.curEquipData.cId]
    local configEquipGroup = Config.EquipStage[self.curEquipData.quality]
    local configSuit = Config.EquipSuit[configEquip.type3]
    local keyAttr = configEquip.star * 10 + configEquip.item_position
    local configAttr = Config.EquipAttr[keyAttr]
    self.nodes.showLock:SetActive(self.curEquipData.locked)
    self.nodes.txtCurLv.text = string.format("Lv.%d", self.curEquipData.lv)
    self.nodes.txtMaxLv.text = string.format("/%d", configEquipGroup.maxlevel) --最大等级 config

    self:setAttrDetails(configAttr)

    self:setSuitDetails(configSuit)

    self:setSuitSkills()

    EquipManager:setQuility(self, self.nodes.imgStage, self.curEquipData.quality, EquipManager.STAGE_TYPE.ICON)
end

---显示基础属性
function EquipGrow_Details:setAttrDetails(config)
    local listAttr = config.show_attr

    local funcAttr = function(index, obj)
        local data = EquipManager:getEquipAttr(config, listAttr[index], self.curEquipData.quality, self.curEquipData.lv)
        local txtName = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
        local txtNum = obj.transform:Find("Text_Num"):GetComponent(typeof(Text))
        txtName.text = data.name
        txtNum.text = data.num
    end

    funcAttr(1, self.nodes.attrShow1)
    funcAttr(2, self.nodes.attrShow2)
end

---套装属性
function EquipGrow_Details:setSuitDetails(config)
    local des = config.sui_des
    local strDes = ""
    for i, v in ipairs(des) do
        if i == 1 then
            strDes = v
        else
            strDes = strDes .. "\n" .. v
        end
    end
    self.nodes.txtSuitDetails.text = strDes
end

---套装觉醒技能
function EquipGrow_Details:setSuitSkills()
    self.nodes.skillAwaken1.gameObject:SetActive(false)
    self.nodes.skillAwaken2.gameObject:SetActive(false)
    self.nodes.nodeSkill.gameObject:SetActive(false)
    if not EquipManager:checkSkillAwaked(self.curEquipData.skills) then
        return
    end

    for key, value in pairs(self.curEquipData.skills) do
        if self.nodes["skillAwaken" .. value.slotId] then
            local nodeAwaken = self.nodes["skillAwaken" .. value.slotId]
            local skillId = value.skillId
            local config = Config.EquipSkill[skillId]
            if not config then
                break
            end
            nodeAwaken.gameObject:SetActive(true)
            local icon = nodeAwaken.transform:Find("Image_Awaken/Image_Icon"):GetComponent(typeof(Image))
            local name = nodeAwaken.transform:Find("Image_Awaken/Text_Title"):GetComponent(typeof(Text))
            local details = nodeAwaken.transform:Find("Image_Awaken/Text_Details"):GetComponent(typeof(Text))
            name.text = config.name
            details.text = config.Des
            EquipManager:setSkillIcon(self, icon, skillId)
            self.nodes.nodeSkill.gameObject:SetActive(true)
        end
    end
end
