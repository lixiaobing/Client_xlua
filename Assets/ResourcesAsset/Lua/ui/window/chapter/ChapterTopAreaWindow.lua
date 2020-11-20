--[[
    章节区域列表界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterTopAreaWindow', BaseWindowExtend)
_G.ChapterTopAreaWindow = M

function M:ctor(data)
    self.chapter = data[1]
end

function M:onInit()
    --lang
    self:getText('nodeDetail/nodeContent/txtConditionTitle').text = '探索条件'
    self:getText('nodeDetail/nodeContent/nodeProgress/nodeSubTask/txtName').text = '支线任务'
    self:getText('nodeDetail/nodeContent/nodeProgress/nodeChallenge/txtName').text = '挑战任务'
    self:getText('nodeDetail/nodeContent/nodeProgress/nodeBox/txtName').text = '宝箱'
    self:getText('nodeDetail/nodeContent/nodeProgress/nodeCollection/txtName').text = '收藏品'
    self:getText('nodeDetail/nodeContent/nodeProgress/nodeCollectInfo/txtName').text = '收集线索'

    --左边的区域list
    self.list = self:getUIList('list')
    self.list:bind(self, self.onItemShow, nil, self.onItemRefresh)
    self.list:clear()
    for i,v in ipairs(self.chapter.areas) do
        self.list:add({area = v})
    end

    --右边的详情
    self.txtName = self:getText('nodeDetail/nodeName/txtName')
    self.txtProgress = self:getText('nodeDetail/nodeName/txtProgress')
    self.txtCondition1 = self:getText('nodeDetail/nodeContent/txtCondition1')
    self.txtCondition2 = self:getText('nodeDetail/nodeContent/txtCondition2')
    self.txtSubTaskCount = self:getText('nodeDetail/nodeContent/nodeProgress/nodeSubTask/txtCount')
    self.txtChallengeCount = self:getText('nodeDetail/nodeContent/nodeProgress/nodeChallenge/txtCount')
    self.txtBoxCount = self:getText('nodeDetail/nodeContent/nodeProgress/nodeBox/txtCount')
    self.txtCollectionCount = self:getText('nodeDetail/nodeContent/nodeProgress/nodeCollection/txtCount')
    self.txtCollectInfoCount = self:getText('nodeDetail/nodeContent/nodeProgress/nodeCollectInfo/txtCount')

    --默认选中第一个区域
    self.area = nil 
    self:select(self.chapter.areas[1])
end

function M:select(area)
    self.area = area
    self.list:refresh()
    self.txtName.text = self.area.config.area_name
    self.txtProgress.text = string.format('本章进度%s%%', math.ceil(self.chapter.progress * 100))
    local finished1 = self.chapter.progress >= 0.3
    local finished2 = self.area.unlocked
    self.txtCondition1.text = Utils.getCostTextWithColor(string.format('本章总进度达到%s%%', 30), finished1, nil, '#000')
    self.txtCondition2 = Utils.getCostTextWithColor('本区域主线通关', finished2, nil, '#000')
    self.txtSubTaskCount.text = string.format('%s/%s', 2, 10)
    self.txtChallengeCount.text = string.format('%s/%s', 2, 10)
    self.txtBoxCount.text = string.format('%s/%s', 2, 10)
    self.txtCollectionCount.text = string.format('%s/%s', 2, 10)
    self.txtCollectInfoCount.text = string.format('%s/%s', 2, 10)
end

function M:onItemShow(e, v)
    v.nodeActive = self:getObj('btn/nodeActive', e.go)
    v.nodeInactive = self:getObj('btn/nodeInactive', e.go)
    self:getText('btn/nodeActive/txt', e.go).text = v.area.config.area_name
    self:getText('btn/nodeInactive/txt', e.go).text = v.area.config.area_name
    self:addClickByPath('btn', function()
        self:select(v.area)
    end, e.go)
end

function M:onItemRefresh(e, v)
    v.nodeActive:SetActive(v.area == self.area)
    v.nodeInactive:SetActive(v.area ~= self.area)
end

function M:onClickArea(area)
    self:select(area)
end