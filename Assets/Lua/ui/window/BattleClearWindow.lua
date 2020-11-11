---@class BattleClearWindow
local BattleClearWindow = DClass("BattleClearWindow", BaseWindow)
_G.BattleClearWindow = BattleClearWindow

function BattleClearWindow:onInit()
    self:addEventHandler(self.nodes.btnSure.onClick, self.onBtnBackHandler)
    self.nodes.imageVictory.gameObject:SetActive(true)
    self.nodes.imageGotit.gameObject:SetActive(false)

    if BattleManager.Instance then 
        local chapterId   = BattleManager.Instance.levelCtrl:getChapter()
        local chapterData = Config.DungeonChapter[chapterId]

        local day, hour, min, sec, mil  = TimeUtils.format(Statistics.time, true)
        self.nodes.textTitle.text    = chapterData.capter_name --章节名称
        self.nodes.textProgress.text = "80%" -- 章节总进度
        self.nodes.textBattleTime.text            = string.format("%s:%s:%s" , min ,sec , mil)  --战斗时常
        local num, allNum = LTaskMgr:getBranchTaskProgress(chapterId)
        self.nodes.textBranchTaskProgress.text    = string.format("%s/%s",num, allNum)      --支线任务进度
        self.nodes.textChallengeTaskProgress.text = "6/8"       --挑战任务进度

        local num, allNum = ChapterMgr:getBoxProgress(chapterId)
        self.nodes.textBoxProgress.text           = string.format("%s/%s",num, allNum)  --宝箱获取进度
    end
end

function BattleClearWindow:onBtnBackHandler()
    if BattleManager.Instance then 
        BattleManager.Instance:dispose()
    end
    --返回主界面
    GameAsset.LoadSceneSingle("UI_Main", function(v)
        UIManager.closeAllWindow()
        UIManager.openWindow("MainWindow")
    end)
end