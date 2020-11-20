--[[
    精灵系统稀有度面板
    @Liukeming 2020-6-22
]]

local M = DClass('HeroStarPanel', HeroBasePanel)
_G.HeroStarPanel = M

function M:onInit()
    --lang
    self:getText('nodeActive/btnStarActivate/txt').text = Lang(1401027)
    self:getText('nodeActive/btnStarLevelup/txt').text = Lang(1401003)

    self.nodeMax = self:getObj('nodeMax')
    self.nodeActive = self:getObj('nodeActive')
    self.nodePointPrefabs = {}
    self.nodePoints = {}
    for i=1,4 do
        local nodePointPrefab = self:getObj('nodePointPrefab' .. i, self.nodeActive)
        table.insert(self.nodePointPrefabs, nodePointPrefab)
    end
    self.imgStarTag = self:getImage('nodeStarTag/img', self.nodeActive)
    self.nodeStarBorder1 = self:getObj('nodeStarBorder1', self.nodeActive)
    self.rtStarBorder1 = self:getRectTransform('nodeStarBorder1', self.nodeActive)
    self.nodeStarBorder2 = self:getObj('nodeStarBorder2', self.nodeActive)
    self.nodeCost = self:getObj('nodeCost', self.nodeActive)
    self.nodeItem = self:getObj('nodeCost/imgItemBg/nodeItem', self.nodeActive)
    self.imgItem = self:getImage('nodeCost/imgItemBg/nodeItem', self.nodeActive)
    self.txtCount = self:getText('nodeCost/txtCount', self.nodeActive)
    self.nodeTips = self:getObj('nodeTips', self.nodeActive)
    self.txtTips = self:getText('nodeTips/txtTips', self.nodeActive)
    self.btnStarActivate = self:getObj('btnStarActivate', self.nodeActive)
    self.btnStarLevelup = self:getObj('btnStarLevelup', self.nodeActive)

    self:addClick(self.nodeActive, self.onClickCenterPoint)
    self:addClick(self.nodeItem, self.onClickItem)
    self:addClick(self.btnStarActivate, self.onClickStarActivate)
    self:addClick(self.btnStarLevelup, self.onClickStarLevelup)

    --当前选中的激活点ID，0代表突破点
    self.index = -1
end

function M:onShow()
    self:reload()
end

--重新加载整个稀有度数据
function M:reload()
    local hero = self.parent.hero
    local starConfig = Config.HeroStart[hero.id * 100 + hero.star]

    --刷新稀有度大图标
    local scale = SpriteStarBigIconScale[hero.star]
    self:setSprite(self.imgStarTag, 'Icon/Hero/quality_big_' .. hero.star, function()
        self.imgStarTag:SetNativeSize()
        self.imgStarTag.transform.localScale = Vector3(scale, scale, 1)
    end)

    --刷新激活点
    for i,v in ipairs(self.nodePoints) do
        GameObject.Destroy(v.node)
    end
    self.nodePoints = {}
    if not starConfig.is_max then
        for k,v in pairs(starConfig.point) do
            local levelConfig = Config.HeroStartLevel[k]
            if not levelConfig then
                LogError('Config of hero star level not exist with key = ' .. k)
            else
                local point = {}
                point.id = k
                point.num = levelConfig.num --这个num不一定连续
                point.node = GameObject.Instantiate(self.nodePointPrefabs[levelConfig.icon])
                point.node.transform:SetParent(self.nodeActive.transform, false)
                point.node:SetActive(true)
                point.img = point.node:GetComponent('Image')
                point.rt = point.node:GetComponent('RectTransform')
                point.rt.anchoredPosition = Vector2(levelConfig.pos[1].x / 100, levelConfig.pos[1].y / 100)
                point.nodeWrap = self:getObj('imgWrap', point.node)
                self:addClick(point.node, function() self:onClickPoint(point) end)
                table.insert(self.nodePoints, point)
            end
        end
        table.sort(self.nodePoints, function(a, b)
            return a.num < b.num
        end)
    end
    self:getNextPoint()
end

--刷新当前稀有度状态
function M:refresh()
    local hero = self.parent.hero
    local starConfig = Config.HeroStart[hero.id * 100 + hero.star]

    --最高阶不显示详细信息，非最高阶的情况只会出现小点和大点的选中情况
    self.nodeMax:SetActive(starConfig.is_max)
    self.nodeActive:SetActive(not starConfig.is_max)

    if not starConfig.is_max then
        local isLevelupPoint = self.index == 0 --是否选中了中心升级点
        self.nodeStarBorder1:SetActive(not isLevelupPoint)
        self.nodeStarBorder2:SetActive(isLevelupPoint)
        self.nodeCost:SetActive(not isLevelupPoint)
        self.btnStarActivate:SetActive(not isLevelupPoint)
        self.btnStarLevelup:SetActive(isLevelupPoint)

        --刷新半透明遮罩
        for i,v in ipairs(self.nodePoints) do
            local actived = hero:isPointActived(v.id)
            v.nodeWrap:SetActive(not actived)
            v.img.color = Color(1,1,1, actived and 1 or 80/256) --没激活时彩色需要更淡一点
        end

        if self.index == 0 then
            if self:getNextInactivedPoint() > 0 then
                self.txtTips.text = Lang(1401028)
                self:setButtonGray(self.btnStarLevelup, true)
            else
                local canLevelup = true
                --todo:升段暂时没有配置条件，默认通过
                self.txtTips.text = starConfig.des_show
                self:setButtonGray(self.btnStarLevelup, not canLevelup)
            end
        else
            --当前激活点
            local point = self.nodePoints[self.index]
            local levelConfig = Config.HeroStartLevel[point.id]
            local actived = hero:isPointActived(point.id)
            self.btnStarActivate:SetActive(not actived)
            
            --小激活点边框
            self.rtStarBorder1.anchoredPosition = point.rt.anchoredPosition

            --消耗道具
            local itemID = levelConfig.consume[1].id
            local itemConfig = BagManager.getItemConfigDataById(itemID)
            local itemCostCount = levelConfig.consume[1].count
            local itemCurCount = UIUtil.getItemCount(itemID)
            local isEnough = itemCurCount >= itemCostCount
            self.nodeCost:SetActive(false)
            if not actived then
                self:loadSprite(BagManager.pathItemIcon .. itemConfig.item_icon, function(sp)
                    self.imgItem.sprite = sp
                    self.nodeCost:SetActive(true)
                end)
                --不够红色，足够黑色
                local notEnoughCount = Utils.getCostTextWithColor(itemCurCount, false)
                self.txtCount.text = (isEnough and itemCurCount or notEnoughCount) .. '/' .. itemCostCount
            end

            --提示文本和按钮
            self.nodeTips:SetActive(true)
            self.txtTips.text = actived and Utils.getCostTextWithColor(levelConfig.des, true) or levelConfig.des
            self:setButtonGray(self.btnStarActivate, not isEnough)
        end
    end
end

--查找下一个可激活的激活点，不包括升阶点
function M:getNextInactivedPoint()
    local hero = self.parent.hero
    local starConfig = Config.HeroStart[hero.id * 100 + hero.star]

    local index = -1
    if not starConfig.is_max then
        for i,v in ipairs(self.nodePoints) do
            if not hero:isPointActived(v.id) then
                index = i
                break
            end
        end
    end
    return index
end

--切换到下一个index
function M:getNextPoint()
    local hero = self.parent.hero
    local starConfig = Config.HeroStart[hero.id * 100 + hero.star]

    local index = self:getNextInactivedPoint()
    if index < 0 and not starConfig.is_max then
        index = 0
    end
    self.index = index
    return index
end

function M:onClickPoint(point)
    for i,v in ipairs(self.nodePoints) do
        if point == v then
            self.index = i
        end
    end
    self:refresh()
end

function M:onClickCenterPoint()
    self.index = 0
    self:refresh()
end

function M:onClickItem()
    local point = self.nodePoints[self.index]
    local levelConfig = Config.HeroStartLevel[point.id]
    local itemID = levelConfig.consume[1].id
    MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, itemID)
end

function M:onClickStarActivate()
    local hero = self.parent.hero
    local point = self.nodePoints[self.index]
    hero:starActivate(point.id, function()
        self.parent:refreshRed()
        self:getNextPoint()
        self:refresh()
    end)
end

function M:onClickStarLevelup()
    local hero = self.parent.hero
    local lastStar = hero.star
    hero:starLevelup(function()
        local nextStar = hero.star
        UIManager.openWindow("HeroStarupWindow", function()
            self.parent:refreshRed()
            self:reload()
            self:refresh()
        end, hero, lastStar, nextStar)
    end)
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtNode, 680, 0, 0.3, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtNode, 0, 680, 0.3, callback)
end

function M:onCheckRed()
    return self.parent.hero:isStarRed()
end