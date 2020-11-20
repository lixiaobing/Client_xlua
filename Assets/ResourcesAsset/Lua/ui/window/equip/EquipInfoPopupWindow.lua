---@class EquipInfoPopupWindow 质点信息对比
local EquipInfoPopupWindow = DClass("EquipInfoPopupWindow", BaseWindow)
_G.EquipInfoPopupWindow = EquipInfoPopupWindow

function EquipInfoPopupWindow:ctor(data)
    self.type = data[1] and data[1] or nil
    ---@type EquipMgr_EquipData
    self.selectEquipData = data[2] and clone(data[2]) or nil
end

function EquipInfoPopupWindow:addListener()
    self.messager:addListener(Msg.EQUIP_SHOW_EQUIPINFO, self.onShowEquipInfo)
    self.messager:addListener(Msg.EQUIP_CHANGEPLACE_PLACE, self.onRecordSelectPlace)
end

function EquipInfoPopupWindow:onShowEquipInfo()
    self:onClose()
end

function EquipInfoPopupWindow:onDispose()
    self.messager:dispose()
end

function EquipInfoPopupWindow:onInit()
    self.coverCallBack = self.close
    self:addListener()
    self.curPopupState = EquipInfoPopupWindow.TYPESHOW.NONE
    self.curSelectPlace = 0

    self:initNodeUIs()

    self:onShowEquipInfoWindow(self.type)
end

EquipInfoPopupWindow.TYPESHOW = {
    NONE = 0,
    DISCHARGE = 1,
    EQUIP = 2,
    COMPARE = 3,
    SUITDETAILS = 4
}
local posShow = {Vector2(0, -50), Vector2(-200, -50), Vector2(200, -50)}
---显示详细信息
---@param type number 0 默认关闭 1 卸下 2 当前 3 对比
function EquipInfoPopupWindow:onShowEquipInfoWindow(type)
    self.curPopupState = type

    local equipEquips = EquipMgr:getEquipingEquips()
    self:setSelectEquipedEquip()

    self.nodes.btnClose.gameObject:SetActive(false)
    self.nodes.nodeEquip.gameObject:SetActive(false)
    self.nodes.nodeCompare.gameObject:SetActive(false)
    self.nodes.nodeSuitDetails.gameObject:SetActive(false)
    if type == EquipInfoPopupWindow.TYPESHOW.DISCHARGE then
        self.nodes.nodeCompare.gameObject:SetActive(true)
        self.nodes.nodeCompare.localPosition = posShow[1]

        self:setDischargeUI()
    elseif type == EquipInfoPopupWindow.TYPESHOW.EQUIP then
        self.nodes.nodeEquip.gameObject:SetActive(true)
        self.nodes.nodeEquip.localPosition = posShow[1]
    elseif type == EquipInfoPopupWindow.TYPESHOW.COMPARE then
        if self.dataEquiping then
            self.nodes.nodeEquip.gameObject:SetActive(true)
            self.nodes.nodeCompare.gameObject:SetActive(true)
            self.nodes.nodeEquip.localPosition = posShow[3]
            self.nodes.nodeCompare.localPosition = posShow[2]
            self:setCompareUI()
        else
            self.nodes.nodeCompare.gameObject:SetActive(true)
            self.nodes.nodeCompare.localPosition = posShow[1]
            self:setEquipUI()
        end
    elseif type == self.TYPESHOW.SUITDETAILS then
        self.nodes.nodeSuitDetails.gameObject:SetActive(true)
        local cpt = self:createComponent(self.nodes.nodeSuitDetails.gameObject, EquipOwn_EquipDetail)
    else
    end
end

---获取对比的正在装备中的质点信息s
function EquipInfoPopupWindow:setSelectEquipedEquip()
    if not self.selectEquipData then
        return
    end

    ---@type EquipMgr_EquipData
    self.dataEquiping = {}
    if self.curSelectPlace == 0 then
        local config = Config.Equip[self.selectEquipData.cId]
        self.dataEquiping = EquipMgr:getEquipEquipByPlace(config.item_position)
    else
        self.dataEquiping = EquipMgr:getEquipEquipByPlace(self.curSelectPlace)
    end
end

---设置卸下UI显示
function EquipInfoPopupWindow:setDischargeUI()
    self:setNodeInfoUI(self.dataEquiping, self.nodeTableControl)
    self:setNodeGroupBtnUI(self.dataEquiping, self.nodes.nodeCompare, self.TYPESHOW.DISCHARGE)
end

---显示需要装备的UI 1个
function EquipInfoPopupWindow:setEquipUI()
    self:setNodeInfoUI(self.selectEquipData, self.nodeTableControl)
    self:setNodeGroupBtnUI(self.selectEquipData, self.nodes.nodeCompare, self.TYPESHOW.COMPARE)
end

---显示对比的UI 2个
function EquipInfoPopupWindow:setCompareUI()
    self:setNodeInfoUI(self.selectEquipData, self.nodeTableControl)
    self:setNodeGroupBtnUI(self.selectEquipData, self.nodes.nodeCompare, self.TYPESHOW.COMPARE)

    self:setNodeInfoUI(self.dataEquiping, self.nodeTableShow)
    self:setNodeGroupBtnUI(self.dataEquiping, self.nodes.nodeEquip, self.TYPESHOW.DISCHARGE)
end

---设置详细信息
---@param data EquipMgr_EquipData
function EquipInfoPopupWindow:setNodeInfoUI(data, nodeTable)
    if not data then
        return
    end

    local config = Config.Equip[data.cId]
    nodeTable.txt_Name.text = config.name
    nodeTable.img_Lock:SetActive(data.locked)
    nodeTable.txt_Lv.text = string.format("Lv.%d", data.lv)

    EquipManager:setEquipPosition(self, nodeTable.img_Place, data.cId)
    for index, value in ipairs(nodeTable.tableStars) do
        nodeTable.tableStars[index]:SetActive(index <= config.star)
    end
    EquipManager:setQuility(self, nodeTable.img_IconBg, config.star, EquipManager.STAGE_TYPE.BG_CUBE)
    EquipManager:setEquipIcon(self, nodeTable.img_IconHead, data.cId)
    EquipManager:setQuility(self, nodeTable.img_TageCell, data.quality, EquipManager.STAGE_TYPE.ICON)

    local configSuit = Config.EquipSuit[config.type3]
    nodeTable.txt_SuitAttr.text = self:getEquipSuitDes(configSuit)

    nodeTable.awake1:SetActive(false)
    nodeTable.awake2:SetActive(false)
    if data.skills then
        for key, value in pairs(data.skills) do
            if value.slotId == 1 and value.skillId > 0 then
                nodeTable.awake1:SetActive(true)
            end
            if value.slotId == 2 and value.skillId > 0 then
                nodeTable.awake2:SetActive(true)
            end
        end
    end

    self:setEquipSkills(nodeTable, configSuit, data)
    self:setAttrDetails(nodeTable, data)
end

---@param data EquipMgr_EquipData
function EquipInfoPopupWindow:setAttrDetails(nodeTable, data)
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

---显示技能
function EquipInfoPopupWindow:setEquipSkills(nodeTable, config, data)
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

---得到装备所属套装技能描述
function EquipInfoPopupWindow:getEquipSuitDes(config)
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

function EquipInfoPopupWindow:initNodeUIs()
    self.nodeTableControl = self:getNodeTable(self.nodes.nodeCompare)
    self.nodeTableShow = self:getNodeTable(self.nodes.nodeEquip)
end

function EquipInfoPopupWindow:getNodeTable(node)
    local nodeTable = {}
    nodeTable.img_Place = node.transform:Find("Top/Image_Head/Image_Place"):GetComponent(typeof(Image))
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

    nodeTable.awake1 = node.transform:Find("Top/Image_Awaken1").gameObject
    nodeTable.awake2 = node.transform:Find("Top/Image_Awaken2").gameObject
    nodeTable.awake1:SetActive(false)
    nodeTable.awake2:SetActive(false)
    return nodeTable
end

---显示操作的的质点bottom
---@param data EquipMgr_EquipData
function EquipInfoPopupWindow:setNodeGroupBtnUI(data, node, state)
    local btnChange = node.transform:Find("Bottom/Button_Change"):GetComponent(typeof(Button))
    local btnGrowup = node.transform:Find("Bottom/Button_Growup"):GetComponent(typeof(Button))
    local btnDischarge = node.transform:Find("Bottom/Button_Discharge"):GetComponent(typeof(Button))
    local btnEquip = node.transform:Find("Bottom/Button_Equip"):GetComponent(typeof(Button))

    self:addEventHandler(btnChange.onClick, self.onBtnChangeClick)
    self:addEventHandler(btnEquip.onClick, self.onBtnChangeClick)
    self:addEventHandler(
        btnGrowup.onClick,
        function()
            self:onBtnGrowupClick(data)
        end
    )
    self:addEventHandler(
        btnDischarge.onClick,
        function()
            self:onBtnDischargeClick(data)
        end
    )

    btnGrowup.gameObject:SetActive(true)
    btnChange.gameObject:SetActive(false)
    btnDischarge.gameObject:SetActive(false)
    btnEquip.gameObject:SetActive(false)
    if state == EquipInfoPopupWindow.TYPESHOW.DISCHARGE then
        btnDischarge.gameObject:SetActive(true)
    elseif state == EquipInfoPopupWindow.TYPESHOW.COMPARE then
        if not self.dataEquiping then
            btnEquip.gameObject:SetActive(true)
        else
            btnChange.gameObject:SetActive(true)
        end
    end
end

function EquipInfoPopupWindow:onRecordSelectPlace(place)
    if self.curSelectPlace == place then
        return
    end
    self.curSelectPlace = place

    MsgCenter.sendMessage(Msg.EQUIP_CHANGEPLACE_PLACE, self.curSelectPlace)
end

---点击更换
function EquipInfoPopupWindow:onBtnChangeClick()
    local gId = self.selectEquipData.gId
    EquipMgr:sendPutOnEquip({heroId = EquipMgr:getCurSelectHero().id, equipId = gId}) --穿戴装备
    self:close()
end

---点击培养
function EquipInfoPopupWindow:onBtnGrowupClick(data)
    UIManager.openWindow("EquipGrowWindow", nil, {data})
    self:onShowEquipInfoWindow(self.TYPESHOW.NONE)
    self:close()
end

---点击卸下
function EquipInfoPopupWindow:onBtnDischargeClick(data)
    EquipMgr:sendPutDownEquip({heroId = EquipMgr:getCurSelectHero().id, equipId = data.gId}) --卸下装备
    self:close()
end
