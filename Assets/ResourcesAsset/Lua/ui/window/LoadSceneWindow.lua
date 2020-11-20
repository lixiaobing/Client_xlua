---@class LoadSceneWindow
local LoadSceneWindow = DClass("LoadSceneWindow", BaseWindow)
_G.LoadSceneWindow = LoadSceneWindow

function LoadSceneWindow:onInit()
    self.bar = self.transform:Find("Progress/Bar"):GetComponent(typeof(Image)) 

    self.lastAmount = 0

    self.messager:addListener(Msg.LOAD_SCENE_PROGRESS, self.onProgress)
end

function LoadSceneWindow:onProgress(amount, time)
    -- if amount < self.lastAmount then
    --     LogError(self.lastAmount.."!!!!!!!!!!!!!!!!!!"..amount)
    -- end
    self.lastAmount = amount
    GameTween.DOFillAmount(self.bar, amount, time or 0.5)
end