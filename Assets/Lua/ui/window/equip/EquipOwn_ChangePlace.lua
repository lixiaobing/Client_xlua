---@class EquipOwn_ChangePlace 显示当前拥有的质点
local EquipOwn_ChangePlace = DClass("EquipOwn_ChangePlace", BaseComponent)
_G.EquipOwn_ChangePlace = EquipOwn_ChangePlace

function EquipOwn_ChangePlace:ctor()
    self.messager = Messager.new(self)
end

function EquipOwn_ChangePlace:addListener()
    self.messager:addListener(Msg.EQUIP_INIT_ASSETS, self.setAssets)
    self.messager:addListener(Msg.EQUIP_CHANGEPLACE_SORT, self.onChangeEquipsSort)
    self.messager:addListener(Msg.EQUIP_UPDATE_SHOWEQUIPS, self.updateShowList)
    self.messager:addListener(Msg.EQUIP_CHANGEPLACE_PLACE, self.showSelectedPlaceEquips)
    self.messager:addListener(Msg.EQUIP_UPDATE_EQUIPDATAS, self.updateShowEquips)
end

function EquipOwn_ChangePlace:setAssets(assets)
    self.prefabEquip = assets[1]
end

function EquipOwn_ChangePlace:onDispose()
    self.messager:dispose()
end

function EquipOwn_ChangePlace:onStart()
    StartCoroutine(
        function()
            self:onResource()
            self:addListener()
            self:onInit()
        end
    )
end

function EquipOwn_ChangePlace:onResource()
    Yield(
        GameAsset.LoadAssets(
            {"UI/Component/EquipInfoCell"},
            function(index, obj)
                if index == 1 then
                    self.prefabEquip = obj
                end
            end
        )
    )
end

local NAME_BTN = "btnPlace%d"
function EquipOwn_ChangePlace:onInit()
    for i = 1, 6 do
        self:addEventHandler(
            self.nodes[string.format(NAME_BTN, i - 1)].onClick,
            function()
                self:showSelectedPlaceEquips(i - 1)
            end
        )
    end

    self.nodes.viewPlaceEquip.prefab = self.prefabEquip.gameObject

    self.curShowSuit = 0
    self.curShowPlace = -1
    self:onInitUI()
end

function EquipOwn_ChangePlace:onInitUI()
    if self.curShowPlace == -1 then
        self:showSelectedPlaceEquips(0)
    else
        self:showSelectedPlaceEquips(self.curShowPlace)
    end
end

---@param placeShow number 显示位置
function EquipOwn_ChangePlace:showSelectedPlaceEquips(placeShow)
    if self.curShowPlace == placeShow then
        return
    end
    self.curShowPlace = placeShow

    self:setTopBtnActive()
    self:updateShowEquips()
end

---刷新位置选中页签
function EquipOwn_ChangePlace:setTopBtnActive()
    for i = 1, 6 do
        local select = self.nodes[string.format(NAME_BTN, i - 1)].transform:Find("Image")
        select.gameObject:SetActive(self.curShowPlace == i - 1)
    end

    MsgCenter.sendMessage(Msg.EQUIP_CHANGEPLACE_PLACE, self.curShowPlace)
end

---刷新选中位置的质点s
function EquipOwn_ChangePlace:updateShowEquips()
    local listShow = self:getShowSortedEquips()
    self.nodes.image_NoEquip:SetActive(#listShow <= 0)
    self.listCptEquips = {}
    self.nodes.viewPlaceEquip:InitPool(
        #listShow,
        function(index, obj)
            ---@type EquipMgr_EquipData
            local data = listShow[index]
            local objSelet = obj.transform:Find("Image_Select").gameObject
            objSelet:SetActive(false)
            local cpt_Equip = self:createComponent(obj.gameObject, Equip_ItemCell)
            cpt_Equip:onUpdateUI(data)
            table.insert(self.listCptEquips, cpt_Equip)
            local btnEquip = obj.transform:GetComponent(typeof(Button))
            self:addEventHandler(
                btnEquip.onClick,
                function()
                    --MsgCenter.sendMessage(Msg.EQUIP_SHOW_EQUIPINFO, {Equip_PopupDetail.TYPESHOW.COMPARE, data})
                    UIManager.openWindow("EquipInfoPopupWindow", nil, Equip_PopupDetail.TYPESHOW.COMPARE, data)
                end
            )
        end
    )
end

---显示排序后的质点s
function EquipOwn_ChangePlace:getShowSortedEquips()
    ---0 筛选总列表  self.listShow
    ---1 筛选套装    self.curShowSuit
    ---2 筛选位置    self.curShowPlace
    ---3 排序规则    self.curSortType

    ---@type table<EquipMgr_EquipData>
    local list = EquipMgr:getAllEquipDatas()
    list = EquipMgr:getEquipsExceptEquiped(list)

    list = EquipMgr:getShowEquipBySuit(list, self.curShowSuit)

    list = EquipMgr:getShowEquipByPlace(list, self.curShowPlace)

    table.sort(
        list,
        function(a, b)
            local config_a = Config.Equip[a.cId]
            local config_b = Config.Equip[b.cId]
            if not self.curSortType or self.curSortType == EquipOwn_Change.sortList[1] then
                return config_a.star > config_b.star
            elseif self.curSortType == EquipOwn_Change.sortList[2] then
                return a.lv > b.lv
            end
        end
    )
    return list
end

---刷新显示的总列表{0,1,2,3,4,5,6,7,8}
function EquipOwn_ChangePlace:updateShowList(suit)
    self.curShowSuit = suit

    self:updateShowEquips()
end

---刷新排序方式
---@param sort string 排序方式
function EquipOwn_ChangePlace:onChangeEquipsSort(sort)
    if sort == self.curSortType then
        return
    end

    self.curSortType = sort
    self:updateShowEquips()
end
