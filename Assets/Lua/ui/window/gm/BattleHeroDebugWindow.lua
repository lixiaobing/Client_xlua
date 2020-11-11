local BattleHeroDebugWindow = DClass("BattleHeroDebugWindow", BaseWindow)
_G.BattleHeroDebugWindow = BattleHeroDebugWindow

function BattleHeroDebugWindow:onAsset()
    self.assetKeys = {

    }

    self.assetComplete = function(index, obj)

    end
end

function BattleHeroDebugWindow:onInit()

end

function BattleHeroDebugWindow:onUpdate()
    local mainHero = BattleLogic.Instance.mainPlayer.mainHero
    self.nodes.name.text = string.format("%s [%s][%s]", mainHero.config.name, mainHero.id, mainHero.config.id)
    if mainHero.stateMachine.transitionState then
        self.nodes.state.text = string.format("%s [%s]", mainHero.stateMachine.state, mainHero.stateMachine.transitionState)
    else
        self.nodes.state.text = string.format("%s", mainHero.stateMachine.state)
    end
    self.nodes.action.text = string.format("%.5f [%.5f]", mainHero.stateMachine.time.number, mainHero.stateMachine.normalizedTime.number)
end

function BattleHeroDebugWindow:refresh()
    
end