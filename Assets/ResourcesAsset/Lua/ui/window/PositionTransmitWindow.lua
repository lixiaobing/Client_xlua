---@class PositionTransmitWindow
local PositionTransmitWindow = DClass("PositionTransmitWindow", BaseWindow)
_G.PositionTransmitWindow = PositionTransmitWindow

function PositionTransmitWindow:ctor(data)
    self.config = data[1]


    --找到同一组的操作台

    --map_pos = nil,
    local id            = self.config.id
    local map_pos_group = self.config.map_pos_group
    
    self.targetIDs = {} 
    --找同一组
    if map_pos_group then 
        for k,v in pairs(Config.DungeonConsole) do
            if v.id ~= id and v.map_pos_group == map_pos_group then
                local console  = BattleLogic.Instance.logicLevelCtrl:getConsole_(v.id)
                if console and console:getState() == LConsoleState.Active then
                    table.insert(self.targetIDs,v.id)
                end
            end
        end 
    end
    --TODO UI如何展示？
    -- self.targetIDs = {3006,3006}
end


function PositionTransmitWindow:onInit()
    self:addEventHandler(self.nodes.BtnRecovery.onClick, self.onBtnRecoveryHandler)
    self:addEventHandler(self.nodes.BtnFormation.onClick, self.onBtnFormationHandler)
    self:addEventHandler(self.nodes.BtnTransmit.onClick, self.onBtnTransmitHandler)
    -- local dungeonConsole = Config.DungeonConsole[self.consoleId]
    -- local dungeonLevel = Config.DungeonLevel[self.levelId]
    -- self.nodes.textTitle.text = dungeonConsole.name
    -- self.nodes.textDesc.text = dungeonLevel.dungeon_desc
    -- self.nodes.textLevelName.text = dungeonLevel.dungeon_name
    -- self.nodes.textSureGo.text = Lang(2305004,dungeonLevel.dungeon_name)
    -- UIUtil.setLevelIcon(self.nodes.imageIcon,dungeonLevel.icon_path)
    self.nodes.scrollView.gameObject:SetActive(false)




    self.nodes.scrollPoolVertical:ReloadConfig()
    self.nodes.scrollPoolVertical:InitPool(#self.targetIDs, function(index, obj) 
            local id = self.targetIDs[index]
            local data = Config.DungeonConsole[id]
 
            obj.transform:Find("TextName"):GetComponent(typeof(Text)).text = data.name
            local btn = obj.transform:Find("ButtonTransmit"):GetComponent(typeof(Button))
            -- btn.transform:Find("Text"):GetComponent(typeof(Text)).text =
           self:addEventHandler(btn.onClick, self.onTargetClick,id)
    end)


end

function PositionTransmitWindow:onTargetClick(id)
    local data = Config.DungeonConsole[id]
    local position = FixedVector3(data.map_pos[1],data.map_pos[2],data.map_pos[3])
    BattleLogic.Instance:getMainHero():transmit(position)
    self:close()
end

function PositionTransmitWindow:onBtnRecoveryHandler()
    Log("血量恢复")
    self:close()
end

function PositionTransmitWindow:onBtnFormationHandler()
    Log("调整阵容")
    self:close()
end
function PositionTransmitWindow:onBtnTransmitHandler()
    Log("越迁移动")
    self.nodes.scrollView.gameObject:SetActive(not self.nodes.scrollView.gameObject.activeSelf)
end


return PositionTransmitWindow