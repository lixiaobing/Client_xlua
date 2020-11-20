---@class Loading
local Loading = DClass("Loading", BaseComponent)
_G.Loading = Loading

function Loading:init()
    self.grids = {}
    for i=1,4 do
        self.grids[i] = self.transform:Find("Box/Grid"..i):GetComponent(typeof(Image))
    end

    self:addEventHandler(self.nodes.btn.onClick, self.coverClickHandler)

    self.frameCount = 0
    self.alphas = {0,0.3,0.7,1}
    self.orders = {1,2,3,4}

    self:stop()
end

function Loading:onUpdate()
    self.frameCount = self.frameCount + 1

    if self.frameCount%10 == 0 then
        for i,grid in ipairs(self.grids) do
            self.orders[i] = self.orders[i] + 1
            if self.orders[i]>4 then
                self.orders[i] = 1
            end
            local alpha = self.alphas[self.orders[i]]
            grid.color = Color(1,1,1,alpha)
        end
    end
end

function Loading:start()
    self:addUpdate()
    self.gameObject:SetActive(true)
end

function Loading:stop()
    self:removeUpdate()
    self.gameObject:SetActive(false)
end

function Loading:setData(clickClose, clickCallback)
    -- LogError("XXXXXXXXXX!")
    self.clickClose = clickClose
    self.clickCallback = clickCallback
end

function Loading:coverClickHandler()
    if self.clickClose then
        self:stop()
    end
    if self.clickCallback then
        self.clickCallback()
    end
end
