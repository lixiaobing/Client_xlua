--[[
    章节驻守阵容选人界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterGarrisonFormationWindow', BaseWindowExtend)
_G.ChapterGarrisonFormationWindow = M

function M:ctor(data)
    self.chapter = data[1]
    self.index = data[2]
end

function M:onInit()
    --lang
    self:getText('nodeDialog/txtTitle').text = '入驻选择'
    self:getText('nodeDialog/btnGarrison/txt').text = '选择入驻'

    self:addClickByPath('nodeDialog/btnClose', self.close)
    self:addClickByPath('nodeDialog/btnGarrison', self.onClickBtnGarrison)
    self.txtName = self:getText('nodeDialog/txtName')
    self.txtFightpower = self:getText('nodeDialog/txtFightPower')
    self.listHero = self:getUIList('nodeDialog/listHero')
    self.listHero:bind(self, self.onItemShow, nil, self.onItemRefresh)
    local heros = SearchManager:getGarrisonIdleHeros()
    self.listHero:clear()
    for i,v in ipairs(heros) do
        self.listHero:add({hero = v})
    end
    
    --默认选中第一个
    self.selectedHero = heros[1]
    self:refresh()
end

function M:refresh()
    self.listHero:refresh()
    self.txtName.text = string.format('精灵名称：%s', self.selectedHero.config.name)
    --todo:战斗力
    --self.txtFightpower.text = '' 
end

function M:onItemShow(e, v)
    v.nodeSelected = self:getObj('imgSelected', e.go)
    v.imgBg = self:getImage('imgBg', e.go)
    v.imgHead = self:getImage('imgHead', e.go)
    v.imgStar = self:getImage('imgStar', e.go)
    
    v.imgBg.gameObject:SetActive(false)
    self:loadSprite("Icon/Hero/head_Back" .. v.hero:getStar(), function(sp)
        v.imgBg.sprite = sp
        v.imgBg.gameObject:SetActive(true)
    end)

    v.imgHead.gameObject:SetActive(false)
    self:loadSprite("Icon/Head/" .. v.hero.config.icon, function(sp)
        v.imgHead.sprite = sp
        v.imgHead.gameObject:SetActive(true)
    end)

    v.imgStar.gameObject:SetActive(false)
    self:loadSprite(SpriteStarIcon[v.hero:getStar()], function(sp)
        v.imgStar.sprite = sp
        v.imgStar.gameObject:SetActive(true)
    end)

    self:addClick(e.go, function()
        self.selectedHero = v.hero
        self:refresh()
    end)
end

function M:onItemRefresh(e, v)
    v.nodeSelected:SetActive(v.hero == self.selectedHero)
end

function M:onClickBtnGarrison()
    SearchManager:formationJoin(self.chapter.id, self.selectedHero.id, self.index, function()
        self:close()
    end)
end