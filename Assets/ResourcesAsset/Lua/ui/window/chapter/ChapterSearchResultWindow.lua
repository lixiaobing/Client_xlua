--[[
    章节区域探索结算界面
    @Liukeming 2020-8-25
]]

local M = DClass('ChapterSearchResultWindow', BaseWindowExtend)
_G.ChapterSearchResultWindow = M

function M:ctor(data)
    self.chapter = data[1]
    self.settleInfo = data[2] --Settle结算数据
    local rewardsConfig = Config.SearchAward[self.settleInfo.searchLv]
    for i,v in ipairs(self.settleInfo.exploreRewards) do
        v.id = v.gradeId
        v.config = rewardsConfig.score[v.gradeId]
        v.sort = v.config.order
        v.icon = v.config.icon
        v.name = v.config.des
    end
    table.sort(self.settleInfo.exploreRewards, function(a, b)
        return a.sort < b.sort
    end)
end

function M:onInit()
    --lang
    self:getText('nodeDialog/txtTimeTitle').text = '探索时间'
    self:getText('nodeDialog/txtAreaTitle').text = '探索区域'
    self:getText('nodeDialog/txtScoreTitle').text = '探索价值'

    self:addClickByPath('btnClose', self.close)
    self:getText('nodeDialog/txtTitle').text = string.format('%s探索统计', self.chapter.config.capter_name)
    self:getText('nodeDialog/txtTime').text = TimeUtils.formatHMS(self.settleInfo.totalTime)
    self:getText('nodeDialog/txtArea').text = string.format('%s/%s', self.settleInfo.fnshArea, self.settleInfo.totalArea)
    self:getText('nodeDialog/txtScore').text = self.settleInfo.assessScore
    self.imgLevel = self:getImage('nodeDialog/imgLevel')
    self.imgLevel.gameObject:SetActive(false)
    self:loadSprite('Icon/Chapter/search_quality_' .. self.settleInfo.searchLv, function(sp)
        self.imgLevel.sprite = sp
        self.imgLevel.gameObject:SetActive(true)
    end)

    --根据奖励挡位读取对应的详细奖励
    self.list = self:getUIList('nodeDialog/list')
    self.list:bind(self, self.onItemShow)
    self.list:clear()
    for i,v in ipairs(self.settleInfo.exploreRewards) do
        self.list:add({info = v})
    end
    self.list:refresh()
end

function M:onItemShow(e, v)
    v.imgItem = self:getImage('imgItem', e.go)
    v.imgItem.gameObject:SetActive(false)
    self:loadSprite('Icon/Chapter/search_reward_' .. v.info.icon, function(sp)
        v.imgItem.sprite = sp
        v.imgItem.gameObject:SetActive(true)
    end)
    self:getText('txtName', e.go).text = v.info.name
    self:getText('txtCount', e.go).text = v.info.count
end