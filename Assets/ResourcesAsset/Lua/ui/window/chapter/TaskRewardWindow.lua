local TaskRewardWindow = DClass("TaskRewardWindow", BaseWindow)
_G.TaskRewardWindow = TaskRewardWindow
function TaskRewardWindow:ctor(data)
--[[    self.rewardDatas = data[1] or {{ id =10201,num =100},{ id =10201,num =100},{ id =10201,num =100}}
    self.rewardType  = data[2] or 20100102--]]
    self.rewardDatas = data[1] or {}
    self.rewardType  = data[2]
end
function TaskRewardWindow:onInit()
    self.nodes.ImageTitleBox.gameObject:SetActive(false)     --宝箱奖励
    self.nodes.ImageTitleBranch.gameObject:SetActive(false)  --支线任务
    self.nodes.ImageTitleMain.gameObject:SetActive(false)    --主线任务
    if self.rewardType then 
        local task = Config.DungeonTask[self.rewardType]
        self.nodes.TextTaskName.text =  task.name
        if task.type == LTaskType.Main then 
            self.nodes.ImageTitleMain.gameObject:SetActive(true)
        elseif task.type == LTaskType.Branch then 
            self.nodes.ImageTitleBranch.gameObject:SetActive(true) 
        end
    else
        self.nodes.TextTaskName.text =  ""
        self.nodes.ImageTitleBox.gameObject:SetActive(true)
    end
    self:initList()

    -- self:addEventHandler(self.nodes.btnRecv.onClick, function()
    --     self:close()
    -- end)
    --根据是否有奖励来显示，如果没有奖励开定时器自动关闭
    self.nodes.panelReward.gameObject:SetActive(true)
    self.nodes.btnRecv.gameObject:SetActive(false) --隐藏确定按钮
    --延迟自动关闭
    StartDelayTask(function()
        self:close()
    end,1)
end

function TaskRewardWindow:initList()

    self.nodes.rewards:ReloadConfig()
    self.nodes.rewards:InitPool(#self.rewardDatas, function(index, obj)
        Log("index:"..index)
        local data =  self.rewardDatas[index]
        local mask = obj.transform:Find("Mask"):GetComponent(typeof(Image))
        local icon = obj.transform:Find("Mask/Icon"):GetComponent(typeof(Image))
        local textNum = obj.transform:Find("TextNum"):GetComponent(typeof(Text))
        textNum.gameObject:SetActive(true)
        textNum.text  = "x"..tostring(data.num)
        local item = Config.Item[data.id]
        UIUtil.setItemIcon(icon,item.item_icon)
        UIUtil.setItemSmallBackground(mask,item.item_bg)
    end)


end

