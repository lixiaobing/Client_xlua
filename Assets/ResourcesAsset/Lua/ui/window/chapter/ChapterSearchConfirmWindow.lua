--[[
    章节区域探索确认界面
    @Liukeming 2020-8-25
]]

local M = DClass('ChapterSearchConfirmWindow', BaseWindowExtend)
_G.ChapterSearchConfirmWindow = M

function M:ctor(data)
    self.chapter = data[1]
end

function M:onInit()
    --lang
    self:getText('nodeDialog/txtCountTitle').text = '探索区域'
    self:getText('nodeDialog/txtTimeTitle').text = '探索时间'
    self:getText('nodeDialog/btnConfirm/txt').text = '开始探索'

    local count = 0
    local time = 0
    for i,v in ipairs(self.chapter.areas) do
        if v.unlocked then
            count = count + 1
            time = time + v.config.search_num * Config.Global[510302].param_1
        end
    end
    self:getText('nodeDialog/txtCount').text = count
    self:getText('nodeDialog/txtTime').text = TimeUtils.formatHMS(time)
    self:addClickByPath('nodeDialog/btnClose', self.close)
    self:addClickByPath('nodeDialog/btnConfirm', function()
        SearchManager:search(self.chapter.id, function()
            self:close()
        end)
    end)
end