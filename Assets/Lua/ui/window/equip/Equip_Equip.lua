---@class Equip_Equip
local Equip_Equip = DClass("Equip_Equip", BaseComponent)
_G.Equip_Equip = Equip_Equip

function Equip_Equip:ctor()
    self.messager = Messager.new(self)
end

function Equip_Equip:addListener()
    self.messager:addListener(Msg.EQUIP_CHANGEPLACE_PLACE, self.onClickPlace)
    self.messager:addListener(Msg.EQUIP_UPDATE_EQUIPDATAS, self.updateAllEquipedEquips)
end

function Equip_Equip:onDispose()
    self.messager:dispose()
end

function Equip_Equip:onStart()
    self:addListener()
    self.curSelectPlace = 0
    self.listPlacesData = {}
    self:onInit()
end

function Equip_Equip:onInit()
    self:addEventHandler(self.nodes.btnDischarge.onClick, self.onDischargeClick)
    self:addEventHandler(self.nodes.btnPlan.onClick, self.onPlanClick)
    self:addEventHandler(self.nodes.btnDetails.onClick, self.onOpenDetails)

    self:refreshSelectHero()

    self:initPlaces()
    self:onInitUI()
end

function Equip_Equip:onOpenDetails()
    UIManager.openWindow("EquipInfoPopupWindow", nil, Equip_PopupDetail.TYPESHOW.SUITDETAILS, nil)
end

function Equip_Equip:initPlaces()
    self.equipedEquips = EquipMgr:getEquipingEquips()
    for i = 1, 5 do
        self:setEquipEquip(i)
    end
end

function Equip_Equip:onDischargeClick()
    
    local data = {}
    data.title = ""
    data.content = Lang(GL_Equip_Equip_QueRenXieSuoYou) --"确认卸下所有当前装备质点吗？"
    data.buttonNames = {Lang(51030031),Lang(51030030)}--{"取消", "确认"}
    data.buttonTypes = {1, 2}
    data.callback = function(sort)
        if sort == 2 then
            EquipMgr:sendPutDownAllEquips(EquipMgr:getCurSelectHero().id) -- 发送卸下所有装备
        end
    end

    MsgCenter.sendMessage(Msg.NOTIFY, data)
end

function Equip_Equip:onPlanClick()
    
    UIManager.openWindow("EquipSuitWindow")
end

function Equip_Equip:refreshSelectHero()
    local cfg = Config.Hero[EquipMgr:getCurSelectHero().id]
    local model_info = EquipMgr:getCurSelectHero().config.model_info
    self.nodes.model:LoadModel("Model/Angle/" .. cfg.weapon_model, model_info.height)
end

function Equip_Equip:onInitUI()
end

---设置装备的质点信息
function Equip_Equip:setEquipEquip(place)
    local nameNode = string.format("place%d", place)
    local nodePlace = self.nodes[nameNode]

    local nodeShow = nodePlace.transform:Find("NodeShow")
    local nodeEquip = nodePlace.transform:Find("NodeEquip")
    local btnAdd = nodePlace.transform:Find("Button_Add"):GetComponent(typeof(Button))
    local select = btnAdd.transform:Find("Image_Select")
    local nodeEquipInfo = nodeEquip.transform:Find("EquipInfoCell")
    select.gameObject:SetActive(place == self.curSelectPlace)
    self:addEventHandler(
        btnAdd.onClick,
        function()
            local data = {}
            self:onClickPlace(place, true)
        end
    )
    local cpt_place = self:createComponent(nodeEquipInfo.gameObject, Equip_EquipedCell)
    cpt_place:onUpdateUI(self.equipedEquips[place])

    local item = {}
    item.place = place
    item.select = select
    item.cpt = cpt_place
    self.listPlacesData[place] = item
end

---点击装备质点框
function Equip_Equip:onClickPlace(place, isClickEquip)
    if not isClickEquip then
        if self.curSelectPlace == place then
            return
        end
    end

    self.curSelectPlace = place
    for index, value in ipairs(self.listPlacesData) do
        value.select.gameObject:SetActive(value.place == place)
    end
    MsgCenter.sendMessage(Msg.EQUIP_CHANGEPLACE_PLACE, place)

    self.equipedEquips = EquipMgr:getEquipingEquips()
    if isClickEquip and self.equipedEquips[place] then
        local data = self.equipedEquips[place]
        if data then
            UIManager.openWindow("EquipInfoPopupWindow", nil, Equip_PopupDetail.TYPESHOW.DISCHARGE, data)
        end
    end
end

---刷新卸下按钮状态
function Equip_Equip:onUpdateDischargeBtn()
    self.equipedEquips = EquipMgr:getEquipingEquips()
    if self.equipedEquips[self.curSelectPlace] then
        self.nodes.btnDischarge.gameObject:SetActive(true)
    else
        self.nodes.btnDischarge.gameObject:SetActive(false)
    end
end

---装备的质点数据更改 刷新装备的UI
function Equip_Equip:updateAllEquipedEquips()
    local equipedEquipDatas = EquipMgr:getEquipingEquips()

    for i = 1, 5 do
        self.listPlacesData[i].cpt:onUpdateUI(equipedEquipDatas[i])
    end
end
