---@class EquipSuitInBagWindow
local EquipSuitInBagWindow = DClass("EquipSuitInBagWindow", BaseWindow)
_G.EquipSuitInBagWindow = EquipSuitInBagWindow

function EquipSuitInBagWindow:onAsset()
end

function EquipSuitInBagWindow:ctor(data)
    self.equipInfo = data[1]
end

function EquipSuitInBagWindow:onInit()
    self.coverCallBack = self.close

    self:onInitList()
end

function EquipSuitInBagWindow:onInitList()
    local listSuits = self:getShowList()
    self.nodes.contentPool:InitPool(
        #listSuits,
        function(index, obj)
            local suitId = listSuits[index]
            local configSuit = Config.EquipSuit[suitId]

            local imgIcon = obj.transform:Find("Image_SuitIcon/Image_Icon"):GetComponent(typeof(Image))
            local txtSuitName = obj.transform:Find("Text_SuitName"):GetComponent(typeof(Text))
            local txtOwnNum = obj.transform:Find("Text_OwnNum"):GetComponent(typeof(Text))
            local objLock = obj.transform:Find("Image_Lock").gameObject
            local btnSelf = obj:GetComponent(typeof(Button))
            self:addEventHandler(
                btnSelf.onClick,
                function()
                    MsgCenter.sendMessage(Msg.BAG_UPDATE_ITEMDATA, suitId)
                    self:close()
                end
            )

            local allEquips = EquipMgr:getAllEquipDatas()
            if suitId ~= 0 then
                local suitEquips = EquipMgr:getShowEquipBySuit(allEquips, suitId)
                txtSuitName.text = configSuit.suit
                txtOwnNum.text = string.format("X%d", #suitEquips)
                EquipManager:setSuitIcon(self, imgIcon, suitId)
            else
                txtSuitName.text = Lang(51030001)--"全部"
                txtOwnNum.text = string.format("X%d", #allEquips)
            end
        end
    )
end

function EquipSuitInBagWindow:getShowList()
    local listSuit = {}
    table.insert(listSuit, 0)
    for key, value in pairs(Config.EquipSuit) do
        table.insert(listSuit, key)
    end
    return listSuit
end
