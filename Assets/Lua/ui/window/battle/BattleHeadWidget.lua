local BattleHeadWidget = DClass("BattleHeadWidget", BaseComponent)
_G.BattleHeadWidget = BattleHeadWidget

function BattleHeadWidget:onStart()
    self.imageBlood = self.nodes.imageBlood
    self.imageEnergy = self.nodes.imageEnergy
    self.timeout = 0
end

function BattleHeadWidget:setRecover(recover)
    self.recover = recover
    self.transParent = recover.transform
end

function BattleHeadWidget:updateHP()
    if self.ctrl then
        self.imageBlood.fillAmount = self.ctrl.attr:getHpPercent().number
        self.imageEnergy.fillAmount = self.ctrl.attr:getGasPercent().number
        self.gameObject:SetActive(true)
        self.timeout = 0
    end
end

function BattleHeadWidget:updateGas()
    if self.ctrl then
        self.imageEnergy.fillAmount = self.ctrl.attr:getGasPercent().number
    end
end

-- 刷新逻辑根据性能测试情况可选择提到c#层
function BattleHeadWidget:onUpdate()
    if not self.ctrl then
        return
    end
    if self.timeout > 3 then
        if self.recover then
            self.recover:recoverWidget(self)
        end
        return
    end
    local deltaTime = Time.deltaTime
    if not self.ctrl.transform then
        if self.recover then
            self.recover:recoverWidget(self)
        end
        return
    end
    local transHead = self.ctrl.boneNogs.Head.transform
    if not transHead then
        if self.recover then
            self.recover:recoverWidget(self)
        end
        return
    end
    local worldHeadPos = transHead.position
    worldHeadPos.y  = worldHeadPos.y + 0.5
    local screenPos = CameraUtility.getCamera():WorldToScreenPoint(worldHeadPos)
    local ret, localPosition = RectTransformUtility.ScreenPointToLocalPointInRectangle(self.transParent, screenPos, UI.Camera, nil)
    self.transform.anchoredPosition = localPosition
    self.timeout = self.timeout + deltaTime
end