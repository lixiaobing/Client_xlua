--[[
    精灵系统升级突破面板
    @Liukeming 2020-6-18
]]
local M = DClass('HeroLevelPanel', HeroBasePanel)
_G.HeroLevelPanel = M

function M:onInit()
    --lang
    self:getText('nodeMid/nodeTitle/txtTitle').text = Lang(1401015)
    self:getText('nodeBottom/nodeBreak/nodeTitle/txtTitle').text = Lang(1401016)
    self:getText('nodeBottom/nodeExp/btnAddExp/txt').text = Lang(1401017)
    self:getText('nodeBottom/nodeBreak/btnBreakThrough/txt').text = Lang(1401018)

    --长按加速模式配置 {加速时间段，加速速度（个/秒）}
    self.pressConfig = 
    {
        {time = 0, speed = 2},
        {time = 1, speed = 8},
        {time = 2, speed = 32},
        {time = 3, speed = 1280},
    }

    --顶部
    self.nodeTop = self:getObj('nodeTop')
    self.rtTop = self:getRectTransform('nodeTop')
    self.txtCurExp = self:getText('nodeExp/txtCurExp', self.nodeTop)
    self.txtMaxExp = self:getText('nodeExp/txtMaxExp', self.nodeTop)
    self.txtCurLevel = self:getText('txtCurLevel', self.nodeTop)
    self.txtMaxLevel = self:getText('txtMaxLevel', self.nodeTop)
    self.imgExp = self:getImage('imgExp', self.nodeTop)
    self.imgTag = self:getImage('imgTag', self.nodeTop)
    --中部
    self.nodeMid = self:getObj('nodeMid')
    self.rtMid = self:getRectTransform('nodeMid')
    self.txtAttack = self:getText('nodeAttrs/nodeAttack/txt', self.nodeMid)
    self.txtDefense = self:getText('nodeAttrs/nodeDefense/txt', self.nodeMid)
    self.txtHP = self:getText('nodeAttrs/nodeHP/txt', self.nodeMid)
    self.txtCrit = self:getText('nodeAttrs/nodeCrit/txt', self.nodeMid)
    --底部
    self.nodeBottom = self:getObj('nodeBottom')
    self.rtBottom = self:getRectTransform('nodeBottom')
    --底部 - 强化
    self.nodeExp = self:getObj('nodeExp', self.nodeBottom)
    self.btnAddExp = self:getObj('btnAddExp', self.nodeExp)
    self.addExpCosts = {}
    self:bindAddExpCosts()
    self:addClick(self.btnAddExp, self.onClickAddExp)
    --底部 - 突破
    self.nodeBreak = self:getObj('nodeBreak', self.nodeBottom)
    self.nodeCondition1 = self:getObj('nodeCondition1', self.nodeBreak)
    self.nodeCondition2 = self:getObj('nodeCondition2', self.nodeBreak)
    self.txtCondition1 = self:getText('txt', self.nodeCondition1)
    self.txtCondition2 = self:getText('txt', self.nodeCondition2)
    self.btnBreakThrough = self:getObj('btnBreakThrough', self.nodeBreak)
    self.breakCosts = {}
    self:bindBreakCosts()
    self:addClick(self.btnBreakThrough, self.onClickBreakThrough)
    --底部 - 满级
    self.nodeMax = self:getObj('nodeMax', self.nodeBottom)

    --使用加经验道具时的加成数据（假数据）
    self.fakeLevel = 0
    self.fakeExp = 0

    --请求过程中的等级面板的阻塞，防止多余的刷新
    self.waiting = false
end

--循环里主要处理长按数据
function M:onUpdate()
    if self.pressing then
        local dt = Time.deltaTime
        self.pressTime = self.pressTime + dt
        --一秒内不做变化，不然减少的时候clickDown和click会冲突
        if self.pressTime >= 1 then
            local speed = 0
            for i,config in ipairs(self.pressConfig) do
                if self.pressTime >= config.time  then
                    speed = config.speed
                end
            end
            
            --长按期间一直使用这个值用于临时计数变化
            self.pressCount = self.pressCount + speed * dt * (self.pressAdd and 1 or -1)
            self:setAddExpCostCount(self.pressCost, math.floor(self.pressCount))
            self:refreshTop()
            self:refreshMid()
        end
    end
end

function M:onShow()
    self:resetAddExpCosts()
end

--绑定加经验消耗相关节点
function M:bindAddExpCosts()
    --长按相关数据
    self.pressAdd = false   --长按类型：增加/减少
    self.pressCost = nil    --长按消耗对象引用
    self.pressCount = 0     --长按初始数量
    self.pressing = false   --是否长按状态
    self.pressTime = 0      --长按时间

    --插入消耗对象并排序
    self.addExpCosts = {}
    for k,v in pairs(Config.Global[10401].param_4) do
        local cost = {}
        cost.id = v.id
        cost.exp = v.count --此道具增加的经验值
        cost.config = Config.Item[cost.id]
        cost.count = 0 --这个值为小数，显示和请求服务器的时候转为整数
        table.insert(self.addExpCosts, cost)
    end
    table.sort(self.addExpCosts, function(a, b) return a.id < b.id end)

    for i,v in ipairs(self.addExpCosts) do
        v.index = i
        v.node = self:getObj('nodeCosts/cost' .. i, self.nodeExp)
        v.node:SetActive(false)
        v.txtCurCount = self:getText('txtCurCount', v.node)
        v.txtMaxCount = self:getText('txtMaxCount', v.node)
        v.imgItem = self:getImage('btnItem/imgItem', v.node)
        v.imgItemBg = self:getImage('btnItem', v.node)
        self:setSprite(v.imgItemBg, BagManager.pathItemQuality .. string.format("Quality_Samll%02d", v.config.quality))
        self:loadSprite(BagManager.pathItemIcon .. v.config.item_icon, function(sp)
            v.imgItem.sprite = sp
            v.node:SetActive(true) --异步加载的道具图片决定显隐
        end)

        for i=1,5 do
            self:getObj('btnItem/stars/star' .. i, v.node):SetActive(v.config.star >= i)
        end

        local cost = v
        v.btnItem = self:getCom('ButtonAction', 'btnItem', v.node)
        v.btnSub = self:getCom('ButtonAction', 'btnSub', v.node)
        self:bindPressEvent(cost, v.btnItem, true)
        self:bindPressEvent(cost, v.btnSub, false)
    end
end

--绑定按钮的长按效果
function M:bindPressEvent(cost, btn, isAdd)
    self.parent:addEventHandler(btn.onPressDown, function()
        self.pressAdd = isAdd
        self.pressCost = cost
        self.pressCount = cost.count
        self.pressing = true
        self.pressTime = 0
    end)

    self.parent:addEventHandler(btn.onPressUp, function() 
        self.pressing = false 
    end)

    self.parent:addEventHandler(btn.onClick, function()
        --长按1秒内走正常点击，否则走批量选取加速
        if self.pressTime < 1 then
            local intCount = math.floor(cost.count) --走正常点击的话长按累计的小数部分就要丢弃
            self:setAddExpCostCount(cost, intCount + (isAdd and 1 or -1), true)
            self:refreshTop()
            self:refreshMid()
        end
    end)
end

--绑定突破消耗
function M:bindBreakCosts()
    self.breakCosts = {}
    for i=1,4 do
        local cost = {}
        cost.node = self:getObj('nodeCosts/cost' .. i, self.nodeBreak)
        cost.node:SetActive(false)
        cost.btn = self:getObj('btnItem', cost.node)
        cost.imgItemBg = self:getImage('btnItem', cost.node)
        cost.imgItem = self:getImage('btnItem/imgItem', cost.node)
        cost.stars = {}
        for i=1,5 do
            table.insert(cost.stars, self:getObj('btnItem/stars/star' .. i, cost.node))
        end
        cost.txtCount = self:getText('txtCount', cost.node)
        self:addClick(cost.btn, function()
            self:onClickBreakCostItem(cost)
        end)
        table.insert(self.breakCosts, cost)
    end
end

--根据当前消耗计算假数据
function M:setFakeExp(cost, count)
    local hero = self.parent.hero
    local groupConfig = Config.HeroGroup[hero.id * 10 + hero.stage]
    
    if count < cost.count then
        --减少经验
        self.fakeExp = self.fakeExp + cost.exp * (count - cost.count)
        while self.fakeExp < 0 do
            self.fakeLevel = self.fakeLevel - 1
            self.fakeExp = self.fakeExp + Config.HeroLevel[hero.stage * 100 + self.fakeLevel].exp
        end
        cost.count = count
    elseif count > cost.count then
        --增加经验
        local diff = count - cost.count
        for i=1,diff do
            if self.fakeLevel == groupConfig.level then
                return false
            else
                --增加经验并且适配到合适的等级
                self.fakeExp = self.fakeExp + cost.exp
                while self.fakeLevel < groupConfig.level do
                    local fakeLevelConfig = Config.HeroLevel[hero.stage * 100 + self.fakeLevel]
                    if self.fakeExp >= fakeLevelConfig.exp then
                        self.fakeExp = self.fakeExp - fakeLevelConfig.exp
                        self.fakeLevel = self.fakeLevel + 1
                    else
                        break
                    end
                end
                --数量自增1表示模拟成功一次
                cost.count = cost.count + 1
            end
        end
    end
    return true
end

--设置强化消耗数量，自动修正非法值，showMaxTips表示仅仅在点击时弹出提示框
function M:setAddExpCostCount(cost, count, showMaxTips)
    if count == cost then
        return
    end

    local maxCount = UIUtil.getItemCount(cost.id) --最大数量为背包数量
    local curCount =  math.max(0, math.min(maxCount, count))
    local intCount = math.floor(curCount) --注意这个只是输入的目标数量
    
    if not self:setFakeExp(cost, intCount) and showMaxTips then
        MsgCenter.sendMessage(Msg.HINT_COMMON, Lang(1401019))
        return
    end

    cost.txtCurCount.text = cost.count > 0 and string.format('<color=orange>%s</color>', cost.count) or ''
    cost.txtMaxCount.text = maxCount
    cost.btnSub.gameObject:SetActive(cost.count > 0)
    self:refreshAddExpButton()
end

--重置全部强化消耗数量
function M:resetAddExpCosts()
    local hero = self.parent.hero
    self.fakeLevel = hero.level
    self.fakeExp = hero.exp
    for i,v in ipairs(self.addExpCosts) do
        v.count = 0
        self:setAddExpCostCount(v, 0)
    end
    self:refreshAddExpButton()
end

--刷新强化按钮状态
function M:refreshAddExpButton()
    local active = false
    for i,v in ipairs(self.addExpCosts) do
        if math.floor(v.count) > 0 then
            active = true
            break
        end
    end
    self:setButtonGray(self.btnAddExp, not active)
end

--刷新突破状态
function M:refreshBreakThrough()
    local hero = self.parent.hero
    local groupConfig = Config.HeroGroup[hero.id * 10 + hero.stage]
    self.txtCondition1.text = groupConfig.lockdes
    self.txtCondition2.text = groupConfig.lockdes
    local enough = true
    for i=1,4 do
        local cost = self.breakCosts[i]
        local consume = groupConfig.consume[i]
        cost.node:SetActive(false)
        if consume then
            local costCount = consume.count
            local curCount = UIUtil.getItemCount(consume.id)
            local item = Config.Item[consume.id]
            cost.itemID = consume.id
            cost.txtCount.text = self:getBreakThroughText(curCount, costCount)
            self:setSprite(cost.imgItemBg, BagManager.pathItemQuality .. string.format("Quality_Samll%02d", item.quality))
            self:loadSprite(BagManager.pathItemIcon .. item.item_icon, function(sp)
                cost.imgItem.sprite = sp
                cost.node:SetActive(true) --异步加载的道具图片决定显隐
            end)
            for i=1,5 do
                cost.stars[i]:SetActive(item.star >= i)
            end
            if curCount < costCount then
                enough = false
                end
        end
    end
    self:setButtonGray(self.btnBreakThrough, not enough)
end

--突破消耗文本按规则显示
function M:getBreakThroughText(curCount, costCount)
    local enough = curCount >= costCount
    if costCount < 1000 then
        return Utils.getCostTextWithColor(curCount, enough) .. '/' .. costCount
    else
        return Utils.getCostTextWithColor(costCount, enough)
    end
end

--刷新顶部等级和经验条
function M:refreshTop()
    local hero = self.parent.hero
    local groupConfig = Config.HeroGroup[hero.id * 10 + hero.stage]
    local levelConfig = Config.HeroLevel[hero.stage * 100 + self.fakeLevel]
    self:setSprite(self.imgTag, 'Icon/Hero/stage_' .. groupConfig.icon)

    local levelTemp = hero.level ~= self.fakeLevel and '<color=orange>%s</color>' or '%s'
    local expTemp = (hero.level ~= self.fakeLevel or hero.exp ~= self.fakeExp) and '<color=orange>%s</color>' or '%s'

    self.txtCurLevel.text = string.format(levelTemp, self.fakeLevel)
    self.txtMaxLevel.text = '/' .. groupConfig.level
    if levelConfig.level_max then
        self.txtCurExp.text = '<color=#f63c41>MAX</color>'
        self.txtMaxExp.text = ''
        self.imgExp.fillAmount = 1
    else
        self.txtCurExp.text = string.format(expTemp, self.fakeExp)
        self.txtMaxExp.text = '/' .. levelConfig.exp
        self.imgExp.fillAmount = self.fakeExp / levelConfig.exp
    end
end

--刷新中间面板
function M:refreshMid()
    self:setAttribute(self.txtAttack, Lang(1401020), AttrType.ATK, 'atk', 'atk_group')
    self:setAttribute(self.txtDefense, Lang(1401021), AttrType.DEF, 'def', 'def_group')
    self:setAttribute(self.txtHP, Lang(1401022), AttrType.HP, 'health', 'health_group')
    self:setAttribute(self.txtCrit, Lang(1401023), AttrType.CRIT, 'crit', 'crit_group')
end

--刷新单个属性
function M:setAttribute(txt, name, attrID, levelFieldName, groupFieldName)
    local hero = self.parent.hero
    local levelConfig = Config.HeroLevel[hero.stage * 100 + hero.level]
    local groupConfig = Config.HeroGroup[hero.id * 10 + hero.stage]
    local attrConfig = Config.HeroAttr[hero.id * 10 + hero.star]
    local value = hero:getAttr(attrID)
    local addition = 0 --不同状态读取不同的字段加成
    if not groupConfig.maxtip or not levelConfig.level_max then
        if levelConfig.level_max then
            --突破加成
            addition = attrConfig[groupFieldName][hero.stage]
        else
            --等级加成，模拟计算假数据（比如从10-12级，那么属性加成就是2个等级的数据加成）
            local value = attrConfig[levelFieldName]
            --策划改了表结构和数值，这里做下兼容
            value = FixedToInt(type(value) == 'number' and value or value[2]) / 100
            addition = value * (self.fakeLevel - hero.level)
            addition = math.ceil(addition)
        end
    end
    addition = math.floor(addition / 100)
    addition = addition > 0 and string.format('<color=#63e158>+%s</color>', addition) or ''
    txt.text = string.format('%s：%s%s', name, value, addition)
end

--刷新底部面板
function M:refreshBottom()
    local hero = self.parent.hero
    local levelConfig = Config.HeroLevel[hero.stage * 100 + hero.level]
    local groupConfig = Config.HeroGroup[hero.id * 10 + hero.stage]
    self.nodeExp:SetActive(false)
    self.nodeBreak:SetActive(false)
    self.nodeMax:SetActive(false)
    if not groupConfig.maxtip or not levelConfig.level_max then
        if not levelConfig.level_max then
            self.nodeExp:SetActive(true)
            self:resetAddExpCosts()
        else
            self.nodeBreak:SetActive(true)
            self:refreshBreakThrough()
        end
    else
        self.nodeMax:SetActive(true)
    end
end

function M:refresh()
    --self.waiting在关键请求返回期间控制界面刷新，防止闪烁
    if not self.waiting then
        self:refreshTop()
        self:refreshMid()
        self:refreshBottom()
    end
end

function M:onClickAddExp()
    local args = {}
    for i=1,4 do
        local cost = self.addExpCosts[i]
        if cost.count > 0 then
            local arg = {}
            arg.itemId = cost.id
            arg.itemNum = math.floor(cost.count)
            table.insert(args, arg)
        end
    end

    --旧数据
    local hero = self.parent.hero
    local lastLevelConfig = Config.HeroLevel[hero.stage * 100 + hero.level]
    local lastLevel = self.parent.hero.level
    local lastExp = self.parent.hero.exp
    local lastAttrs = table.clone2(hero.attrs)
    self.waiting = true
    hero:addExp(args, function(data)
        self.waiting = false
        --新数据
        local nextLevelConfig = Config.HeroLevel[hero.stage * 100 + hero.level]
        local nextLevel = self.parent.hero.level
        local nextExp = self.parent.hero.exp
        local nextAttrs = table.clone2(hero.attrs) --这里服务器已经推送了新的属性了，可以放心使用
        self.parent:refreshRed()
        self:refresh()
        --弹框
        local panel = self.parent.panels.levelupPanel
        panel:setData(lastLevel, nextLevel, lastAttrs, nextAttrs)
        panel:show()
    end)
end

function M:onClickBreakCostItem(cost)
    MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, cost.itemID)
end

function M:onClickBreakThrough()
    self.waiting = true
    self.parent.hero:breakThrough(function(data)
        UIManager.openWindow('HeroStageupWindow', function()
            self.waiting = false
            self.parent:refreshRed()
            self:refresh()
        end, self.parent.hero)
    end)
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtTop, 650, 0, 0.2)
    self:doFadeX(0.1, self.rtMid, 650, 0, 0.2)
    self:doFadeX(0.2, self.rtBottom, 650, 0, 0.2)
    self:doFadeCallback(0.4, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtBottom, 0, 650, 0.2)
    self:doFadeX(0.1, self.rtMid, 0, 650, 0.2)
    self:doFadeX(0.2, self.rtTop, 0, 650, 0.2)
    self:doFadeCallback(0.4, callback)
end

function M:onCheckRed()
    return self.parent.hero:isBreakThroughRed()
end