--[[
    精灵系统技能面板
    @Liukeming 2020-6-23
]]

local M = DClass('HeroSkillPanel', HeroBasePanel)
_G.HeroSkillPanel = M

function M:onInit()
    --lang
    self:getText('nodeDetail/nodeCost/txtTitle').text = Lang(1401024)
    self:getText('nodeDetail/btnLevelup/txt').text = Lang(1401002)
    self:getText('nodeDetail/txtMax').text = Lang(1401025)

    --技能分组
    self.nodeGroups = self:getObj('nodeGroups')
    self.listGroups = self:getUIList('nodeGroups')
    self.listGroups:bind(self, self.onGroupItemShow, self.onGroupItemHide, self.onGroupItemRefresh)
    self.groups = {}
    for k,v in pairs(Config.HeroSkillType) do
        table.insert(self.groups, v)
    end
    table.sort(self.groups, function(a, b)
        return a.id < b.id
    end)
    
    --分组详情
    self.nodeDetail = self:getObj('nodeDetail')
    self.txtName = self:getText('txtName', self.nodeDetail)
    self.txtLevel = self:getText('txtLevel', self.nodeDetail)
    self.txtDesc = self:getText('txtDesc', self.nodeDetail)
    self.txtTips = self:getText('txtTips', self.nodeDetail)
    self.nodeMax = self:getObj('txtMax', self.nodeDetail)
    --技能消耗
    self.nodeCost = self:getObj('nodeCost', self.nodeDetail)
    self.nodeCostPrefab = self:getObj('costPrefab', self.nodeCost)
    self.nodeCostPrefab:SetActive(false)
    self.costs = {}
    --技能列表
    self.list = self:getUIList('listSkills', self.nodeDetail)
    self.list:bind(self, self.onItemShow, self.onItemHide, self.onItemRefresh)
    --按钮
    self.btnLeft = self:getObj('btnLeft', self.nodeDetail)
    self.btnRight = self:getObj('btnRight', self.nodeDetail)
    self.btnLevelup = self:getObj('btnLevelup', self.nodeDetail)
    self:addClick(self.btnLeft, self.onClickLeft)
    self:addClick(self.btnRight, self.onClickRight)
    self:addClick(self.btnLevelup, self.onClickLevelup)

    --动态数据
    self.groupIndex = nil --当前选中的分组
    self.skillIndex = nil --当前选中的技能
    self.skills = {}      --当前角色的技能
end

function M:onShow()
    self.groupIndex = nil
    self.skillIndex = nil
    self.listGroups:clear()
    for i,v in ipairs(self.groups) do
        self.listGroups:add({index = i, config = v})
    end
end

function M:refresh()
    self.nodeGroups:SetActive(self.groupIndex == nil)
    self.nodeDetail:SetActive(self.groupIndex ~= nil)
    if self.groupIndex == nil then
        self:refreshGroups()
    else
        self:refreshDetail()
    end
end

--刷新分组信息
function M:refreshGroups()
    self.listGroups:refresh()
end

--加载当前分组的技能信息
function M:reloadSkills()
    local hero = self.parent.hero
    local groupConfig = self.groups[self.groupIndex]
    self.skills = {}
    for k,v in pairs(groupConfig.skilltype) do
        local skill = {}
        skill.type = v
        skill.id = hero.id * 100 + skill.type
        skill.config = Config.HeroSkill[skill.id]
        skill.info = hero:getSkill(skill.type)
        table.insert(self.skills, skill)
    end
    table.sort(self.skills, function(a, b)
        return a.type < b.type
    end)
    self.list:clear()
    for i,v in ipairs(self.skills) do
        self.list:add({index = i, skill = v})
    end
end

--获取技能等级配置，未解锁则返回1级
function M:getSkillLevelConfig(skill)
    local level = skill.info and skill.info.level or 1
    return Config.HeroskillLevel[hero.id * 10000 + skill.type * 100 + skill.info.level]
end

--刷新分组的技能详情
function M:refreshDetail()
    local hero = self.parent.hero
    local skill = self.skills[self.skillIndex] --应该配置确保存在至少一个技能可供选择，否则分组无意义
    local skillLevel = skill.info and skill.info.level or 1
    local levelConfig = Config.HeroskillLevel[hero.id * 10000 + skill.type * 100 + skillLevel]
    self.txtName.text = levelConfig.name
    self.txtLevel.text = skill.info and string.format('LV.<size=76>%s</size>', skill.info.level) or ''
    self.txtDesc.text = levelConfig.des
    self.btnLeft:SetActive(self.groupIndex > 1)
    self.btnRight:SetActive(self.groupIndex < #self.groups)
    self.list:refresh()

    self.txtTips.gameObject:SetActive(false)
    self.nodeMax:SetActive(false)
    self.nodeCost:SetActive(false)
    self.btnLevelup:SetActive(false)
    if not skill.info then
        --未解锁
        self.txtTips.gameObject:SetActive(true)
        self.txtTips.text = skill.config.lock_des --稀有度解锁
    else
        if levelConfig.max then
            --已满级
            self.nodeMax.gameObject:SetActive(true)
        elseif hero.level < levelConfig.lock then
            self.txtTips.gameObject:SetActive(true)
            self.txtTips.text = levelConfig.lockdes --升级限制提示
        else
            --消耗道具
            self.nodeCost:SetActive(true)
            for i,v in ipairs(self.costs) do
                v.node:SetActive(false)
            end

            --自增式加载
            self.costs = {}
            for i,v in ipairs(levelConfig.consume) do
                local itemID = v.id
                local cost = self.costs[i]
                if not cost then
                    cost = {}
                    cost.node = GameObject.Instantiate(self.nodeCostPrefab)
                    cost.node.transform:SetParent(self.nodeCost.transform, false)
                    cost.imgItem = self:getImage('imgItemBg/imgItem', cost.node)
                    cost.txtCount = self:getText('txtCount', cost.node)
                end

                cost.node:SetActive(true)
                cost.imgItem.gameObject:SetActive(false)
                local itemConfig = BagManager.getItemConfigDataById(itemID)
                self:loadSprite(BagManager.pathItemIcon .. itemConfig.item_icon, function(sp)
                    cost.imgItem.sprite = sp
                    cost.imgItem.gameObject:SetActive(true)
                end)
                self:addClick(cost.imgItem.gameObject, function()
                    self:onClickItem(itemID)
                end)
                local costCount = v.count
                local curCount =  UIUtil.getItemCount(itemID)
                local isEnough = curCount >= costCount
                local notEnoughCount = Utils.getCostTextWithColor(costCount, false)
                cost.txtCount.text = isEnough and costCount or notEnoughCount
                table.insert(self.costs, cost)
            end

            local enough = true
            for i,v in ipairs(levelConfig.consume) do
                if UIUtil.getItemCount(v.id) < v.count then
                    enough = false
                    break
                end
            end
            self.btnLevelup:SetActive(true)
            self:setButtonGray(self.btnLevelup, not enough)
        end
    end
    
    self.list:refresh()
end

--有些界面好好几层，一层层返回
function M:getBackCount()
    return self.groupIndex ~= nil and 1 or 0
end

--返回上一层级回调
function M:onBack()
    self:fadeOut(function()
        self:fadeIn() --fadeIn会自动情况两个索引
    end)
end

function M:onGroupItemShow(e, v)
    v.imgIconBg = self:getImage('imgIconBg', e.go)
    v.imgIcon = self:getImage('imgIcon', e.go)
    v.imgTag = self:getImage('imgTag', e.go)
    v.nodeRed = self:getObj('imgRed', e.go)
    v.txtName = self:getText('txtName', e.go)
    v.txtLevel = self:getText('txtLevel', e.go)
    v.txtType = self:getText('txtType', e.go)
    v.txtName.text = v.config.name
    v.txtType.text = v.config.tip_name
    self:setSprite(v.imgTag, 'Icon/Hero/group_' .. v.config.tip_icon)
    self:addClick(e.go, function()
        self:onClickGroup(v.index)
    end)
end

function M:onGroupItemHide(e, v)
    self:removeClick(e.go)
end 

function M:onGroupItemRefresh(e, v)
    local hero = self.parent.hero
    local level = 0
    for i,type in ipairs(v.config.skilltype) do
        local skill = hero:getSkill(type)
        if skill then
            level = level + skill.level
        end
    end
    v.txtLevel.text = string.format(Lang(1401026), level)
    v.nodeRed:SetActive(self.parent.hero:isSkillGroupRed(v.config))
end

function M:onItemShow(e, v)
    v.nodeBg = self:getObj('imgBg', e.go)
    v.nodeBg2 = self:getObj('imgBg2', e.go)
    v.imgSkill = self:getImage('imgSkill', e.go)
    v.nodeSelected = self:getObj('imgSelected', e.go)
    v.nodeRed = self:getObj('imgRed', e.go)
    v.btn = e.go
    self:addClick(v.btn, function()
        self:onClickSkill(v.index)
    end)

    --todo:技能暂时没有主动被动之分
    v.nodeBg:SetActive(true)
    v.nodeBg2:SetActive(false)
end

function M:onItemHide(e, v)
    self:removeClick(v.btn)
end

function M:onItemRefresh(e, v)
    UIUtil.setGrayWithStencil(v.imgSkill, v.skill.info == nil)
    v.nodeSelected:SetActive(v.index == self.skillIndex)
    v.nodeRed:SetActive(self.parent.hero:isSkillRed(v.skill.type))
end

function M:onClickGroup(index)
    self:onFadeOut(function()
        self.groupIndex = index
        self.skillIndex = 1
        self:reloadSkills()
        self:refresh()
        self:onFadeIn()
    end)
end

function M:onClickSkill(index)
    self.skillIndex = index
    self:reloadSkills()
    self:refresh()
end

function M:onClickLeft()
    if self.groupIndex > 1 then
        self.groupIndex = self.groupIndex - 1
        self.skillIndex = 1
        self:reloadSkills()
        self:refresh()
    end
end

function M:onClickRight()
    if self.groupIndex < #self.groups then
        self.groupIndex = self.groupIndex + 1
        self.skillIndex = 1
        self:reloadSkills()
        self:refresh()
    end
end

function M:onClickItem(id)
    MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, id)
end

function M:onClickLevelup()
    local hero = self.parent.hero
    local skill = self.skills[self.skillIndex]
    hero:skillLevelup(skill.type, function()
        self.parent:refreshRed()
        self:refresh()
    end)
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtNode, 650, 0, 0.3, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtNode, 0, 650, 0.3, callback)
end

function M:onCheckRed()
    return self.parent.hero:isSkillGroupsRed()
end