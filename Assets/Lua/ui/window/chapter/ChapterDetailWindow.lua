--[[
    章节区域详细界面
    @Liukeming 2020-8-24
]]

local M = DClass('ChapterDetailWindow', BaseWindowExtend)
_G.ChapterDetailWindow = M

function M:ctor(data)
    self.chapter = data[1]
    self.chapterPrefabPath = 'UI/Window/Chapter/Maps/chapter_' .. self.chapter.id
end

function M:onAsset()
    self.assetKeys = {self.chapterPrefabPath}
    self.assetComplete = function(index, obj)
        self.nodeChapterPrefab = obj --动态加载一个固定的地图
    end
end

function M:onInit()
    --lang
    self:getText('nodeRightTop/btnInfo/txt').text = '情报'
    self:getText('nodeRightTop/btnShop/txt').text = '兑换'
    self:getText('nodeRightTop/btnArea/txt').text = '区域'
    self:getText('nodeBottom/tabMainTask/txt').text = '主线'
    self:getText('nodeBottom/tabSearch/txt').text = '探索'
    self:getText('nodeBottom/nodeButtons/btnTask/txt').text = '任务'
    self:getText('nodeBottom/nodeButtons/btnFight/txt').text = '开始战斗'
    self:getText('nodeBottom/nodeButtons/btnSearch/txt').text = '开始探索'
    self:getText('nodeBottom/nodeButtons/btnReward/txt').text = '奖励详情'
    self:getText('nodeBottom/nodeButtons/btnFinish/txt').text = '探索完成'
    self:getText('nodeBottom/nodeButtons/btnSpeedUp/txt').text = '探索加速'
    self:getText('nodeTask/btnDetail/txt').text = '详情'
    self:getText('nodeTask/nodeDetail/txtMainTaskTitle').text ='主线任务'
    self:getText('nodeTask/nodeDetail/txtCurEventsTitle').text = '当前事件'
    self:getText('nodeTask/nodeDetail/nodeCurEvents/nodeBrach/txtType').text = '支线任务'
    self:getText('nodeTask/nodeDetail/nodeCurEvents/nodeChallenge/txtType').text = '关卡挑战'
    self:getText('nodeTask/nodeDetail/nodeCurEvents/nodeBox/txtType').text = '宝箱收集'
    self:getText('nodeGarrison/txtTitle').text = '驻守'
    self:getText('nodeSearch/txtCountdownTitle').text = '剩余时间'
    self:getText('nodeSearch/txtRewardTitle').text = '探索奖励'

    --标题
    self.nodeTitle = self:getObj('imgTitle')
    self:getText('imgTitle/txt').text = self.chapter.config.capter_name

    --探索驻守面板
    self.nodeGarrison = self:getObj('nodeGarrison')
    self.btnGarrisonReward = self:getObj('nodeGarrison/nodeHeros/btnReward')
    self:addClick(self.btnGarrisonReward, self.onClickGarrisonReward)
    self:addClickByPath('nodeGarrison/nodeHeros/btnHeros', self.onClickGarrison)
    self.garrisons = {}
    for i=1,3 do
        local garrison = {}
        garrison.node = self:getObj('nodeGarrison/nodeHeros/hero' .. i)
        garrison.imgBack = self:getImage('imgBack', garrison.node)
        garrison.imgHead = self:getImage('imgHead', garrison.node)
        garrison.imgBack.gameObject:SetActive(false)
        garrison.imgHead.gameObject:SetActive(false)
        garrison.heroID = nil
        table.insert(self.garrisons, garrison)
    end

    --任务面板
    self.nodeTask = self:getObj('nodeTask')
    self.barProgress = self:getSlider('nodeTask/barProgress')
    self.txtProgress = self:getText('nodeTask/barProgress/txt')
    self.txtMainTask = self:getText('nodeTask/nodeDetail/nodeMaintask/txt')
    self.txtBranchNumber = self:getText('nodeTask/nodeDetail/nodeCurEvents/nodeBrach/txtNumber')
    self.txtChallengeNumber = self:getText('nodeTask/nodeDetail/nodeCurEvents/nodeChallenge/txtNumber')
    self.txtBoxNumber = self:getText('nodeTask/nodeDetail/nodeCurEvents/nodeBox/txtNumber')

    --探索面板
    self.nodeSearch = self:getObj('nodeSearch')
    self.txtSearchCountdown = self:getText('nodeSearch/txtCountdown')
    self.listSearchRewards = self:getUIList('nodeSearch/listSearchRewards')
    self.listSearchRewards:bind(self, self.onSearchRewardsItemShow, nil, self.onSearchRewardsItemRefresh)
    self.listSearchRewards:clear()
    self.listSearchRewardSize = 0

    --地图区域
    self.nodeChapterParent = self:getObj('nodeMap')
    self.nodeChapter = GameObject.Instantiate(self.nodeChapterPrefab)
    self.nodeChapter.name = 'chapter_' .. self.chapter.id
    self.nodeChapter.transform:SetParent(self.nodeChapterParent.transform, false)
    self.nodeMap = self:getObj('nodeMap', self.nodeChapter)
    self:getObj('nodeTask', self.nodeMap):SetActive(true)
    self:getObj('nodeSearch', self.nodeMap):SetActive(true)
    self.currentArea = nil --当前区域
    self.nodeShip = self:getObj('nodeSearch/nodeCommonShip', self.nodeMap)  --用于显示的飞船
    self.nodeShip.transform:SetAsLastSibling()
    self.nodeShip:SetActive(false)
    self.areas = {}
    for i,v in ipairs(self.chapter.areas) do
        local area = {}
        area.area = v
        --主线节点
        area.task = {}
        area.task.node = self:getObj('nodeTask/' .. v.id, self.nodeMap)
        area.task.txtTitle = self:getText('nodeTitle/txtTitle', area.task.node)
        area.task.txtTitle.text = '主线任务'
        area.task.txtDesc = self:getText('nodeTitle/txtDesc', area.task.node)
        area.task.txtDesc.text = v.config.area_name
        --探索节点
        area.search = {}
        area.search.node = self:getObj('nodeSearch/' .. v.id, self.nodeMap)
        area.search.nodeShip = self:getObj('nodeShip', area.search.node)  --用于定位的飞船
        area.search.nodeShip:SetActive(false)
        area.search.nodeLocked = self:getObj('nodeLocked', area.search.node)
        area.search.nodeTitleBg1 = self:getObj('nodeTitle/imgBg1', area.search.node)
        area.search.nodeTitleBg2 = self:getObj('nodeTitle/imgBg2', area.search.node)
        area.search.nodeTitleBg3 = self:getObj('nodeTitle/imgBg3', area.search.node)
        area.search.txtTitle = self:getText('nodeTitle/txt', area.search.node)
        area.search.txtTitle.text = v.config.area_name
        --探索节点的事件触发点，注意数据管理器中area.events是键值对，窗口中的area.search.events是数组
        area.search.events = {}
        for k,w in pairs(v.events) do
            local event = {}
            event.id = w.id
            event.node = self:getObj('nodeEvents/' .. w.id, area.search.node)
            event.event = w
            event.nodeExecuting = self:getObj('img_executing', event.node)
            event.nodeFinished = self:getObj('img_finished', event.node)
            self:addClick(event.node, function()
                self:onClickSearchEvent(event.event)
            end)
            table.insert(area.search.events, event)
        end
        table.insert(self.areas, area)
    end

    --按钮
    self.btnInfo = self:getObj('nodeRightTop/btnInfo')
    self.btnShop = self:getObj('nodeRightTop/btnShop')
    self.btnArea = self:getObj('nodeRightTop/btnArea')
    self.btnTask = self:getObj('nodeBottom/nodeButtons/btnTask')
    self.btnFight = self:getObj('nodeBottom/nodeButtons/btnFight')
    self.btnSearch = self:getObj('nodeBottom/nodeButtons/btnSearch')
    self.btnReward = self:getObj('nodeBottom/nodeButtons/btnReward')
    self.btnFinish = self:getObj('nodeBottom/nodeButtons/btnFinish')
    self.btnSpeedUp = self:getObj('nodeBottom/nodeButtons/btnSpeedUp')
    self.btnDetail = self:getObj('nodeTask/btnDetail')
    self:addClick(self.btnInfo, self.onClickInfo)
    self:addClick(self.btnShop, self.onClickShop)
    self:addClick(self.btnArea, self.onClickArea)
    self:addClick(self.btnTask, self.onClickTask)
    self:addClick(self.btnFight, self.onClickFight)
    self:addClick(self.btnSearch, self.onClickSearch)
    self:addClick(self.btnReward, self.onClickReward)
    self:addClick(self.btnFinish, self.onClickFinish)
    self:addClick(self.btnSpeedUp, self.onClickSpeedUp)
    self:addClick(self.btnDetail, self.onClickDetail)

    --页签
    self.tabs = self:getUITabs('nodeBottom')
    self.tabs:bind(self, self.onSelected)
    self.tabsIndex = 0
    self.tabs:select(self.tabsIndex)

    --刷新事件
    self.messager:addListener(Msg.CHAPTER_SEARCH_REFRESH, self.refresh)
    self.messager:addListener(Msg.CHAPTER_FORMATION_REFRESH, self.refreshGarrison)
    self.messager:addListener(Msg.TASK_REFRESH, self.refresh)

    --探索过程飞船动画
    self.tweening = false
    self.tweenShip = QTween.new()
end

function M:onUpdate(force)
    --刷新倒计时
    local t = Time.realtimeSinceStartup
    if force or (not self.refreshTime or t >= self.refreshTime) then
        self.refreshTime = t + 1
        if self.tabsIndex == 1 and self.chapter.searching and not self.chapter.finished then
            if not self.chapter.searchFinished then
                local second = TimeUtils.getLeftTime(self.chapter.searchEndTime).tScond
                self.txtSearchCountdown.text = TimeUtils.formatHMS(second)
            else
                self.txtSearchCountdown.text = '探索完成'
            end
        end
    end

    --飞船动画
    if self.tweening then
        self.tweenShip:update()
    end
end

function M:refresh()
    self.nodeTitle:SetActive(self.tabsIndex == 0)
    self.nodeGarrison:SetActive(self.tabsIndex == 1)
    self.nodeSearch:SetActive(self.tabsIndex == 1 and self.chapter.searching)
    self:refreshButtons()

    if self.tabsIndex == 0 then
        self:refreshAreas()
        self:refreshTask()
    elseif self.tabsIndex == 1 then
        self:refreshAreas()
        self:refreshGarrison()
        self:refreshSearch()
        self:onUpdate(true)
    end
end

function M:onSelected(tab, index)
    self.tabsIndex = index
    self:refresh()
end

--计算当前探索中的区域
function M:getCurrentArea()
    local currentArea = nil
    for i,v in ipairs(self.areas) do
        --第一个处于探索中的区域就是当前区域，其他区域要么已完成，要么未解锁
        if v.area.searching then
            return v
        end
    end
    return currentArea
end

--刷新地图区域数据
function M:refreshAreas()
    --刷新飞船状态或播放飞船移动动画
    if not self.tweening then
        local currentArea = self:getCurrentArea()
        if currentArea then
            --存在激活区域显示飞船
            self.nodeShip:SetActive(self.tabsIndex == 1)
            --激活区域跟上次不同则需要移动
            if currentArea ~= self.currentArea then
                local position2 = currentArea.search.nodeShip.transform.position
                if not self.currentArea then
                    --首次出现直接显示
                    self.nodeShip.transform.position = position2
                else
                    --需要移动飞行2秒
                    local position1 = self.currentArea.search.nodeShip.transform.position
                    self.tweening = true --做个标记防止动画过程中出现连续变化
                    self.tweenShip:addTo(0, 1, 2, function(v)
                        self.nodeShip.transform.position = Vector3.Lerp(position1, position2, v)
                    end, function()
                        self.tweening = false
                        self:refreshAreas()
                    end)
                end
                self.currentArea = currentArea
            end
        else
            --不存在激活区域隐藏飞船
            self.nodeShip:SetActive(false)
            self.currentArea = nil
        end
    end

    --刷新区域数据
    for i,v in ipairs(self.areas) do
        v.task.node:SetActive(self.tabsIndex == 0)
        v.search.node:SetActive(self.tabsIndex == 1)
        if self.tabsIndex == 0 then
            --刷新主线任务区域
            --todo:暂时没有要刷新的东西
        elseif self.tabsIndex == 1 then
            --刷新探索区域状态
            local locked = not v.area.unlocked --区域已解锁
            local searching = not locked and self.currentArea --章节探索中
            --服务器返回的数据中,当章节无探索或区域探索完成时area.searching都为false，这里需要自行判断
            local waiting = not searching or (v.area.searching and self.currentArea ~= v)
            local active = searching and v.area.searching and self.currentArea == v
            local passed = searching and not v.area.searching and self.currentArea ~= v
            v.search.nodeTitleBg1:SetActive(waiting) --灰色，未探索
            v.search.nodeTitleBg2:SetActive(active) --红色，探索中
            v.search.nodeTitleBg3:SetActive(passed) --蓝色，已探索
            v.search.nodeLocked:SetActive(locked)
            for k,event in pairs(v.search.events) do
                if event.event.active then
                    --事件激活，事件ID==任务ID
                    local task = event.event.task
                    local subTask = TaskManager:getTask(event.event.config.triger_task)
                    local finished = subTask.status == TaskStatus.Finished
                    event.node:SetActive(true)
                    event.nodeExecuting:SetActive(not finished)
                    event.nodeFinished:SetActive(finished)
                else
                    event.node:SetActive(false)
                end
            end
        end
    end
end

--刷新右侧任务详情面板
function M:refreshTask()
    self.barProgress.value = self.chapter.progress
    self.txtProgress.text = string.format('完成度%s%%', math.floor(self.chapter.progress * 100))
    local task = SearchManager:getCurrentMainTask(self.chapter)
    if self.chapter.finished or not task then
        self.txtMainTask.text = '当前主线任务已完成'
    else
        self.txtMainTask.text = task.config.name
    end
    self.txtBranchNumber.text = '[功能暂未实现]'
    self.txtChallengeNumber.text = '[功能暂未实现]'
    self.txtBoxNumber.text = '[功能暂未实现]'
end

--刷新所有按钮状态
function M:refreshButtons()
    self.nodeTask:SetActive(self.tabsIndex == 0)
    self.btnTask:SetActive(self.tabsIndex == 0)
    self.btnFight:SetActive(self.tabsIndex == 0)
    self.btnSearch:SetActive(self.tabsIndex == 1 and not self.chapter.searching)
    self.btnReward:SetActive(self.tabsIndex == 1 and self.chapter.searching)
    self.btnFinish:SetActive(self.tabsIndex == 1 and self.chapter.searching and self.chapter.searchFinished)
    self.btnSpeedUp:SetActive(self.tabsIndex == 1 and self.chapter.searching and not self.chapter.searchFinished)
end

--刷新驻守面板
function M:refreshGarrison()
    self.btnGarrisonReward:SetActive(self.chapter.event ~= nil)
    for i,v in ipairs(self.garrisons) do
        local garrison = self.garrisons[i]
        local formation = self.chapter.formations[i]
        if formation.heroID > 0 then
            --避免重复加载
            if garrison.heroID ~= formation.heroID then
                garrison.heroID = formation.heroID
                local hero = HeroMgr:getHero(formation.heroID)
                self:loadSprite("Icon/Hero/head_Back" .. hero:getStar(), function(sp)
                    garrison.imgBack.sprite = sp
                    garrison.imgBack.gameObject:SetActive(true)
                end)
                self:loadSprite("Icon/Head/" .. hero.config.icon, function(sp)
                    garrison.imgHead.sprite = sp
                    garrison.imgHead.gameObject:SetActive(true)
                end)
            end
        else
            garrison.heroID = nil
            garrison.imgBack.gameObject:SetActive(false)
            garrison.imgHead.gameObject:SetActive(false)
        end
    end
end

--刷新右侧探索奖励面板
function M:refreshSearch()
    if self.chapter.searching then
        --动态的一个一个扩展，避免频繁刷新造成的闪烁
        while self.listSearchRewardSize < #self.chapter.searchRewards do
            self.listSearchRewardSize = self.listSearchRewardSize + 1
            self.listSearchRewards:add({index = self.listSearchRewardSize})
        end
        self.listSearchRewards:refresh()
    end
end

function M:onSearchRewardsItemShow(e, v)
    v.txtCount = self:getText('txtCount', e.go)
    v.imgItem = self:getImage('imgItem', e.go)
    v.icon = nil
end

function M:onSearchRewardsItemRefresh(e, v)
    local info = self.chapter.searchRewards[v.index]
    e.go:SetActive(info ~= nil)
    if info then
        v.txtCount.text = info.count
        --图标变化时才进行加载，避免闪烁
        if info.icon ~= v.icon then
            v.icon = info.icon
            v.imgItem.gameObject:SetActive(false)
            self:loadSprite('Icon/Chapter/search_reward_' .. v.icon, function(sp)
                v.imgItem.sprite = sp
                v.imgItem.gameObject:SetActive(true)
            end)
        end
    end
end

--点击情报按钮
function M:onClickInfo()
    UIManager.openWindow('ChapterTopInfoWindow', nil, self.chapter)
end

--点击兑换按钮
function M:onClickShop()
    UIManager.openWindow('ChapterTopShopWindow', nil, self.chapter)
end

--点击区域按钮
function M:onClickArea()
    UIManager.openWindow('ChapterTopAreaWindow', nil, self.chapter)
end

--打开任务界面
function M:onClickTask()
    UIManager.openWindow("ChapterTaskWindow", nil, self.chapter.id)
end

--进入战前阵容界面
function M:onClickFight()
    local levelID = ChapterMgr:getLastDungeon(self.chapter.id)
    UIManager.openWindow("FormationWindow", nil , levelID)
end

--点击探索按钮
function M:onClickSearch()
    if SearchManager.searched then
        MsgCenter.sendMessage(Msg.HINT_COMMON, '其他章节正在探索中')
    else
        UIManager.openWindow('ChapterSearchConfirmWindow', nil, self.chapter)
    end
end

--点击探索加速
function M:onClickSpeedUp()
    UIManager.openWindow('ChapterSearchSpeedUpWindow', nil, self.chapter)
end

--点击奖励详情
function M:onClickReward()
    UIManager.openWindow('ChapterSearchRewardWindow', nil, self.chapter)
end

--点击探索完成
function M:onClickFinish()
    SearchManager:searchGetReward(function(result)
        if result.settleInfo then
            UIManager.openWindow('ChapterSearchResultWindow', nil, self.chapter, result.settleInfo)
        end
    end)
end

--点击任务详情按钮
function M:onClickDetail()
    print('点击任务详情按钮')
end

--点击驻守面板
function M:onClickGarrison()
    UIManager.openWindow('ChapterGarrisonWindow', nil, self.chapter)
end

--点击驻守奖励气泡
function M:onClickGarrisonReward()
    UIManager.openWindow('ChapterGarrisonRewardWindow', nil, self.chapter)
end

--点击探索事件标记
function M:onClickSearchEvent(event)
    UIManager.openWindow('ChapterSearchEventWindow', nil, event)
end
