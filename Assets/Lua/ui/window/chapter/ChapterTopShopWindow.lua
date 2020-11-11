--[[
    章节商店界面
    @Liukeming 2020-8-26
]]

local M = DClass('ChapterTopShopWindow', BaseWindowExtend)
_G.ChapterTopShopWindow = M

function M:ctor()
end

function M:onInit()
    self.listTypes = self:getUIList('listTypes')
    self.listTypes:bind(self, self.onTypesItemShow, self.onTypesItemHide, self.onTypesItemRefresh)

    self.listContent = self:getUIList('listContent')
    self.listContent:bind(self, self.onContentItemShow, self.onContentItemHide, self.onContentItemRefresh)

    self.types = {}
    self.type = nil
end

function M:onTypesItemShow(e, v)
end

function M:onTypesItemHide(e, v)
end

function M:onTypesItemRefresh(e, v)
end

function M:onContentItemShow(e, v)
    self:getText('txtName', e.go).text = v.info.config.name
end

function M:onContentItemHide(e, v)
end

function M:onContentItemRefresh(e, v)
end