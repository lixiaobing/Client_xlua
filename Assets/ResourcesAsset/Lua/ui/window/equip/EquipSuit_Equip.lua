---@class EquipSuit_Equip 显示已经装备的
local EquipSuit_Equip = DClass("EquipSuit_Equip", BaseComponent)
_G.EquipSuit_Equip = EquipSuit_Equip

function EquipSuit_Equip:ctor()
    self.messager = Messager.new(self)
end

function EquipSuit_Equip:addListener()
    self.messager:addListener(Msg.EQUIP_SUIT_CHANGE, self.setControllSuitState)
end

function EquipSuit_Equip:dispose()
    self.messager:dispose()
    self.cpt_Details:dispose()
end

function EquipSuit_Equip:onStart()
    self:addListener()
    self:onInit()
end

function EquipSuit_Equip:onInit()
    self.cpt_Details = self:createComponent(self.nodes.nodeDetails, EquipSuit_Details)

    self:addEventHandler(
        self.nodes.btnDetails.onClick,
        function()
            self:changeShowState(true)
        end
    )
    self:addEventHandler(
        self.nodes.btnGroup.onClick,
        function()
            self:changeShowState(false)
        end
    )

    self:addEventHandler(self.nodes.btnSave.onClick, self.onSaveSuit)
    self:addEventHandler(
        self.nodes.btnUse.onClick,
        function()
            self:onUseSuit(true)
        end
    )
    self:addEventHandler(
        self.nodes.btnEquip.onClick,
        function()
            self:onUseSuit(false)
        end
    )
    self:addEventHandler(self.nodes.btnRename.onClick, self.onRenameSuit)
    self:addEventHandler(self.nodes.btnDelete.onClick, self.onDeleteSuit)

    self:changeShowState(false)
    self.showDetails = false
    self:refreshSelectHero()
    self:initPlaces()
end

function EquipSuit_Equip:onSaveSuit()
    EquipMgr:sendAddDiyEquipScheme(self.nodes.iptSuitName.text)
    self.nodes.iptSuitName.text = ""

    --EquipMgr:setCustomSuit(self.curSuitId, self.nodes.iptSuitName.text, self.equipedEquips)
end

function EquipSuit_Equip:onUseSuit(isCustom)
    ---@type HERO_REQ_USE_EQUIP_SCHEME
    local data = {}
    data.type = isCustom
    data.schemeId = self.curSuitId
    data.heroId = EquipMgr:getCurSelectHero().id
    data.equipIds = {}
    for key, value in pairs(self.listSuitDatas) do
        if EquipManager:checkEquipOwn(value.cId) then
            table.insert(data.equipIds, value.gId)
        end
    end

    if
        not self:checkEquipable(
            data.equipIds,
            function()
                EquipMgr:sendUseEquipScheme(data)
            end
        )
     then
        EquipMgr:sendUseEquipScheme(data)
    end

    --EquipMgr:onEquipSuit(self.curSuitId, self.equipedEquips)
end

---检测是否有被装备的质点
function EquipSuit_Equip:checkEquipable(listGid, callBack)
    local beEquiped = false
    local curHeroId = EquipMgr:getCurSelectHero().id
    local listEquiped = {}

    for key, value in pairs(listGid) do
        ---@type EquipMgr_EquipData
        local equipData = EquipMgr:getEquipDataByGid(value)
        if equipData then
            if equipData.heroId > 0 and curHeroId ~= equipData.heroId then
                table.insert(listEquiped, equipData)
                beEquiped = true
            end
        end
    end

    if beEquiped then
        UIManager.openWindow("EquipUsedWindow", nil, {listEquiped, callBack})
    end

    return beEquiped
end

function EquipSuit_Equip:onRenameSuit()
    MsgCenter.sendMessage(Msg.EQUIP_SUIT_RENAMESHOW, self.curSuitId)
end

function EquipSuit_Equip:onDeleteSuit()
    EquipMgr:sendDeleteDiyEquipScheme(self.curSuitId)
    --EquipMgr:onDeleteSuit(self.curSuitId)
end

function EquipSuit_Equip:refreshSelectHero()
    local pathModel = "Angle/A_Tokisaki_01" ---当前选中英雄的武器路径 table.Hero.weapon_math
    local hightModel = 1
    self.nodes.model:LoadModel("Model/" .. pathModel, hightModel)
end

---设置
function EquipSuit_Equip:changeShowState(details)
    if self.showDetails == details then
        return
    end
    self.showDetails = details
    self:setBtnState(self.nodes.btnDetails, details)
    self:setBtnState(self.nodes.btnGroup, not details)
    
    self:updateNodeSuit()
end

function EquipSuit_Equip:setBtnState(btn, active)
    local select = btn.transform:Find("Image_Select").gameObject
    select:SetActive(active)
end

function EquipSuit_Equip:updateNodeSuit()
    self.nodes.nodeDetails:SetActive(self.showDetails)
    self.nodes.nodePlaces:SetActive(not self.showDetails)
end

---显示套装操作栏
---@param suitSelect number
function EquipSuit_Equip:setControllSuitState(suitId, isCustom)
    if self.curSuitId == suitId then
        return
    end
    self.curSuitId = suitId

    local suitType = EquipMgr:getSuitType(suitId, isCustom)

    self.nodes.nodeSaveSuit:SetActive(suitType == EquipManager.SUIT_SELECTED.EQUIPING)
    self.nodes.nodeRecommend:SetActive(suitType == EquipManager.SUIT_SELECTED.RECOMMEND)
    self.nodes.nodeCustom:SetActive(suitType == EquipManager.SUIT_SELECTED.CURSTOM)

    if suitId == 0 then
        self.equipedEquips = EquipMgr:getEquipingEquips()
    else
        self.equipedEquips = EquipMgr:getSuitDatas(suitId, isCustom)
    end

    local hasOwnEquip = false
    for i = 1, #self.listPlacesData do
        ---@type EquipMgr_EquipData
        local _data = nil
        for key, value in pairs(self.equipedEquips) do
            local cfgEquip = Config.Equip[value.cId]
            if cfgEquip and cfgEquip.item_position == i then
                _data = {}
                _data = clone(value)
            end
        end

        self.listPlacesData[i].cpt:onUpdateUI(_data)
        self.listSuitDatas[i] = _data

        if _data and EquipManager:checkEquipOwn(_data.cId) then
            hasOwnEquip = true
        end
    end

    if suitType == EquipManager.SUIT_SELECTED.EQUIPING then
        self.nodes.nodeSaveSuit:SetActive(hasOwnEquip)
    elseif suitType == EquipManager.SUIT_SELECTED.RECOMMEND then
        self.nodes.btnUse.gameObject:SetActive(hasOwnEquip)
    elseif suitType == EquipManager.SUIT_SELECTED.CURSTOM then
        self.nodes.btnEquip.gameObject:SetActive(hasOwnEquip)
    end
end

function EquipSuit_Equip:initPlaces()
    self.curSelectPlace = 0
    self.listPlacesData = {} --当前显示UI组件信息
    self.listSuitDatas = {} ---当前显示套装中每个位置上的质点信息
    --self.equipedEquips = EquipMgr:getEquipingEquips()
    for i = 1, 5 do
        self:setEquipEquip(i)
    end
end

---设置装备的质点信息
function EquipSuit_Equip:setEquipEquip(place)
    local nameNode = string.format("place%d", place)
    local nodePlace = self.nodes[nameNode]

    local nodeShow = nodePlace.transform:Find("NodeShow")
    local nodeEquip = nodePlace.transform:Find("NodeEquip")
    local btnAdd = nodePlace.transform:Find("Button_Add"):GetComponent(typeof(Button))
    local select = btnAdd.transform:Find("Image_Select")
    local nodeEquipInfo = nodeEquip.transform:Find("EquipInfoCell")
    select.gameObject:SetActive(false)
    self:addEventHandler(
        btnAdd.onClick,
        function()
            local data = {}
            --MsgCenter.sendMessage(Msg.EQUIP_SHOW_EQUIPINFO, {Equip_PopupDetail.TYPESHOW.EQUIP, data})
            self:onClickPlace(place)
        end
    )
    local cpt_place = self:createComponent(nodeEquipInfo.gameObject, Equip_EquipedCell)
    --cpt_place:onUpdateUI(self.equipedEquips[place])

    local item = {}
    item.place = place
    item.select = select
    item.cpt = cpt_place
    self.listPlacesData[place] = item
end

---点击装备质点框
function EquipSuit_Equip:onClickPlace(place)
    -- if self.curSelectPlace == place then
    --     return
    -- end
    --self.curSelectPlace = place

    local data = self.listSuitDatas[place]
    if EquipManager:checkEquipOwn(data.cId) then
        UIManager.openWindow("EquipInfoWindow", nil, data)
    else
        local cfg = Config.Equip[data.cId]
        UIManager.openWindow("JumpGetWindow", nil, {cfg.jump_id, cfg.jump_des})
    end
    --MsgCenter.sendMessage(Msg.EQUIP_CHANGEPLACE_PLACE, place)
end

---刷新展示的套装
function EquipSuit_Equip:updateEquipSuit()
end
