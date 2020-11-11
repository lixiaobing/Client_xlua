---@class DialogWindow
local NarratorWindow = DClass("NarratorWindow", BaseWindow)
_G.NarratorWindow = NarratorWindow
local speed = 20*0.001
function NarratorWindow:ctor(data)
    self.textId = data[1]
    self.style  = data[2] or 0
end

function NarratorWindow:onInit()
    self.messager:addListener(Msg.NARRATOR_TEXT_REFRESH, self.onTextRefresh)
    self:onTextRefresh(self.textId,self.style)
end

function NarratorWindow:onTextRefresh(textId,style)
    self.nodes.imageBlackBottom.gameObject:SetActive(false)
    self.nodes.textContentTopLeft.gameObject:SetActive(false)
    local text  = Lang(textId)
    if style == 0 then 
    	self.nodes.imageBlackBottom.gameObject:SetActive(true)
    	self.nodes.textContent.text = text
	elseif style == 1 then
		self.nodes.textContentTopLeft.gameObject:SetActive(true)
		self.nodes.textContentTopLeft.text = text
        local color = self.nodes.textContentTopLeft.color
        color.a = 0
        self.nodes.textContentTopLeft.color = color
        local fadeIn = GameTween.DOFade(self.nodes.textContentTopLeft, 1, 1.5 )
        self:tweenPush(fadeIn)
	end
end


function NarratorWindow:closeEx()
    local tween = GameTween.DOFade(self.nodes.canvasGroupRoot, 0, 1):OnComplete(function()
        self:close()
       end)
    self:tweenPush(tween)
end
