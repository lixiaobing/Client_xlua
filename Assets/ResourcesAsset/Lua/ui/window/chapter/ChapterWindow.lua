--[[
    章节主界面
    @Liukeming 2020-8-24
]]

local M = DClass('ChapterWindow', BaseWindowExtend)
_G.ChapterWindow = M

function M:ctor()
end

function M:onInit()
    --章节列表
    self.chaptersData = {}
    self:loadChapters()

    --刷新事件
    self.messager:addListener(Msg.CHAPTER_SEARCH_REFRESH, self.refreshChapters)
end

function M:onUpdate()
    self:refreshChapters()
end

--加载章节列表
function M:loadChapters()
    local rt = self:getObj('nodeMap/nodeChapters').transform
    --按配置显示章节节点
    for i,chapter in ipairs(SearchManager:getChapters()) do
        local data = {}
        data.node = self:getObj('nodeMap/nodeChapters/' .. chapter.id)
        data.chapter = chapter
        if data.node then
            data.node:SetActive(true)
            SearchManager:refreshChapterStatus(data.chapter)
            data.txtTips = self:getText('btnChapter/imgTips/txt', data.node)
            data.nodeLocked = self:getObj('btnChapter/imgLocked', data.node)
            data.nodeFinished = self:getObj('btnChapter/imgFinished', data.node)
            data.nodeRunning = self:getObj('btnChapter/imgRunning', data.node)
            data.nodeSearchEvent = self:getObj('btnChapter/imgSearchEvent', data.node)
            data.nodeSearchReward = self:getObj('btnChapter/imgSearchReward', data.node)
            data.nodeSearchChallenge = self:getObj('btnChapter/imgSearchChallenge', data.node)
            data.nodeSearch = self:getObj('btnChapter/nodeSearch', data.node)
            data.nodeSearchIcon = self:getObj('btnChapter/nodeSearch/imgBoat', data.node)
            data.txtSearchCountdown = self:getText('btnChapter/nodeSearch/nodeCountdown/txt', data.node)
            data.nodeGarrisonEvent = self:getObj('btnChapter/nodeGarrisonEvent', data.node)
            data.btnGarrisonEvent = self:getObj('btnChapter/nodeGarrisonEvent/btnReward', data.node)
            self:addClick(data.btnGarrisonEvent, function()
                self:onClickGarrisonEvent(data.chapter)
            end)
            --todo:动态加载章节图标
            --chapter.imgIcon = self:getImage('btnChapter/imgIcon')
            self:getText('btnChapter/imgName/txt', data.node).text = data.chapter.config.capter_name
            self:addClickByPath('btnChapter', function()
                self:onClickChapter(data.chapter)
            end, data.node)
            table.insert(self.chaptersData, data)
        end
    end
    self:refreshChapters()
end

--刷新章节列表
function M:refreshChapters()
    for i,v in ipairs(self.chaptersData) do
        local chapter = v.chapter
        v.nodeLocked:SetActive(not chapter.unlocked)
        v.nodeFinished:SetActive(chapter.unlocked and chapter.finished)
        v.nodeRunning:SetActive(chapter.unlocked and not chapter.finished)
        v.nodeSearch:SetActive(chapter.unlocked and chapter.searching)
        v.nodeSearchIcon:SetActive(chapter.searching --[[and not chapter.searchFinished--]])
        v.nodeSearchEvent:SetActive(chapter.searching and chapter.searchExistEvents)
        v.nodeSearchReward:SetActive(false) --todo:探索奖励图标
        v.nodeSearchChallenge:SetActive(false) --todo:挑战状态
        v.nodeGarrisonEvent:SetActive(chapter.event ~= nil)

        if not chapter.unlocked then
            v.txtTips.text = string.format('LV %s', chapter.config.level)
        else
            v.txtTips.text = string.format('完成度%s%%', math.floor(chapter.progress * 100))
        end

        if chapter.searching then
            if not chapter.searchFinished then
                local second = TimeUtils.getLeftTime(chapter.searchEndTime).tScond
                v.txtSearchCountdown.text = TimeUtils.formatHMS(second)
            else
                v.txtSearchCountdown.text = '探索完成'
            end
        end
    end
end

--点击驻守事件旗袍
function M:onClickGarrisonEvent(chapter)
    UIManager.openWindow('ChapterGarrisonRewardWindow', nil, chapter)
end

--点击章节
function M:onClickChapter(chapter)
    UIManager.openWindow('ChapterDetailWindow', nil, chapter)
end

