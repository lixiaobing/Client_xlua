---@class BattlePauseWindow
local BattlePauseWindow = DClass("BattlePauseWindow", BaseWindow)
_G.BattlePauseWindow = BattlePauseWindow

function BattlePauseWindow:onInit()
    self.containerCvs = self.transform:Find("Container"):GetComponent(typeof(CanvasGroup))

    self.btnExit= self.containerCvs.transform:Find("BtnExit"):GetComponent(typeof(Button))
    self.btnExitCvs = self.btnExit.transform:GetComponent(typeof(CanvasGroup))
    self:addEventHandler(self.btnExit.onClick, self.onBtnExitHandler)

    self.btnBack = self.containerCvs.transform:Find("BtnBack"):GetComponent(typeof(Button))
    self.btnBackCvs = self.btnBack.transform:GetComponent(typeof(CanvasGroup))
    self:addEventHandler(self.btnBack.onClick, self.onBtnBackHandler)

--[[    self.font1 = self.containerCvs.transform:Find("Font1"):GetComponent(typeof(RectTransform))
    self.font2 = self.containerCvs.transform:Find("Font2"):GetComponent(typeof(RectTransform))--]]
    -- self.text = self.containerCvs.transform:Find("Text"):GetComponent(typeof(Text))
    self:playAnimation()
end

function BattlePauseWindow:playAnimation()
    self.containerCvs.alpha = 0
    self.btnExitCvs.alpha = 0
    self.btnBackCvs.alpha = 0

    self.playComplete = false

    GameTween.DOFade(self.containerCvs, 1, 0.1):SetUpdate(0,true)
    GameTween.DOFade(self.btnExitCvs, 1, 0.4):SetDelay(0.1):SetUpdate(0,true)
    GameTween.DOFade(self.btnBackCvs, 1, 0.4):SetDelay(0.1):SetUpdate(0,true):OnComplete(function()
        self.playComplete = true
    end)

end

function BattlePauseWindow:onBtnExitHandler()
    if not self.playComplete then return end
    ChapterMgr:ReqFightOver() --中途离开战斗发送请求
    StartCoroutine(function()
        UIManager.waitOpenWindow("LoadSceneWindow")

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 0.1)
        Time.timeScale = 1
        UIManager.closeAllWindow("LoadSceneWindow")
        BattleManager.Instance:clear()
        BattleManager.Instance:dispose()
        Yield(0)

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 0.5)
        Yield(GameAsset.WaitLoadSceneSingle("UI_Main", function(v) end))

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 0.8)
        UIManager.waitOpenWindow("MainWindow")

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 1, 0.3)
        WaitForSeconds(1)

        UIManager.closeWindow("LoadSceneWindow")
    end)
end

function BattlePauseWindow:onBtnBackHandler()
    if not self.playComplete then return end
    Time.timeScale = 1
    self:close()
end