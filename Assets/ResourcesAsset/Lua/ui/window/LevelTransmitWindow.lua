---@class LevelTransmitWindow
local LevelTransmitWindow = DClass("LevelTransmitWindow", BaseWindow)
_G.LevelTransmitWindow = LevelTransmitWindow

function LevelTransmitWindow:ctor(data)
    self.consoleId = data[1] --控制台ID
    self.levelId   = data[2] --关卡ID
end


function LevelTransmitWindow:onInit()
    self:addEventHandler(self.nodes.BtnCancel.onClick, self.onBtnCancelHandler)
    self:addEventHandler(self.nodes.BtnSure.onClick, self.onBtnSureHandler)
    local dungeonConsole = Config.DungeonConsole[self.consoleId]
    local dungeonLevel = Config.DungeonLevel[self.levelId]
    self.nodes.textTitle.text = dungeonConsole.name
    self.nodes.textDesc.text = dungeonLevel.dungeon_desc
    self.nodes.textLevelName.text = dungeonLevel.dungeon_name
    self.nodes.textSureGo.text = Lang(2305004,dungeonLevel.dungeon_name)
    UIUtil.setLevelIcon(self.nodes.imageIcon,dungeonLevel.icon_path)

end

function LevelTransmitWindow:onBtnCancelHandler()
    Log("再想想")
    self:close()
end

function LevelTransmitWindow:onBtnSureHandler()
    Log("前往")
    self:close()
    Statistics.onConsoleInteractive(self.consoleId) --床送成功表示操作天操作成功
    ChapterMgr:ReqOperateConsole(self.consoleId)

    local captainId = BattleManager.Instance.mainHero.cid  --队长ID
    BattleManager.Instance:dispose()
    UIManager.openWindow("LoadSceneWindow", function()
        local heroList = ChapterMgr:getBattleHeroList()
        if heroList and #heroList > 0 then 
            BattleFactory.enter_(self.levelId,false,captainId)
        else
            local selectHeroId = PlayerPrefsUtils.getSelectHeroId()
            BattleFactory.enter({selectHeroId}, self.levelId,false)
        end
    end)
end
return LevelTransmitWindow