---@class EquipInfoWindow
local EquipInfoWindow = DClass("EquipInfoWindow", BaseWindow)
_G.EquipInfoWindow = EquipInfoWindow

function EquipInfoWindow:onAsset()
end

function EquipInfoWindow:ctor(data)
    ---@type EquipMgr_EquipData
    self.equipInfo = data[1]
end

function EquipInfoWindow:onInit()
    self.coverCallBack = self.close
    self.nodeTableShow = self:getNodeTable(self.transform)
    self:setNodeInfoUI(self.equipInfo, self.nodeTableShow)
end

function EquipInfoWindow:getNodeTable(node)
    local nodeTable = {}
    nodeTable.txt_Place = node.transform:Find("Top/Image_Head/Image_Place/Text"):GetComponent(typeof(Text))
    nodeTable.img_IconBg = node.transform:Find("Top/Image_Head"):GetComponent(typeof(Image))
    nodeTable.img_IconHead = node.transform:Find("Top/Image_Head/Image_Icon"):GetComponent(typeof(Image))
    nodeTable.pnt_Tage = node.transform:Find("Top/Tage")
    nodeTable.img_TageCell = nodeTable.pnt_Tage:Find("Image1"):GetComponent(typeof(Image))
    nodeTable.tableStars = {}
    for i = 1, 6 do
        local path = string.format("Top/Stars/Image%d", i)
        local star = node.transform:Find(path).gameObject
        nodeTable.tableStars[i] = star
    end
    nodeTable.txt_Lv = node.transform:Find("Top/Image_Lv/Text_Lv"):GetComponent(typeof(Text))
    nodeTable.txt_Name = node.transform:Find("Top/Text_Name"):GetComponent(typeof(Text))
    nodeTable.img_Lock = node.transform:Find("Top/Image_Lock").gameObject

    local nodeMiddle = node.transform:Find("Middle/ScrollView/Viewport/Content"):GetComponent(typeof(RectTransform))
    nodeTable.txt_Attr1 = nodeMiddle.transform:Find("Image/Text_Attr1"):GetComponent(typeof(Text))
    nodeTable.txt_Attr2 = nodeMiddle.transform:Find("Image/Text_Attr2"):GetComponent(typeof(Text))

    nodeTable.txt_SuitAttr = nodeMiddle.transform:Find("Text_SuitAttr"):GetComponent(typeof(Text))
    nodeTable.img_IconSkill1 = nodeMiddle.transform:Find("NodeSkill1/Image_Skill1"):GetComponent(typeof(Image))
    nodeTable.txt_Details1 = nodeTable.img_IconSkill1.transform:Find("Text"):GetComponent(typeof(Text))
    nodeTable.img_IconSkill2 = nodeMiddle.transform:Find("NodeSkill2/Image_Skill2"):GetComponent(typeof(Image))
    nodeTable.txt_Details2 = nodeTable.img_IconSkill2.transform:Find("Text"):GetComponent(typeof(Text))

    return nodeTable
end

---设置详细信息
---@param data EquipMgr_EquipData
function EquipInfoWindow:setNodeInfoUI(data, nodeTable)
    local config = Config.Equip[data.cId]
    nodeTable.txt_Name.text = config.name
    nodeTable.img_Lock:SetActive(data.locked)
    nodeTable.txt_Lv.text = string.format("Lv.%d", data.lv)
    nodeTable.txt_Place.text = EquipManager.NAME_PLACE[config.item_position]
    for index, value in ipairs(nodeTable.tableStars) do
        nodeTable.tableStars[index]:SetActive(index <= config.star)
    end
    EquipManager:setQuility(self, nodeTable.img_IconBg, config.star, EquipManager.STAGE_TYPE.BG_CUBE)
    EquipManager:setEquipIcon(self, nodeTable.img_IconHead, data.cId)
    EquipManager:setQuility(self, nodeTable.img_TageCell, data.quality, EquipManager.STAGE_TYPE.ICON)

    local configSuit = Config.EquipSuit[config.type3]
    nodeTable.txt_SuitAttr.text = self:getEquipSuitDes(configSuit)

    self:setEquipSkills(nodeTable, configSuit, data)
    self:setAttrDetails(nodeTable, data)
end

---得到装备所属套装技能描述
function EquipInfoWindow:getEquipSuitDes(config)
    local des = config.sui_des
    local strDes = ""
    for i, v in ipairs(des) do
        if i == 1 then
            strDes = v
        else
            strDes = strDes .. "\n" .. v
        end
    end
    return strDes
end

---显示技能
function EquipInfoWindow:setEquipSkills(nodeTable, config, data)
    local skillIds = config.skill_id

    local setSuitSkill = function(img, txt, cId, index)
        if not data.skills then
            img.gameObject:SetActive(false)
            return
        end
        local skillData = data.skills[index]
        if not skillData or skillData.skillId <= 0 then
            img.gameObject:SetActive(false)
            return
        else
            img.gameObject:SetActive(true)
        end
        local config = Config.EquipSkill[cId]
        EquipManager:setSkillIcon(self, img, cId)
        txt.text = config.name
    end

    setSuitSkill(nodeTable.img_IconSkill1, nodeTable.txt_Details1, skillIds[1], 1)
    setSuitSkill(nodeTable.img_IconSkill2, nodeTable.txt_Details2, skillIds[2], 2)
end

---@param data EquipMgr_EquipData
function EquipInfoWindow:setAttrDetails(nodeTable, data)
    local configEquip = Config.Equip[data.cId]
    local keyAttr = configEquip.star * 10 + configEquip.item_position
    local configAttr = Config.EquipAttr[keyAttr]

    local listAttr = configAttr.show_attr

    local funcAttr = function(index, obj)
        local dataConfig = EquipManager:getEquipAttr(configAttr, listAttr[index], data.quality, data.lv)
        obj.text = string.format("%s      +%d", dataConfig.name, dataConfig.num)
    end

    funcAttr(1, nodeTable.txt_Attr1)
    funcAttr(2, nodeTable.txt_Attr2)
end
