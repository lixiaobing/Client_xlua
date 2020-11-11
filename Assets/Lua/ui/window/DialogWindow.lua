---@class DialogWindow
local DialogWindow = DClass("DialogWindow", BaseWindow)
_G.DialogWindow = DialogWindow

local DialogType = 
{
    LeftSimple   = 1, --左侧简单对话
    UpAndDownBlackScreen = 2, --上下黑屏对话
    BottomRich   = 3, --底部丰富对话
    BottomSimple = 4, --底部简单对话
}
function DialogWindow:ctor(data)
    self.dialogId = data[1]
    self.closeCallFunc = data[2]
end

function DialogWindow:onInit()
---------- 初始化对话数据
    self.dialogList = {}
    for k,data in pairs(Config.Dialog) do
        if data.dialogid == self.dialogId then 
            table.insert(self.dialogList, data)
        end
    end
    table.sort( self.dialogList, function ( d1,d2)
        return d1.id < d2.id
    end)


    self.defaultType = self.dialogList[1].type
    if self.defaultType == DialogType.BottomRich or self.defaultType == DialogType.UpAndDownBlackScreen then 
        MsgCenter.sendMessage(Msg.BATTLE_ACTIVE_LOGIC,false,self.id)
        MsgCenter.sendMessage(Msg.BATTLE_ACTIVE_ALL_UI,false,self.id)
    end
    MsgCenter.sendMessage(Msg.DIALOG_SHOW,self.defaultType,self.dialogId)

    --播放第一句对话
    self:start()
    if self.defaultType  == DialogType.BottomRich then --隐藏战斗模型
        if BattleManager.Instance and BattleManager.Instance.mainHero then 
            BattleManager.Instance.mainHero.gameObject:SetActive(false)
        end
    end
end

function DialogWindow:start()

    if self.defaultType == DialogType.LeftSimple then 
        --小箭头动画
        local rectTransform = self.nodes.panel1_imageNext.transform:GetComponent(typeof(RectTransform))
        local tween = GameTween.DOAnchorPosY(rectTransform,rectTransform.anchoredPosition.y+10,0.3,false):SetLoops(-1,1)
        self:tweenPush(tween)
        self:next()
    elseif self.defaultType == DialogType.BottomSimple then --底部简单对话

         self:next()
    elseif self.defaultType == DialogType.UpAndDownBlackScreen then --上下黑屏对话 
        self.nodes.panel2.gameObject:SetActive(true)
        self.nodes.panel2_container.gameObject:SetActive(false)
        --点击事件
        self:addEventHandler(self.nodes.panel2_buttonForward.onClick, self.onClickSkip)
        self:addEventHandler(self.nodes.panel2_buttonNext.onClick, self.onClickNext)
        --小箭头动画
        local rectTransform = self.nodes.panel2_imageNext.transform:GetComponent(typeof(RectTransform))
        local tween3 = GameTween.DOAnchorPosY(rectTransform,rectTransform.anchoredPosition.y+10,0.3,false):SetLoops(-1,1)
        self:tweenPush(tween3)
        --上下黑屏动画
        local rectTransform = self.nodes.panel2_imageBlackUp:GetComponent(typeof(RectTransform))
        rectTransform.anchoredPosition = Vector2(rectTransform.anchoredPosition.x, 75)
        local tween1 = GameTween.DOAnchorPosY(rectTransform, -75, 1, true)
        self:tweenPush(tween1)
        rectTransform = self.nodes.panel2_imageBlackDown:GetComponent(typeof(RectTransform))
        rectTransform.anchoredPosition = Vector2(rectTransform.anchoredPosition.x, -75)
        local tween2 = GameTween.DOAnchorPosY(rectTransform, 75, 1, true):OnComplete(function()
            self.nodes.panel2_container.gameObject:SetActive(true)
            self:next()
           end)
        self:tweenPush(tween2)
    elseif self.defaultType == DialogType.BottomRich then 
        --点击事件
        self:addEventHandler(self.nodes.panel3_buttonForward.onClick, self.onClickSkip)
        self:addEventHandler(self.nodes.panel3_buttonNext.onClick, self.onClickNext)
        --小箭头动画
        local rectTransform = self.nodes.panel3_imageNext.transform:GetComponent(typeof(RectTransform))
        local tween = GameTween.DOAnchorPosY(rectTransform,rectTransform.anchoredPosition.y+10,0.3,false):SetLoops(-1,1)
        self:tweenPush(tween)
        self:next()

    else
        self:next()
    end
end

function DialogWindow:setBlock(block)
    self.nodes.imageBlock.enabled  = block
end
--跳过
function DialogWindow:onClickSkip()
    self:closeEx()
end
--下一条
function DialogWindow:onClickNext()
    if self.defaultType == 2 then
        if self.nodes.panel2_typeWriter.IsActive then 
            self.nodes.panel2_typeWriter:Skip()
            return 
        end
    elseif self.defaultType == 3 then
        if self.nodes.panel3_typeWriter.IsActive then 
            self.nodes.panel3_typeWriter:Skip()
            return 
        end
    end
    self:next()
end

--类型2对话播放完成
function DialogWindow:onFinish()
    self:next()
end


function DialogWindow:next()
    if #self.dialogList > 0 then 
        local data = table.remove(self.dialogList,1)
        self:showConent(data)    
    else
        self:closeEx()
    end
end


function DialogWindow:showConent(data)
    self.defaultType = data.type
    self.nodes.panel1.gameObject:SetActive(false)
    self.nodes.panel2.gameObject:SetActive(false)
    self.nodes.panel3.gameObject:SetActive(false)
    self.nodes.panel4.gameObject:SetActive(false)
    self.nodes.uiModel.gameObject:SetActive(false)
    if data.bg_path and #data.bg_path > 0 then 
        self.nodes.imageBackground.gameObject:SetActive(true)
        -- self.nodes.imageBackground.color   = Color(0,1,1,1)
        UIUtil.setTexture(self.nodes.imageBackground, data.bg_path)
        --UIManager.loadBackground(data.bg_path, function() end)
    else
        self.nodes.imageBackground.gameObject:SetActive(false)
        --UIManager.clearBackground()
    end

    if data.type == DialogType.LeftSimple then --自动对话
        self:setBlock(false)
        self.nodes.panel1.gameObject:SetActive(true)
        self.nodes.panel1_textName.text = data.name
        self.nodes.panel1_typeWriter.charsPerSecond = data.speed*0.001
        self.nodes.panel1_typeWriter:Play(data.desc)
        UIUtil.setSprite(self.nodes.panel1_imageHead, "Icon/PlotHead/"..data.icon)
        StopDelayTask(self.delayTask)
        self.delayTask =  StartDelayTask(handler(self.onFinish,self),2)
    elseif data.type == DialogType.BottomSimple then
        self:setBlock(false)
        self.nodes.panel4.gameObject:SetActive(true)
        self.nodes.panel4_textName.text = data.name..":"
        self.nodes.panel4_typeWriter.charsPerSecond = data.speed*0.001
        self.nodes.panel4_typeWriter:Play(data.desc)
        StopDelayTask(self.delayTask)
        self.delayTask =  StartDelayTask(handler(self.onFinish,self),2)

    elseif data.type == DialogType.UpAndDownBlackScreen then --阻断 带点击对话

        self:setBlock(true)
        self.nodes.panel2.gameObject:SetActive(true)
        self.nodes.panel2_textName.text = data.name
        self.nodes.panel2_typeWriter.charsPerSecond = data.speed*0.001
        self.nodes.panel2_typeWriter:Play(data.desc)
        UIUtil.setSprite(self.nodes.panel2_imageHead, "Icon/PlotHead/"..data.icon)


    elseif data.type == DialogType.BottomRich  then --模型
        self:setBlock(true)
        self.nodes.panel3.gameObject:SetActive(true)
   
        self.nodes.panel3_typeWriter.charsPerSecond = data.speed *0.001
        self.nodes.panel3_typeWriter:Play(data.desc)



        if data.name and #data.name > 0 then 
            self.nodes.panel3_imageNameBg.gameObject:SetActive(true)
            self.nodes.panel3_textName.text = data.name
        else
            self.nodes.panel3_imageNameBg.gameObject:SetActive(false)
        end
        if data.item_path and #data.item_path > 0 then 
            self.nodes.panel3_imageItem.gameObject:SetActive(true)
            UIUtil.setSprite(self.nodes.panel3_imageItem,"Icon/"..data.item_path,true)
        else
            self.nodes.panel3_imageItem.gameObject:SetActive(false)
        end

        if data.left_model or data.right_model then
            self.nodes.uiModel.gameObject:SetActive(true)
            if data.left_model then 
                self.nodes.modelL.gameObject:SetActive(true)
                local model = Config.Model[data.left_model]
                self:loadModel("Model/"..model.model_path, data.left_action,self.nodes.modelL)
            else
                self.nodes.modelL.gameObject:SetActive(false)
            end

            if data.right_model then 
                self.nodes.modelR.gameObject:SetActive(true)
                local model = Config.Model[data.right_model]
                self:loadModel("Model/"..model.model_path,data.right_action,self.nodes.modelR)
            else
                self.nodes.modelR.gameObject:SetActive(false)
            end
        else
            self.nodes.uiModel.gameObject:SetActive(false)
        end

    end
end

function DialogWindow:loadModel(path,action,parent)
    self.modelInfos = self.modelInfos or {}
    self.modelInfos[parent] = self.modelInfos[parent] or{}
    local modelInfo =   self.modelInfos[parent]
    if modelInfo.path ~= path then 
        modelInfo.path = path
        GameAsset.LoadUIModel(path,function (obj)
            if modelInfo.path == path then 
                if modelInfo._modelL then 
                    GameObject.Destroy(modelInfo._model)    
                end
                modelInfo._model       = GameObject.Instantiate(obj, parent)
                modelInfo._model.layer = LayerMask.NameToLayer("UIModel");
                modelInfo._model.transform.localPosition =  Vector3.zero
                modelInfo._model.transform.localScale    =  Vector3.one
                --禁用模型特写相机
                Utils.disableCameraInChildren(modelInfo._model)
                Prefab.setLayer(modelInfo._model,"UIModel")

                UIUtil.resetUIModel(modelInfo._model)

                modelInfo.animator = modelInfo._model.transform:GetComponent(typeof(Animator))
                modelInfo.animator:Play(action, 0, 0)
            end
        end)
    else
        if modelInfo.animator then 
            modelInfo.animator:Play(action, 0, 0)
            modelInfo.animator:Update(0)
        end
    end
end

function DialogWindow:closeEx()
    if self.defaultType == DialogType.UpAndDownBlackScreen then
        self.nodes.panel2_container.gameObject:SetActive(false)
        local rectTransform = self.nodes.panel2_imageBlackUp:GetComponent(typeof(RectTransform))
        local tween1 = GameTween.DOAnchorPosY(rectTransform, 75, 1, true)
        self:tweenPush(tween1)
        rectTransform = self.nodes.panel2_imageBlackDown:GetComponent(typeof(RectTransform))
        local tween2 = GameTween.DOAnchorPosY(rectTransform, -75, 1, true):OnComplete(function()
            self:close()
           end)
        self:tweenPush(tween2)
    else
        self:close()
    end
end

function DialogWindow:onClose()
    Statistics.onTalk(self.dialogId) --对话统计
    if self.defaultType  == DialogType.BottomRich then --还原战斗模型显示
        if BattleManager.Instance and BattleManager.Instance.mainHero then 
            BattleManager.Instance.mainHero.gameObject:SetActive(true)
        end
    end
    if self.defaultType == DialogType.BottomRich or self.defaultType == DialogType.UpAndDownBlackScreen then 
        MsgCenter.sendMessage(Msg.BATTLE_ACTIVE_LOGIC,true,self.id)
        MsgCenter.sendMessage(Msg.BATTLE_ACTIVE_ALL_UI,true,self.id)
    end
    --对话关闭
    MsgCenter.sendMessage(Msg.DIALOG_HIDE,self.defaultType,self.dialogId)
    if self.closeCallFunc then 
        self.closeCallFunc()
    end
end

function DialogWindow:onDispose()
    if self.delayTask then
        StopDelayTask(self.delayTask)
    end
end



