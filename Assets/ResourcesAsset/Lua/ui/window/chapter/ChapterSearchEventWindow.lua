--[[
    章节区域探索事件界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterSearchEventWindow', BaseWindowExtend)
_G.ChapterSearchEventWindow = M

function M:ctor(data)
    self.event = data[1]
end

function M:onInit()
    local task = TaskManager:getTask(self.event.config.pro_task)
    local subTask = TaskManager:getTask(self.event.config.triger_task)
    self:getText('nodeDialog/txtDesc').text = self.event.config.des
    self.txtCondition = self:getText('nodeDialog/txtCondition')
    self.txtCondition.text = subTask.config.des
    self.nodeRewards = self:getObj('nodeDialog/nodeRewards')

    --进度条
    self.nodeProgressParent = self:getObj('nodeDialog/nodeProgress')
    self.nodeProgressPrefab = self:getObj('nodeDialog/nodeProgress/prefab')
    self.nodeProgressPrefab:SetActive(false)
    
    for i=1,task.max do
        local nodeProgress = GameObject.Instantiate(self.nodeProgressPrefab)
        nodeProgress.transform:SetParent(self.nodeProgressParent.transform, false)
        nodeProgress:SetActive(true)
        self:getObj('img', nodeProgress):SetActive(task.cur >= i)
    end

    --显示条件
    local subFinished = subTask.status == TaskStatus.Finished
    self.txtCondition.gameObject:SetActive(not subFinished)
    self.nodeRewards:SetActive(subFinished)

    --子任务完成就显示道具
    if subFinished then
        --1道具 2任务 3信物
        --todo:暂时不支持任务
        local type = self.event.config.award_type
        if type == 1 or type == 3 then
            for i=1,3 do
                local node = self:getObj('nodeDialog/nodeRewards/item' .. i)
                local reward = self.event.config.award[i]
                node:SetActive(reward ~= nil)
                if reward then
                    self:loadItemBox(node, reward.id)
                    self:getText('txtCount', node).text = reward.count
                end
            end
        end
    end

    --任务领取
    if task.status ~= TaskStatus.Finished then
        --大任务未完成
        self:addClickByPath('btnOK', function()
            if subTask.status == TaskStatus.Finished then
                TaskManager:receive(subTask.id, function(result)
                    self.event.active = false
                    self:close()
                end)
            else
                self:close()
            end
        end)
    else
        --大任务完成则，小任务大任务同时领取
        self:addClickByPath('btnOK', function()
            TaskManager:receive(subTask.id, function(_)
                TaskManager:receive(task.id, function(result)
                    self.event.active = false
                    MsgCenter.sendMessage(Msg.ITEMTIPS, {result.rewardsMsg, 1, function()
                        self:close()
                    end})
                end)
            end)
        end)
    end
end