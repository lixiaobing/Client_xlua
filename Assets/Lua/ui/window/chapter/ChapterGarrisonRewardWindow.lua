--[[
    驻守奖励领取界面
    @Liukeming 2020-9-8

    逻辑流程：
        1.服务器推送章节数据
        2.章节数据中grrsEvt字段不为空
        3.grrsEvt.id即为配置表SearchStateEvent的ID
        4.道具事件（type=1）读取奖励ID，显示道具图标
        5.战斗事件（type=2）读取关卡ID，进入战前准备
]]

local M = DClass('ChapterGarrisonRewardWindow', BaseWindowExtend)
_G.ChapterGarrisonRewardWindow = M

function M:ctor(data)
    self.chapter = data[1]
    self.rewardConfig = self.chapter.event.config
    self.rewardID = self.rewardConfig.award[1].id
end

function M:onInit()
    self.txtDesc = self:getText('nodeNormal/nodeDesc/txt')
    self.nodeNormal = self:getObj('nodeNormal')
    self.nodeLevel = self:getObj('nodeLevel')
    self.nodeNormal:SetActive(self.rewardConfig.award_type == 1)
    self.nodeLevel:SetActive(self.rewardConfig.award_type == 2)

    if self.rewardConfig.award_type == 1 then
        --道具事件
        self.txtDesc.text = self.rewardConfig.des
        self:addClickByPath('nodeNormal/btnGet', self.onClickNormalGet)
        self.imgItem = self:getImage('nodeNormal/imgItem')
        self.imgItem.gameObject:SetActive(false)
        local item = Config.Item[self.rewardID]
        self:loadSprite("Icon/ItemIcon/" .. item.item_icon, function(sp)
            self.imgItem.sprite = sp
            self.imgItem.gameObject:SetActive(true)
        end)
    elseif self.rewardConfig.award_type == 2 then
        --战斗事件
        --todo:等待策划定义战斗事件
        --todo:战斗节点是否要支持可返回按钮
    end
end

function M:onClickNormalGet()
    SearchManager:formationReward(self.chapter.id, function(result)
        self:close()
        MsgCenter.sendMessage(Msg.ITEMTIPS, {result.rewardsMsg, 1})
    end)
end
