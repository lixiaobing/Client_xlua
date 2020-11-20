---@class MultiFightWaitingWindow:BaseWindow
local MultiFightWaitingWindow = DClass("MultiFightWaitingWindow", BaseWindow)
_G.MultiFightWaitingWindow = MultiFightWaitingWindow

IsNetBattle = true

if IsNetBattle then
else
    Msg.LocalNetBattle_Input = "LocalNetBattle_Input"
end

function MultiFightWaitingWindow:onOpen()
    if IsNetBattle then
        NetWork:addProto(s2c.BATTLE_RES_START_BATTLE, self, self.handleStartBattle)
        NetWork:send(c2s.BATTLE_REQ_START_BATTLE, {levelId=10001}, nil, true)
    else
        ---@type MultiPlayerBattlerData
        local data = {}
        data.levelId = 10001
        data.fightServerHost = '192.168.1.1'
        data.fightServerPort = '8080'
        data.players = {}
        for i = 1, 3 do
            ---@type MultiPlayerBattlerData_Player
            local player = {}
            player.id = i
            player.inputId = i
            player.name = tostring(i)
            player.heroList = {40102, 40101}
            table.insert(data.players, player)
        end
        data.players[1].id = MainPlayer:getPlayerId()
        self:handleStartBattle(data)
    end
end

function MultiFightWaitingWindow:onClose()
    if IsNetBattle then
        NetWork:removeProto(s2c.BATTLE_RES_START_BATTLE)
    end
end
    
function MultiFightWaitingWindow:handleStartBattle(data)
    UIManager.openWindow("LoadSceneWindow", function()
        UIManager.closeAllWindow("LoadSceneWindow")
        data.levelId = 10001
        BattleFactory.enterMultiPlayerBattle(data, MainPlayer:getPlayerId())
    end)
end