--[[
    精灵提升稀有度成功面板
    @Liukeming 2020-6-22
]]

local M = DClass('HeroStarupWindow', BaseWindowExtend)
_G.HeroStarupWindow = M

function M:ctor(data)
    self.hero = data[1]
    self.lastStar = data[2]
    self.nextStar = data[3]
end

function M:onInit()
    --lang
    self:getText('btnClose/txt').text = Lang(1401013)

    --模型组件
    self.model = self:getCom('UIModel', 'UIModel')
    self.tCamera = self:getObj('UIModel/Camera').transform
    self.gesture = self.transform:GetComponent('UIGesture')
    self.gesture:AddHandler(UIGestureType.All, function(e) self:onGestureHandler(e) end)
    self.model.gameObject:SetActive(false)

    self.imgLastStar = self:getImage('nodeLastStar/img')
    self.imgNextStar = self:getImage('nodeNextStar/img')
    self.nodeDesc1 = self:getObj('nodeDesc1')
    self.nodeDesc2 = self:getObj('nodeDesc2')
    self.nodeDesc3 = self:getObj('nodeDesc3')
    self.txtDesc1 = self:getText('nodeDesc1/txt')
    self.txtDesc2 = self:getText('nodeDesc2/txt')
    self.txtDesc3 = self:getText('nodeDesc3/txt')
    self.txtCountdown = self:getText('txtCountdown')
    self.btnClose = self:getObj('btnClose')
    self:addClick(self.btnClose, self.onClickClose)
    self.countdown = 15 --定时关闭

    --读取配置
    local lastStarConfig = Config.HeroStart[self.hero.id * 100 + self.lastStar]
    local nextStarConfig = Config.HeroStart[self.hero.id * 100 + self.nextStar]
    
    --加载突破成功才显示，防止闪烁
    self.imgLastStar.gameObject:SetActive(false)
    self.imgNextStar.gameObject:SetActive(false)
    self:loadSprite('Icon/Hero/quality_big_' .. self.lastStar, function(sp)
        local scale = SpriteStarBigIconScale[self.lastStar]
        self.imgLastStar.sprite = sp
        self.imgLastStar.gameObject:SetActive(true)
        self.imgLastStar:SetNativeSize()
        self.imgLastStar.transform.localScale = Vector3(scale, scale, 1)
    end)
    self:loadSprite('Icon/Hero/quality_big_' .. self.nextStar, function(sp)
        local scale = SpriteStarBigIconScale[self.lastStar]
        self.imgNextStar.sprite = sp
        self.imgNextStar.gameObject:SetActive(true)
        self.imgNextStar:SetNativeSize()
        self.imgNextStar.transform.localScale = Vector3(scale, scale, 1)
    end)

    self.txtDesc1.text = nextStarConfig.des[1]
    self.txtDesc2.text = nextStarConfig.des[2]
    self.txtDesc3.text = nextStarConfig.des[3]
    
    local model_info = self.hero.config.model_info
    local height = Fixed64(model_info.height)
    self.model:LoadModel("Model/" .. model_info.path, height.number)
end

function M:onOpen()
    --模型加载可能更快，此时显示模型，防止与其他窗口的模型重叠
    self.model.gameObject:SetActive(true)
end

--手势操作模型
function M:onGestureHandler(event)
    if event.type == UIGestureType.Move then
        self.model:RotateModel(-event.deltaPosition.x)
    end
end

function M:onUpdate()
    self.countdown = self.countdown - Time.deltaTime
    local intCountdown = math.floor(self.countdown)
    if intCountdown < 0 then
        self:close()
    else
        self.txtCountdown.text = string.format(Lang(1401014), intCountdown)
    end
end

function M:onClickClose()
    self:close()
end