--[[
    章节区域探索奖励界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterSearchRewardWindow', BaseWindowExtend)
_G.ChapterSearchRewardWindow = M

function M:ctor(data)
    self.chapter = data[1]
    self.configs = {}
end

function M:onInit()
    --lang
    self:getText('nodeDialog/btnGet/txt').text = '领取'
    self:getText('nodeDialog/txtTitle').text = '奖励详情'

    self:addClickByPath('nodeDialog/btnClose', self.close)
    self.btnGet = self:getObj('nodeDialog/btnGet')
    self:addClick(self.btnGet, self.onClickGet)

    self.nodeTypeParent = self:getObj('nodeDialog/nodeTypes/view/content')
    self.nodeTypePrefab = self:getObj('nodeDialog/nodeTypes/view/content/nodeTypePrefab')
    self.nodeTypePrefab:SetActive(false)
    --一个分类占一行
    self.types = {}
    for i,v in ipairs(self.chapter.searchRewards) do
        local type = {}
        type.node = GameObject.Instantiate(self.nodeTypePrefab)
        type.node:SetActive(true)
        type.node.transform:SetParent(self.nodeTypeParent.transform, false)
        type.txtCount = self:getText('txtCount', type.node)
        type.txtCount.text = v.count
        type.imgItem = self:getImage('imgItem', type.node)
        self:loadSprite('Icon/Chapter/search_reward_' .. v.icon, function(sp)
            type.imgItem.sprite = sp
            type.imgItem.gameObject:SetActive(true)
        end)
        --一行里面的全部奖励
        type.nodeRewardParent = self:getObj('nodeRewards/view/content', type.node)
        type.nodeRewardPrefab = self:getObj('nodeRewards/view/content/nodeRewardPrefab', type.node)
        type.nodeRewardPrefab:SetActive(false)
        type.rewards = {}
        for j,w in ipairs(v.details) do
            local reward = {}
            reward.node = GameObject.Instantiate(type.nodeRewardPrefab)
            reward.node:SetActive(true)
            reward.node.transform:SetParent(type.nodeRewardParent.transform, false)
            reward.txtCount = self:getText('txtCount', reward.node)
            reward.txtCount.text = w.count
            self:loadItemBox(self:getObj('ItemBox', reward.node), w.id);
            table.insert(type.rewards, reward)
        end
        table.insert(self.types, type)
    end
end

function M:onClickGet()
    SearchManager:searchGetReward(function(result)
        self:close()
        if result.settleInfo then
            UIManager.openWindow('ChapterSearchResultWindow', nil, self.chapter, result.settleInfo)
        end
    end)
end