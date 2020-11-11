-- 多管血条掉血多管过渡表现效果组件
local BattleTargetWidget = DClass("BattleTargetWidget", BaseComponent)
_G.BattleTargetWidget = BattleTargetWidget

function BattleTargetWidget:onStart()
    local nodes = self.nodes
    self.imageBack = nodes.imageBack
    self.imageBackFade = nodes.imageBackFade
    self.imageFront = nodes.imageFront
    self.imageFrontFade = nodes.imageFrontFade
    self.textPipe = nodes.textPipe
    self.transBlood = nodes.blood
    self.imageArmor = nodes.imageArmor

    self.oldHP = 0
    -- 过渡
    self.fadeTime = 0.8
    self.needFade = false
    self.fadeSpeed = 0
    self.hpSlide = 0
    self.hpSlideTarget = 0
    self.nPipeMax = 1
    self.perSlideMax = 1
    self.nFrontPipeIndex = 0
    -- 震动
    self.shakeParam = Vector2(0,0)
    -- input param: 震动范围
    self.shakeRadius = 3
    -- input param: 震动次数
    self.shakeTimes = 20
    -- input param: 震动时间
    self.shakeTimeMax = 0.2
    self.shakeInterval = self.shakeTimeMax / self.shakeTimes
    self.shakeTimeout = 0
    self.shakeTime = 0
    self.shakeIntervalTime = 0
    self.needShake = 0
    -- 特效
    self.bloodWidth = self.imageBack.transform.sizeDelta.x
    self.effectXOffset = -self.bloodWidth / 2
    
    -- 有可能会设计成交替血条颜色，预留方案
    self.bloodColors = {
        Color(180/255, 180/255, 180/255),            --imageBack
        Color(255/255, 0/255, 0/255, 140/255),       --imageBackFade
        Color(255/255, 255/255, 255/255),            --imageFront
        Color(255/255, 0/255, 0/255, 220/255),       --imageFrontFade
    }
    -- 前后背景和过渡颜色
    self.imageBack.color = self.bloodColors[1]
    self.imageBackFade.color = self.bloodColors[2]
    self.imageFront.color = self.bloodColors[3]
    self.imageFrontFade.color = self.bloodColors[4]
end

function BattleTargetWidget:setEffectOrigin(effectOrigin)
    self.effect = UIUtil.addEffect(effectOrigin, self.transBlood)
    -- -- 需要搞一个不自动销毁的资源创建接口
    -- local effectCtrl = self.effect.transform:GetComponent(typeof(EffectControll))
    -- effectCtrl.onFinished:RemoveAllListeners()
    self.effect.gameObject:SetActive(false)
end

function BattleTargetWidget:setTarget(targetId)
    if not targetId then 
        if self.transform and self.transform.gameObject.activeSelf then
            self.transform.gameObject:SetActive(false)
        end
        return
    end
    
    local ctrl = BattleLogic.Instance:getEntityById(targetId)
    if ctrl then
        self.targetCtrl = ctrl
        if self.targetId ~= targetId then
            self.targetId = targetId
            self.nodes.textName.text = ctrl.config.name
            self.nPipeMax = ctrl.config.health_num
            -- 注意 maxHP可能会改变
            self.maxHp = ctrl.attr:getMaxHp().number
        end
        if not self.transform.gameObject.activeSelf then
            self.oldHP = ctrl.attr:getHp().number
            self.transform.gameObject:SetActive(true)
            self:onHPChange(self.oldHP, true)
        end
        self.timeout = Time.deltaTime + 3
    else
        self.targetId = nil
    end
end

function BattleTargetWidget:onHPChange(newHP, isNewTarget)
    self.hpSlideTarget = newHP
    if self.hpSlide < self.hpSlideTarget then
        self.hpSlide = self.hpSlideTarget
    end
    -- 计算每一管血量
    self.perSlideMax = self.maxHp / self.nPipeMax
    -- 计算当前是第几管血
    self.nFrontPipeIndex = math.floor(newHP / self.perSlideMax)
    if self.nFrontPipeIndex >= self.nPipeMax then
        self.nFrontPipeIndex = self.nPipeMax-1
        self.imageFront.fillAmount = 1
    else
        self.imageFront.fillAmount = (newHP % self.perSlideMax) / self.perSlideMax
    end
    if self.nFrontPipeIndex < 1 then
        --小于一管
        self.imageBack.fillAmount = 0
        self.imageBack.gameObject:SetActive(false)
    else
        self.imageBack.fillAmount = 1
        self.imageBack.gameObject:SetActive(true)
    end
    self.textPipe.text = "x" .. (self.nFrontPipeIndex + 1)
    if isNewTarget then
        self.needFade = false
        self.imageBackFade.fillAmount = 0
        self.imageFrontFade.fillAmount = 0
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

-- 刷新逻辑根据性能测试情况可选择提到c#层
function BattleTargetWidget:onUpdate()
    if not self.targetId then
        return
    end
    local newHP = self.targetCtrl.attr:getHp().number
    if newHP ~= self.oldHP then
        self.oldHP = newHP
        -- do update fade and shake
        self:onHPChange(newHP)
    end
    local deltaTime = Time.deltaTime
    self:updateFade(deltaTime)
    self:updateShake(deltaTime)
    self:updateArmor()
end


function BattleTargetWidget:updateFade(deltaTime)
    if deltaTime > self.timeout then
        self.targetId = nil
        self.targetCtrl = nil
        self.transform.gameObject:SetActive(false)
        return
    end
    if self.needFade then
        local offset = math.abs(self.hpSlide - self.hpSlideTarget)
        if offset > 0.001 then
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
            local frontFadePipeIndex = math.floor(self.hpSlide / self.perSlideMax)
            local fadeRate = (self.hpSlide % self.perSlideMax) / self.perSlideMax
            if  frontFadePipeIndex > 0 and frontFadePipeIndex > self.nFrontPipeIndex then
                self.imageBackFade.fillAmount = 1
                self.imageFrontFade.fillAmount = fadeRate
            else
                self.imageBackFade.fillAmount = fadeRate
                self.imageFrontFade.fillAmount = 0
            end
        else
            self.needFade = false
        end
    end
end

function BattleTargetWidget:updateShake(deltaTime)
    if not self.needShake then
        return
    end
    if self.shakeIntervalTime > self.shakeInterval then
        self.shakeIntervalTime = 0
        self.shakeParam.x = math.random(-self.shakeRadius, self.shakeRadius)
        self.shakeParam.y = math.random(-self.shakeRadius, self.shakeRadius)
        self.transBlood.anchoredPosition = self.shakeParam
    end

    if self.shakeTime > self.shakeTimeout then
        self.needShake = false
        self.shakeParam.x = 0
        self.shakeParam.y = 0
        self.transBlood.anchoredPosition = self.shakeParam
        return
    end
    self.shakeTime = self.shakeTime + deltaTime
    self.shakeIntervalTime = self.shakeIntervalTime + deltaTime
end

function BattleTargetWidget:updateArmor()
    if self.targetCtrl then
        local max = BattleCalculates.cal_armor(self.targetCtrl.attr)
        if max.number > 0 then
            self.imageArmor.transform.parent.gameObject:SetActive(true)
            self.imageArmor.fillAmount = self.targetCtrl.attr:getArmorPercent().number
        else
            self.imageArmor.transform.parent.gameObject:SetActive(false)
        end
    end
end