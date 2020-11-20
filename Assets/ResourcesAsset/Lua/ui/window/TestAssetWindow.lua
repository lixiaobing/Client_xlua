local TestAssetWindow = DClass("TestAssetWindow", BaseWindow)
_G.TestAssetWindow = TestAssetWindow

function TestAssetWindow:onAsset()
    --准备预加载的资源/窗口销毁后统一释放
    self.assetKeys = {
        "UI/Component/Item",
    }

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.itemPrefab = obj
        end
    end
end

function TestAssetWindow:onInit()
    self:addEventHandler(self.nodes.btn.onClick, function()
        self:close()
    end)

    self:refresh()
end

function TestAssetWindow:refresh()
    self.nodes.list.prefab = self.itemPrefab
    self.nodes.list:InitPool(500, function(index, target)
        local data= list[index]
        local cpn = self:createComponent(target, TestAssetItem)
        cpn:init(data)
    end)
end