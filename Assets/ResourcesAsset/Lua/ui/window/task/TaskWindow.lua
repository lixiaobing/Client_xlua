--[[
    任务（常规）主界面
    @Liukeming 2020-9-7
]]

local M = DClass('TaskWindow', BaseWindowExtend)
_G.TaskWindow = M

function M:onInit()
    --lang
    self:getText('nodeTypes/btnDaily/nodeActive/txt').text = '日常任务'
    self:getText('nodeTypes/btnDaily/nodeInactive/txt').text = '日常任务'
    self:getText('nodeTypes/btnWeekly/nodeActive/txt').text = '周常任务'
    self:getText('nodeTypes/btnWeekly/nodeInactive/txt').text = '周常任务'
    self:getText('nodeTask/list/content/prefab/btnFinished/txt').text = '领取'

    self.tabs = self:getUITabs('nodeTypes')
    self.tabs:bind(self, self.onSelected)
    self.list = self:getUIList('nodeTask/list')
    self.list:bind(self, self.onItemShow)

    self.type = nil
    self.tabs:select(0)
end

function M:reload()
    local tasks = TaskManager:getTasks(function(task)
        --显示限定类型的任务，1主线 2支线
        return 
            task.config.type == self.type and 
            task.config.is_show and 
            task.status == TaskStatus.Executing or task.status == TaskStatus.Finished
    end)
    self.list:clear()
    for i,v in ipairs(tasks) do
        self.list:add({task = v})
    end
    self.list:refresh()
end

function M:onSelected(tab, index)
    self.type = index + 1
    self:reload()
end

function M:onItemShow(e, v)
    self:getText('txtName', e.go).text = v.task.config.name
    self:getText('txtDesc', e.go).text = v.task.config.des
    self:getText('nodeProgress/txt', e.go).text = string.format('%s/%s', v.task.cur, v.task.max)
    self:getImage('nodeProgress/img', e.go).fillAmount = v.task.progress

    print(v.task.status)
    self:getObj('nodeExecuting', e.go):SetActive(v.task.status == TaskStatus.Executing)
    v.btnFinished = self:getObj('btnFinished', e.go)
    v.btnFinished:SetActive(v.task.status == TaskStatus.Finished)
    self:addClick(v.btnFinished, function()
        self:onClickFinished(v.task.id)
    end)
    --加载道具奖励框
    local rewards = {}
    for k,v in pairs(v.task.config.reward) do
        table.insert(rewards, v)
    end
    for i=1,2 do
        local nodeItemBox = self:getObj('nodeRewards/item' .. i, e.go)
        local reward = rewards[i]
        nodeItemBox:SetActive(reward ~= nil)
        if reward then
            self:loadItemBox(nodeItemBox, reward.id)
        end
    end
end

function M:onClickFinished(taskID)
    TaskManager:receive(taskID, function(result)
        MsgCenter.sendMessage(Msg.ITEMTIPS, {result.rewardsMsg, 1, function()
            self:reload()
        end})
    end)
end

