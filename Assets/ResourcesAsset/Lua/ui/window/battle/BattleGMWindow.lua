--[[
    战斗内GM面板
    @Liukeming 2020-8-17
]]

local M = DClass('BattleGMWindow', BaseWindowExtend)
_G.BattleGMWindow = M

function M:ctor()
    self.enemies = {}       --被管理的敌人
    self.enemy = nil        --当前选中敌人
    self.actions = {}       --当前怪物动画
    self.skills = {}        --当前怪物技能
end

function M:onInit()
    self:addClickByPath('nodeBg', self.onClickBg)
    self:addClickByPath('nodeBg/nodeTitle/btnClose', self.onClickClose)
    self:addClickByPath('nodeBg/nodeTitle/btnCreate', self.onClickCreate)

    --创建的敌人列表
    self.listEnemies = self:getUIList('nodeBg/listEnemies')
    self.listEnemies:bind(self, self.onItemShow, nil, self.onItemRefresh)

    --AI开关
    self.togAI = self:getCom('Toggle', 'nodeBg/nodeTitle/togAI')
    self.togAI.isOn = BattleManager.Instance.aiEnabled
    self:addEventHandler(self.togAI.onValueChanged, self.onClickAI)

    --无敌开关
    self.togSafe = self:getCom('Toggle', 'nodeBg/nodeTitle/togSafe')
    self.togSafe.isOn = BattleManager.Instance.safeMode
    self:addEventHandler(self.togSafe.onValueChanged, self.onClickSafe)

    --攻击调试
    self.togDebug= self:getCom('Toggle', 'nodeBg/nodeTitle/togDebug')
    self.togDebug.isOn = false
    self:addEventHandler(self.togDebug.onValueChanged, self.onClickDebug)

    --预加载敌人配置表
    self.enemiesConfig = Utils.sortConfig(Config.Monster)
    self.dropEnemies = self:getCom('Dropdown', 'nodeBg/nodeTitle/dropEnemies')
    self.dropEnemies.options:Clear()
    for i,v in ipairs(self.enemiesConfig) do
        local valid = true --self:checkConfig(v, false)
        local txt = string.format('<color=%s>%s（%s）</color>', valid and '#3F3F3F' or '#CFCFCF', v.name, v.id)
        self.dropEnemies.options:Add(Dropdown.OptionData.New(txt));
    end

    --详细界面
    self.nodeDetail = self:getObj('nodeBg/nodeDetail')
    self.nodeDetail:SetActive(false)
    self.txtName = self:getText('nodeBg/nodeDetail/info/txtName')
    self.txtID = self:getText('nodeBg/nodeDetail/info/txtID')
    self.txtModel = self:getText('nodeBg/nodeDetail/info/txtModel')
    self.dropActions = self:getCom('Dropdown', 'nodeBg/nodeDetail/dropAction')
    self.dropSkills = self:getCom('Dropdown', 'nodeBg/nodeDetail/dropSkill')
    self:addClickByPath('nodeBg/nodeDetail/btnAction', self.onClickAction)
    self:addClickByPath('nodeBg/nodeDetail/btnSkill', self.onClickSkill)

    --添加英雄为怪物
    self.heroes = {}
    for _,hero in pairs(Config.Hero) do
        table.insert(self.heroes, hero)
    end
    self.nodeHeroTest = self:getObj('nodeBg/nodeHeroTest')
    self.dropHeroes = self:getCom('Dropdown', 'nodeBg/nodeHeroTest/dropHeroes')
    self:addClickByPath('nodeBg/nodeHeroTest/btnAdd', self.onClickCreateHero)
    --创建英雄列表
    self.dropHeroes.options:Clear()
    for i,v in ipairs(self.heroes) do
        self.dropHeroes.options:Add(Dropdown.OptionData.New(v.name))
    end

    --怪物死亡事件
    self.messager:addListener(Msg.BATTLE_REMOVE_MONSTER, self.onEnemyDied)
end

function M:onOpen()
    self.dropEnemies.value = 0
end

function M:onUpdate()

end

function M:getEnemyActions(enemy)
    local clips = enemy.view.animator.runtimeAnimatorController.animationClips
    self.actions = {}
    for i=1,clips.Length do
        local clip = clips[i-1]
        if clip then
            table.insert(self.actions, clip.name)
        end
    end
    table.sort(self.actions, function(a, b)
        return a < b
    end)
end

function M:getEnemySkills(enemy)
    self.skills = {}
    for k,v in pairs(enemy.skillList) do
        local skill = {}
        skill.id = v.config.id
        skill.name = v.config.action --目前SkillX表没有配置名称，暂时使用动作名称
        table.insert(self.skills, skill)
    end
end

function M:refresh()
    self.listEnemies:refresh()
    self.nodeDetail:SetActive(self.enemy ~= nil)
    if self.enemy then
        local config = self.enemy.config
        self.txtName.text = string.format('%s', config.name)
        self.txtID.text = string.format('%s', config.id)
        self.txtModel.text = string.format('%s', config.model_info.path)
        --动作名称列表
        self:getEnemyActions(self.enemy)
        self.dropActions.options:Clear()
        for i,v in ipairs(self.actions) do
            self.dropActions.options:Add(Dropdown.OptionData.New(v));
        end
        --技能名称列表
        self:getEnemySkills(self.enemy)
        self.dropSkills.options:Clear()
        for i,v in ipairs(self.skills) do
            self.dropSkills.options:Add(Dropdown.OptionData.New(v.name));
        end
    end
end

function M:reloadEnemies()
    self.listEnemies:clear()
    for i,v in ipairs(self.enemies) do
        self.listEnemies:add({info = v})
    end
    self:refresh()
end

function M:onItemShow(e, v)
    v.txt = self:getText('txt', e.go)
    v.nodeSelected = self:getObj('nodeSelected', e.go)
    self:addClick(e.go, function()
        self:onClickEnemy(v.info)
    end)
end

function M:onItemRefresh(e, v)
    v.nodeSelected:SetActive(v.info == self.enemy)
    v.txt.text = string.format('%s（%s）', v.info.config.name, v.info.config.id)
end

function M:onClickBg()
    self.dropEnemies:Hide()
    self.dropActions:Hide()
    self.dropSkills:Hide()
end

function M:onClickClose()
    -- self.gameObject:SetActive(false)
    self:close()
end

function M:warning(showTips, info, ...)
    if showTips then
        MsgCenter.sendMessage(Msg.HINT_COMMON, string.format(info, ...))
    end
    return false
end

function M:checkConfig(config, showTips)
    if config.born_action > 0 and not Config.Effect[config.born_action] then
        return self:warning(showTips, '配置了无效的出生特效 id=%s, born_action=%s', config.id, config.born_action)
    elseif not config.attr or not Config.MonsterAttr[config.attr] then
        return self:warning(showTips, '配置了无效的怪物属性 id=%s, attr=%s', config.id, config.attr)
    else
        return true
    end
end

function M:onClickCreate()
    local config = self.enemiesConfig[self.dropEnemies.value + 1]
    local path = "Model/"..config.model_info.path
    StartCoroutine(function()
        BattleCache.readyMonster(config.id, true)

        local mainHero = BattleLogic.Instance:getMainHero()

        local param = {}
        param.cid = config.id
        param.position = mainHero.controller:TransformPoint(FixedVector3.forward*Fixed64.from(3))
        param.uid = config.uid
        param.tag = config.tag
        param.group = config.group
        local enemy = BattleLogic.Instance:addLogicEntity(FrameSyncEntityType.Monster, param)

        if config.born_action == 0 then 
            enemy:playAction(AnimationName.Start) --播放出场动作
        elseif Config.Effect[config.born_action] then
            enemy:playBornEffect(config.born_action) --出生特效
        end

        table.insert(self.enemies, enemy)
        self.enemy = enemy
        self:reloadEnemies()
    end)
end

function M:onClickCreateHero()
    local config = self.heroes[self.dropHeroes.value + 1]
    local path = "Model/"..config.model_info.path
    StartCoroutine(function()
        BattleCache.readyHero(config.id, true)

        local mainHero = BattleLogic.Instance:getMainHero()

        local param = {}
        param.cid = config.id
        param.id = BattleLogic.Instance:getEntityId()

        local hero = BattleFactory.createLogicEntity(FrameSyncEntityType.Hero, param)
        hero.testHero = true
        BattleLogic.Instance:addNewEntity(hero)

        hero:playAction(AnimationName.Idle) 
        local p = mainHero.controller:TransformPoint(FixedVector3.forward*Fixed64.from(3))
        local pos = FixedVector3(p.x, p.y + fixed.half, p.z)
        ---@type FixedVector3
        local roa = FixedQuaternion.Euler(0,0,0)
        hero:setTransform(pos, roa)
        hero:setActive(true)
        hero.controller:Move(FixedVector3.New(0, -fixed.one, 0))
    end)
end

function M:onClickAI()
    BattleManager.Instance.aiEnabled = self.togAI.isOn
    if not self.togAI.isOn and self.enemy then
        --self.enemy:reset()
        self.enemy:playAction(AnimationName.IdleBattle)
    end
end

function M:onClickSafe()
    BattleManager.Instance.safeMode = self.togSafe.isOn
end

function M:onClickDebug()
    for k,v in pairs(AttackFrameConfig) do
        v.debugPause = self.togDebug.isOn
    end  
end

function M:onClickEnemy(enemy)
    self.enemy = enemy
    self:refresh()
end

function M:onClickAction()
    local action = self.actions[self.dropActions.value + 1]
    self.enemy:playAction(action)
end

function M:onClickSkill()
    local skill = self.skills[self.dropSkills.value + 1]
    self.enemy:doAttack(skill.id)
end

function M:onEnemyDied(enemy)
    if self.enemy == enemy then
        self.enemy = nil
    end

    table.removeItem(self.enemies, enemy)
    self:reloadEnemies()
    self:onClickBg()
end

