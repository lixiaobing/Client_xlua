--[[
    战斗界面的任务标记点，单独提出来管理方便后期维护
    @Liukeming 2020-08-03
]]

local M = DClass('BattleTaskMarker')
_G.BattleTaskMarker = M

function M:ctor(nodeParent, nodePrefab)
    self.nodeParent = nodeParent
    self.nodePrefab = nodePrefab
    self.eff1Span = 0.4             --单词特效显示时常
    self.markers = {}               --标记点，键(任务ID)值
end

--每帧动态刷新任务状态，触发相关操作
function M:onUpdate()
    --新增标记
    local tasks = BattleLogic.Instance.logicLevelCtrl:getTasks()
    for i,task in ipairs(tasks) do
        if task:getStatus() == LTaskStatus.Accepted then
            if task.config.scenes_pos and not self.markers[task:getId()] then
                self:add(task)
            end
        end
    end

    --刷新标记
    for k,marker in pairs(self.markers) do
        local task = LTaskMgr:getTask(marker.taskID, marker.parentTaskID)
        if not task or task:getStatus() ~= LTaskStatus.Accepted then
            self:remove(marker)
        else
            self:refresh(marker)
        end
    end
end

--可标记任务出现
function M:add(task)
    local pos = task.config.scenes_pos
    local marker = {}
    marker.taskID = task:getId()
    marker.parentTaskID = task.parent and task.parent:getId() or nil
    marker.positionIndex = 1                    --当前所在位置索引
    marker.positions = {}                       --连续标记点的位置
    for i=1,#pos/3 do
        local position = Vector3(pos[i*3-2], pos[i*3-1], pos[i*3])
        table.insert(marker.positions, position)
    end
    marker.radiuses = task.config.scenes_radius     --标记点响应半径
    marker.go = GameObject.Instantiate(self.nodePrefab) 
    marker.go.name = "t_location_"..task:getId()
    marker.go:SetActive(true)
    marker.rt = marker.go:GetComponent(typeof(RectTransform))
    marker.rt:SetParent(self.nodeParent.transform, false)
    marker.small = {}
    marker.small.node = marker.rt:Find("small").gameObject
    marker.small.rtArrow = marker.rt:Find("small/nodeArrow"):GetComponent(typeof(RectTransform))
    marker.small.txtDistance = marker.rt:Find("small/txtDistance"):GetComponent(typeof(Text))
    marker.small.eff1 = marker.rt:Find("small/eff1"):GetComponent(typeof(EffectControll))
    marker.small.eff2 = marker.rt:Find("small/eff2"):GetComponent(typeof(EffectControll))
    marker.small.eff1:Stop()
    marker.small.eff2:Stop()
    marker.big = {}
    marker.big.node = marker.rt:Find("big").gameObject
    marker.big.rtArrow = marker.rt:Find("big/nodeArrow"):GetComponent(typeof(RectTransform))
    marker.big.txtDistance = marker.rt:Find("big/txtDistance"):GetComponent(typeof(Text))
    marker.big.eff1 = marker.rt:Find("big/eff1"):GetComponent(typeof(EffectControll))
    marker.big.eff2 = marker.rt:Find("big/eff2"):GetComponent(typeof(EffectControll))
    marker.big.eff1:Stop()
    marker.big.eff2:Stop()
    marker.coutndown = self.eff1Span                            --倒计时，用于控制特效
    marker.isEff1Playing = false
    self.markers[marker.taskID] = marker
    self:resetEffect(marker)
end

--可标记任务消失
function M:remove(marker)
    GameObject.Destroy(marker.go)
    self.markers[marker.taskID] = nil
end

--返回当前所属的节点（大小节点）
function M:getType(marker)
    local last = marker.positionIndex == #marker.positions
    local type = last and marker.big or marker.small
    return type, last
end

function M:resetEffect(marker)
    local type = self:getType(marker)
    type.eff1:Play()
    type.eff2:Play()
    marker.isEff1Playing = true
end

--刷新标记状态，移动到一定距离内立即切换
function M:refresh(marker)
    local mainHero   = BattleLogic.Instance:getMainHero()
    if mainHero then
        --当前位置和距离
        local radius = marker.radiuses[marker.positionIndex]
        local position = marker.positions[marker.positionIndex]
        local heroPosition = mainHero.controller.position:ToViewVector()
        local distance = Vector3.Distance(heroPosition, position)
        marker.coutndown = marker.coutndown - Time.deltaTime

        if distance < radius and marker.positionIndex < #marker.positions then
            marker.positionIndex = marker.positionIndex + 1     --半径内可继续下一个点，等待下一波刷新
            marker.coutndown = self.eff1Span                    --切换节点也要重新闪出单词特效
            self:resetEffect(marker)
        else
            --标记始终显示
            local type, last = self:getType(marker)
            marker.small.node:SetActive(distance >= radius and not last)
            marker.big.node:SetActive(distance >= radius and last)

            --刷新显示对象
            local camera = BattleView.Instance.cameraCtrl.camera
            local margin = {40, 160, 120, 120} --上下左右
            local point = self:getMarkerPoint(camera, position, margin) --替换掉worldToLocalPoint
            local angle  = Vector2.Angle(point, Vector2.right) * Mathf.Sign(point.y)
            marker.rt.anchoredPosition = point
            type.rtArrow.eulerAngles = Vector3(0, 0, angle)  
            type.txtDistance.text = math.ceil(distance).."m"
            
            --限定箭头范围
            local uiRect = UI.Rect.rect 
            local rect = Rect(-uiRect.width/4, -uiRect.height/6, uiRect.width/2, uiRect.height * 2 / 3)
            type.rtArrow.gameObject:SetActive(not rect:Contains(point))
            
            --特效状态
            if marker.isEff1Playing and marker.coutndown <= 0 then
                marker.isEff1Playing = false
                type.eff1:Stop()
                type.eff2:Play()
            end
        end
    end
end

--转换目标点在屏幕上的映射
function  M:getMarkerPoint(camera, position, margin)
    local screenPoint = camera:WorldToScreenPoint(position)
    local screenXY = screenPoint * Mathf.Sign(screenPoint.z)
    local ret, point = RectTransformUtility.ScreenPointToLocalPointInRectangle(UI.Rect, screenXY, UI.Camera, nil)
    local min = UI.Rect.offsetMin
    local max = UI.Rect.offsetMax

    --按比例截断X方向
    if point.x < min.x + margin[3] then
        point.y = (min.x + margin[3]) * point.y / point.x
        point.x = min.x + margin[3]
    elseif point.x > max.x - margin[4] then
        point.y = (max.x - margin[4]) * point.y / point.x
        point.x = max.x - margin[4]
    end

    --按比例截断Y方向
    if point.y < min.y  + margin[2] then
        point.x = (min.y + margin[2]) * point.x / point.y
        point.y = min.y + margin[2]
    elseif point.y > max.y - margin[1] then
        point.x = (max.y - margin[1]) * point.x / point.y
        point.y = max.y - margin[1]
    end

    return point
end