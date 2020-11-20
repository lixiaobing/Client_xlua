--[[
    角色菜单面板
    @Liukeming 2020-6-5
]]

local M = DClass('HeroMenuPanel', HeroBasePanel)
_G.HeroMenuPanel = M

function M:onInit()
    self.buttons = {}
    self:initMenu('btnLevel', Lang(1401002), self.parent.panels.levelPanel, function() self:switchMenu(1, true) end)
    self:initMenu('btnStar', Lang(1401003), self.parent.panels.starPanel, function() self:switchMenu(2, true) end)
    self:initMenu('btnSkill', Lang(1401004), self.parent.panels.skillPanel, function() self:switchMenu(3, true) end)
end

--初始化单个菜单
function M:initMenu(path, text, panel, callback)
    local button = {}
    button.btn = self:getObj(path)
    button.nodeActive = self:getObj('nodeActive', button.btn)
    button.nodeInactive = self:getObj('nodeInactive', button.btn)
    button.nodeRed = self:getObj('imgRed', button.btn)
    button.panel = panel
    self:getText('nodeActive/txt', button.btn).text = text
    self:getText('nodeInactive/txt', button.btn).text = text
    self:addClick(button.btn, callback)
    table.insert(self.buttons, button)
end

function M:onShow()
    self.index = -1
    self:switchMenu(1)
end

--设置选中样式
function M:refresh()
    for i,v in ipairs(self.buttons) do
        v.nodeActive:SetActive(i == self.index)
        v.nodeInactive:SetActive(i ~= self.index)
        v.nodeRed:SetActive(v.panel:onCheckRed())
    end
end

function M:switchMenu(index, isClearTween)
    if self.index ~= index then
        --手动切换时要结束上一个补间动画，避免冲突
        if isClearTween then
            self.parent.tween:finish()
        end
        self.index = index
        self.parent:switchDetail(index)
        self:refresh()
    end
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtNode, -350, 0, 0.2, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtNode, 0, -350, 0.2, callback)
end