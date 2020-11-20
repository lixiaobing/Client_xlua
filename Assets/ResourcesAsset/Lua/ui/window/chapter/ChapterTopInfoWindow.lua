--[[
    章节区域情报界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterTopInfoWindow', BaseWindowExtend)
_G.ChapterTopInfoWindow = M

function M:ctor(data)
    self.chapter = data[1]
end

function M:onInit()
    --lang
    self:getText('nodeMainTask/nodeDetail/txtContitionTitle').text = '任务目标/奖励'
    self:getText('nodeSubTask/list/content/prefab/txtConditionTitle').text = '任务目标'
    self:getText('nodeSubTask/list/content/prefab/btnSubmit/txt').text = '提交任务'
    self:getText('nodeSubTask/nodeEmpty/txt').text = '暂无直线'

    --主线
    self.main = {}
    self.main.node = self:getObj('nodeMainTask')
    self.main.tasks = LTaskMgr:getTasks(self.chapter.id, LTaskType.Main)
    self.main.list = self:getUIList('nodeMainTask/list') --左侧任务列表
    self.main.list:bind(self, self.onMainTaskItemShow, nil, self.onMainTaskItemRefresh)
    self.main.list:clear()
    for i,v in ipairs(self.main.tasks) do
        self.main.list:add({task = v})
    end
    self.main.selectedTask = self.main.tasks[1]
    self.main.txtName = self:getText('nodeMainTask/nodeDetail/txtName')
    self.main.txtDesc = self:getText('nodeMainTask/nodeDetail/txtDesc')
    self.main.txtCondition = self:getText('nodeMainTask/nodeDetail/txtCondition')
    self.main.listReward = self:getUIList('nodeMainTask/nodeDetail/listReward') --右侧任务奖励
    self.main.listReward:bind(self, self.onMainTaskRewardItemShow)
    self.main.nodeFinished = self:getObj('nodeMainTask/nodeDetail/imgFinished')

    --支线
    self.sub = {}
    self.sub.node = self:getObj('nodeSubTask')
    self.sub.tasks = LTaskMgr:getTasks(self.chapter.id, LTaskType.Branch)
    self.sub.nodeEmpty = self:getObj('nodeSubTask/nodeEmpty')
    self.sub.nodeEmpty:SetActive(#self.sub.tasks == 0)
    self.sub.list = self:getUIList('nodeSubTask/list')
    self.sub.list.gameObject:SetActive(#self.sub.tasks > 0)
    if #self.sub.tasks > 0 then
        self.sub.list:bind(self, self.onSubTaskItemShow, nil, self.onSubTaskItemRefresh)
        self.sub.list:clear()
        for i,v in ipairs(self.sub.tasks) do
            self.sub.list:add({task = v})
        end
        self.sub.list:refresh()
    end

    --收藏品
    self.collection = {}
    self.collection.node = self:getObj('nodeCollection')
    self.collection.list = self:getUIList('nodeCollection/list')

    --探索事件（情报）
    self.event = {}
    self.event.node = self:getObj('nodeEvent')
    --准备所有事件
    --todo:由于配置表DungeonArea中不同区域配置了相同的事件，所以暂时无法合并当前章节的所有事件
    self.event.list = self:getUIList('nodeEvent/list')
    self.event.list:bind(self, self.onEventItemShow)
    self.event.list:clear()
    self.event.list:refresh()
    
    --页签
    self.tabIndex = nil;
    self.tabs = self:getUITabs('nodeTabs')
    self.tabs:bind(self, self.onSelected)
    self.tabs:select(0)
end

function M:refresh()
    if self.tabIndex == 0 then
        local task = self.main.selectedTask
        self.main.list:refresh()
        self.main.txtName.text = task.config.name
        self.main.txtDesc.text = task.config.desc
        self.main.txtCondition = Utils.getCostTextWithColor(task.config.finish_desc, task.data.status == 3)
        self.main.nodeFinished:SetActive(task.data.status == 3)
        self.main.listReward:clear()
        for i,v in ipairs(task.reward) do
            self.main.listReward:add({reward = v})
        end
        self.main.listReward:refresh()
    elseif self.tabIndex == 1 then
        self.sub.list:refresh()
    elseif self.tabIndex == 2 then
        --内容固定，不需要刷新
    elseif self.tabIndex == 3 then
        --内容固定，不需要刷新
    end
end

function M:onSelected(tab, index)
    self.tabIndex = index
    self:refresh()
end

function M:onMainTaskItemShow(e, v)
    v.nodeActive = self:getObj('imgActive', e.go)
    v.nodeInactive = self:getObj('imgInactive', e.go)
    self:getText('txt', e.go).text = v.task.config.name
end

function M:onMainTaskItemRefresh(e, v)
    v.nodeActive:SetActive(v.task == self.main.selectedTask)
    v.nodeInactive:SetActive(v.task ~= self.main.selectedTask)
end

function M:onMainTaskRewardItemShow(e, v)
    self:loadItemBox(self:getObj('ItemBox', e.go), v.reward.id)
end

function M:onSubTaskItemShow(e, v)
    self:getText('txtName', e.go).text = v.task.config.name
    self:getText('txtDesc', e.go).text = v.task.config.desc
    v.list = self:getUIList('listSubTaskReward', e.go)
    v.list:bind(self, self.onSubTaskRewardItemShow)
    v.list:clear()
    for i,v in ipairs(v.task.config.reward) do
        v.list:add({reward = v})
    end
    v.list:refresh()
    v.txtCondition = self:getText('txtCondition', e.go)
    v.nodeExecuting = self:getObj('imgExecuting', e.go)
    v.nodeFinished = self:getObj('imgFinished', e.go)
    v.btnSubmit = self:getObj('btnSubmit', e.go)
    self:addClick(v.btnSubmit, function()
        self:onClickSubTaskSubmit(v.task)
    end)
end

function M:onSubTaskItemRefresh(e, v)
    v.txtCondition.text = Utils.getCostTextWithColor(v.task.config.finish_desc, v.task.data.status == 3)
    v.nodeExecuting:SetActive(v.task.data.status == 1)
    v.btnSubmit:SetActive(v.task.data.status == 2)
    v.nodeFinished:SetActive(v.task.data.status == 3)
end

function M:onSubTaskRewardItemShow(e, v)
    self:loadItemBox(self:getObj('ItemBox', e.go), v.reward.id)
    self:getText('txtCount', e.go).text = string.format('x%s', v.reward.count)
end

--点击支线任务提交
function M:onClickSubTaskSubmit(task)
    --todo:提交后需要刷新支线任务界面
    self:refresh()
end