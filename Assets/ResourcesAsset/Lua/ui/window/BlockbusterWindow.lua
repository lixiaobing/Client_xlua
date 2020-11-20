---@class DialogWindow
local BlockbusterWindow = DClass("BlockbusterWindow", BaseWindow)
_G.BlockbusterWindow = BlockbusterWindow
function BlockbusterWindow:ctor()

end
function BlockbusterWindow:onInit()
    local rectTransform = self.nodes.ContainerTop:GetComponent(typeof(RectTransform))
    rectTransform.anchoredPosition = Vector2(rectTransform.anchoredPosition.x, 75)
    local tween1 = GameTween.DOAnchorPosY(rectTransform, -75, 1, true)
    self:tweenPush(tween1)
    rectTransform = self.nodes.ContainerBottom:GetComponent(typeof(RectTransform))
    rectTransform.anchoredPosition = Vector2(rectTransform.anchoredPosition.x, -75)
    local tween2 = GameTween.DOAnchorPosY(rectTransform, 75, 1, true)
    self:tweenPush(tween2)
end


function BlockbusterWindow:close()
    if not self.closeIng then
        self.closeIng = true
        local rectTransform = self.nodes.ContainerTop:GetComponent(typeof(RectTransform))
        local tween1 = GameTween.DOAnchorPosY(rectTransform, 75, 1, true)
        self:tweenPush(tween1)
        rectTransform = self.nodes.ContainerBottom:GetComponent(typeof(RectTransform))
        local tween2 = GameTween.DOAnchorPosY(rectTransform, -75, 1, true):OnComplete(function()
            self.super.close(self)
           end)
        self:tweenPush(tween2)
    end
end

