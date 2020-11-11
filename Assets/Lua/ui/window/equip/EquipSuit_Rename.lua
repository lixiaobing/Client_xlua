---@class EquipSuit_Rename 改名弹框
local EquipSuit_Rename = DClass("EquipSuit_Rename", BaseComponent)
_G.EquipSuit_Rename = EquipSuit_Rename

function EquipSuit_Rename:ctor()
    self.messager = Messager.new(self)
end

function EquipSuit_Rename:addListener()
    self.messager:addListener(Msg.EQUIP_SUIT_RENAMESHOW, self.showRenameNode)
end

function EquipSuit_Rename:onDispose()
    self.messager:dispose()
end

function EquipSuit_Rename:onStart()
    self:addListener()
    self:onInit()
end

function EquipSuit_Rename:onInit()
    self:showRenameNode(false)
    self:addEventHandler(self.nodes.btnSure.onClick, self.onSureClick)
    self:addEventHandler(self.nodes.btnCannel.onClick, self.onCannelClick)
end

function EquipSuit_Rename:onSureClick()
    
    EquipMgr:sendDiyEquipSchemeChangeName(self.suitId, self.nodes.iptName.text)

    --EquipMgr:onRenameSuit(self.suitId, self.nodes.iptName.text)
    self:showRenameNode(false)
end

function EquipSuit_Rename:onCannelClick()
    self:showRenameNode(false)
end

function EquipSuit_Rename:showRenameNode(suitid)
    local show = suitid and true or false
    self.nodes.nodeRename.gameObject:SetActive(show)
    if show then
        self.suitId = suitid
    end
end
