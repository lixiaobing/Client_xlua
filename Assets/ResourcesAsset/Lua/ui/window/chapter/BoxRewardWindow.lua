--[[
    战斗宝箱奖励弹出界面（重构版本）
    @Liukeming 2020-08-05

    比之前的版本优化如下：
        1.动画方式改为平滑上衣，顶部奖励平滑淡出
        2.支持窗口未关闭时，新的奖励弹出衔接，避免重复开关界面（UIUtil.showBoxReward）
]]

local M = DClass('BoxRewardWindow', BaseWindowExtend)
_G.BoxRewardWindow = M

function M:ctor(data)
    self.initRewards = data[1] or {}
end

function M:onInit()
    self.nodeParent = self:getObj('view')
    self.nodePrefab = self:getObj('view/prefab')
    self.nodePrefab:SetActive(false)
    self.items = {}                         --已经显示的奖励节点
    self.rewards = self.initRewards         --等待弹出的奖励列表
    self.tween = QTween.new()

    self.lineHeight = 34                    --行高 = 28(高度) + 6(间距)
    self.moveSpeed = self.lineHeight / 0.3  --上移速度
    self.pushing = false                    --当前是否正在插入
    self.keepTime = 1.5                     --保持时间，超过后开始淡出
    self.fadeTime = 0.5                     --淡出时间，淡出后立即销毁
end

--[[
function M:onOpen()
    --测试数据
    self.rewards =
    {
        { id =10201,num =100},
        { id =10201,num =100},
        { id =10201,num =100},
        { id =10201,num =100},
        { id =10201,num =100},
        { id =10201,num =100},
    }
end
--]]

function M:onUpdate()
    if #self.items == 0 and #self.rewards == 0 then
        --没有后续节点关闭界面
        self:close()
    else
        --提前刷新补间动画
        self.tween:update()

        --留出足够位置或者没有前置节点，可插入新节点
        if #self.rewards > 0 and not self.sliding then
            local reward = self.rewards[1]
            table.remove(self.rewards, 1)

            if #self.items == 0 then
                self:push(reward)
            else
                self:slide(function()
                    self:push(reward)
                end)
            end
        end
    end
end

--添加数据
function M:append(rewards)
    for i,v in ipairs(rewards) do
        table.insert(self.rewards, v)
    end
end

--统一上滑
function M:slide(callback)
    self.sliding = true
    for i,item in ipairs(self.items) do
        item.y = item.rt.anchoredPosition.y
    end
    self.tween:addTo(0, self.lineHeight, self.lineHeight / self.moveSpeed, function(offset)
        for i,item in ipairs(self.items) do
            item.rt.anchoredPosition = Vector2(0, item.y + offset)
        end
    end, function()
        self.sliding = false
        callback()
    end)
end

--压入一个节点
function M:push(reward)
    local item = {}
    item.go = GameObject.Instantiate(self.nodePrefab)
    item.go:SetActive(true)
    item.go.transform:SetParent(self.nodeParent.transform, false)
    item.rt = item.go:GetComponent('RectTransform')
    item.rt.anchoredPosition = Vector2.zero
    item.cg = item.go:GetComponent('CanvasGroup')

    local config = Config.Item[reward.id]
    self:getText('txtDesc', item.go).text = string.format('获得 [%s] x%s', config.name, reward.num)
    self:setSprite(self:getImage('imgItem', item.go), 'Icon/ItemIcon/' .. config.item_icon)

    --定时淡出
    local seq = self.tween:addSequence()
    seq:addDelay(self.keepTime)
    seq:addTo(1, 0, self.fadeTime, function(v)
        item.cg.alpha = v
    end, function()
        GameObject.Destroy(item.go)
        table.removeItem(self.items, item)
    end)

    table.insert(self.items, item)
end