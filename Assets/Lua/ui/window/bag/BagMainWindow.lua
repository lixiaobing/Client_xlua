---@class BagMainWindow
local BagMainWindow = DClass("BagMainWindow", BaseWindow)
_G.BagMainWindow = BagMainWindow

--打开加载界面后 接收data
function BagMainWindow:ctor(data)
end

function BagMainWindow:onAddListener()
    self.messager:addListener(Msg.BAG_UPDATE_MOVENODES, self.setSellResolve)
end

function BagMainWindow:onDispose()
    self.messager:dispose()
    self.cpn_Item:onDispose()
    self.cpn_Tap:onDispose()
    self.cpn_Sell:onDispose()
end

function BagMainWindow:onAsset()
    self.assetKeys = {
        "UI/Component/Bag/Bag_SortBtn",
        "UI/Component/Bag/Bag_Cell",
        "UI/Component/TapShow",
        "UI/Component/Bag/Bag_SellGain"
    }

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.sortPrefab = obj:GetComponent(typeof(Button))
        elseif index == 2 then
            self.cellPrefab = obj:GetComponent(typeof(Button))
        elseif index == 3 then
            self.tapPrefab = obj:GetComponent(typeof(Button))
        elseif index == 4 then
            self.gainPrefab = obj
        end
    end
end

function BagMainWindow:onInit()
    self.nodeAll = self.transform:Find("NodeAll")

    self:onAddListener()
    --------------------
    self.nodeItems = self.nodes.nodeItems
    self.cpn_Item = self:createComponent(self.nodeItems.gameObject, Bag_NodeItem)
    self.cpn_Item:initData(self)
    self.cpn_Item:onInitUI()

    self.nodeTaps = self.nodes.nodeTaps
    self.cpn_Tap = self:createComponent(self.nodeTaps.gameObject, Bag_NodeTap) 

    self.nodeSell = self.nodes.nodeSell
    self.cpn_Sell = self:createComponent(self.nodeSell.gameObject, Bag_NodeSell) 
    self.cpn_Sell:initData(self)
    
    self:setScreentPos()
end

---获得当前选中的道具信息
function BagMainWindow:getSelectItem()
    return self.cpn_Item.curSelectItem
end

---获取当前界面显示的状态（通过nodetap 开关得到 ）
function BagMainWindow:getShowUIState()
    return not self.nodes.nodeSell.gameObject.activeSelf
end

---初始化node位置
function BagMainWindow:setScreentPos()
    local screenWidth = Screen.width

    local tapWidth = self.nodeTaps.transform:GetComponent(typeof(RectTransform)).sizeDelta.x
    self.posTapShow = self.nodeTaps.transform.localPosition.y
    self.posTapClose = -100 --self.posTapShow - tapWidth
    local sellWidth = self.nodeSell.transform:GetComponent(typeof(RectTransform)).sizeDelta.x
    self.posSellClose = self.nodeSell.transform.localPosition.y
    self.posSellShow = self.posSellClose - sellWidth

    local itemWidth = self.nodeItems.transform:GetComponent(typeof(RectTransform)).sizeDelta.x
    self.posItemRight = self.nodeItems.transform.localPosition.y
    self.posItemLeft = -1 * self.posItemRight
end

---页面功能切换显示
function BagMainWindow:setSellResolve(open)
    local nodeShow = nil
    local nodeClose = nil
    local posItem = 0
    local posTap = 0
    local posSell = 0
    if open then
        posItem = self.posItemLeft
        posSell = self.posSellShow
        posTap = self.posTapClose

        self.nodeSell.gameObject:SetActive(true)
    else
        posItem = self.posItemRight
        posSell = self.posSellClose
        posTap = self.posTapShow

        self.nodeSell.gameObject:SetActive(false)
    end
    MsgCenter.sendMessage(Msg.BAG_UPDATE_CHOICEUSABLEITEM, not open)

    -- nodeShow.gameObject:SetActive(true)
    -- nodeClose.gameObject:SetActive(false)

    -- local tween =
    --     GameTween.DOLocalMoveY(self.nodeItems, posItem, 0.2, false):OnComplete(
    --     function()
    --         nodeClose.gameObject:SetActive(false)
    --     end
    -- )
    -- self:tweenPush(tween)
    -- tween =
    --     GameTween.DOLocalMoveY(self.nodeTaps, posTap, 0.2, false):OnComplete(
    --     function()
    --         nodeClose.gameObject:SetActive(false)
    --     end
    -- )
    -- self:tweenPush(tween)
    -- tween =
    --     GameTween.DOLocalMoveY(self.nodeSell, posSell, 0.2, false):OnComplete(
    --     function()
    --         nodeClose.gameObject:SetActive(false)
    --     end
    -- )
    -- self:tweenPush(tween)
end

------------------------
