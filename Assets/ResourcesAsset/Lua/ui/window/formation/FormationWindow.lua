---@class FormationWindow
local UIModelGroup = require("ui/window/formation/UIModelGroup")
local FormationWindow = DClass("FormationWindow", BaseWindow)
_G.FormationWindow = FormationWindow

function FormationWindow:ctor(data, onStartCallback)
    self.dungeonLevelID = data[1]
    self.onStartCallback = data[2] --不为空则不会自动进入关卡，而是关闭界面并执行回调

    -- self.dungeonLevelID = 201002
        Log("self.dungeonLevelID:".. self.dungeonLevelID)
    --初始化关卡数据
    FormationMgr:initLimitFormation(self.dungeonLevelID)
end

function FormationWindow:onInit()
    --阵容数据更新
    self.messager:addListener(Msg.FORMATION_UPDATE,self.onFormationUpdate)

    self.roleNodes = {}
    self.nodes.uiGesture:AddHandler(UIGestureType.All, function(e) self:onGestureHandler(e) end)
    self:addEventHandler(self.nodes.btnBattle.onClick, self.onClickBtnBattle)
    self:addEventHandler(self.nodes.btnTask.onClick, self.onClickBtnTask)
    self.uiModelGroup = UIModelGroup.new()
    self.uiModelGroup:bind(self.nodes.modelGroup)

    for index = 1 , 3 do
        local comps = {}
        local panel = self.nodes.roles:Find("Role"..index)
        -- comps.rect   = panel:GetComponent(typeof(RectTransform))
        comps.rect   = panel:Find("Panel_drag"):GetComponent(typeof(RectTransform))
        comps.idx     = index 
        comps.button  = panel:Find("Button_select"):GetComponent(typeof(Button))
        comps.image_lock     = panel:Find("Button_select/Image_lock"):GetComponent(typeof(Image))
        comps.image_captain  = panel:Find("Image_captain"):GetComponent(typeof(Image))
        comps.transform_pos  = panel:Find("Image_pos")
        comps.image_info     = panel:Find("Panel_pack/Image_info"):GetComponent(typeof(Image))
        comps.text_lv        = panel:Find("Panel_pack/Image_info/Text_lv"):GetComponent(typeof(Text))
        comps.text_name      = panel:Find("Panel_pack/Image_info/Text_name"):GetComponent(typeof(Text))
        comps.image_limit    = panel:Find("Panel_pack/Image_info/Image_limit"):GetComponent(typeof(Image))
        comps.text_limit     = panel:Find("Panel_pack/Image_info/Image_limit/Text_limit"):GetComponent(typeof(Image))
        comps.image_grade    = panel:Find("Panel_pack/Image_info/Image_grade"):GetComponent(typeof(Image))
        -- self:addEventHandler(comps.button.onClick, self.onClickBtnUse ,comps)
        -- self:addEventHandler(comps.panel.onClick, self.onClickBtnUse ,comps)
        --comps.panel:AddHandler(UIGestureType.All, function(e) self:onGestureHandler(e,comps) end)
        table.insert( self.roleNodes,comps)
    end

end

--阵容数据更新
function FormationWindow:onFormationUpdate()
    self:refreshRoles() 
end

--[[    None = 0,
    Slip = 1,//滑动
    Flexible = 2,//伸缩
    Down = 3,//按下
    Up = 4,//弹起
    Move = 5,//移动
    Click = 6,//点击
    Hold = 7,//按住
    ForceTouch = 8,//3D touch
    All = 10//所有手势--]]


function FormationWindow:getSlotIndex(screenPoint)
    for i,v in ipairs(self.roleNodes) do
        local ret ,_p =  RectTransformUtility.ScreenPointToLocalPointInRectangle(v.rect, screenPoint, UI.Camera,nil)
        -- LogWarning("ret:"..tostring(ret).."  i:"..i)
        if ret then 
            if v.rect.rect:Contains(_p) then
                local worldPoint  =  v.rect.transform.position
                local screenPoint =  RectTransformUtility.WorldToScreenPoint(UI.Camera,worldPoint)
                local ret , localPosition =  RectTransformUtility.ScreenPointToLocalPointInRectangle(self.nodes.rootRect ,screenPoint, UI.Camera,nil)
                return i , localPosition
            end
        end
    end
end

function FormationWindow:onGestureHandler(event)
    -- LogWarning(event.type)
    if event.type == UIGestureType.Down then  --检查点击的是哪个精灵
        self.drag     = false
        self.dragTime = Time.time
        local index, localPosition = self:getSlotIndex(event.position)
        local posInfo = FormationMgr:getPosInfo(index)

        if index and not posInfo.specifiedBySystem then 
            self.startIndex = index 
            -- self.nodes.imageDrag.gameObject:SetActive(true)  
            local ret ,_localPosition =  RectTransformUtility.ScreenPointToLocalPointInRectangle(self.nodes.rootRect, event.position, UI.Camera,nil)
            -- self.offsetPosition =   localPosition  -_localPosition 
            self.nodes.imageDrag.anchoredPosition = _localPosition
        end
    elseif event.type == UIGestureType.Move then
        self.drag = true
        -- LogWarning(event.type)
        if self.startIndex then
            self.nodes.imageDrag.gameObject:SetActive(true)  
            local ret ,localPosition = RectTransformUtility.ScreenPointToLocalPointInRectangle(self.nodes.rootRect, event.position, UI.Camera,nil)
            self.nodes.imageDrag.anchoredPosition = localPosition
            -- self.nodes.imageDrag.anchoredPosition = localPosition + self.offsetPosition
        end
    elseif event.type == UIGestureType.Up then
        self.nodes.imageDrag.gameObject:SetActive(false)
         if self.startIndex then
            --交換位置
            local index, _ = self:getSlotIndex(event.position)

            if index and self.startIndex ~= index then 
                local posInfo = FormationMgr:getPosInfo(index)
                if not posInfo.specifiedBySystem then 
           --[[         FormationMgr:swapPos(self.startIndex,index)--]]
                    FormationMgr:swapPos(self.startIndex,index)
                    --self:refreshRoles()
                end
            end
         end
         self.startIndex = nil
    elseif event.type == UIGestureType.Click then
        if not self.drag then 
            self.dragTime = self.dragTime or Time.time
            -- Log("PassTime:"..(Time.time -self.dragTime))
            if Time.time -self.dragTime < 0.3 then 
                local index, localPosition = self:getSlotIndex(event.position)
                if index then --检查位是否可用 
                    local posInfo = FormationMgr:getPosInfo(index)
                    if not posInfo.specifiedBySystem then 
                        UIManager.openWindow("HeroSelectWindow",nil ,index)
                    end
                end
            end
        end
    end
end


--刷新角色列表
function FormationWindow:refreshRoles()
    self.nodes.textSkillDes.text = "显示队长技能"
    self.temp_positions = {}
    local formation = FormationMgr:getFormation()
    local SlotScales = {1,1,1}
    for i, roleNode in ipairs(self.roleNodes) do
        local model = self.uiModelGroup:getModel(i)
--世界左边转屏幕坐标
        local worldPoint  =  roleNode.transform_pos.position
        local screenPoint =  RectTransformUtility.WorldToScreenPoint(UI.Camera,worldPoint)
        --print("-------------screenPoint"..i.." x:"..worldPoint.x.." y:"..worldPoint.y)
        local ret , roleWorldPoint = RectTransformUtility.ScreenPointToWorldPointInRectangle(UI.Rect,screenPoint,self.uiModelGroup.camera,nil)
        model:setPosition(clampVectorY(roleWorldPoint, 0))
        self.temp_positions[i] = roleWorldPoint
        model:setScale(SlotScales[i])
        local posInfo = FormationMgr:getPosInfo(i)
        if posInfo == nil then 
            LogWarning("i:::"..i)
        end

        -- local roleId = formation[i]
        if posInfo.heroId > 0 then 
            local roleId = posInfo.heroId
            if posInfo.specifiedBySystem then
                roleId = Config.HeroLimit[roleId].hero_id
            end
            local config = Config.Hero[roleId]
            model:load("Model/"..config.model_info.path)
            roleNode.image_info.gameObject:SetActive(true)
            roleNode.button.gameObject:SetActive(false)
            roleNode.text_lv.text   =   "LV1"     --等级数据    
            roleNode.text_name.text =   config.name   
            roleNode.image_limit.gameObject:SetActive(posInfo.specifiedBySystem)
            
            roleNode.image_lock.gameObject:SetActive(false)
            UIUtil.setSpriteStar(roleNode.image_grade,config.default_star)

        elseif posInfo.heroId == 0 then --空闲状态
            if posInfo.specifiedBySystem then --锁定状态
                model:clear()
                roleNode.image_info.gameObject:SetActive(false)
                roleNode.button.gameObject:SetActive(true)
                roleNode.button.enabled = false
                roleNode.image_lock.gameObject:SetActive(true)
            else
                model:clear()
                roleNode.image_info.gameObject:SetActive(false)
                roleNode.button.gameObject:SetActive(true)
                roleNode.button.enabled = true
                roleNode.image_lock.gameObject:SetActive(false)
            end
  
        end
    end
end

function FormationWindow:onOpen()
    self:refreshRoles()
end

--上阵
function FormationWindow:onClickBtnUse(comps)
    UIManager.openWindow("HeroSelectWindow",nil ,comps.idx)
end

function FormationWindow:onClickBtnTask()
    self:refreshRoles()    
end

function FormationWindow:onClickBtnBattle()

    local formation = FormationMgr:getFormation()

    local slots = {2,1,3}
    table.sort(formation,function(a,b)
            return slots[a.position] < slots[b.position]
        end)

    local roles = {}
    for i,v in ipairs(formation) do
       if v.heroId > 0 then
            --TODO 临时使用限定精灵 绑定的角色进入游戏
            local roleId = v.specifiedBySystem == true and Config.HeroLimit[v.heroId].hero_id or v.heroId
            table.uniqueAdd(roles,roleId)  
        end
    end
    --Log(roles)
    if #roles > 0 then 
        -- UIManager.closeAllWindow()
        -- UIManager.openWindow("LoadSceneWindow", function()
        --     self:close()
        --     BattleFactory.enter(roles, self.dungeonLevelID)
        -- end)


        if not self.onStartCallback then
            ChapterMgr:ReqFightPrepare(self.dungeonLevelID)
        else
            --这个回调提供给测试战斗，进入战场时不会走服务器
            self.onStartCallback(roles)
        end
    else
        local data = {}
        data.title = "提示"
        data.content = "出战队员不能为空"
        data.buttonNames = {"确定"}
        data.buttonTypes = {1}
        MsgCenter.sendMessage(Msg.NOTIFY, data)
    end
end

function FormationWindow:onLateUpdate()
    --解决动画位置错乱的问题
    if not self.bugfix then 
        if self.temp_positions then 
            if self.temp_positions[1].x - self.temp_positions[#self.temp_positions].x  < 0.1 then 
                self:refreshRoles()
                -- LogError("11111111111:" ..(self.temp_positions[1].x - self.temp_positions[#self.temp_positions].x ))
            else
                self.bugfix = true
            end
        end
    end
end

return FormationWindow