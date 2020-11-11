--[[
    角色类型管理
    @Liukeming 2020-6-3
]]

local M = DClass('HeroWindow', BaseWindowExtend)
_G.HeroWindow = M

--资源预加载
function M:onAsset()
    self.assetKeys = {}
    self:preloadHeroIcon('stage', 4)
    self:preloadHeroIcon('group', 4)
    self:preloadHeroIcon('quality_big', 6)
    self:preloadItemQuality()
    self:preloadSpriteIcon()

    self.assetComplete = function(index, obj)
        
    end
end

--预加载，精灵图标
function M:preloadHeroIcon(type, count)
    for i=1,count do 
        table.insert(list, 'UI/Sprites/Icon/Hero/' .. type .. '_' .. i) 
    end
end

--预加载，道具品质
function M:preloadItemQuality()
    for i=1,5 do
        table.insert(self.assetKeys, 'UI/Sprites/' .. BagManager.pathItemQuality .. 'Quality_Samll0' .. i)
    end
end

--预加载，精灵相关
function M:preloadSpriteIcon()
    local cacheTables = 
    {
        SpriteTypeBack,
        SpriteTypeIcon,
        SpriteStarIcon,
    }
    for i,v in ipairs(cacheTables) do
        for k,path in pairs(v) do
            table.insert(self.assetKeys, 'UI/Sprites/' .. path)
        end
    end
end

--初始化
function M:onInit()
    --补间动画
    self.tween = QTween.new()
    
    --模型组件
    self.model = self:getCom('UIModel', 'UIModel')
    self.modelCamera = self:getObj('UIModel/Camera')
    self.tBg = UI.BackgroundRect
    self.tEye = self:getObj('UIModel/Camera').transform
    self.gesture = self.transform:GetComponent('UIGesture')
    self.gesture:AddHandler(UIGestureType.All, function(e) self:onGestureHandler(e) end)
    self.modelCamera.gameObject:SetActive(false)

    --视野远近位置
    self.farBg = Vector3(0, 0, 0)
    self.nearBg = Vector3(85, 0, -450)
    self.farEye = Vector3(-0.16, 1.48, 5.4)
    self.nearEye = Vector3(-0.16, 1.48, 3.5)

    --所有面板初始化
    self.panels = {}
    self.panels.headPanel = HeroHeadPanel.new(self, self:getObj('nodeHead'))
    self.panels.unlockPanel = HeroUnlockPanel.new(self, self:getObj('nodeUnlock'))
    self.panels.overviewPanel = HeroOverviewPanel.new(self, self:getObj('nodeOverview'))
    self.panels.menuPanel = HeroMenuPanel.new(self, self:getObj('nodeMenu'))
    self.panels.switchPanel = HeroSwitchPanel.new(self, self:getObj('nodeSwitch'))
    self.panels.levelPanel = HeroLevelPanel.new(self, self:getObj('nodeLevel'))
    self.panels.levelupPanel = HeroLevelupPanel.new(self, self:getObj('nodeLevelup'))
    self.panels.starPanel = HeroStarPanel.new(self, self:getObj('nodeStar'))
    self.panels.skillPanel = HeroSkillPanel.new(self, self:getObj('nodeSkill'))
    for k,panel in pairs(self.panels) do
        panel:init()
    end


    self.hero = nil         --当前精灵
    self.isDetail = false   --是否进入详细面板
    self.mainPanel = nil    --主要面板：unlockPanel,overviewPanel
    self.detailPanel = nil  --详情面板：levelPanel,starPanel,skillPanel
    self.isPlayFade = true
    -- self.panels.headPanel:fadeIn(function()
    --     local defaultHero = HeroMgr:getHero(PlayerPrefsUtils.getSelectHeroId() or Config.Global[3].param_1)
    --     self:selectMainHero(defaultHero)
    -- end)

    --事件绑定
    self.messager:addListener(Msg.ITEMDATA_UPDATE, function()
        self:refreshRed(true)
    end)
end

function M:updateWindowUI()
    if not self.hero then
        local defaultId = PlayerPrefsUtils.getSelectHeroId()
        local configId = Config.Global[3].param_1
        local showId = defaultId ~= 0 and defaultId or configId
        
        local defaultHero = HeroMgr:getHero(showId)
        self:selectMainHero(defaultHero)
    end
end

function M:onOpen()
    if self.isPlayFade then
        self.panels.headPanel:fadeIn(
            function()
                self:updateWindowUI()
            end
        )
        self.isPlayFade = false
    else
        self:refreshMainPanel()
    end
    --模型加载可能更快，此时显示模型，防止与其他窗口的模型重叠
    self.modelCamera.gameObject:SetActive(true)
end

function M:onClose()
    self.messager:dispose()
end

--传递给子面板
function M:onUpdate()
    for k,v in pairs(self.panels) do
        if v:isVisible() then
            v:onUpdate()
        end
    end
    self.tween:update()
end

--手势操作模型
function M:onGestureHandler(event)
    if event.type == UIGestureType.Move then
        self.model:RotateModel(-event.deltaPosition.x)
    end
end

--加载角色模型
function M:loadModel(hero)
    local model_info = hero.config.model_info
    local height = Fixed64(model_info.height)
    self.model:LoadModel("Model/" .. model_info.path, height.number)
end

--选中主界面角色
function M:selectMainHero(hero)
    self.hero = hero
    self:loadModel(hero)
    self:refreshMainPanel()
    self.panels.headPanel:refresh()
end

--选中详细界面角色
function M:selectDetailHero(hero)
    self.selectingHero = true
    self.hero = hero
    self:loadModel(hero)
    self:refreshRed()
    self.detailPanel:fadeOut(function()
        self.detailPanel:fadeIn(function()
        end)
    end)
end

function M:loop(parent)
    self.loopc = self.loopc + #parent.units
    if self.loopc > 100 then
        return
    end
    for i,v in ipairs(parent.units) do
        self:loop(v)
    end
end

--刷新主界面
function M:refreshMainPanel()
    local nextMainPanel = self.hero:isUnlocked() and self.panels.overviewPanel or self.panels.unlockPanel
    if self.mainPanel == nextMainPanel then
        self.mainPanel:refresh()
    else
        if self.mainPanel then
            self.mainPanel:fadeOut()
        end

        self.mainPanel = nextMainPanel
        self.mainPanel:fadeIn()
    end
end

--刷新红点
function M:refreshRed(isRefreshPanel)
    if not self.isDetail then
        self.panels.headPanel:refresh()
        if isRefreshPanel then
            self.mainPanel:refresh()
        end
    else
        self.panels.menuPanel:refresh()
        if isRefreshPanel then
            self.detailPanel:refresh()
        end
    end
end

--进入详细面板模式
function M:openDetail()
    --替换banner回调
    self.lastTopBanerCallback = UIGlobal.topBanner.backHandler
    UIGlobal.topBanner:setBackHandler(function()
        if self.detailPanel:getBackCount() > 0 then
            self.detailPanel:onBack()
        else
            self:closeDetail()
        end
    end)

    --结束之前的补间动画防止冲突
    self.tween:finish()

    --相关面板
    self.panels.headPanel:fadeOut()
    self.panels.overviewPanel:fadeOut() --可以确定切换状态时一定是这个界面而不是解锁界面
    
    --拉近
    local seq = self.tween:addSequence()
    seq:addDelay(0.1, function()
        self.panels.menuPanel:fadeIn()
    end)
    seq:addTo(0, 1, 0.6, function(v)
        self.tBg.localPosition = Vector3.Lerp(self.farBg, self.nearBg, v)
        self.tEye.localPosition = Vector3.Lerp(self.farEye, self.nearEye, v)
    end, function()
        self.panels.switchPanel:show()
    end)

    self.isDetail = true
end

--退出详细面板模式
function M:closeDetail()
    --归还banner回调
    UIGlobal.topBanner:setBackHandler(self.lastTopBanerCallback)

    --结束之前的补间动画防止冲突
    self.tween:finish()

    --相关面板
    self.panels.switchPanel:hide()
    self.panels.menuPanel:fadeOut()
    self.detailPanel:fadeOut()

    --拉远
    local seq = self.tween:addSequence()
    seq:addDelay(0.1, function()
        self.panels.overviewPanel:fadeIn()
        self.panels.headPanel:fadeIn()
    end)
    seq:addTo(0, 1, 0.6, function(v)
        self.tBg.localPosition = Vector3.Lerp(self.nearBg, self.farBg, v)
        self.tEye.localPosition = Vector3.Lerp(self.nearEye, self.farEye, v)
    end, function()
    end)

    self.isDetail = false
end

--切换详细面板
function M:switchDetail(index)
    local detailPanels = 
    { 
        self.panels.levelPanel,
        self.panels.starPanel,
        self.panels.skillPanel,
    }

    if self.detailPanel then
        self.detailPanel:fadeOut()
    end

    self.detailPanel = detailPanels[index]
    self.detailPanel:fadeIn()
end