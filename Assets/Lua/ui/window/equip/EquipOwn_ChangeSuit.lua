---@class EquipOwn_ChangeSuit 筛选显示的套装
local EquipOwn_ChangeSuit = DClass("EquipOwn_ChangeSuit", BaseComponent)
_G.EquipOwn_ChangeSuit = EquipOwn_ChangeSuit

function EquipOwn_ChangeSuit:ctor()
    self.messager = Messager.new(self)
end

function EquipOwn_ChangeSuit:addListener()
end

function EquipOwn_ChangeSuit:onDispose()
    self.messager:dispose()
end

function EquipOwn_ChangeSuit:onStart()
    self:onInit()
end

function EquipOwn_ChangeSuit:onInit()
    self:addEventHandler(self.nodes.btnClose.onClick, self.onCloseClick)
    self.curSuitId = 0
    self:onInitUI()
end

function EquipOwn_ChangeSuit:onCloseClick()
    self.gameObject:SetActive(false)
end

function EquipOwn_ChangeSuit:onInitUI()
    self.listSuit = {}
    local listShow = self:getShowList()

    self.nodes.viewSuit:InitPool(
        #listShow,
        function(index, obj)
            local suitId = listShow[index]
            local config = Config.EquipSuit[suitId]

            local btnSelf = obj:GetComponent(typeof(Button))
            local img_Icon = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local ownTag = obj.transform:Find("Image_Owned")
            local txt_Name = obj.transform:Find("Text_Name"):GetComponent(typeof(Text))
            local txt_Count = obj.transform:Find("Text_Count"):GetComponent(typeof(Text))
            local txt_Details = obj.transform:Find("Scroll View/Text_Details"):GetComponent(typeof(Text))
            local img_Select = obj.transform:Find("Image_Select").gameObject

            local allEquips = EquipMgr:getAllEquipDatas()
            
            EquipManager:setSuitIcon(self, img_Icon,suitId)
            if suitId ~= 0 then
                local suitEquips = EquipMgr:getShowEquipBySuit(allEquips, suitId)
                txt_Name.text = config.suit
                local strDetails = ""
                for index, value in ipairs(config.sui_des) do
                    if index == 1 then
                        strDetails = string.format("%s", value)
                    else
                        strDetails = string.format("%s\n%s", strDetails, value)
                    end
                end
                txt_Details.text = strDetails
                txt_Count.text = string.format("X%d", #suitEquips)
            else
                txt_Name.text = Lang(GL_EquipOwnChangeSuitPopup_SuoYou)--"所有"
                txt_Details.text = ""
                txt_Count.text = string.format("X%d", #allEquips)
            end

            img_Select:SetActive(self.curSuitId == suitId)

            local data = {}
            data.suitId = suitId
            data.select = img_Select

            self:addEventHandler(
                btnSelf.onClick,
                function()
                    if self.curSuitId == suitId then
                    else
                        self.curSuitId = suitId
                        MsgCenter.sendMessage(Msg.EQUIP_UPDATE_SHOWEQUIPS, suitId)
                    end
                    for key, value in pairs(self.listSuit) do
                        value.select:SetActive(value.suitId == suitId)
                    end
                    MsgCenter.sendMessage(Msg.EQUIP_OPEN_SELECTSUIT, false)
                end
            )

            table.insert(self.listSuit, data)
        end
    )
end

function EquipOwn_ChangeSuit:getShowList()
    local listSuit = {}
    table.insert(listSuit, 0)
    for key, value in pairs(Config.EquipSuit) do
        table.insert(listSuit, key)
    end
    return listSuit
end
