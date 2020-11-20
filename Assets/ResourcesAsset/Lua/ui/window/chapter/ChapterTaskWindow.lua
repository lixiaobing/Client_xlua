---@class ChapterTaskWindow
local ChapterTaskWindow = DClass("ChapterTaskWindow", BaseWindow)
_G.ChapterTaskWindow = ChapterTaskWindow


function ChapterTaskWindow:ctor(data)
    self.chapterID = data[1]
    self.closeFunc = data[2]
    self.hideBackMain = data[3] --是否隐藏返回按钮
end
function ChapterTaskWindow:onInit()

    self.messager:addListener(Msg.CHAPTER_TASK_STATUS_CHANGE, self.onTaskStatusChange)
    self.tabs ={}
    for i=1,2 do
        local panel = self.nodes.panelTabs:Find("Panel"..i)
        local tab = {}
        tab.button   = panel.transform:Find("Button"):GetComponent(typeof(Button))
        tab.goSelect = panel.transform:Find("Image_select")
        tab.textName = panel.transform:Find("Text_name"):GetComponent(typeof(Text))
        table.insert(self.tabs,tab)
        self:addEventHandler(tab.button.onClick, self.onTabClick,i)
    end
    self:onTabClick(1)
end

function ChapterTaskWindow:onTaskStatusChange()
    self:onTabClick(self.tabIndex or 1) --强制刷新
end

function ChapterTaskWindow:getTasks(taskType)
    Log("self.chapterID:"..self.chapterID)
    local tasks =  LTaskMgr:getTasks(self.chapterID,taskType)
    return tasks
end

function ChapterTaskWindow:refresh()
end

--任务详情
function ChapterTaskWindow:onClickTaskDetails()
    Log("任务详情")
end


--任务
function ChapterTaskWindow:onClickTask()
    Log("任务界面")
end

--开始战斗
function ChapterTaskWindow:onClickBattle()
      Log("开始战斗..")
    UIManager.closeAllWindow()
    UIManager.openWindow("LoadSceneWindow", function()
        self:close()

        local selectHeroId = PlayerPrefsUtils.getSelectHeroId()
        local selectLevelID = PlayerPrefsUtils.getSelectLevelId()

        BattleFactory.enter({selectHeroId}, selectLevelID)
    end)
end

-- --开发
-- function ChapterTaskWindow:onClickDev()
--     Log("功能开发中...")
-- end
-- --情报
-- function ChapterTaskWindow:onClickInfo()
--     Log("功能开发中...")
-- end
-- --兑换
-- function ChapterTaskWindow:onClickExchange()
--     Log("功能开发中...")
-- end

function ChapterTaskWindow:onTabClick(index)
    Log("onTabClick:"..index)
    self.tabIndex = index

    --按钮刷新
    for i, tab in ipairs(self.tabs) do
        tab.button.interactable = (i ~= index)
        tab.goSelect.gameObject:SetActive(i == index )
    end

    self.nodes.panelMain.gameObject:SetActive(index == 1)
    self.nodes.panelBranch.gameObject:SetActive(index == 2)
    if index == 1 then 

        local tasks = self:getTasks(LTaskType.Main)
        --选中的任务索引
        if not self.selectTaskIdx then 
            for i, v in ipairs(tasks) do
                if v:getStatus() == LTaskStatus.Accepted then 
                    self.selectTaskIdx = i
                end
            end
            self.selectTaskIdx = self.selectTaskIdx or 1 --没找到默认选中第一个
        end
        self.nodes.scrollMainTaskList:ReloadConfig()
        local startIndex = self.nodes.scrollMainTaskList:GetCurViewRange(0,0)
        self.nodes.scrollMainTaskList:InitPool(#tasks, function(_index, obj)
            local task = tasks[_index]
            local btn = obj.transform:GetComponent(typeof(Button))
            self:addEventHandler(btn.onClick, self.onTaskSelect,_index)
            obj.transform:Find("Text"):GetComponent(typeof(Text)).text = task:getName()
            btn.interactable = (self.selectTaskIdx ~= _index)
        end,startIndex)
        self:refreshTaskInfo()
    elseif index == 2 then 
        local tasks = self:getTasks(LTaskType.Branch) --支线任务
        self.nodes.imageNoItems.gameObject:SetActive(#tasks == 0)
        self.nodes.scrollBranchTaskList:ReloadConfig()
        local startIndex = self.nodes.scrollBranchTaskList:GetCurViewRange(0,0)
        self.nodes.scrollBranchTaskList:InitPool(#tasks, function(_index, obj)
            local task = tasks[_index]
            obj.transform:Find("TextName"):GetComponent(typeof(Text)).text = task:getName()
            obj.transform:Find("TextDesc"):GetComponent(typeof(Text)).text = task:getDesc()
            obj.transform:Find("TextTargetName"):GetComponent(typeof(Text)).text = task:getTarget().text
            obj.transform:Find("TextRecommendLevel"):GetComponent(typeof(Text)).text = ""..(task.config.level or 0)
            obj.transform:Find("ImageComplete").gameObject:SetActive(task:isDone() or task:isRecived())
            obj.transform:Find("ImageProgress").gameObject:SetActive(task:isAccepted())
            local toggle = obj.transform:Find("ToggleTrack"):GetComponent(typeof(Toggle))
            toggle.isOn  = task:isTrack()
            self:addEventHandler(toggle.onValueChanged, function( ... )
                task:setTrack(toggle.isOn)
                self.nodes.scrollBranchTaskList:ReloadCurCards()
            end)



            local btn = obj.transform:Find("Button_submit"):GetComponent(typeof(Button))

            local status = task:getStatus()

            if task:isDone() then 
                btn.gameObject:SetActive(true)
                self:addEventHandler(btn.onClick, self.onTaskSubmit,_index)
            else
                btn.gameObject:SetActive(false)
            end
            local scrollItem = obj.transform:Find("Rewards/Viewport/Content"):GetComponent(typeof(ScrollPoolHorizontal))

            --任务奖励
            scrollItem:ReloadConfig()
            -- Log(rewards)
            local rewards = task:getReward()
            scrollItem:InitPool(#rewards, function(index, obj) 
                    local data = rewards[index]
                    local mask = obj.transform:Find("Mask"):GetComponent(typeof(Image))
                    local icon = obj.transform:Find("Mask/Icon"):GetComponent(typeof(Image))
                    local textNum = obj.transform:Find("TextNum"):GetComponent(typeof(Text))
                    textNum.gameObject:SetActive(true)
                    textNum.text  = "x"..tostring(data.count)
                    local item = Config.Item[data.id]
                    UIUtil.setItemIcon(icon,item.item_icon)
                    UIUtil.setItemSmallBackground(mask,item.item_bg)
                end)
        end,startIndex)

    end
end

function ChapterTaskWindow:onTaskSubmit(index)
    Log("提交任务")
    local task = self:getTasks(LTaskType.Branch)[index]
    if task then
        task:reqReceiveReward()
    end
end

function ChapterTaskWindow:onTaskSelect(index)
    Log("onTaskSelect---:"..index)
    self.selectTaskIdx = index
    self.nodes.scrollMainTaskList:ReloadCurCards()
    self:refreshTaskInfo()
end

--刷新主线任务信息
function ChapterTaskWindow:refreshTaskInfo()
    --当前选中的任务
    local task = self:getTasks(LTaskType.Main)[self.selectTaskIdx]
    if not task then  return end
    self.nodes.textTaskName.text   = task:getName()
    self.nodes.textLevel.text      = task:getLevelLimit()
    self.nodes.textTaskDesc.text   = task:getDesc()
    local targets = task:getTargets()
    for i=1,3 do
        local textTaskTarget = self.nodes["textTaskTarget"..i]
        if targets[i] then
            textTaskTarget.gameObject:SetActive(true) 
            textTaskTarget.text = targets[i].text
            if targets[i].done then 
                textTaskTarget.color =  Color.black
            else
                textTaskTarget.color =  Color.gray
            end
        else
            textTaskTarget.gameObject:SetActive(false) 
        end
    end

    self.nodes.imageComplete.gameObject:SetActive(task:isDone())
    local rewards = task:getReward() 
    --任务奖励
    self.nodes.scrollReward:ReloadConfig()
    -- Log(rewards)
    self.nodes.scrollReward:InitPool(#rewards, function(index, obj) 
            local data = rewards[index]
            local mask = obj.transform:Find("Mask"):GetComponent(typeof(Image))
            local icon = obj.transform:Find("Mask/Icon"):GetComponent(typeof(Image))
            local textNum = obj.transform:Find("TextNum"):GetComponent(typeof(Text))
            textNum.gameObject:SetActive(true)
            textNum.text  = "x"..tostring(data.count)
            local item = Config.Item[data.id]
            UIUtil.setItemIcon(icon,item.item_icon)
            UIUtil.setItemBigBackground(mask,item.item_bg)
        end)

end

function ChapterTaskWindow:onOpen()
    if self.hideBackMain then 
        UIGlobal.topBanner:showMainButton(false)
    end
end

function ChapterTaskWindow:onClose()
    if self.closeFunc then
        self.closeFunc()
    end 
end

return ChapterTaskWindow