---@class EquipWindow
local EquipWindow = DClass("EquipWindow", BaseWindow)
_G.EquipWindow = EquipWindow

function EquipWindow:ctor(data)
    EquipMgr:setCurSelectHero(data[1])
    EquipMgr:initEquipingEquips()
end

function EquipWindow:addListeners()
    self.messager:addListener(Msg.EQUIP_OPEN_SELECTSUIT, self.openSelectSuit)
end

function EquipWindow:onDispose()
    self.messager:dispose()
end

function EquipWindow:onAsset()
    self.assetKeys = {
        "UI/Component/EquipInfoCell"
    }
    self.assetComplete = function(index, obj)
        if index == 1 then
            self.cell_EquipInfo = obj:GetComponent(typeof(Button))
        end
    end
end

function EquipWindow:onInit()
    self:addListeners()

    self.nodes.uiGesture:AddHandler(
        UIGestureType.All,
        function(e)
            if e.type == UIGestureType.Move then
                self.nodes.model:RotateModel(-e.deltaPosition.x)
            end
        end
    )
    --self.nodes.nodePopup.gameObject:SetActive(true)
    self.nodes.nodeShowSuit.gameObject:SetActive(false)
    self.cpt_OwnEquip = self:createComponent(self.nodes.nodeOwnEquip, Equip_OwnEquip)
    --self.cpt_PopupSuit = self:createComponent(self.nodes.nodeShowSuit, EquipOwn_ChangeSuit)
    self.cpt_Equip = self:createComponent(self.nodes.nodeEquip, Equip_Equip)
    --self.cpt_Popup = UIUtil.createComponent(self.nodes.nodePopup, Equip_PopupDetail)
end

---@param open number 当前显示的套装id
function EquipWindow:openSelectSuit(open)
    if open then
        UIManager.openWindow("EquipOwnChangeSuitPopup", nil, open)
    else
        UIManager.closeWindow("EquipOwnChangeSuitPopup")
    end
    --self.cpt_PopupSuit.gameObject:SetActive(open)
end

function EquipWindow:onOpen()
    self.cpt_OwnEquip:onOpen()
    --self.cpt_PopupSuit:onInit()
    self.cpt_Equip:onInit()
    --self.cpt_Popup:onInit()
end
