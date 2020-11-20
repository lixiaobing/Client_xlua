--[[
    精灵切换面板
    @Liukeming 2020-6-18
]]

local M = DClass('HeroSwitchPanel', HeroBasePanel)
_G.HeroSwitchPanel = M

function M:onInit()
    --基本结构
    self.btnSwitch = self:getObj('btnSwitch')
    self.btnWrap = self:getObj('btnSwitchWrap')
    self.btnWrap:SetActive(false)
    self.nodeWrap = self:getObj('nodeSwitchWrap')
    self.nodeWrap:SetActive(false)
    self:addClick(self.btnSwitch, self.onClickSwitch)
    self:addClick(self.btnWrap, self.onClickWrap)

    --显示头像列表
    self.listHead = self:getUIList('nodeSwitchWrap/listHead')
    self.listHead:bind(self, self.onItemShow, self.onItemHide, self.onItemRefresh)
end

function M:onShow()
    self.loaded = false
    self.heros = {}
end

function M:onItemShow(e, v)
    v.alpHead = self:getCanvasGroup('nodeHead', e.go)
    v.nodeBg = self:getObj('nodeHead/imgBg', e.go)
    v.nodeBgSelected = self:getObj('nodeHead/imgBgSelected', e.go)
    v.imgHead = self:getImage('nodeHead/nodeHead/imgHead', e.go)
    v.imgType = self:getImage('nodeHead/imgType', e.go)
    v.nodeLock = self:getObj('nodeHead/nodeLock', e.go)
    v.btnHead = self:getObj('nodeHead/btnHead', e.go)
    v.alpHead.alpha = 0
    v.loadedSpriteCount = 0
    self:addClick(v.btnHead, function() self:onClickHead(v.hero) end)

    self:setSprite(v.imgType, SpriteTypeBack[v.hero.config.hero_type])
    self:loadSprite("Icon/Head/" .. v.hero.config.icon, function(sp) 
        v.imgHead.sprite = sp
        v.alpHead.alpha = 1
    end)
end

function M:onItemHide(e, v)
    v.alpHead.alpha = 0
    self:removeClick(v.btnHead)
end

function M:onItemRefresh(e, v)
    local selected = v.hero == self.parent.hero
    local unlocked = v.hero:isUnlocked()
    v.nodeBg:SetActive(not selected)
    v.nodeBgSelected:SetActive(selected)
    v.nodeLock:SetActive(not unlocked)
    UIUtil.setGrayWithStencil(v.imgHead, not unlocked)
end

function M:onClickHead(hero)
    if hero ~= self.parent.hero then
        self.parent:selectDetailHero(hero)
        self.btnWrap:SetActive(false)
        self.nodeWrap:SetActive(false)
    end
end

function M:onClickSwitch()
    self.btnWrap:SetActive(true)
    self.nodeWrap:SetActive(true)

    --动态加载已经拥有的精灵列表
    if not self.loaded then
        self.loaded = true
        self.heros = table.clone2(HeroMgr:getAllHeros(false))
        table.sort(self.heros, function(a, b)
            return a:getComparerValue() > b:getComparerValue()
        end)
        self.listHead:clear()
        for i,v in ipairs(self.heros) do
            self.listHead:add({hero = v})
        end
    end
    self.listHead:refresh()
    self.listHead:reset() --滑动位置重置
end

function M:onClickWrap()
    self.btnWrap:SetActive(false)
    self.nodeWrap:SetActive(false)
end