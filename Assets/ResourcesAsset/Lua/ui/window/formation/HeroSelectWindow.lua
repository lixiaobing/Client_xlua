---@class HeroSelectWindow
local HeroSelectWindow = DClass("HeroSelectWindow", BaseWindow)
_G.HeroSelectWindow = HeroSelectWindow

function HeroSelectWindow:ctor(data)
    self.positionIdx  = data[1]
    local posInfo = FormationMgr:getPosInfo(self.positionIdx)
    local curRoleId = posInfo.heroId
    if curRoleId > 0 then 
        self.selectHeroId = curRoleId
    else
        self.selectHeroId = HeroMgr:getAllHeros()[1].id  --TODO 默认选中一个
    end
    -- Log("self.positionIdx:"..self.positionIdx)
end

function HeroSelectWindow:onInit()
    self.items = {}
    self.nodes.uiGesture:AddHandler(UIGestureType.All, function(e) self:onGestureHandler(e) end)
    self:addEventHandler(self.nodes.btnUse.onClick, self.onClickBtnUse)
    self:addEventHandler(self.nodes.btnDetail.onClick, self.onClickBtnDetail)
    
--[[    self.selectHeroId = 40101--]]

    self:refreshSelectHero()
    self:reloadRolesList()
end

--
function HeroSelectWindow:onClickBtnDetail()
    Log("角色详情")
end

function HeroSelectWindow:onClickBtnUse()
    local posInfo = FormationMgr:getPosInfo(self.positionIdx)
    if posInfo.heroId == self.selectHeroId then
        FormationMgr:sendGoOut(self.positionIdx)
    else
        FormationMgr:sendGoInto(self.selectHeroId,self.positionIdx)
    end
    self:close()
end

function HeroSelectWindow:refreshSelectHero()
    local config = Config.Hero[self.selectHeroId]
    local height = Fixed64(config.model_info.height)
    self.nodes.model:LoadModel("Model/"..config.model_info.path, height.number)
end

function HeroSelectWindow:onGestureHandler(event)
    if event.type == UIGestureType.Move then
        self.nodes.model:RotateModel(-event.deltaPosition.x)
    end
end

function HeroSelectWindow:selectRole(id)
    if self.selectHeroId == id then 
        return
    end
    self.selectHeroId = id
    self:refreshRolesList()
    self:refreshSelectHero()
    self:refreshButton()
end
--[[-     "dressId" = 140120201
-     "exp"     = 0
-     "id"      = 40102
-     "level"   = 1
-     "nodeId"  = 0
-     "stage"   = 1
-     "star"    = 3--]]
function HeroSelectWindow:refreshRolesList()
    self.nodes.roleList:ReloadCurCards()
end

function HeroSelectWindow:reloadRolesList()
    local roles = HeroMgr:getAllHeros()  --拥有的角色
    self.nodes.roleList:ReloadConfig()
    self.nodes.roleList:InitPool(#roles, function(index, obj)
        local data = roles[index]
        local cfg  = Config.Hero[data.id]
        local root = obj.transform:Find("Root")
        local btn = root.transform:GetComponent(typeof(Button))
        self:addEventHandler(btn.onClick, function()
            self:selectRole(cfg.id)
        end)
        local image_icon_bg_select = root.transform:Find("Mask/Image_select"):GetComponent(typeof(Image))
        -- local image_icon_bg_noraml = root.transform:Find("Mask/Image_normal"):GetComponent(typeof(Image))

        local icon = root.transform:Find("Mask/Icon"):GetComponent(typeof(Image))
        UIUtil.setSprite(icon, "Icon/Head/"..cfg.icon)


        local _select      = root.transform:Find("Select")
        local image_allready = root.transform:Find("Image_allready")
        local textLevel    = root.transform:Find("TextLevel"):GetComponent(typeof(Text))
        local textName     = root.transform:Find("TextName"):GetComponent(typeof(Text))
        local textZDL      = root.transform:Find("TextZDL"):GetComponent(typeof(Text))
        local textZDLValue = root.transform:Find("TextZDLValue"):GetComponent(typeof(Text))
        local imageGrade   = root.transform:Find("ImageGrade"):GetComponent(typeof(Image))
        -- UIUtil.setSprite(icon, "Icon/Head/"..cfg.icon) --设置角色评级

        UIUtil.setSpriteStar(imageGrade,cfg.star)
        textLevel.text = "LV"..data.level  --TODO 角色等级
        textName.text  = cfg.name
        textZDLValue.text = tostring(888)
        if self.selectHeroId == cfg.id then
            image_icon_bg_select.gameObject:SetActive(true)
            _select.gameObject:SetActive(true)
            textZDL.color = Color.white
            textZDLValue.color = Color.white
        else
            image_icon_bg_select.gameObject:SetActive(false)
            _select.gameObject:SetActive(false)
            textZDL.color = Color.black
            textZDLValue.color = Color.black
        end
        --显示是否出战
        image_allready.gameObject:SetActive(FormationMgr:isOnFormation(cfg.id))
    end)

    self:refreshButton()
end


function HeroSelectWindow:refreshButton()
    --同一个ID显示 卸下 否则 还是上阵
    local posInfo = FormationMgr:getPosInfo(self.positionIdx)
    if posInfo.heroId == self.selectHeroId then
        self.nodes.btnUseText.text = "卸下"
    else
        self.nodes.btnUseText.text = "上阵"
    end
      
end
return HeroSelectWindow