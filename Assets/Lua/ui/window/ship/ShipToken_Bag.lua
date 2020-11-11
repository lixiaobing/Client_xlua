---@class ShipToken_Bag
local M = DClass("ShipToken_Bag", BaseComponent)
_G.ShipToken_Bag = M

function M:Awake()
    self:BindNodes()
    self:onStart()
    self:addUpdate()
end

function M:onStart()
    self:onInit()
end

function M:onDispose()
end

function M:onInit()
    self.listShowItems = {}
    self.curOpenTap = 1
    self:onInitTaps()
end

function M:onOpen()
    self:showPoolTap(self.curOpenTap)
end

function M:onInitTaps()
    for i = 1, 5 do
        local strTap = "Tap_" .. i
        local cptTap = self.nodes.taps.transform:Find(strTap):GetComponent(typeof(Toggle))
        self:addEventHandler(
            cptTap.onValueChanged,
            function(v)
                if v then
                    self:showPoolTap(i)
                    self.curOpenTap = i
                end
            end
        )
    end
end

---@param tap number
function M:showPoolTap(tap)
    local listShow = ShipMgr:getTokensShowList(tap)
    self.nodes.image_None:SetActive(#listShow == 0)
    self.nodes.content:InitPool(
        #listShow,
        function(index, obj)
            local data = listShow[index]
            local oId = obj:GetInstanceID()
            local itemContains =
                table.findOne(
                self.listShowItems,
                function(a)
                    return a.oId == oId
                end
            )
            local cpt = itemContains and itemContains.cpt or self:createComponent(obj.gameObject, ShipToken_Cell)
            cpt:onUpdateUI(data.cId)

            local item = {}
            item.oId = oId
            item.cpt = cpt

            if not itemContains then
                table.insert(self.listShowItems, item)
            end
        end
    )
end
