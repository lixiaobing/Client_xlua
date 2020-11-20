--[[
    精灵升级成功弹出面板
    @Liukeming 2020-6-19
]]

local M = DClass('HeroLevelupPanel', HeroBasePanel)
_G.HeroLevelupPanel = M

function M:onInit()
    --lang
    self:getText('nodeAttrs/nodeAttack/txtTitle').text = Lang(1401020)
    self:getText('nodeAttrs/nodeDefense/txtTitle').text = Lang(1401021)
    self:getText('nodeAttrs/nodeHP/txtTitle').text = Lang(1401022)
    self:getText('nodeAttrs/nodeCrit/txtTitle').text = Lang(1401023)

    --属性
    self.txtLastLevel = self:getText('txtLastLevel')
    self.txtNextLevel = self:getText('txtNextLevel')
    self.txtLastAttack = self:getText('nodeAttrs/nodeAttack/txtLastValue')
    self.txtNextAttack = self:getText('nodeAttrs/nodeAttack/txtNextValue')
    self.txtLastDefense = self:getText('nodeAttrs/nodeDefense/txtLastValue')
    self.txtNextDefense = self:getText('nodeAttrs/nodeDefense/txtNextValue')
    self.txtLastHP = self:getText('nodeAttrs/nodeHP/txtLastValue')
    self.txtNextHP = self:getText('nodeAttrs/nodeHP/txtNextValue')
    self.txtLastCrit = self:getText('nodeAttrs/nodeCrit/txtLastValue')
    self.txtNextCrit = self:getText('nodeAttrs/nodeCrit/txtNextValue')
    self:addClick(self.node, self.onClickClose)
end

function M:setData(lastLevel, nextLevel, lastAttrs, nextAttrs)
    self.lastLevel = lastLevel
    self.nextLevel = nextLevel
    self.lastAttrs = lastAttrs
    self.nextAttrs = nextAttrs
end

function M:onShow()
    self.txtLastLevel.text = self.lastLevel
    self.txtNextLevel.text = self.nextLevel
    self.txtLastAttack.text = self.lastAttrs[AttrType.ATK]
    self.txtNextAttack.text = self.nextAttrs[AttrType.ATK]
    self.txtLastDefense.text = self.lastAttrs[AttrType.DEF]
    self.txtNextDefense.text = self.nextAttrs[AttrType.DEF]
    self.txtLastHP.text = self.lastAttrs[AttrType.HP]
    self.txtNextHP.text = self.nextAttrs[AttrType.HP]
    self.txtLastCrit.text = self.lastAttrs[AttrType.CRIT]
    self.txtNextCrit.text = self.nextAttrs[AttrType.CRIT]
end

function M:onClickClose()
    self:hide()
end