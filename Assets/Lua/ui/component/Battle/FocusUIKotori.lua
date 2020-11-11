---@class FocusUIKotori
local FocusUIKotori = DClass("FocusUIKotori", BaseComponent)
_G.FocusUIKotori = FocusUIKotori

function FocusUIKotori:init(args)
    self.left = self.transform:Find("Left"):GetComponent(typeof(RectTransform))
    self.right = self.transform:Find("Right"):GetComponent(typeof(RectTransform))
    self.focus = self.transform:Find("Focus"):GetComponent(typeof(CanvasGroup))
end

function FocusUIKotori:open()
    local tween1 = GameTween.DOAnchorPosX(self.left, 130, 0.3, true)
    self:tweenPush(tween1)
    local tween2 = GameTween.DOAnchorPosX(self.right, -130, 0.3, true)
    self:tweenPush(tween2)
    local tween3 = GameTween.DOFade(self.focus, 1, 0.3)
    self:tweenPush(tween3)
end

function FocusUIKotori:close(complete)
    local tween1 = GameTween.DOAnchorPosX(self.left, -130, 0.5, true)
    self:tweenPush(tween1)
    local tween2 = GameTween.DOAnchorPosX(self.right, 130, 0.5, true)
    self:tweenPush(tween2)
    local tween3 = GameTween.DOFade(self.focus, 0, 0.5):OnComplete(function()
        if complete then
            complete()
        end
    end)
    self:tweenPush(tween3)
end