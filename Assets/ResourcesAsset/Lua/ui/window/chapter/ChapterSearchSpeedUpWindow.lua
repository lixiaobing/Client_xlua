--[[
    章节区域探索加速界面
    @Liukeming 2020-8-25
]]

local M = DClass('ChapterSearchSpeedUpWindow', BaseWindowExtend)
_G.ChapterSearchSpeedUpWindow = M

function M:ctor(data)
    self.chapter = data[1]
end

function M:onInit()
    --lang
    self:getText('nodeDialog/btnCancel/txt').text = '终止探索'
    self:getText('nodeDialog/btnSpeedUp/txt').text = '探索加速'
    self:getText('nodeDialog/txtTimeTitle').text = '探索时间'
    self:getText('nodeDialog/txtSpeedUpTitle').text = '加速时间'
    self:getText('nodeDialog/txtCostTitle').text = '加速消耗'

    self.txtTime = self:getText('nodeDialog/txtTime')
    self.txtSpeedUp = self:getText('nodeDialog/txtSpeedUp')
    self.txtCost = self:getText('nodeDialog/txtCost')
    self:addClickByPath('nodeDialog/btnClose', self.close)
    self:addClickByPath('nodeDialog/btnCancel', self.onClickCancel)
    self:addClickByPath('nodeDialog/btnSpeedUp', self.onClickSpeedUp)
    self.endTime = self.chapter.searchEndTime

    --道具图标
    local itemID = Config.Global[510301].param_3[1]
    local item = Config.Item[itemID]
    self.imgItem = self:getImage('nodeDialog/nodeItem/img')
    self.imgItem.gameObject:SetActive(false)
    self:loadSprite("Icon/ItemIcon/" .. item.item_icon, function(sp)
        self.imgItem.sprite = sp
        self.imgItem.gameObject:SetActive(true)
    end)

    self:refresh()
end

function M:onUpdate()
    --1秒刷新一次
    local t = Time.realtimeSinceStartup
    if not self.refreshTime or t >= self.refreshTime then
        self:refresh()
        self.refreshTime = t + 1
    end
end

function M:refresh()
    local config = Config.Global[510301].param_3
    local seconds = math.max(0, TimeUtils.getLeftTime(self.endTime).tScond)
    local haveCount = UIUtil.getItemCount(config[1])
    local costCount = math.ceil(seconds / config[2])
    local enough = haveCount >= costCount
    local color = enough and '#000000' or 'red'

    self.count = math.min(costCount, haveCount)
    self.enough = enough
    self.speedUpTime = enough and seconds or self.count * config[2]

    self.txtTime.text = TimeUtils.formatHMS(seconds)
    self.txtSpeedUp.text = string.format('<color=%s>%s</color>', color, TimeUtils.formatHMS(self.speedUpTime))
    self.txtCost.text = string.format('<color=%s>%s</color>/%s', color, haveCount, costCount)
end

function M:onClickCancel()
    if not self.chapter.searching or self.chapter.searchFinished then 
        MsgCenter.sendMessage(Msg.HINT_COMMON, '探索已结束')
    else
        SearchManager:searchCancel(function(result)
            self:close() 
            if result.settleInfo then
                UIManager.openWindow('ChapterSearchResultWindow', nil, self.chapter, result.settleInfo)
            end
        end)
    end
end

function M:onClickSpeedUp()
    if not self.chapter.searching or self.chapter.searchFinished then 
        MsgCenter.sendMessage(Msg.HINT_COMMON, '探索已结束')
    elseif not self.enough then
        MsgCenter.sendMessage(Msg.HINT_COMMON, '消耗道具不足')
    else
        SearchManager:searchSpeedUp(self.count, function(result)
            self:close()
        end)
    end
end