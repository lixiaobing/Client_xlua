local BattleHeadInfo = DClass("BattleHeadInfo", BaseComponent)
_G.BattleHeadInfo = BattleHeadInfo

function BattleHeadInfo:onStart()
    self.goHeroHead = self.nodes.heroHead
    self.goHeroHead:SetActive(false)
    self.heroHeadWidgets = {}
    self.heroHeadPool = {}
end

--获取组件
function BattleHeadInfo:getWidget(ctrl,onlyExist)
    --找已有的
    for i,widget in ipairs(self.heroHeadWidgets) do
        if widget.ctrl == ctrl then
            return widget
        end
    end
    if onlyExist then
        return
    end
    --再找回收池的
    local heroHead
    for i,widget in ipairs(self.heroHeadPool) do
        heroHead = widget
        table.remove(self.heroHeadPool, i)
        break
    end
    --找不到就创建一个
    if not heroHead then
        local goNewHead = UIUtil.cloneGameObject(self.goHeroHead)
        heroHead = UIUtil.createComponent(goNewHead, BattleHeadWidget)
        heroHead:setRecover(self)
    end
    heroHead.ctrl = ctrl
    return heroHead
end

--回收
function BattleHeadInfo:recoverWidget(widget)
    widget.ctrl = nil
    widget.gameObject:SetActive(false)
    table.insert(self.heroHeadPool, widget)
end

function BattleHeadInfo:onRoleRemoved(ctrl)
    for i,widget in ipairs(self.heroHeadWidgets) do
        if widget.ctrl == ctrl then
            self:recoverWidget(widget)
            return
        end
    end
end

function BattleHeadInfo:onRoleHPChange(ctrl)
    if ctrl.attr:getHp() == ctrl.attr:getMaxHp() then
        return
    end
    if ctrl.type == BattleRole.Hero or ctrl.type == BattleRole.MainHero then
        local widget = self:getWidget(ctrl)
        widget:updateHP()
    end
end

function BattleHeadInfo:onRoleGasChange(ctrl)
    if ctrl.type == BattleRole.Hero or ctrl.type == BattleRole.MainHero then
        local widget = self:getWidget(ctrl, true)
        if widget then
            widget:updateGas()
        end
    end
end

function BattleHeadInfo:onWidgetTimeout(widget)
    self:recoverWidget(widget)
end