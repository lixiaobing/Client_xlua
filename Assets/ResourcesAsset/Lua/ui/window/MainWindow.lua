---@class MainWindow:BaseWindow
local MainWindow = DClass("MainWindow", BaseWindow)
_G.MainWindow = MainWindow

function MainWindow:onAsset()
    self.assetKeys = {
        "UI/Component/HeroItem",
        "UI/Component/SkillItem"
    }

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.heroItemPrefab = obj
        elseif index == 2 then
            self.skillItemPrefab = obj
        end
    end

    Yield(GameAsset.WaitLoadSceneAdditive("UI_Home", function(v)
        self.sceneCamera = GameObject.Find("Main Camera")
    end))
end

function MainWindow:onInit()
    self.items = {}

    self.nodes.uiGesture:AddHandler(
        UIGestureType.All,
        function(e)
            self:onGestureHandler(e)
        end
    )

    self:addEventHandler(self.nodes.btnBattle.onClick, self.onClickBtnBattle)
    self:addEventHandler(self.nodes.btnLevel.onClick, self.onClickBtnLevel)
    self:addEventHandler(self.nodes.btnLevelNew.onClick, self.onClickLevelNew)
    self:addEventHandler(self.nodes.btnShip.onClick, self.onClickShip)

    self:addEventHandler(self.nodes.btnBackpack.onClick, self.onClickBtnBag)
    self:addEventHandler(self.nodes.btnHide.onClick, self.onClickBtnHide)
    self:addEventHandler(self.nodes.btnChange.onClick, self.onClickBtnChange)
    self:addEventHandler(self.nodes.btnSpirit.onClick, self.onClickBtnSpirit)
    self:addEventHandler(self.nodes.btnMultiFight.onClick, self.onClickBtnMultiFight)
    self:addEventHandler(self.nodes.btnMail.onClick, self.onClickBtnMail)
    self:addEventHandler(self.nodes.btnTask.onClick, self.onClickBtnTask)

    self.nodes.playerName.text = string.format("Lv.%s %s", MainPlayer.lvl, MainPlayer.playername)
    self.nodes.idLabel.text = string.format("ID：%s", MainPlayer.playerId)

    self.selectHeroId = PlayerPrefsUtils.getSelectHeroId()
    if self.selectHeroId == 0 or not Config.Hero[self.selectHeroId] then
        Log("初始化 默认角色-----")
        local defid = Config.Global[3].param_1
        PlayerPrefsUtils.saveSelectHeroId(defid)
        self.selectHeroId = defid
    end
    self:selectRole(self.selectHeroId)
end

function MainWindow:refreshSelectHero()
    local config = Config.Hero[self.selectHeroId]
    if not self.nodes.model then
        Log("self.nodes.model is nil--------")
    end

    GameAsset.LoadUIModel("Model/" .. config.model_info.path, function(v)
        if self.heroModel then
            GameObject.Destroy(self.heroModel)
        end
        self.heroModel = GameObject.Instantiate(v)
        self.heroModel.transform.position = Vector3.zero
        self.heroModel.transform.eulerAngles = Vector3.zero
        self.heroModel.transform.localScale = Vector3.one

        local ani = self.heroModel:GetComponent(typeof(Animator))
        ani:Update(0.01)

        local heroWorld = self.heroModel:GetComponent(typeof(HeroWorldInformaltion))
        heroWorld.isInUI = true
        UIUtil.resetUIModel(self.heroModel)
    end)
end

function MainWindow:onGestureHandler(event)
    if event.type == UIGestureType.Move then
        if self.heroModel then
            self.heroModel.transform:Rotate(Vector3(0,-event.deltaPosition.x,0))
        end
        -- self.nodes.model:RotateModel(-event.deltaPosition.x)
    elseif event.type == UIGestureType.Click then
        if self.isHideUI then
            self.nodes.container:SetActive(true)
            MsgCenter.sendMessage(Msg.SHOW_TOPBANNER, true)
            self.isHideUI = false
        end
    end
end

function MainWindow:onClickShip()
    UIManager.openWindow("ShipWindow")    
end

function MainWindow:onClickLevelNew()
    SearchManager:reloadSearchInfo(function()
        UIManager.openWindow('ChapterWindow')
    end)
end

function MainWindow:onClickBtnBattle()
    --[[
    UIManager.openWindow(
        "LoadSceneWindow",
        function()
            self:close()

            local selectHeroId = PlayerPrefsUtils.getSelectHeroId()
            local selectLevelID = PlayerPrefsUtils.getSelectTestLevelId()

            BattleFactory.enter({selectHeroId}, selectLevelID)
        end
    )
    --]]

    --所有进入战斗都要通过阵容界面 @Modified by Liukeming 2020-8-3
    local levelID = PlayerPrefsUtils.getSelectTestLevelId()
    UIManager.openWindow("FormationWindow", nil, levelID, function(herosID)
        UIManager.openWindow("LoadSceneWindow", function()
		    UIManager.closeAllWindow("LoadSceneWindow")
            BattleFactory.enter(herosID, levelID)
        end)
    end)
end

function MainWindow:onClickBtnLevel()
    UIManager.openWindow(
        "SelectLevelWindow",
        function()
        end
    )
end

function MainWindow:onClickBtnBag()
    UIManager.openWindow("BagMainWindow")
end

function MainWindow:onClickBtnHide()
    self.nodes.container:SetActive(false)
    MsgCenter.sendMessage(Msg.SHOW_TOPBANNER, false)
    self.isHideUI = true
end

function MainWindow:onClickBtnChange()
    self.nodes.container:SetActive(false)
    self.nodes.rolesContainer:SetActive(true)

    self.selectHeroId = PlayerPrefsUtils.getSelectHeroId()
    self:reloadHerosList()

    UIGlobal.topBanner:showBackButton(true)
    UIGlobal.topBanner:setBackHandler(
        function()
            UIGlobal.topBanner:showBackButton(false)
            UIGlobal.topBanner:setBackHandler(nil)
            GameTween.DOAnchorPosX(self.nodes.rolesSelectContainer, -500, 0.4, true)
            GameTween.DOAnchorPosX(self.nodes.rolesDetailContainer, 750, 0.4, true):OnComplete(
                function()
                    self.nodes.rolesContainer:SetActive(false)
                    self.nodes.container:SetActive(true)
                end
            )

            self.selectHeroId = PlayerPrefsUtils.getSelectHeroId()
            self:refreshSelectHero()
        end
    )

    self.nodes.rolesSelectContainer.anchoredPosition = Vector2(-500, self.nodes.rolesSelectContainer.anchoredPosition.y)
    GameTween.DOAnchorPosX(self.nodes.rolesSelectContainer, 0, 0.3, true)
    self.nodes.rolesDetailContainer.anchoredPosition = Vector2(750, self.nodes.rolesDetailContainer.anchoredPosition.y)
    GameTween.DOAnchorPosX(self.nodes.rolesDetailContainer, 0, 0.3, true)
end

--看板娘切换列表走假数据，方便战斗那边调试
function MainWindow:getFakeHeros()
    local heros = {}
    for key, value in pairs(Config.Hero) do
        local hero = {}
        hero.id = value.id
        table.insert(heros, hero)
    end
    return heros
end

function MainWindow:refreshHerosList()
    self.nodes.roleList:ReloadCurCards()
end

function MainWindow:reloadHerosList()
    --local roles = table.clone2(HeroMgr:getAllHeros())
    local heros = self:getFakeHeros()
    table.sort(heros,function(a, b)
        return a.id < b.id
    end)
    
    self.nodes.roleList:InitPool(
        #heros,
        function(index, obj)
            local cfg = {}

            for key, value in pairs(Config.Hero) do
                if value.id == heros[index].id then
                    cfg = value
                end
            end

            local btn = obj.transform:GetComponent(typeof(Button))
            self:addEventHandler(
                btn.onClick,
                function()
                    self:selectRole(cfg.id)
                end
            )

            local icon = obj.transform:Find("Mask/Icon"):GetComponent(typeof(Image))
            self:setSprite(icon, "Icon/Head/" .. cfg.icon)

            local select = obj.transform:Find("Select")
            local actions = obj.transform:Find("Actions")
            if self.selectHeroId == cfg.id then
                select.gameObject:SetActive(true)
                actions.gameObject:SetActive(true)
                self:showRoleDetail(cfg)
            else
                select.gameObject:SetActive(false)
                actions.gameObject:SetActive(false)
            end
        end
    )
end

function MainWindow:showRoleDetail(cfg)
    self.nodes.selectHeroName.text = cfg.name
    self.nodes.selectHeroCvName.text = cfg.cv_name
    self.nodes.selectHeroDesc.text = cfg.des

    self:setSprite(self.nodes.spriteTypeIcon, SpriteTypeIcon[cfg.hero_type])
    self:setSprite(self.nodes.spriteStarIcon, SpriteStarIcon[cfg.default_star])

    --[[
        修复BUG，当前已经选中的精灵不显示切换按钮
        @Modified by Liukeming 2020-6-28
    --]]
    self.nodes.btnSelectHero.gameObject:SetActive(PlayerPrefsUtils.getSelectHeroId() ~= cfg.id)

    self:addEventHandler(
        self.nodes.btnSelectHero.onClick,
        function()
            --HeroMgr:sendChangeHero(
            --    cfg.id,
            --    function()
                    self.selectHeroId = cfg.id
                    PlayerPrefsUtils.saveSelectHeroId(cfg.id)
                    UIGlobal.topBanner:doBack()
            --    end
            --)
        end
    )
end

function MainWindow:selectRole(id)
    self.selectHeroId = id
    self:refreshHerosList()
    self:refreshSelectHero()
end

function MainWindow:onClickBtnSpirit()
    HeroMgr:requestHerosInfo(function()
        UIManager.openWindow("HeroWindow")
    end)
end

function MainWindow:onClickBtnMultiFight()
    --NetWork:send()
    --LogError(string.format('联机测试'))
    UIManager.openWindow("MultiFightWaitingWindow")
end

function MainWindow:onClickBtnMail()
end

function MainWindow:onClickBtnTask()
    UIManager.openWindow("TaskWindow")
end

function MainWindow:onOpen()
    if self.sceneCamera then
        self.sceneCamera:SetActive(true)
    end
    if self.heroModel then
        self.heroModel:SetActive(true)
        local ani = self.heroModel:GetComponent(typeof(Animator))
        ani:Update(0.01)
    end
end

function MainWindow:onHide()
    if self.sceneCamera then
        self.sceneCamera:SetActive(false)
    end
    if self.heroModel then
        self.heroModel:SetActive(false)
    end
end