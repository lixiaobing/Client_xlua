---@class EquipOwn_Change
local EquipOwn_Change = DClass("EquipOwn_Change", BaseComponent)
_G.EquipOwn_Change = EquipOwn_Change

function EquipOwn_Change:ctor()
    self.messager = Messager.new(self)
end

function EquipOwn_Change:addListener()
    self.messager:addListener(Msg.EQUIP_UPDATE_SHOWEQUIPS, self.updateShowList)
end

function EquipOwn_Change:onDispose()
    self.messager:dispose()
end

function EquipOwn_Change:onStart()
    self:addListener()
    self:onInit()
end

function EquipOwn_Change:onInit()
    self.cpn_Place = self:createComponent(self.nodes.nodePlace, EquipOwn_ChangePlace)

    self:addEventHandler(self.nodes.btnSelectSuit.onClick, self.onBtnSelectSuitClick)

    self:addEventHandler(self.nodes.btnPlace.onClick, self.onBtnPlaceClick)
    self:addEventHandler(self.nodes.btnSuit.onClick, self.onBtnSuitClick)

    self:addEventHandler(self.nodes.btnSortPlace.onClick, self.onBtnSortClick)
    self:addEventHandler(self.nodes.btnEquipSuit.onClick, self.onEquipSuitClick)
    self:addEventHandler(self.nodes.btnCloseTopViews.onClick, self.onCloseTopView)

    self:onInitUI()
end

function EquipOwn_Change:onOpen()
    self.cpn_Place:onInitUI()
end

---打开套装筛选
function EquipOwn_Change:onBtnSelectSuitClick()
    MsgCenter.sendMessage(Msg.EQUIP_OPEN_SELECTSUIT, self.suitId)
end

EquipOwn_Change.sortList = {Lang(51030004), Lang(51030042)}--"星级" "等级"

function EquipOwn_Change:onInitUI()
    self:updateShowList(0)
    self.curSelectSort = self.sortList[1]
    self:onSortPlaceChange()
    self.nodes.btnCloseTopViews.gameObject:SetActive(false)
    self:onCloseTopView()

    self.showPlaceState = false
    self:showPlaceNode(true)
end

function EquipOwn_Change:updateShowList(suit)
    if self.suitId == suit then
        return
    else
        self.suitId = suit
    end

    local txt_CurSuit = self.nodes.btnSelectSuit.transform:Find("Text"):GetComponent(typeof(Text))
    local img_Icon = self.nodes.btnSelectSuit.transform:Find("Image_Icon"):GetComponent(typeof(Image))
    local config = Config.EquipSuit[suit]
    if config then
        txt_CurSuit.text = config.suit
    else
        txt_CurSuit.text = Lang(GL_EquipOwnChangeSuitPopup_SuoYou)--"所有"
    end
end

function EquipOwn_Change:showPlaceNode(showPlace)
    if self.showPlaceState == showPlace then
        return
    end
    self.showPlaceState = showPlace

    self.nodes.btnPlace.transform:Find("Image").gameObject:SetActive(showPlace)
    self.nodes.btnSuit.transform:Find("Image").gameObject:SetActive(not showPlace)
    self.nodes.nodePlace:SetActive(showPlace)
    
    if showPlace then
        self.cpn_Place:onInitUI()
    else
        --self.cpn_Suit:onInitUI()
    end
end

function EquipOwn_Change:onBtnPlaceClick()
    self:showPlaceNode(true)
end

function EquipOwn_Change:onBtnSuitClick()
    self:showPlaceNode(false)
end

function EquipOwn_Change:onBtnSortClick()
    if self.nodes.viewSortPlace.gameObject.activeSelf then
        self:onCloseTopView()
    end

    self.nodes.btnCloseTopViews.gameObject:SetActive(true)
    self:showSortPlaceView()
end

function EquipOwn_Change:onEquipSuitClick()
    if self.nodes.viewEquipSuit.gameObject.activeSelf then
        self:onCloseTopView()
    end

    self.nodes.btnCloseTopViews.gameObject:SetActive(true)
    self:showEquipSuitView()
end

function EquipOwn_Change:onCloseTopView()
    self.nodes.viewSortPlace.scrollRect.gameObject:SetActive(false)
    self.nodes.viewEquipSuit.scrollRect.gameObject:SetActive(false)

    self.nodes.btnCloseTopViews.gameObject:SetActive(false)
end

---展示 位置页签内排序
function EquipOwn_Change:showSortPlaceView()
    self.nodes.viewSortPlace.scrollRect.gameObject:SetActive(true)
    self.listSortItem = {}
    self.nodes.viewSortPlace:InitPool(
        #self.sortList,
        function(index, obj)
            local str = self.sortList[index]
            local btn = obj:GetComponent(typeof(Button))
            local txt = obj.transform:Find("Text"):GetComponent(typeof(Text))
            local select = obj.transform:Find("Image_Select")
            txt.text = str
            select.gameObject:SetActive(str == self.curSelectSort)

            local data = {}
            data.key = str
            data.select = select

            self:addEventHandler(
                btn.onClick,
                function()
                    for index, value in ipairs(self.listSortItem) do
                        local check = value.key == data.key
                        value.select.gameObject:SetActive(check)
                        if check and self.curSelectSort ~= value.key then
                            self.curSelectSort = value.key
                            self:onSortPlaceChange()
                        end
                    end
                    self:onCloseTopView()
                end
            )

            table.insert(self.listSortItem, data)
        end
    )
end

---排序规则刷新
function EquipOwn_Change:onSortPlaceChange()
    local txt = self.nodes.btnSortPlace.transform:Find("Text"):GetComponent(typeof(Text))
    txt.text = self.curSelectSort
    
    MsgCenter.sendMessage(Msg.EQUIP_CHANGEPLACE_SORT, self.curSelectSort)
end

---展示 更换套装
function EquipOwn_Change:showEquipSuitView()
    self.nodes.viewEquipSuit.scrollRect.gameObject:SetActive(true)
    self.listSuitItem = {}
    local sortList = {}

    self.nodes.viewEquipSuit:InitPool(
        #sortList,
        function(index, obj)
            local str = sortList[index]
            local btn = obj:GetComponent(typeof(Button))
            local txt = obj.transform:Find("Text"):GetComponent(typeof(Text))
            local select = obj.transform:Find("Image_Select")
            txt.text = str
            select.gameObject:SetActive(str == self.curSelectSuit)
            local data = {}
            data.key = str
            data.select = select

            self:addEventHandler(
                btn.onClick,
                function()
                    for index, value in ipairs(self.listSuitItem) do
                        local check = value.key == data.key
                        value.select.gameObject:SetActive(check)
                        if check and self.curSelectSuit ~= value.key then
                            self.curSelectSuit = value.key
                            self:onSuitChange()
                        end
                    end
                    self:onCloseTopView()
                end
            )

            table.insert(self.listSuitItem, data)
        end
    )
end

---排序规则刷新
function EquipOwn_Change:onSuitChange()
    local txt = self.nodes.btnEquipSuit.transform:Find("Text"):GetComponent(typeof(Text))
    txt.text = self.curSelectSuit
    
end
