---@class ShipScienceWindow
local M = DClass("ShipScienceWindow", BaseWindow)
_G.ShipScienceWindow = M

function M:ctor(...)
    self.tableAllPoint = {}
end

function M:onInit()
    self:onInitNodes()
    self:onResetContentPos()
    self:onInitAllPonits()
end


function M:onInitNodes()
    self:addEventHandler(
        self.nodes.nodeDetails.onClick,
        function()
            self:setDetailsUI(false)
            self:onClickCell(0)
        end
    )
    self.cpt_Details = self:createComponent(self.nodes.nodeDetails.gameObject, ShipScience_Details)
    self.nodes.nodeDetails.gameObject:SetActive(false)
end

function M:onResetContentPos()
    self.nodes.content.transform.localPosition = Vector3(0, 0, 0)
end

function M:onInitAllPonits()
    for i = 1, self.nodes.content.transform.childCount do
        local childObj = self.nodes.content:GetChild(i - 1)
        if string.sub(childObj.name, 1, 6) == "Point_" then
            local strId = string.gsub(childObj.name, "Point_", "", 1)
            local id = tonumber(strId)
            local cptPoint = self:createComponent(childObj.gameObject, ShipScience_Cell)
            cptPoint:onUpdateUI(
                id,
                function()
                    self:onClickCell(id)
                end
            )
            local item = {}
            item.id = id
            item.cptPoint = cptPoint
            table.insert(self.tableAllPoint, item)
        end
    end
end

function M:onClickCell(id)
    for key, value in pairs(self.tableAllPoint) do
        value.cptPoint:onClickCell(id)
    end
    if id ~= 0 then
        self:setDetailsUI(true, id)
    end
end

function M:setDetailsUI(show, id)
    self.nodes.nodeDetails.gameObject:SetActive(show)
    if show then
        self.cpt_Details:onUpdateUI(id)
    end
end
