---@class BattleWindow:BaseWindow
---@field isSendNoneMoveJoystick boolean 
local BattleWindow = DClass("BattleWindow", BaseWindow)
_G.BattleWindow = BattleWindow

local States = {
    Default = 0,
    Avatar = 1,
}
BattleWindow.States = States

function BattleWindow:onAsset()
    self.assetKeys = {
        "UI/Component/PassCondtion",
        "UI/Window/BattleTip",
        "UI/Component/TargetPrompt",

        "Effect/UI/battle/ui_nuqi",
        "Effect/UI/battle/ui_dazhaodianliang",

        "Effect/UI/battle/ui_dian_001",
        "Effect/UI/battle/ui_dian_002",
        "Effect/UI/battle/ui_dian_003",
        "Effect/UI/battle/ui_dian_004",
        "Effect/UI/battle/ui_dian_005",
        "Effect/UI/battle/ui_dian_006",
        "Effect/UI/battle/ui_dian_007",

        "Effect/UI/battle/ui_xuetiao",
    }

    --准备英雄独特需求的UI资源
    local mainPlayer = BattleLogic.Instance.mainPlayer
    for i,hero in ipairs(mainPlayer.heroes) do
        for i,v in ipairs(hero.config.userui or {}) do
            table.insert(self.assetKeys, "UI/Component/Battle/"..v)
        end
    end

    self.actionEffectPrefabs = {}

    self.assetComplete = function(index, obj)
        if index == 1 then
            self.PassCondtionPrefab = obj
        elseif index == 2 then
            self.BattleTipPrefab = obj
        elseif index == 3 then
            self.TargetPromptPrefab = obj   --任务标记中的路径点
        else
            self.actionEffectPrefabs[self.assetKeys[index]] = obj
        end
    end

    --废弃之前的onResource（方便统一管理UI加载的资源）
    --self.assetKeys 指定需要加载的资源key（key和Addressables里面对应）
    --self.assetComplete 单个资源加载完的回调
    --若没有提供self.assetComplete，则在主逻辑中可用self.cacheAssets[key]获取对应资源
end

function BattleWindow:onInit()
    self:addEventHandler(self.nodes.uiScreen.onMouseDown, self.onScreenMouseDownHandler)

    self:addEventHandler(self.nodes.joystick.onUIJoyStick, self.onJoystickMoveHandler)
    self:addEventHandler(self.nodes.btnAttack.onPressDown, self.onAttackHandler)
    self:addEventHandler(self.nodes.btnRush.onPressDown, self.onRushHandler)

    self.inputRelaxBtns = {}
    self.inputRelaxBtns.btnJump = self.nodes.inputRelax:Find("BtnJump"):GetComponent(typeof(Button))
    self.inputRelaxBtns.btnRush = self.nodes.inputRelax:Find("BtnRush"):GetComponent(typeof(Button))
    self.inputRelaxBtns.btnAttack = self.nodes.inputRelax:Find("BtnAttack"):GetComponent(typeof(Button))

    self:addEventHandler(self.inputRelaxBtns.btnJump.onPressDown, self.onJumpHandler)
    self:addEventHandler(self.inputRelaxBtns.btnRush.onPressDown, self.onRushHandler)
    self:addEventHandler(self.inputRelaxBtns.btnAttack.onPressDown, self.onAttackHandler)

    self.btnSkills = {}
    for i=1,4 do
        self.btnSkills[i] = self.nodes["btnSkill"..i]
        self:addEventHandler(self.btnSkills[i].onPressDown, self.onSkillHandler, i)
    end

    --操作台交互按钮
    self.nodes.imageProgress.fillAmount = 0
    self.nodes.btnConnect.gameObject:SetActive(false)
    self:addEventHandler(self.nodes.btnConnect.onClick, self.onConnectHandler)

    self.nodes.targetBox.gameObject:SetActive(false)
    self.nodes.comboCanvas.alpha = 0
    self.isSendNoneMoveJoystick = true
    self.groupChains = {}
    for i=1,7 do
        self.groupChains[i] = self.nodes.chainCanvas.transform:Find("Chain"..i):GetComponent(typeof(CanvasGroup))
    end

    self:refreshMainActor()

    self.teamHeros = {}
    for i=1,2 do
        self.teamHeros[i] = self.nodes.teamCanvas.transform:Find("Hero"..i):GetComponent(typeof(Button))
        self:addEventHandler(self.teamHeros[i].onClick, self.selectTeamHeroHandler, i)
    end
    self:refreshTeam()

    BattleWindow.selectOrder = 1

    self.messager:addListener(Msg.BATTLE_REMOVE_ROLE, self.onRoleRemoved)
    self.messager:addListener(Msg.BATTLE_HP_CHANGE, self.onHpChange)
 
    self.messager:addListener(Msg.BATTLE_SHOW_TARGET, self.onTargetShow)
    self.messager:addListener(Msg.BATTLE_SPECIALCAMERA, self.onClearMonsterHp)
    self.messager:addListener(Msg.BATTLE_COMBO_COUNT, self.onShowComboCount)
    self.messager:addListener(Msg.BATTLE_CHAIN_GROUP, self.onBattleChainGroup)
    self.messager:addListener(Msg.BATTLE_CHANGE_ACTOR, self.selectTeamHeroHandler)

    self.messager:addListener(Msg.BATTLE_USERUI_OPEN, self.openBattleUserUI)
    self.messager:addListener(Msg.BATTLE_USERUI_CLOSE, self.closeBattleUserUI)

    self.messager:addListener(Msg.BATTLE_SHOW_LEVEL_TIP, self.onShowLevelTip)
    self.messager:addListener(Msg.BATTLE_SHOW_LEVEL_EVENT, self.onShowLevelEvent)
    self.messager:addListener(Msg.BATTLE_SHOW_PASS_CONDTION, self.onShowPassCondtion)

    self.messager:addListener(Msg.BATTLE_START, self.OnBattleStart)

    self.messager:addListener(Msg.BATTLE_ACTIVE_ALL_UI, self.setActiveRoot)
    self.messager:addListener(Msg.BATTLE_ACTIVE_LOGIC, self.OnActiveLogic)
    
    self.messager:addListener(Msg.BATTLE_SHOW_CONNECT, self.onShowConnect)
    self.messager:addListener(Msg.BATTLE_HIDE_CONNECT, self.onHideConnect)
    
    self.messager:addListener(Msg.BATTLE_CHANGE_HANDLE_STATE, self.refreshHandleState)

    self.messager:addListener(Msg.BATTLE_POWER_UPDATE, self.refreshMainActorPower)
    self.messager:addListener(Msg.BATTLE_POWER_POINT, self.showMainActorPowerPoint)
    self.messager:addListener(Msg.BATTLE_POWER_FULLTIP, self.showMainActorPowerFull)
    self.messager:addListener(Msg.BATTLE_GAS_UPDATE, self.refreshMainActorGas)

    self.messager:addListener(Msg.BATTLE_ATTACK_TYPE_CHANGE, self.refreshAttackButton)

    self.messager:addListener(Msg.BATTLE_WINDOW_STATE, self.onDisplayStates)

    self.messager:addListener(Msg.CHAPTER_TASK_STATUS_CHANGE, self.refreshTaskList) --任务状态变更
    --self.messager:addListener(Msg.CHAPTER_TASK_ACCEPTED, self.onTaskAccepted) --任务接取
    -- self.messager:addListener(Msg.BATTLE_OBSTACLE_REWARD, self.onShowReward) 

    self.messager:addListener(Msg.CHAPTER_BRANCH_TASK_STATUS_CHANGE, self.onBranchTaskStateChange) --
    self.messager:addListener(Msg.BATTLE_REFRESH_MAIN_HERO_VIEW, self.handleRefreshMainHeroView) --
    self.messager:addListener(Msg.BATTLE_EXIT, self.handleExitBattle)

    self:addEventHandler(self.nodes.buttonPause.onClick, self.onButtonPause)
    if BattleManager.Instance.levelCtrl:isPlayStartAnimation() then --播放出场动画
        self:setActiveRoot(false)
    else 
        self:OnBattleStart()
    end

    self:refreshHandleState()

    --任务目标指引
    self.taskMarker = BattleTaskMarker.new(self.nodes.panelTask.gameObject, self.TargetPromptPrefab)

    -------任务相关
    self.nodes.textLevelName.text = BattleManager.Instance.levelCtrl:getName() --关卡名称
    self.nodes.panelTask.gameObject:SetActive(true)--任务跟节点
    self.nodes.panelTaskRecv.gameObject:SetActive(false)
    self.nodes.canvasGroupReward.gameObject:SetActive(false)
    self.rewards = {}
    self:addEventHandler(self.nodes.btnTaskCheck.onClick, self.onTaskCheck)
    self:refreshTaskList()
    --支线任务状态显示
    self.nodes.imageBranchTaskState.gameObject:SetActive(false)
  

    --MsgCenter.sendMessage(Msg.CHAPTER_BRANCH_TASK_STATUS_CHANGE,BattleManager.Instance.levelCtrl:getTasks()[1])
    -------战斗目标
    self.battleTarget = UIUtil.createComponent(self.nodes.battleTarget.gameObject, BattleTargetSingleWidget)
    self.battleTarget:setEffectOrigin(self.actionEffectPrefabs["Effect/UI/battle/ui_xuetiao"])
    self.battleTarget.gameObject:SetActive(false)
    -------头顶信息
    self.headInfo = UIUtil.createComponent(self.nodes.headInfo.gameObject, BattleHeadInfo)
end

function BattleWindow:refreshHandleState()
    local mainHero = BattleLogic.Instance.mainPlayer.mainHero
    self.nodes.inputBattle.gameObject:SetActive(mainHero.handleState == HandleState.Battle)
    self.nodes.inputRelax.gameObject:SetActive(mainHero.handleState == HandleState.Relax)
end

function BattleWindow:onBranchTaskStateChange(task)
    if not task then return end
    if self.branchTaskStateTween then 
        self.branchTaskStateTween:Kill(false)
        self.branchTaskStateTween = nil
    end
    self.nodes.imageBranchTaskState.gameObject:SetActive(true)
    self.nodes.imageBranchTaskComplete.gameObject:SetActive(task:isDone2()) --是否已经完成
    self.nodes.textBranchTaskName.text    = task:getName()   --任务名称
    self.nodes.textBranchTaskTarget.text  = task:getTarget().text --任务目标
    self.nodes.imageBranchTaskState.alpha = 1
    self.branchTaskStateTween = GameTween.DOFade(self.nodes.imageBranchTaskState,0 , 0.7):SetDelay(3):OnComplete(function()
        self.nodes.imageBranchTaskState.gameObject:SetActive(false)
        if self.branchTaskStateTween then 
            self.branchTaskStateTween:Kill(false)
            self.branchTaskStateTween = nil
        end
    end)
    self:tweenPush(self.branchTaskStateTween)
end

-- function BattleWindow:onShowReward(rewards)
--     for i,v in ipairs(rewards) do
--         table.insert(self.rewards,v)
--     end
--     self:showRewardOne()
-- end

-- function BattleWindow:showRewardOne()
--     if #self.rewards > 0 then 
--         local data = table.remove(self.rewards,1)
--         self.nodes.canvasGroupReward.gameObject:SetActive(true)
--         local item = Config.Item[data.id]
--         UIUtil.setItemIcon( self.nodes.imageRewardIcon,item.item_icon)
--         self.nodes.textRewardCount.text = "x"..tostring(data.num)

--         self.nodes.canvasGroupReward.alpha = 0.001
--         local tween1 = GameTween.DOFade(self.nodes.canvasGroupReward, 1, 0.3)
--         local tween2 = GameTween.DOFade(self.nodes.canvasGroupReward, 0, 0.7):SetDelay(1):OnComplete(function()
--             if #self.rewards > 0 then 
--                 self:showRewardOne()
--             else
--                 self.nodes.canvasGroupReward.gameObject:SetActive(false) 
--             end
--         end)
--         local seq = GameTween.Sequence()
--         seq:Append(tween1)
--         seq:Append(tween2)
--         self:tweenPush(seq)
--     end
-- end

function BattleWindow:onShowConnect(console)
    self.console = console
    self.nodes.btnConnect.gameObject:SetActive(true)
    self.nodes.btnConnect.transform:Find("Text"):GetComponent(typeof(Text)).text = self.console:getTip()
    self.nodes.action.gameObject:SetActive(false)
end

function BattleWindow:onHideConnect(console)
    if self.console then 
        if self.console == console  then 
            self.console = nil
            self.nodes.btnConnect.gameObject:SetActive(false)
            self.nodes.action.gameObject:SetActive(true)
        end
    else
        self.nodes.btnConnect.gameObject:SetActive(false)
        self.nodes.action.gameObject:SetActive(true)
    end
end

function BattleWindow:cancelConnect()
    --取消连接
    if self.console then 
        self.console:cancelConnect()
    end
end

function BattleWindow:onConnectHandler()
    if self.console then 
        self.console:connect()
    end
end

function BattleWindow:OnActiveLogic(active)
    BattleManager.Instance:setLogicStart(active)
end

function BattleWindow:onOrderChanged(sort, count)
    if sort<count then
        self.nodes.joystick:Reset()
    end
end

function BattleWindow:OnBattleStart()
     self:setActiveRoot(true)
     BattleManager.Instance:setLogicStart(true)
end


function BattleWindow:setActiveRoot(active,tag)
    tag = tag or self.id
    --LogError("setActiveRoot: "..tag .." : "..tostring(active))
    self.rootHideFlags = self.rootHideFlags or {}
    if active then 
        self.rootHideFlags[tag] = nil
    else
        self.rootHideFlags[tag] = true
    end
    self.nodes.root.gameObject:SetActive(table.count(self.rootHideFlags) == 0)
end

function BattleWindow:onShowPassCondtion(content)
    self:showPassCondtion(Config.getString(content))
end

function BattleWindow:onShowLevelTip(data)
    local title
    if data.title and data.title > 0 then 
        title = Config.getString(data.title)
    end
    self:showLevelTip(Config.getString(data.content),title)
end

--通关条件
function BattleWindow:showPassCondtion(content)
    if not self.passCondtion then 
        self.passCondtion = GameObject.Instantiate(self.PassCondtionPrefab)
        self.passCondtion.transform:SetParent(self.nodes.group,false)
        -- self.passCondtion.transform.localPosition = Vector3(-480, 180, 0) 
        -- self.passCondtion.transform.localScale = Vector3.one
        self.passCondtion.transform:Find("Text_value").gameObject:SetActive(false)
    end
    self.passCondtion.transform:Find("Text_title"):GetComponent(typeof(Text)).text = content
    --local deadNum = string.format("%s/5",Statistics.getDeadNumByType(BattleRole.Monster)) 
    --self.passCondtion.transform:Find("Text_value"):GetComponent(typeof(Text)).text = deadNum
  
end

--关卡提示
function BattleWindow:showLevelTip(content,title)
    if not self.tips then 
        self.tips = GameObject.Instantiate(self.BattleTipPrefab)  
        self.tips.transform:SetParent(self.transform)
        self.tips.transform.localPosition = Vector3.zero
        self.tips.transform.localScale = Vector3.one
    end
    local text_title = self.tips.transform:Find("Text_title")
    local text_content = self.tips.transform:Find("Text_content")
    local text_content_center = self.tips.transform:Find("Text_content_center")

    if title then 
        text_title.gameObject:SetActive(true)
        text_content.gameObject:SetActive(true)
        text_content_center.gameObject:SetActive(false)
        text_title:GetComponent(typeof(Text)).text = title  --标题
        text_content:GetComponent(typeof(Text)).text = content  --正文
    else
        text_title.gameObject:SetActive(false)
        text_content.gameObject:SetActive(false)
        text_content_center.gameObject:SetActive(true)
        text_content_center:GetComponent(typeof(Text)).text = content
    end
    self.tips:SetActive(true)
    local canvasGroup = self.tips:GetComponent(typeof(CanvasGroup))
    canvasGroup.alpha = 1
    GameTween.DOFade(canvasGroup, 0, 0.5):SetDelay(1):OnComplete(function()
        self.tips:SetActive(false)
    end)
end

function BattleWindow:onButtonPause(event)
    if IsNetBattle and BattleLogic.Instance.params.mode == BattleMode.MultiPlayer then
        --- TODO:临时处理
        BattleLogic.Instance.server.netWork:send(c2s.BATTLE_REQ_BATTLE_RESULT, {result=1})
    else
        if Time.timeScale == 1 then
            Time.timeScale = 0
        else
            Time.timeScale = 1
        end
        UIManager.openWindow("BattlePauseWindow")
    end
end

function BattleWindow:showTime()
    local day , hour ,min ,sec ,mil = TimeUtils.format(Statistics.time:tonumber(),true)
    self.nodes.textTime.text = string.format("%s:%s", min ,sec) 
end

function BattleWindow:onScreenMouseDownHandler(args, isDown)
    -- LogError(isDown)
    CameraController.mouseDown = isDown
end

function BattleWindow:onUpdate()
    self.deltaTime = self.deltaTime or 0
    self.deltaTime = self.deltaTime + (Time.unscaledDeltaTime - self.deltaTime) * 0.1
    local fps = 1 / self.deltaTime

    self.nodes.fps.text = string.format("FPS：%.2f", fps)

    if not BattleManager.Instance then return end
    
    self:showTime()
    -- self:showTarget()
    -- self:showTest()
    if self.console then 
        self.nodes.imageProgress.fillAmount = self.console:getProgress().number
    end

    --self:checkTaskLoaction()
    self.taskMarker:onUpdate()
end

function BattleWindow:refreshMainActor()
    local mainHero = BattleLogic.Instance:getMainHero()
    -- self.actorName.text = mainActor.config.name
    UIUtil.setSprite(self.nodes.actorIcon, "Icon/Head/"..mainHero.config.icon)

    self:refreshMainActorHp()
    self:refreshMainActorGas()
    self:refreshMainActorPower()
    self:refreshAttackButton()
end

function BattleWindow:refreshMainActorHp()
    local mainHero = BattleLogic.Instance.mainPlayer.mainHero

    self:tweenPush(GameTween.DOFillAmount(self.nodes.hpBar, mainHero.attr:getHpPercent().number, 0.2))
    self.nodes.hpValue.text = string.format("%s/%s", mainHero.attr:getHp().number, mainHero.attr:getMaxHp().number)
end

function BattleWindow:refreshMainActorGas(tweenTime)
    local mainHero = BattleLogic.Instance.mainPlayer.mainHero
    --怒气显示
    local val = mainHero.attr:getGasPercent().number
    local progressValue = 0.11 + val*(0.693-0.11)
    if tweenTime then
        self:tweenPush(GameTween.DOFillAmount(self.nodes.gasBar, progressValue, 0.1))
    else
        self.nodes.powerBar.fillAmount = progressValue
    end

    local isShowSuperSkill = val >= 1
    self.btnSkills[4].interactable = isShowSuperSkill
    self.btnSkills[4].gameObject:SetActive(isShowSuperSkill)

    UIUtil.createLoopEffect(self, "nuqi", self.actionEffectPrefabs["Effect/UI/battle/ui_nuqi"], self.nodes.actorHead, isShowSuperSkill, false)
    UIUtil.createLoopEffect(self, "skillButton4", self.actionEffectPrefabs["Effect/UI/battle/ui_dazhaodianliang"], self.btnSkills[4].transform, isShowSuperSkill, false)
end

function BattleWindow:showMainActorPowerFull(atp)
    if atp == AttrType.POWER_POINT then
        local prefab = self.cacheAssets["Effect/UI/battle/ui_dian_005"]
        UIUtil.addEffect(prefab, self.nodes.btnAttack.transform, true)
    else
        local tps = {AttrType.POWER_POINT1, AttrType.POWER_POINT2, AttrType.POWER_POINT3}
        local sort = table.find(tps, atp)
        local btnSkill = self.btnSkills[sort]
        local prefab = self.cacheAssets["Effect/UI/battle/ui_dian_006"]
        UIUtil.addEffect(prefab, btnSkill.transform, true)
    end
end

function BattleWindow:showMainActorPowerPoint()
    local prefab = self.cacheAssets["Effect/UI/battle/ui_dian_007"]
    UIUtil.addEffect(prefab, self.nodes.btnAttack.transform, true)
end

function BattleWindow:refreshMainActorPower(tweenTime)
    local mainHero = BattleLogic.Instance.mainPlayer.mainHero

    --能量显示
    local val = mainHero.attr:getPowerPercent()
    val = ResManager.Instance.battleViewPowerCurve.curve:Evaluate(val.number)

    local to = Vector3(0,0,131.5*(1-val))
    if tweenTime then
        self:tweenPush(GameTween.DOLocalRotate(self.nodes.powerBar.transform, to, tweenTime, XRotateMode.Fast))
    else
        self.nodes.powerBar.transform.localEulerAngles = to
    end

    local step = math.floor(val/0.2)+1
    self:setSprite(self.nodes.powerNum, "Icon/Battle/Attack_Number0"..step)

    local point = mainHero.attr:getPowerPoint(AttrType.POWER_POINT).number
    self:setSprite(self.nodes.powerPoint, "Icon/Battle/PowerPoint_"..point)

    if self.uiPowerPointCount then
        if point > self.uiPowerPointCount then
            local prefab = self.cacheAssets["Effect/UI/battle/ui_dian_001"]
            local position = nil
            local rotation = nil
            for i=self.uiPowerPointCount+1,point do
                if i==1 then
                    position = Vector3(-41.5, -11.5, 0)
                    rotation = Vector3(0,0,0)
                elseif i==2 then
                    position = Vector3(-22.5, 1, 0)
                    rotation = Vector3(0,0,-10)
                elseif i==3 then
                    position = Vector3(-2, 10.5, 0)
                    rotation = Vector3(0,0,-24)
                elseif i==4 then
                    position = Vector3(20, 16, 0)
                    rotation = Vector3(0,0,-36)
                elseif i==5 then
                    position = Vector3(42.5, 15.5, 0)
                    rotation = Vector3(0,0,-45)
                end

                UIUtil.addEffect(prefab, self.nodes.powerPoint.transform, true, position, rotation)
            end
        end
    end
    self.uiPowerPointCount = point

    local isShowPowerFull = point == AttrDefine.POWER_POINT_TOTAL.number
    local loopPrefab = self.cacheAssets["Effect/UI/battle/ui_dian_003"]
    UIUtil.createLoopEffect(self, "public_power_full", loopPrefab, self.nodes.btnAttack.transform, isShowPowerFull, false)

    for i=1,3 do
        local tps = {AttrType.POWER_POINT1, AttrType.POWER_POINT2, AttrType.POWER_POINT3}
        local point = mainHero.attr:getPowerPoint(tps[i]).number
        local btnSkill = self.btnSkills[i]

        local powerIcon = btnSkill.transform:Find("Icon"):GetComponent(typeof(Image))
        powerIcon.color = point > 0 and Color.white or Color.gray

        local powerPoint = btnSkill.transform:Find("Power"):GetComponent(typeof(Image))
        if point > 0 then
            powerPoint.gameObject:SetActive(true)
            self:setSprite(powerPoint, "Icon/Battle/PowerPoint_Skill_"..point)
        else
            powerPoint.gameObject:SetActive(false)
        end

        self.uiSubPowerPointCounts = self.uiSubPowerPointCounts or {}
        local count = self.uiSubPowerPointCounts[i]
        if count then
            if point > count then
                local prefab = self.cacheAssets["Effect/UI/battle/ui_dian_002"]
                local position = nil
                local rotation = nil
                for i=count+1,point do
                    if i==1 then
                        position = Vector3(-7.5, -11, 0)
                        rotation = Vector3(0,0,-13.5)
                    elseif i==2 then
                        position = Vector3(1.8, -1.55, 0)
                        rotation = Vector3(0,0,0)
                    elseif i==3 then
                        position = Vector3(8.17, 10.22, 0)
                        rotation = Vector3(0,0,15.2)
                    end
    
                    UIUtil.addEffect(prefab, powerPoint.transform, true, position, rotation)
                end
            end
        end
        self.uiSubPowerPointCounts[i] = point

        local isShowPowerFull = point == AttrDefine.POWER_POINT_MAX.number
        local loopPrefab = self.cacheAssets["Effect/UI/battle/ui_dian_004"]
        UIUtil.createLoopEffect(self, "power_full"..i, loopPrefab, btnSkill.transform, isShowPowerFull, false)
    end
end

function BattleWindow:refreshTeam()
    self.teamList = BattleLogic.Instance:getMainPlayerReadyTeam()

    for i,v in ipairs(self.teamHeros) do
        local cvs = v.transform:GetComponent(typeof(CanvasGroup))
        if self.teamList[i] then
            cvs.alpha = 1
            cvs.blocksRaycasts = true

            local head = cvs.transform:Find("Mask/Icon"):GetComponent(typeof(Image))
            UIUtil.setSprite(head, "Icon/Head/"..self.teamList[i].config.icon)

            local cdImage = cvs.transform:Find("Cd"):GetComponent(typeof(Image))
            if self.teamList[i].changeCD.number>0 then
                cdImage.fillAmount = (self.teamList[i].changeCD/BATTLE_CHANGE_ACTOR_CD).number
                self:tweenPush(GameTween.DOFillAmount(cdImage, 0, self.teamList[i].changeCD.number):SetEase(XEase.Linear))
            else
                cdImage.fillAmount = 0
            end

            local hp = cvs.transform:Find("Hp"):GetComponent(typeof(Image))
            hp.fillAmount = self.teamList[i].attr:getHpPercent().number
        else
            cvs.alpha = 0
            cvs.blocksRaycasts = false
        end
    end
end

function BattleWindow:refreshActorPower()

end

function BattleWindow:onJoystickMoveHandler(args, vec)
    if BattleLogic.Instance then
        if BattleLogic.Instance:isInputLock() and not BattleLogic.Instance:getMainHero().useJoystickState then
            return
        end
        local isMove = vec.x ~= 0 or vec.y ~= 0
        if isMove then
            self.isSendNoneMoveJoystick = true
            local cameraVec = BattleView.Instance.cameraCtrl:getDirection(vec)
            cameraVec = clampVectorY(cameraVec, 0)
            local joystick = FrameSyncUtils.ToJoystick(cameraVec)
            BattleLogic.Instance:playerInputJoystick(joystick)

            local state = BattleLogic.Instance:getMainHero():getState()
            if state == AnimationName.Run or state == AnimationName.RunLoop or state == AnimationName.RunFast then
                BattleView.Instance.cameraCtrl:doMoveRotate(vec)
            end
        else
            if self.isSendNoneMoveJoystick then
                BattleLogic.Instance:playerInputJoystick(0)
                self.isSendNoneMoveJoystick = false 
            end
        end
    end
    --检查连接
    if (vec.x ~= 0 or vec.y ~= 0) then
        self:cancelConnect()
    end
end

function BattleWindow:onAttackHandler()
    if BattleLogic.Instance then
        BattleLogic.Instance:onInputAttack()
    end
end

function BattleWindow:onSkillHandler(sort)
    if BattleLogic.Instance then
        BattleLogic.Instance:onInputSkill(sort)
    end
end

function BattleWindow:onRushHandler()
    if BattleLogic.Instance then
        BattleLogic.Instance:onInputRush()
    end
end

function BattleWindow:onJumpHandler()
    if BattleLogic.Instance then
        BattleLogic.Instance:onInputJump()
    end
end

function BattleWindow:onHpChange(targetCtrl, tp, damage, isCrit)
    if targetCtrl:isMainPlayer() then
        self:refreshMainActorHp()
    end

    if damage == 0 then return end
    
    -- Log("显示伤害")
    self.damageFontSave = self.damageFontSave or {}
    local unUse = nil
    for i,v in ipairs(self.damageFontSave) do
        if not v.isPlaying then
            unUse = v
            break
        end
    end
    if not unUse then
        local obj = GameObject.Instantiate(self.nodes.damageFontPrefab)
        obj.transform:SetParent(self.nodes.canvas, false)

        unUse = UIUtil.createComponent(obj, DamageFont)

        table.insert( self.damageFontSave, unUse )
    end
    unUse:init(self.nodes.canvas, targetCtrl.view.transform, tp, damage, isCrit)

    if false and not BattleManager.Instance.specialCameraMode then
        if targetCtrl.type == BattleRole.Monster then
            self.monsterHpSave = self.monsterHpSave or {}
            
            local cpn = nil
            for i,v in ipairs(self.monsterHpSave) do
                if v.target and v.target.id == targetCtrl.id then
                    cpn = v
                    break
                end
            end
            if cpn then
                cpn:refresh()
            else
                local unUse = nil
                for i,v in ipairs(self.monsterHpSave) do
                    if not v.target then
                        unUse = v
                        break
                    end
                end
                if not unUse then
                    local obj = GameObject.Instantiate(self.nodes.monsterHpPrefab)
                    obj.transform:SetParent(self.nodes.canvas, false)

                    unUse = UIUtil.createComponent(obj, MonsterHp)

                    table.insert( self.monsterHpSave, unUse )
                end
                unUse:init(self.nodes.canvas, targetCtrl)
            end
        end
    end
    if self.headInfo and targetCtrl:isMainPlayer() then
        self.headInfo:onRoleHPChange(targetCtrl)
    end
end

function BattleWindow:onArmorChange(isTween)
    local percent = BattleLogic.Instance.mainHero.attr:getArmorPercent()
    if self.armorTween then
        self.armorTween:Kill(false)
    end
    if isTween then
        self.armorTween = GameTween.DOFillAmount(self.nodes.armorBar, percent, 0.2)
    else
        self.nodes.armorBar.fillAmount = percent
    end
end

function BattleWindow:onClearMonsterHp()
    for i,v in ipairs(self.monsterHpSave or {}) do
        v.target = nil
    end
end

function BattleWindow:onTargetShow(targetId)
    --self.targetMonsterId = targetId
    self.battleTarget:setTarget(targetId)
end

-- function BattleWindow:showTarget()
--     if not self.targetMonsterId then 
--         if self.nodes.targetBox and self.nodes.targetBox.gameObject.activeSelf then
--             self.nodes.targetBox.gameObject:SetActive(false)
--         end
--         return
--     end

--     local ctrl = BattleManager.Instance:getMonsterById(self.targetMonsterId)
--     if ctrl then
--         if not self.nodes.targetBox.gameObject.activeSelf then
--             self.nodes.targetBox.gameObject:SetActive(true)
--         end

--         self.nodes.targetName.text = ctrl.config.name.." "..ctrl.id
--         self.nodes.targetHpValue.text = string.format("%s/%s", ctrl.attr:getHp(), ctrl.attr:getMaxHp())
--         self.nodes.targetHpBar.fillAmount = ctrl.attr:getHpPercent()

--         local max = BattleCalculates.cal_armor(ctrl.attr)
--         if max > 0 then
--             self.nodes.targetArmorBar.transform.parent.gameObject:SetActive(true)
--             self.nodes.targetArmorBar.fillAmount = ctrl.attr:getArmorPercent()
--         else
--             self.nodes.targetArmorBar.transform.parent.gameObject:SetActive(false)
--         end
--     else
--         self.targetMonsterId = nil
--     end
-- end

function BattleWindow:onShowComboCount(count, time)
    count = count.number
    time = time.number

    if count>1 then
        self:showOrHideCombo(true)
    else
        self:showOrHideCombo(false)
        return
    end

    self.nodes.comboCountBar.fillAmount = time/5
    if self.comboBarTween then
        self.comboBarTween:ChangeEndValue(0, time, false):Restart(true)
    else
        self.comboBarTween = GameTween.DOFillAmount(self.nodes.comboCountBar, 0, time):SetEase(XEase.Linear)
        self.comboBarTween:SetAutoKill(false)
        self.comboBarTween:OnComplete(function()
            self:showOrHideCombo(false)
        end)

        self:tweenPush(self.comboBarTween)
    end

    if count > 1 then
        if count > 999 then
            count = 999
        end
        self.nodes.comboCountLabel.text = count

        if self.comboShakeTween then
            self.comboShakeTween:Restart(false)
        else
            self.comboShakeTween = GameTween.DOShakeAnchorPos(self.nodes.comboCountRect, 0.1, 10, 30, 90, true):OnComplete(function()
                self.comboShakeTween = nil
            end)
            self:tweenPush(self.comboShakeTween)
        end
    end
end

function BattleWindow:showOrHideCombo(isShow)
    if isShow then
        if self.comboHideTween then
            self.comboHideTween:Pause()
        end
        self.nodes.comboCanvas.alpha = 1
    else
        if self.comboHideTween then
            self.comboHideTween:Restart(false)
        else
            self.comboHideTween = GameTween.DOFade(self.nodes.comboCanvas, 0, 0.5)
            self.comboHideTween:SetAutoKill(false)
            self:tweenPush(self.comboHideTween)
        end
    end
end

function BattleWindow:onBattleChainGroup(info, sort)
    local skill = info.skill or ""
    local chains = info.chains or {}
    sort = sort or 0

    -- LogWarning(sort)

    for i,v in ipairs(self.groupChains) do
        local chain = chains[i]
        if chain then
            v.alpha = 1

            local name = v.transform:Find("Name"):GetComponent(typeof(Text))
            name.text = chain

            local shine = v.transform:Find("Shine"):GetComponent(typeof(CanvasGroup))
            shine.alpha = i>sort and 0 or 1
        else
            v.alpha = 0
        end
    end
end

function BattleWindow:selectTeamHeroHandler(sort)
    if BattleLogic.Instance:isInputLock() then
        return
    end
    local mainHero = BattleLogic.Instance:getMainHero()
    if not mainHero.changeWindow then 
        return 
    end

    local target = self.teamList[sort]
    if not target then
        return
    end
    self:cancelConnect()
    if target.changeCD.number > 0 then return end

    BattleLogic.Instance:changeMainHero(sort)
end

function BattleWindow:handleRefreshMainHeroView()
    self:refreshMainActor()
    self:refreshTeam()
end

function BattleWindow:handleExitBattle()
    StartCoroutine(function()
        UIManager.waitOpenWindow("LoadSceneWindow")

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 0.1)
        Time.timeScale = 1
        UIManager.closeAllWindow("LoadSceneWindow")
        BattleManager.Instance:clear()
        BattleManager.Instance:dispose()
        Yield(0)

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 0.5)
        Yield(GameAsset.WaitLoadSceneSingle("UI_Main", function(v) end))

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 0.8)
        UIManager.waitOpenWindow("MainWindow")

        MsgCenter.sendMessage(Msg.LOAD_SCENE_PROGRESS, 1, 0.3)
        WaitForSeconds(1)

        UIManager.closeWindow("LoadSceneWindow")
    end)
end

-- function BattleWindow:showTest()
--     if self.test then 
--         --计算第一只怪和 主角之间的距离
--         local dist  = 0
--         if BattleManager.Instance then 
--             local momster = BattleManager.Instance.monsterList[1]
--             local actor   = BattleManager.Instance.mainHero
--             if momster and  actor then 
--                 dist  = Vector3.Distance(momster.transform.position,actor.transform.position)
          
--             end
--         end
--         self.test.text = string.format("dist:%.3f", dist)
--     end
-- end

--任务查看
function BattleWindow:onTaskCheck()
    local timeScale  = Time.timeScale
    Time.timeScale = 0
    UIManager.openWindow("ChapterTaskWindow",nil, BattleManager.Instance.levelCtrl:getChapter(),function()
        Time.timeScale = timeScale  
    end,true)
end

--刷新任务列表
function BattleWindow:refreshTaskList(revTask)
    if self.nodes.panelTaskRecv.gameObject.activeSelf then  --显示接取任务提示时隐藏任务列表
        self.nodes.panelTaskList.gameObject:SetActive(false)
        return
    end

    if newTask then 
        self.revTask = revTask
    end
    if self.trackTaskTween then 
        return
    end
    --任务列表
    local task = BattleManager.Instance.levelCtrl:getTrackTask()
    if task then
        local newTask = task == self.revTask
        if newTask then 
            self.revTask = nil
        end
        self.nodes.panelTaskList.gameObject:SetActive(true)
        local targets = task:getTargets()
        --顺序任务目标显示规则不同意，此处特殊处理只显示最后一个任务目标
        if task:getFinishType() == LTaskFinishType.subtask_sequence then
            local _targets = {} 
            _targets[1] = targets[#targets]
            targets = _targets
        end
        self.nodes.textTaskTitle.text = task:getName2()

        self.nodes.scrollTask:ReloadConfig()
        self.nodes.scrollTask:InitPool(#targets, function(index, obj) 
            local textIndex = obj.transform:Find("ImageBack/TextIndex"):GetComponent(typeof(Text))
            local textName  = obj.transform:Find("ImageBack/TextName"):GetComponent(typeof(Text))
            local textPrama = obj.transform:Find("ImageBack/TextPrama"):GetComponent(typeof(Text))
            local imageIcon = obj.transform:Find("ImageBack/ImageIcon").gameObject
            local imageFrame = obj.transform:Find("ImageBack/ImageFrame"):GetComponent(typeof(Image))

            -- textName.text   = "击杀AST的长官"..index
            textIndex.text  = string.format("%02d",index)
            textPrama.text  = ""
            textName.text   = targets[index].text
            if targets[index].done then 
                textName.color = Color.green
                imageIcon:SetActive(true)
                imageFrame.gameObject:SetActive(false)
            else
                textName.color = Color.white
                imageIcon:SetActive(false)
                if newTask then
                    imageFrame.gameObject:SetActive(true)
                    local seq = GameTween.Sequence()
                    seq:Append(GameTween.DOFade(imageFrame,0,0.2))
                    seq:Append(GameTween.DOFade(imageFrame,1,0.2))
                    seq:Append(GameTween.DOFade(imageFrame,0,0.2))
                    seq:Append(GameTween.DOFade(imageFrame,1,0.2))
                    seq:Append(GameTween.DOFade(imageFrame,0,0.2):OnComplete(function()
                        imageFrame.gameObject:SetActive(false) 
                    end))
                    self:tweenPush(seq)
                else
                    imageFrame.gameObject:SetActive(false)
                end
            end
        end)
        if task:isDone2() then
            local color = Color.New(0, 200, 200)
            self.trackTaskTween = GameTween.Sequence()
            self.trackTaskTween:Append(GameTween.DOColor(self.nodes.textTaskTitle,color,0.2))
            self.trackTaskTween:Append(GameTween.DOColor(self.nodes.textTaskTitle,Color.white,0.2))
            self.trackTaskTween:Append(GameTween.DOColor(self.nodes.textTaskTitle,color,0.2))
            self.trackTaskTween:Append(GameTween.DOColor(self.nodes.textTaskTitle,Color.white,0.2))
            self.trackTaskTween:Append(GameTween.DOColor(self.nodes.textTaskTitle,color,0.2))
            local tween = GameTween.DOColor(self.nodes.textTaskTitle,color,2):OnComplete(function()
                self:disposeTween(self.trackTaskTween)
                self.trackTaskTween = nil
                BattleManager.Instance.levelCtrl:clearTrackTask()
                self:refreshTaskList(curTask)
            end)
            self.trackTaskTween:Append(tween)
            self:tweenPush(self.trackTaskTween)
        else
            self.nodes.textTaskTitle.color = Color.white
        end
    else --木有任务了
        self.nodes.panelTaskList.gameObject:SetActive(false)
    end
end

function BattleWindow:onShowLevelEvent(data)
    self.nodes.panelTaskList.gameObject:SetActive(false) 
    self.nodes.panelTaskRecv.gameObject:SetActive(true)
    local animator  = self.nodes.PanelTaskRecvContent:GetComponent(typeof(Animator))
    animator:Play("FadIn", 0, 0)
    self.nodes.textRecvTaskTitle.text = data.title
    self.nodes.textTaskType.text  = ""
    self.nodes.textTaskName.text  = data.content
    self.nodes.textTaskPrama.text = ""
    local canvasGroup = self.nodes.panelTaskRecv:GetComponent(typeof(CanvasGroup))
    canvasGroup.alpha = 1
    GameTween.DOFade(canvasGroup, 0, 0.2):SetDelay(3):OnComplete(function()
        canvasGroup.alpha = 1
        self.nodes.panelTaskRecv.gameObject:SetActive(false)
        self.nodes.panelTaskList.gameObject:SetActive(true) 
    end)
end


--显示任务接取(自动隐藏)
function BattleWindow:onTaskAccepted(taskId)
    local task = LTaskMgr:getTask(taskId)
    if task then 
        --隐藏任务列表
        self.nodes.panelTaskList.gameObject:SetActive(false) 

        self.nodes.panelTaskRecv.gameObject:SetActive(true)
        local animator  = self.nodes.PanelTaskRecvContent:GetComponent(typeof(Animator))
        -- local stateInfo = self.animator:GetCurrentAnimatorStateInfo(0)
        animator:Play("FadIn", 0, 0)
        self.nodes.textRecvTaskTitle.text = "接取任务"
        self.nodes.textTaskType.text  = task:getTypeText()
        self.nodes.textTaskName.text  = task:getName()
        self.nodes.textTaskPrama.text = ""
  
        local canvasGroup = self.nodes.panelTaskRecv:GetComponent(typeof(CanvasGroup))
        canvasGroup.alpha = 1
        GameTween.DOFade(canvasGroup, 0, 0.2):SetDelay(3):OnComplete(function()
            canvasGroup.alpha = 1
            self.nodes.panelTaskRecv.gameObject:SetActive(false)
        end)
    end
end

function BattleWindow:openBattleUserUI(uiname, ...)
    -- LogError("showBattleFocusUI")
    self.userUIs = self.userUIs or {}

    if self.userUIs[uiname] then
        return
    end

    self.userUIs[uiname] = true

    local args = {...}

    local key = "UI/Component/Battle/"..uiname
    local prefab = self.cacheAssets[key]
    if prefab then
        local obj = GameObject.Instantiate(prefab)
        obj.transform:SetParent(self.nodes.userUI, false)
        local cpn = UIUtil.createComponent(obj, _G[uiname])
        cpn:init(args)
        cpn:open()

        self.userUIs[uiname] = cpn
    end
end

function BattleWindow:closeBattleUserUI(uiname)
    -- LogError("hideBattleFocusUI")
    local ui = self.userUIs[uiname]
    if ui and type(ui) == "table" then
        ui:close(function()
            GameObject.Destroy(ui.gameObject)
            self.userUIs[uiname] = nil
        end)
    end
end

function BattleWindow:refreshAttackButton()
    local mainHero = BattleLogic.Instance:getMainHero()

    local icon = self.nodes.btnAttack.transform:Find("Icon"):GetComponent(typeof(Image))
    local tp = mainHero.localAttackType or Fixed64.zero
    UIUtil.setSprite(icon, "Icon/Battle/AttackBtn_".. tp.number)
end

--------------------------------------------------------------------------

function BattleWindow:onDisplayStates(tp, toggle)
    if not toggle then
        tp = States.Default
    end

    local funcs = {}

    local _avatar = function(toggle)
        self.nodes.joystick.gameObject:SetActive(not toggle)
    end
    funcs[States.Avatar] = _avatar

    if funcs[States.Avatar] then
        funcs[States.Avatar](toggle)
    end
end

function BattleWindow:onRoleRemoved(ctrl)
    if self.headInfo then
        self.headInfo:onRoleRemoved(ctrl)
    end
end