---@class EquipUsedWindow ---提示装备在其他英雄身上装备着
local EquipUsedWindow = DClass("EquipUsedWindow", BaseWindow)
_G.EquipUsedWindow = EquipUsedWindow

function EquipUsedWindow:ctor(data)
    self.listShow = data[1]
    self.callBack = data[2]
end

function EquipUsedWindow:onInit()
    self:addEventHanlder(self.nodes.btnClose.onClick, self.onCloseClick)
    self:addEventHanlder(self.nodes.btnSure.onClick, self.onSureClick)

    self:onInitUI()
end

function EquipUsedWindow:onCloseClick()
    self:close()
end

function EquipUsedWindow:onSureClick()
    if self.callBack then
        self.callBack()
    end
end

function EquipUsedWindow:onInitUI()
    self.nodes.contentPool:InitPool(
        #self.listShow,
        function(index, obj)
            ---@type EquipMgr_EquipData
            local equipData = self.listShow[index]
            local nodeEquipCell = obj.transform:Find("EquipInfoCell").gameObject
            local cpt_Equip = self:createComponent(nodeEquipCell, Equip_EquipedCell)
            cpt_Equip:onUpdateUI(equipData)
            local btnCell = nodeEquipCell:GetComponent(typeof(Button))
            self:addEventHanlder(
                btnCell.onClick,
                function()
                    UIManager.openWindow("EquipInfoWindow",nil,equipData)
                end
            )

            local btnHero = obj.transform:Find("Button_Hero"):GetComponent(typeof(Button))
            local imgIcon = obj.transform:Find("Button_Hero/Image_Icon"):GetComponent(typeof(Image))
            self:addEventHanlder(
                btnHero.onClick,
                function()
                end
            )
            EquipManager:setHeroIcon(self, imgIcon, equipData.heroId)
        end
    )
end
