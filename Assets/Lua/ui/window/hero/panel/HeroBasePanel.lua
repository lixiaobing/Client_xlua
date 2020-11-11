--[[
    面板基类，用于减少单个界面类复杂度，减少耦合度
    @Liukeming 2020-6-5
]]

local M = DClass('HeroBasePanel')
_G.HeroBasePanel = M

function M:ctor(parent, node)
    self.parent = parent
    self.node = node
    self.rtNode = self.node:GetComponent('RectTransform')
end

--模拟BaseWindowExtend那一套
function M:getObj(path, parent) return self.parent:getObj(path, parent or self.node) end
function M:getCom(name, path, parent) return self.parent:getCom(name, path, parent or self.node) end
function M:getButton(path, parent) return self:getCom('Button', path, parent) end
function M:getImage(path, parent) return self:getCom('Image', path, parent) end
function M:getText(path, parent) return self:getCom('Text', path, parent) end
function M:getRectTransform(path, parent) return self:getCom('RectTransform', path, parent) end
function M:getScrollPool(path, parent) return self:getCom('ScrollPool', path, parent) end
function M:getRichText(path, parent) return self:getCom('UIRichText', path, parent) end
function M:getUIList(path, parent) return self:getCom('UIList', path, parent) end
function M:getCanvasGroup(path, parent) return self:getCom('CanvasGroup', path, parent) end
function M:addClick(obj, callback) 
    local event = obj:GetComponent('Button').onClick
	event:RemoveAllListeners()
    event:AddListener(function(data)
        callback(self)
    end)
end
function M:addClickByPath(path, callback, parent) self:addClick(self:getObj(path, parent), callback) end
function M:removeClick(obj) obj:GetComponent('Button').onClick:RemoveAllListeners() end
function M:setButtonGray(btn, active) self.parent:setButtonGray(btn, active) end

function M:init(parent, node)
    self:onInit()
    self:hide()
end

function M:show()
    if not self:isVisible() then
        self.node:SetActive(true)
        self:onShow()
        self:refresh()
    end
end

function M:hide()
    if self:isVisible() then
        self:onHide()
        self.node:SetActive(false)
    end
end

function M:setVisible(visible)
    if visible then
        self:show() 
    else
        self:hide()
    end
end

function M:refresh()
end

function M:isVisible()
    return self.node.activeSelf
end 

function M:loadSprite(path, callback)
    self.parent:loadSprite(path, callback)
end

function M:setSprite(image, path, bSetNativeSize)
    self.parent:setSprite(image, path, bSetNativeSize)
end

function M:fadeIn(callback)
    if not self:isVisible() then
        self:show()
        self:onFadeIn(callback)
    end
end

function M:fadeOut(callback)
    if self:isVisible() then
        self:onFadeOut(function()
            self:hide()
            if callback then
                callback()
            end
        end)
    end
end

--回调，初始化
function M:onInit()
end

--回调，显示
function M:onShow()
end

--回调，隐藏
function M:onHide()
end

--回调，每帧
function M:onUpdate()
end

--回调，淡入
function M:onFadeIn(callback)
    if callback then
        callback()
    end
end

--回调，淡出
function M:onFadeOut(callback)
    if callback then
        callback()
    end
end

--淡入淡出X，方便实现面板无缝动画衔接
function M:doFadeX(delay, rt, x1, x2, time, callback)
    if self.parent.tween then
        --参数：开始延迟时间，目标RectTransform, 开始位置，结束位置，动画时间，回调
        local seq = self.parent.tween:addSequence()
        local pos = rt.anchoredPosition
        rt.anchoredPosition = Vector2(x1, pos.y)
        seq:addDelay(delay)
        seq:addTo(x1, x2, time, function(x) rt.anchoredPosition = Vector2(x, pos.y) end, callback)
    end
end

--传入onFadeIn和onFadeOut的回调
function M:doFadeCallback(delay, callback)
    if self.parent.tween then
        self.parent.tween:addDelay(delay, callback)
    end
end

--有些界面好好几层，一层层返回
function M:getBackCount()
    return 0
end

--返回上一层级回调
function M:onBack()
end

--面板是否显示小红点
function M:onCheckRed()
    return false
end