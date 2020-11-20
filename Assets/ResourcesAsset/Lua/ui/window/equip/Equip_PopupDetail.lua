---@class Equip_PopupDetail 质点信息对比
local Equip_PopupDetail = DClass("Equip_PopupDetail", BaseComponent)
_G.Equip_PopupDetail = Equip_PopupDetail

function Equip_PopupDetail:ctor()
    self.messager = Messager.new(self)
end

function Equip_PopupDetail:addListener()
    --self.messager:addListener(Msg.EQUIP_SHOW_EQUIPINFO, self.onShowEquipInfo)
    self.messager:addListener(Msg.EQUIP_CHANGEPLACE_PLACE, self.onRecordSelectPlace)
end

function Equip_PopupDetail:onDispose()
    self.messager:dispose()
end

function Equip_PopupDetail:onStart()
    self:addListener()
    self:onInit()
end

function Equip_PopupDetail:onInit()
    self:onShowEquipInfoWindow(Equip_PopupDetail.TYPESHOW.NONE)
    self.curPopupState = Equip_PopupDetail.TYPESHOW.NONE
    self:addEventHandler(
        self.nodes.btnClose.onClick,
        function()
            self:onShowEquipInfoWindow(Equip_PopupDetail.TYPESHOW.NONE)
        end
    )
    self.curSelectPlace = 0

    self:initNodeUIs()
end

---data[1] 打开类型  data[2] 选中质点信息
function Equip_PopupDetail:onShowEquipInfo(data)
    local type = data[1] and data[1] or nil
    ---@type EquipMgr_EquipData
    self.selectEquipData = data[2] and clone(data[2]) or nil
    self:onShowEquipInfoWindow(type)
end

Equip_PopupDetail.TYPESHOW = {
    NONE = 0,
    DISCHARGE = 1,
    EQUIP = 2,
    COMPARE = 3,
    SUITDETAILS = 4
}
local posShow = {Vector2(0, -50), Vector2(-200, -50), Vector2(200, -50)}
---显示详细信息
---@param type number 0 默认关闭 1 卸下 2 当前 3 对比
function Equip_PopupDetail:onShowEquipInfoWindow(type)
    if self.curPopupState == type then
        return
    end
    self.curPopupState = type

    local equipEquips = EquipMgr:getEquipingEquips()
    local hasNoneEquip = EquipMgr:checkEquipedEquip() == 0
    self:setSelectEquipedEquip()

    self.nodes.btnClose.gameObject:SetActive(false)
    self.nodes.nodeEquip.gameObject:SetActive(false)
    self.nodes.nodeCompare.gameObject:SetActive(false)
    self.nodes.nodeSuitDetails.gameObject:SetActive(false)
    if type == Equip_PopupDetail.TYPESHOW.DISCHARGE then
        if hasNoneEquip then
            return
        end

        self.nodes.btnClose.gameObject:SetActive(true)
        self.nodes.nodeCompare.gameObject:SetActive(true)
        self.nodes.nodeCompare.localPosition = posShow[1]

        self:setDischargeUI()
    elseif type == Equip_PopupDetail.TYPESHOW.EQUIP then
        self.nodes.btnClose.gameObject:SetActive(true)
        self.nodes.nodeEquip.gameObject:SetActive(true)
        self.nodes.nodeEquip.localPosition = posShow[1]
    elseif type == Equip_PopupDetail.TYPESHOW.COMPARE then
        if self.dataEquiping then
            self.nodes.btnClose.gameObject:SetActive(true)
            self.nodes.nodeEquip.gameObject:SetActive(true)
            self.nodes.nodeCompare.gameObject:SetActive(true)
            self.nodes.nodeEquip.localPosition = posShow[3]
            self.nodes.nodeCompare.localPosition = posShow[2]
            self:setCompareUI()
        else
            self.nodes.btnClose.gameObject:SetActive(true)
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
function Equip_PopupDetail:setSelectEquipedEquip()
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
function Equip_PopupDetail:setDischargeUI()
    self:setNodeInfoUI(self.dataEquiping, self.nodeTableControl)
    self:setNodeGroupBtnUI(self.dataEquiping, self.nodes.nodeCompare)
end

---显示需要装备的UI 1个
function Equip_PopupDetail:setEquipUI()
    self:setNodeInfoUI(self.selectEquipData, self.nodeTableControl)
    self:setNodeGroupBtnUI(self.selectEquipData, self.nodes.nodeCompare)
end

---显示对比的UI 2个
function Equip_PopupDetail:setCompareUI()
    self:setNodeInfoUI(self.selectEquipData, self.nodeTableControl)
    self:setNodeGroupBtnUI(self.selectEquipData, self.nodes.nodeCompare)

    self:setNodeInfoUI(self.dataEquiping, self.nodeTableShow)
end

---设置详细信息
---@param data EquipMgr_EquipData
function Equip_PopupDetail:setNodeInfoUI(data, nodeTable)
    if not data then
        Log(" Equip_PopupDetail:setNodeInfoUI 。data is nil")
        return
    end

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

---@param data EquipMgr_EquipData
function Equip_PopupDetail:setAttrDetails(nodeTable, data)
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
function Equip_PopupDetail:setEquipSkills(nodeTable, config, data)
    local skillIds = config.skill_id

    local setSuitSkill = function(img, txt, cId, index)
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
function Equip_PopupDetail:getEquipSuitDes(config)
    local des = config.sui_des
    local strDes = ""
    for i, v in ipairs(des) do
        if i == 1 then
            strDes = v
        else
            strDes = strDes .. "\n\t" .. v
        end
    end
    return strDes
end

function Equip_PopupDetail:initNodeUIs()
    self.nodeTableControl = self:getNodeTable(self.nodes.nodeCompare)
    self.nodeTableShow = self:getNodeTable(self.nodes.nodeEquip)
end

function Equip_PopupDetail:getNodeTable(node)
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

    nodeTable.txt_Attr1 = node.transform:Find("Middle/Image/Text_Attr1"):GetComponent(typeof(Text))
    nodeTable.txt_Attr2 = node.transform:Find("Middle/Image/Text_Attr2"):GetComponent(typeof(Text))

    nodeTable.txt_SuitAttr = node.transform:Find("Middle/Text_SuitAttr"):GetComponent(typeof(Text))
    nodeTable.img_IconSkill1 = node.transform:Find("Middle/Image_Skill1"):GetComponent(typeof(Image))
    nodeTable.txt_Details1 = nodeTable.img_IconSkill1.transform:Find("Text"):GetComponent(typeof(Text))
    nodeTable.img_IconSkill2 = node.transform:Find("Middle/Image_Skill2"):GetComponent(typeof(Image))
    nodeTable.txt_Details2 = nodeTable.img_IconSkill2.transform:Find("Text"):GetComponent(typeof(Text))

    return nodeTable
end

---显示操作的的质点bottom
---@param data EquipMgr_EquipData
function Equip_PopupDetail:setNodeGroupBtnUI(data, node)
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
    self:addEventHandler(btnDischarge.onClick, self.onBtnDischargeClick)

    btnGrowup.gameObject:SetActive(true)
    btnChange.gameObject:SetActive(false)
    btnDischarge.gameObject:SetActive(false)
    btnEquip.gameObject:SetActive(false)
    if self.curPopupState == Equip_PopupDetail.TYPESHOW.DISCHARGE then
        btnDischarge.gameObject:SetActive(true)
    elseif self.curPopupState == Equip_PopupDetail.TYPESHOW.COMPARE then
        if not self.dataEquiping then
            btnEquip.gameObject:SetActive(true)
        else
            btnChange.gameObject:SetActive(true)
        end
    end
end

function Equip_PopupDetail:onRecordSelectPlace(place)
    if self.curSelectPlace == place then
        return
    end
    self.curSelectPlace = place

    MsgCenter.sendMessage(Msg.EQUIP_CHANGEPLACE_PLACE, self.curSelectPlace)
end

---点击更换
function Equip_PopupDetail:onBtnChangeClick()
    local gId = self.selectEquipData.gId
    EquipMgr:sendPutOnEquip({heroId = EquipMgr:getCurSelectHero().id, equipId = gId}) --穿戴装备
end

---点击培养
function Equip_PopupDetail:onBtnGrowupClick(data)
    UIManager.openWindow("EquipGrowWindow", nil, {data})
    self:onShowEquipInfoWindow(self.TYPESHOW.NONE)
end

---点击卸下
function Equip_PopupDetail:onBtnDischargeClick()
    local gId = self.selectEquipData.gId
    EquipMgr:sendPutDownEquip({heroId = EquipMgr:getCurSelectHero().id, equipId = gId}) --卸下装备
end
