--[[
    精灵系统突破成功面板
    @Liukeming 2020-6-19
]]

local M = DClass('HeroStageupWindow', BaseWindowExtend)
_G.HeroStageupWindow = M

function M:ctor(data)
    self.hero = data[1]
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

    self.imgLastStage = self:getImage('imgLastStage')
    self.imgNextStage = self:getImage('imgNextStage')
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

    self.imgLastStage.gameObject:SetActive(false)
    self.imgNextStage.gameObject:SetActive(false)
    
    local lastGroupConfig = Config.HeroGroup[self.hero.id * 10 + self.hero.stage - 1]
    local nextGroupConfig = Config.HeroGroup[self.hero.id * 10 + self.hero.stage]
    self:loadSprite('Icon/Hero/stage_' .. lastGroupConfig.icon, function(sp)
        self.imgLastStage.sprite = sp
        self.imgLastStage.gameObject:SetActive(true)
    end)
    self:loadSprite('Icon/Hero/stage_' .. nextGroupConfig.icon, function(sp)
        self.imgNextStage.sprite = sp
        self.imgNextStage.gameObject:SetActive(true)
    end)

    local config = Config.HeroGroup[self.hero.id * 10 + self.hero.stage]
    self.txtDesc1.text = config.des[1]
    self.txtDesc2.text = config.des[2]
    self.txtDesc3.text = config.des[3]
    

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