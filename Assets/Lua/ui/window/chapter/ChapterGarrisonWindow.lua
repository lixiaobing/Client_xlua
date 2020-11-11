--[[
    章节驻守阵容界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterGarrisonWindow', BaseWindowExtend)
_G.ChapterGarrisonWindow = M

function M:ctor(data)
    self.chapter = data[1]
    self.garrisonConfig = Config.SearchStation[self.chapter.config.station]
end

function M:onInit()
    --lang
    self:getText('nodeDetail/txtTitle').text = '驻守要求'
    self:getText('nodeDetail/txtRewardsTitle').text = '可能奖励'

    --驻守要求内容固定，可提前加载
    self.listCondition = self:getUIList('nodeDetail/listCondition')
    self.listCondition:bind(self, self.onConditionItemShow, nil, self.onConditionItemRefresh)
    self.listCondition:clear()
    for i,v in ipairs(self.chapter.formationConditions) do
        self.listCondition:add({info = v})
    end
    self.listCondition:refresh()

    --加载驻守奖励固定，可提前加载
    self.listReward = self:getUIList('nodeDetail/listReward')
    self.listReward:bind(self, self.onRewardItemShow)
    self.listReward:clear()
    for k,v in pairs(self.garrisonConfig.show_item) do
        self.listReward:add({info = v})
    end
    self.listReward:refresh()

    --绑定固定位置，解锁数量由garrisonConfig.hero_num决定
    self.camera = self:getObj('UIModelGroup/Camera')
    self.camera.gameObject:SetActive(false)
    self.modelGroup = UIModelGroup.new()
    self.modelGroup:bind(self:getObj('UIModelGroup').transform)
    self.loadingCount = 0 --正在加载的数量，防止玩家点击
    self.positions = {}
    for i=1,3 do
        local index = i
        local position = {}
        position.node = self:getObj('nodePositions/position' .. i)
        position.nodeInfo = self:getObj('nodeInfo', position.node)
        position.nodeEmpty = self:getObj('imgEmpty', position.node)
        position.nodeLocked = self:getObj('imgLocked', position.node)
        position.btn = self:getObj('btn', position.node)
        position.txtName = self:getText('nodeInfo/txtName', position.node)
        position.txtLevel = self:getText('nodeInfo/txtLevel', position.node)
        position.imgStar = self:getImage('nodeInfo/imgStar', position.node)
        position.imgStar.gameObject:SetActive(false) --初始隐藏，后面直接刷新，防止闪烁
        position.nodeModel = nil
        position.heroID = 0
        position.unlocked = i <= self.garrisonConfig.hero_num --配置表决定开启的位置数量
        self:addClick(position.btn, function()
            self:onClickPosition(index)
        end)

        position.btn:SetActive(position.unlocked)
        position.nodeLocked:SetActive(not position.unlocked)
        position.nodeInfo:SetActive(false)
        table.insert(self.positions, position)
    end
    self.messager:addListener(Msg.CHAPTER_FORMATION_REFRESH, self.refresh)
end

function M:onOpen()
    self:refresh()
    self.camera.gameObject:SetActive(true)
end

function M:refresh()
    self.listCondition:refresh()
    
    for i=1,3 do
        local formation = self.chapter.formations[i]
        local position = self.positions[i]
        if position.unlocked then
            --刷新模型
            local model = self.modelGroup:getModel(i)
            if position.heroID ~= formation.heroID and position.nodeModel then
                model:clear()
                position.nodeModel = nil
            end

            if position.heroID ~= formation.heroID and formation.heroID > 0 then
                local hero = HeroMgr:getHero(formation.heroID)
                model:load("Model/" .. hero.config.model_info.path)
                position.nodeModel = model
            end

            --刷新信息
            position.nodeEmpty:SetActive(formation.heroID == 0)
            position.nodeInfo:SetActive(formation.heroID > 0)
            if formation.heroID > 0 and formation.heroID ~= position.heroID then
                local hero = HeroMgr:getHero(formation.heroID)
                position.txtName.text = hero.config.name
                position.txtLevel.text = string.format('LV.%s', hero.level)
                self:loadSprite(SpriteStarIcon[hero:getStar()], function(sp)
                    position.imgStar.sprite = sp
                    position.imgStar.gameObject:SetActive(true)
                end)
            end

            --赋值
            position.heroID = formation.heroID
        end
    end
end

function M:onPositionsItemShow(e, v)
    v.imgHero = self:getImage('imgHero', e.go)
    v.imgAdd = self:getImage('imgAdd', e.go)
    v.btn = self:getObj('btn', e.go)

    v.imgHero.gameObject:SetActive(v.formation.heroID ~= 0)
    v.imgAdd.gameObject:SetActive(v.formation.heroID == 0)
    if v.formation.heroID > 0 then
        local hero = HeroMgr:getHero(v.formation.heroID)
        v.imgHero.gameObject:SetActive(false)
        self:loadSprite("Icon/Head/" .. hero.config.icon, function(sp)
            v.imgHero.sprite = sp
            v.imgHero.gameObject:SetActive(true)
        end)
    end
    self:addClick(v.btn, function()
        self:onClickAdd(v.index)
    end)
end

function M:onConditionItemShow(e, v)
    v.txtDesc = self:getText('txtDesc', e.go)
end

function M:onConditionItemRefresh(e, v)
    v.txtDesc.text = Utils.getCostTextWithColor(v.info.desc, v.info.finished, '#43B34F', '#09090A')
end

function M:onRewardItemShow(e, v)
    v.imgBg = self:getImage('imgBg', e.go)
    v.imgItem = self:getImage('imgItem', e.go)
    v.imgBg.gameObject:SetActive(false)
    v.imgItem.gameObject:SetActive(false)
    local item = Config.Item[v.info.id]
    local bgpath = string.format("Icon/ItemQuality/Quality_Big%02d", item.item_bg)
    self:loadSprite(bgpath, function(sp)
        v.imgBg.sprite = sp
        v.imgBg.gameObject:SetActive(true)
    end)
    self:loadSprite("Icon/ItemIcon/" .. item.item_icon, function(sp)
        v.imgItem.sprite = sp
        v.imgItem.gameObject:SetActive(true)
    end)
end

function M:onClickPosition(index)
    if self.loadingCount == 0 then
        local heros = SearchManager:getGarrisonIdleHeros()
        if #heros > 0 then
            UIManager.openWindow('ChapterGarrisonFormationWindow', nil, self.chapter, index)
        else
            MsgCenter.sendMessage(Msg.HINT_COMMON, "无可用精灵")
        end
    end
end