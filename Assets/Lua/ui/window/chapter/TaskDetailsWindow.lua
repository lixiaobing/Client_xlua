local TaskDetailsWindow = DClass("TaskDetailsWindow", BaseWindow)
_G.TaskDetailsWindow = TaskDetailsWindow

function TaskDetailsWindow:ctor(data)
    self.taskId    = data[1]
    self.subTaskId = data[2]
    self.closeCallFunc = data[3]
end


function TaskDetailsWindow:onInit()

    local taskConfig = Config.DungeonTask[self.taskId]
    self.nodes.textTitle.text  = taskConfig.name
    -- self.nodes.item
    self.nodes.textDesc.text   = taskConfig.desc

    local taskData = {}
    if self.subTaskId > 0 then 
        taskData.cid = self.subTaskId
    else
        taskData.cid = self.taskId
    end

    self.task = LTask.new(taskData)
    local target = self.task:getTarget()
    self.nodes.textTarget.text = target.text
    
    if taskConfig.level then
        self.nodes.textTip.text    = "推荐等級"..taskConfig.level
    else
        self.nodes.textTip.gameObject:SetActive(false)
    end
    self:initList() 

    self:addEventHandler(self.nodes.btnRecv.onClick,self.onButtonClick)
    self:addEventHandler(self.nodes.btnCancel.onClick,self.onButtonCancel)

end

function TaskDetailsWindow:initList()
    local config  = Config.DungeonTask[self.taskId]
    local rewards = {}
    if config.reward then 
        for k,v in pairs(config.reward) do
            table.insert(rewards,v)
        end
    end
    self.nodes.rewards:ReloadConfig()
    self.nodes.rewards:InitPool(#rewards, function(index, obj)
        Log("index:"..index)
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


end

function TaskDetailsWindow:onButtonClick(sort)

    if self.task:checkLevel() then
        LTaskMgr:ReqAcceptDungeonTask(self.taskId,self.subTaskId)
        self:close() 
    else
        local data = {}
        data.title       = "提示"
        data.content     = "任务无法接取,等级不够"
        data.buttonNames = {"确定"}
        data.buttonTypes = {1}
        MsgCenter.sendMessage(Msg.NOTIFY, data)
    end
end

function TaskDetailsWindow:onButtonCancel()
    self:close() 
end
function TaskDetailsWindow:onClose()
    if self.closeCallFunc then 
        self.closeCallFunc()
    end
end