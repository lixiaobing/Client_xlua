---@class ShipTokenWindow
local M = DClass("ShipTokenWindow", BaseWindow)
_G.ShipTokenWindow = M

function M:ctor(...)
end

function M:onInit()
    self:onInitCpts()
    self:onAddListeners()
    self:onNodeChanged(self.NodeType.Bag)
end

function M:onInitCpts()
    self.cpt_Bag = self:createComponent(self.nodes.nodeBag, ShipToken_Bag)
    self.cpt_Details = self:createComponent(self.nodes.nodeDetails, ShipToken_Details)
end

function M:onAddListeners()
    self.messager:addListener(Msg.SHIP_NODECHANGE, self.onNodeChanged)
    self.messager:addListener(Msg.SHIP_SHOWTOKEN, self.onShowDetails)
end

M.NodeType = {
    Bag = 1,
    Detail = 2
}

function M:onNodeChanged(nodeType)
    if nodeType == self.NodeType.Bag then
        self.nodes.nodeBag:SetActive(true)
        self.nodes.nodeDetails:SetActive(false)
        self.cpt_Bag:onOpen()
    elseif nodeType == self.NodeType.Detail then
        self.nodes.nodeBag:SetActive(false)
        self.nodes.nodeDetails:SetActive(true)
    end
end


function M:onShowDetails(cId)
    self:onNodeChanged(self.NodeType.Detail)
    self.cpt_Details:onOpen(cId)
end
