---@class HintCommon
local HintCommon = DClass("HintCommon", BaseComponent)
_G.HintCommon = HintCommon

function HintCommon:init(content, startCallback, destroyCallback)
    self.nodes.content.text = content

    self.nodes.rect.anchoredPosition = Vector2(0, -150)

    self.isComplete = false
    self.tweenMove = GameTween.DOAnchorPosY(self.nodes.rect, 0, 0.6, true)
    self.tweenMove:OnStart(function()
        if startCallback then startCallback(self) end
    end)
    self.tweenMove:OnComplete(function()
        self.isComplete = true
    end)

    self.nodes.canvas.alpha = 0
    GameTween.DOFade(self.nodes.canvas, 1, 0.3)

    GameTween.DOFade(self.nodes.canvas, 0, 0.5):SetDelay(2):OnComplete(function()
        if destroyCallback then destroyCallback(self) end
        if self.tweenMove then
            self.tweenMove:Kill(false)
        end
        GameObject.Destroy(self.gameObject)
    end)
end

function HintCommon:adjustPosY(to)
    if self.tweenMove then
        self.tweenMove:Kill(false)
    end
    self.tweenMove = GameTween.DOAnchorPosY(self.nodes.rect, to.y, 0.6, true)
end