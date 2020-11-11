---@class EquipSuit_Suit 显示所有的方案
local EquipSuit_Suit = DClass("EquipSuit_Suit", BaseComponent)
_G.EquipSuit_Suit = EquipSuit_Suit

function EquipSuit_Suit:ctor()
    self.messager = Messager.new(self)
end

function EquipSuit_Suit:addListener()
    self.messager:addListener(Msg.EQUIP_SUIT_UPDATESUITS, self.updateShowSuit)
end


function EquipSuit_Suit:dispose()
    self.messager:dispose()
end

function EquipSuit_Suit:onStart()
    self:addListener()
    self:onInit()
end

function EquipSuit_Suit:onInit()
    self:addEventHandler(
        self.nodes.btnRecommend.onClick,
        function()
            self:changeShowSuitState(false)
        end
    )
    self:addEventHandler(
        self.nodes.btnCustom.onClick,
        function()
            self:changeShowSuitState(true)
        end
    )

    self:changeShowSuitState(false)
    self.isCustom = false
end

---设置
function EquipSuit_Suit:changeShowSuitState(custom)
    if self.isCustom == custom then
        return
    end
    self.isCustom = custom
    self:setBtnState(self.nodes.btnCustom, custom)
    self:setBtnState(self.nodes.btnRecommend, not custom)

    self.curSuitId = 0
    MsgCenter.sendMessage(Msg.EQUIP_SUIT_CHANGE, self.curSuitId, self.isCustom)

    self:updateShowSuit()
end

function EquipSuit_Suit:setBtnState(btn, active)
    local select = btn.transform:Find("Image_Select").gameObject
    select:SetActive(active)
end

---刷新显示的套装列表
function EquipSuit_Suit:updateShowSuit()
    
    local list = self:getShowSuitList()
    self.listShowSuit = {}
    self.nodes.contentSuit:InitPool(
        #list,
        function(index, obj)
            local showId = list[index]

            local txt_Name = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local txt_Count = obj.transform:Find("Text_Count"):GetComponent(typeof(Text))
            local img_IconSuit = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local img_Equiped = obj.transform:Find("Image_Equiped").gameObject
            local img_IconHero = img_Equiped.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local img_Select = obj.transform:Find("Image_Select").gameObject
            local btn_Suit = obj:GetComponent(typeof(Button))

            local showSuits, count = EquipMgr:getSuitDatas(showId, self.isCustom)
            txt_Count.text = string.format("%d/5", count)

            if showId == 0 then
                txt_Name.text = Lang(GL_EquipSuit_Suit_DangQian) --"当前"
                img_Equiped.gameObject:SetActive(false)
            else
                --local type = EquipMgr:getSuitType(showId)
                if self.isCustom then --type == EquipManager.SUIT_SELECTED.CURSTOM
                    ---@type EquipMgr_DiyEquipScheme
                    local suitData = EquipMgr:getSuitData(showId, self.isCustom)
                    txt_Name.text = suitData.name
                    img_Equiped.gameObject:SetActive(suitData.heroId)
                else
                    txt_Name.text = Config.EquipPlan[showId].name
                    img_Equiped.gameObject:SetActive(false)
                end
            end
            img_Select:SetActive(showId == 0)

            self:addEventHandler(
                btn_Suit.onClick,
                function()
                    if self.curSuitId == showId then
                        return
                    end
                    self.curSuitId = showId
                    for key, value in pairs(self.listShowSuit) do
                        value.select:SetActive(value.suit == self.curSuitId)
                    end
                    MsgCenter.sendMessage(Msg.EQUIP_SUIT_CHANGE, self.curSuitId, self.isCustom)
                    --if self.curSuitId ~= 0 and self.isCustom then
                        --EquipMgr:sendLookDiyEquipScheme(self.curSuitId) --这里取消发送请求查看自定义方案
                    --end
                end
            )

            local item = {}
            item.suit = showId
            item.select = img_Select

            img_Select:SetActive(showId == self.curSuitId)

            table.insert(self.listShowSuit, item)
        end
    )
end

---获得套装list --TODO 从EquipMgr数据中得到(将当前装备的 缓存在EquipMgr中)
function EquipSuit_Suit:getShowSuitList()
    local list = {}
    table.insert(list, 0)
    if self.isCustom then
        local customs = EquipMgr:getCustomSuits()
        for key, value in pairs(customs) do
            table.insert(list, value.schemeId)
        end

        table.sort(
            list,                       
            function(a, b)
                return a <= b
            end
        )
    else
        for key, value in pairs(Config.EquipPlan) do
            if value.hero_id == EquipMgr:getCurSelectHero().id then
                table.insert(list, value.id)
            end
        end

        table.sort(
            list,
            function(a, b)
                return a <= b
            end
        )
    end
    return list
end
