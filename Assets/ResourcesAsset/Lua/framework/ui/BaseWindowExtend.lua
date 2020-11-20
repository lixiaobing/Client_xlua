--[[
    提供一些方便使用的接口
    @Liukeming 2020-6-8

    除了窗口初始化，某些列表节点也需要查找子节点，所以节点处理不可避免，
    这些函数用于减少代码量，美化代码

    从根节点获取节点
        self.transform:Find('node').gameObject
        self:getObj('node')
    从根节点获取组件
        self.transform:Find('path').GetComponent(typeof('Image'))
        self:getCom('Image', 'path')
        self:getImage('path')
]]

local M = DClass('BaseWindowExtend', BaseWindow)
_G.BaseWindowExtend = M

--获取GameObject节点
function M:getObj(path, parent)
    parent = parent and parent.transform or self.transform
    local obj = parent:Find(path)
    return obj and obj.gameObject or LogError('子节点路径不存在：' .. tostring(path))
end

--获取组件
function M:getCom(name, path, parent)
    local obj = self:getObj(path, parent)
    local com = obj:GetComponent(name)
    return com and com or LogError('组件类型不存在：' .. tostring(name))
end

--获取按钮组件
function M:getButton(path, parent) 
    return self:getCom('Button', path, parent) 
end

--获取Image组件
function M:getImage(path, parent) 
    return self:getCom('Image', path, parent) 
end

--获取Text组件
function M:getText(path, parent) 
    return self:getCom('Text', path, parent) 
end

--获取对象池滑动面板
function M:getScrollPool(path, parent) 
    return self:getCom('ScrollPool', path, parent) 
end

--获取富文本组件
function M:getRichText(path, parent)
    return self:getCom('UIRichText', path, parent)
end

--获取滑动条组件
function M:getSlider(path, parent)
    return self:getCom('Slider', path, parent)
end

--获取UIList循环列表组件
function M:getUIList(path, parent)
    return self:getCom('UIList', path, parent)
end

--获取UITabs标签页组件
function M:getUITabs(path, parent)
    return self:getCom('UITabs', path, parent)
end

--获取透明度组件
function M:getCanvasGroup(path, parent)
    return self:getCom('CanvasGroup', path, parent)
end

--绑定点击
function M:addClick(obj, callback, ...) 
    self:addEventHandler(obj:GetComponent('Button').onClick, callback, ...) 
end

--根据路径绑定点击
function M:addClickByPath(path, callback, parent, ...) 
    self:addClick(self:getObj(path, parent), callback, ...) 
end

--移除点击
function M:removeClick(obj)
    obj:GetComponent('Button').onClick:RemoveAllListeners()
end

--按钮置灰
function M:setButtonGray(btn, isGray)
    local imgGray = btn.transform:Find('imgGray')
    if imgGray then
        imgGray.gameObject:SetActive(isGray)
    end
    btn:GetComponent('Button').interactable = not isGray
end

--加载同一个风格的道具框（带品质背景和道具图标）,异步加载前隐藏图片防止闪烁
--todo：考虑在需要时兼容其他风格，比如带数量/带满足条件不同颜色的数量/带鼠标点击事件等
function M:loadItemBox(obj, itemID)
    local itemBox = {}
    itemBox.node = obj
    itemBox.config = Config.Item[itemID]
    itemBox.imgItemBg = self:getImage('imgItemBg', obj)
    itemBox.imgItem = self:getImage('imgItem', obj)
    itemBox.itemBgpath = string.format("%sQuality_Samll%02d", BagManager.pathItemQuality, itemBox.config.item_bg) 
    itemBox.imgItemBg.gameObject:SetActive(false)
    self:loadSprite(itemBox.itemBgpath, function(sp)
        itemBox.imgItemBg.sprite = sp
        itemBox.imgItemBg.gameObject:SetActive(true)
    end)
    
    itemBox.imgItem.gameObject:SetActive(false)
    self:loadSprite('Icon/ItemIcon/' .. itemBox.config.item_icon, function(sp)
        itemBox.imgItem.sprite = sp
        itemBox.imgItem.gameObject:SetActive(true)
    end)
    return itemBox
end