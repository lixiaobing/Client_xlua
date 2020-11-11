---@class DamageFont
local DamageFont = DClass("DamageFont", BaseComponent)
_G.DamageFont = DamageFont

DamageFont.showBomb = 0

function DamageFont:init(rect, target, tp, num, isCrit)
    num = num.number

    self.container = rect
    self.targetPos = target.position + Vector3(0,1,0)
    self.offset = Vector2(0, 50)

    self.gameObject:SetActive(true)
    
    local sp = CameraUtility.getCamera():WorldToScreenPoint(self.targetPos)
    local b, p = RectTransformUtility.ScreenPointToLocalPointInRectangle(self.container, sp, UI.Camera, nil)
    if b then
        self.nodes.rect.anchoredPosition = p + Vector2(math.random(-50,50), math.random(0,50))
        self.nodes.canvas.alpha = 1
    else
        self.nodes.canvas.alpha = 0
    end

    self.transform.localScale = Vector3.one

    -- local x = math.random(1,100)
    -- if x >= 30 then
    --     isCrit = true
    -- end
    if isCrit then
        if DamageFont.showBomb > 3 then
            self.nodes.bomb.gameObject:SetActive(true)
            DamageFont.showBomb = 0
        else
            self.nodes.bomb.gameObject:SetActive(false)
            DamageFont.showBomb = DamageFont.showBomb + 1
        end
    else
        self.nodes.bomb.gameObject:SetActive(false)
    end

    self.nodes.label.text = num
    -- self.nodes.label.fontSize = 24

    if tp==SkillEffectType.PHYSICS then
        if isCrit then
            self.nodes.label.color = UIUtil.getColor("#FF9653")
        else
            self.nodes.label.color = UIUtil.getColor("#FFFFFF")
        end
        self.nodes.label.text = num
    elseif tp==SkillEffectType.ELEMENT then
        self.nodes.label.color = UIUtil.getColor("#FFFFFF")
        self.nodes.label.text = num
    elseif tp==SkillEffectType.RECOVER then
        self.nodes.label.color = UIUtil.getColor("#95EE69")
        self.nodes.label.text = "+"..num
    end

    self.isPlaying = true
    local tween1 = GameTween.DOScale(self.transform, 1.5, 0.2)
    self:tweenPush(tween1)
    local tween2 = GameTween.DOScale(self.transform, 1, 0.1):SetDelay(0.2)
    self:tweenPush(tween2)
    -- local tween3 = GameTween.DOAnchorPosY(self.nodes.rect, self.nodes.rect.anchoredPosition.y + 50, 0.5, true):SetDelay(0.3)
    -- self:tweenPush(tween3)
    local tween3 = GameTween.DOFade(self.nodes.canvas, 0, 0.01):SetDelay(0.5):OnComplete(function()
        self.nodes.canvas.alpha = 0
        self.gameObject:SetActive(false)
        self.isPlaying = false
    end)
    self:tweenPush(tween3)
end

-- function DamageFont:onUpdate()
--     if not BattleManager.Instance then return end

--     local sp = CameraUtility.getCamera():WorldToScreenPoint(self.targetPos)

--     local b, p = RectTransformUtility.ScreenPointToLocalPointInRectangle(self.container, sp, UI.Camera, nil)
--     if b then
--         self.nodes.rect.anchoredPosition = p + self.offset
--     else
--         self.nodes.canvas.alpha = 0
--     end
-- end