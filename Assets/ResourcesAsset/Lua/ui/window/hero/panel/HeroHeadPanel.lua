--[[
    角色系统左边头像面板
    @Liukeming 2020-6-12
]]
local M = DClass('HeroHeadPanel', HeroBasePanel)
_G.HeroHeadPanel = M

function M:onInit()
    --构造角色数组
    self.heros = table.clone2(HeroMgr:getAllHeros(true))
    table.sort(self.heros, function(a, b)
        return a:getComparerValue() > b:getComparerValue()
    end)
    --显示头像列表
    self.listHead = self:getUIList('listHead')
    self.listHead:bind(self, self.onItemShow, self.onItemHide, self.onItemRefresh)
end

function M:onShow()
    self.listHead:clear()
    for i,v in ipairs(self.heros) do
        self.listHead:add({hero = v})
    end
end

function M:refresh()
    self.listHead:refresh()
end

function M:onItemShow(e, v)
    v.alpHead = self:getCanvasGroup('nodeHead', e.go)
    v.nodeMenu = self:getObj('nodeMenu', e.go)
    v.nodeBg = self:getObj('nodeHead/imgBg', e.go)
    v.nodeBgSelected = self:getObj('nodeHead/imgBgSelected', e.go)
    v.imgHead = self:getImage('nodeHead/nodeHead/imgHead', e.go)
    v.imgType = self:getImage('nodeHead/imgType', e.go)
    v.nodeRed = self:getObj('nodeHead/imgRed', e.go)
    v.nodeLock = self:getObj('nodeHead/nodeLock', e.go)
    v.btnHead = self:getObj('nodeHead/btnHead', e.go)
    v.btnAttribute = self:getObj('nodeMenu/btnAttribute', e.go)
    v.btnDocument = self:getObj('nodeMenu/btnDocument', e.go)
    v.alpHead.alpha = 0
    self:addClick(v.btnHead, function() self:onClickHead(v.hero) end)
    self:addClick(v.btnAttribute, self.onClickAttribute)
    self:addClick(v.btnDocument, self.onClickDocument)

    self:setSprite(v.imgType, SpriteTypeBack[v.hero.config.hero_type])
    self:loadSprite("Icon/Head/" .. v.hero.config.icon, function(sp)
        v.imgHead.sprite = sp
        v.alpHead.alpha = 1
    end)
end

function M:onItemHide(e, v)
    v.alpHead.alpha = 0
    self:removeClick(v.btnHead)
    self:removeClick(v.btnAttribute)
    self:removeClick(v.btnDocument)
end

function M:onItemRefresh(e, v)
    local selected = v.hero == self.parent.hero
    local unlocked = v.hero:isUnlocked()
    v.nodeBg:SetActive(not selected)
    v.nodeBgSelected:SetActive(selected)
    v.nodeMenu:SetActive(false)
    v.nodeLock:SetActive(not unlocked)
    v.nodeRed:SetActive(v.hero:isRed())
    UIUtil.setGrayWithStencil(v.imgHead, not unlocked)
end

function M:onClickHead(hero)
    --当hero不为空时左侧头像栏已经完全进入
    if self.parent.hero then
        --结束之前的补间动画防止冲突
        self.parent.tween:finish()
        self.parent:selectMainHero(hero)
    end
end

function M:onClickAttribute()
end

function M:onClickDocument()
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtNode, -500, 0, 0.3, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtNode, 0, -500, 0.3, callback)
end

function M:onRefreshRed()
    self:refresh()
end