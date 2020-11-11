-- 多管血条掉血单管过渡表现效果组件
local BattleTargetSingleWidget = DClass("BattleTargetSingleWidget", BattleTargetWidget)
_G.BattleTargetSingleWidget = BattleTargetSingleWidget

function BattleTargetSingleWidget:onStart()
    self.super.onStart(self)
    -- 单血条这种版本不用frontFade
    self.imageFrontFade.gameObject:SetActive(false)
end

function BattleTargetSingleWidget:onHPChange(newHP, isNewTarget)
    -- 计算每一管血量
    self.nPipeMax = self.nPipeMax or 1
    self.perSlideMax = self.maxHp / self.nPipeMax
    -- 计算当前是第几管血
    self.nFrontPipeIndex = math.floor(newHP / self.perSlideMax)
    if self.nFrontPipeIndex >= self.nPipeMax then
        self.nFrontPipeIndex = self.nPipeMax-1
        self.hpSlideTarget = 1
    else
        self.hpSlideTarget = (newHP % self.perSlideMax) / self.perSlideMax
    end
    self.imageFront.fillAmount = self.hpSlideTarget
    if self.hpSlide < self.hpSlideTarget then
        self.hpSlide = self.hpSlideTarget
    end
    if self.nFrontPipeIndex < 1 then
        --小于一管
        self.imageBack.fillAmount = 0
    else
        self.imageBack.fillAmount = 1
    end
    self.textPipe.text = "x" .. (self.nFrontPipeIndex + 1)
    if isNewTarget then
        self.needFade = false
        self.imageBackFade.fillAmount = self.imageFront.fillAmount
        self.hpSlide = self.hpSlideTarget
        self.effect.gameObject:SetActive(false)
    else
        -- fade
        self.fadeSpeed = math.abs(self.hpSlide - self.hpSlideTarget) / self.fadeTime
        self.needFade = true
        -- shake
        self.shakeTime = 0
        self.shakeIntervalTime = 0
        self.shakeTimeout = self.shakeTimeMax
        self.needShake = true
        -- effect
        self.effect.gameObject:SetActive(false)
        self.effect.gameObject:SetActive(true)
        local newPos = self.transBlood.localPosition
        newPos.x = newPos.x + self.effectXOffset + self.bloodWidth * self.imageFront.fillAmount
        newPos.y = 2.5
        self.effect.transform.localPosition = newPos
    end
end

function BattleTargetSingleWidget:updateFade(deltaTime)
    if deltaTime > self.timeout then
        self.targetId = nil
        self.targetCtrl = nil
        self.transform.gameObject:SetActive(false)
        return
    end
    
    if self.needFade then
        local offset = math.abs(self.hpSlide - self.hpSlideTarget)
        if offset > 0.0001 then
            -- hpSlide close to hpSlideTarget
            if self.hpSlide < self.hpSlideTarget then
                self.hpSlide = self.hpSlide + deltaTime * self.fadeSpeed
                if self.hpSlide > self.hpSlideTarget then
                    self.hpSlide = self.hpSlideTarget
                end
            else
                self.hpSlide = self.hpSlide - deltaTime * self.fadeSpeed
                if self.hpSlide < self.hpSlideTarget then
                    self.hpSlide = self.hpSlideTarget
                end 
            end
            self.imageBackFade.fillAmount = self.hpSlide
        else
            self.needFade = false
        end
    end
end
