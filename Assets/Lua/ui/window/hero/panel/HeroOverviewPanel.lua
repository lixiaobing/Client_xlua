--[[
    角色预览信息面板
    @Liukeming 2020-6-12
]]
local M = DClass("HeroOverviewPanel", HeroBasePanel)
_G.HeroOverviewPanel = M

function M:onInit()
    --战斗力
    self.rtFightPower = self:getRectTransform("nodeFightPower")
    self.txtFightPower = self:getText("nodeFightPower/txtFightPower")
    --角色信息
    self.rtInfo = self:getRectTransform("nodeInfo")
    self.rtWeapon = self:getRectTransform("nodeWeapon")
    self.rtSuit = self:getRectTransform("nodeSuit")
    self.imgType = self:getImage("nodeInfo/imgType")
    self.imgStar = self:getImage("nodeInfo/imgStar")
    self.imgStage = self:getImage("nodeInfo/imgStage")
    self.imgElement = self:getImage("nodeInfo/imgElement")
    self.txtName = self:getText("nodeInfo/txtName")
    self.txtCVName = self:getText("nodeInfo/txtCVName")
    self.txtLevel = self:getText("nodeInfo/txtLevel")
    self.txtMaxLevel = self:getText("nodeInfo/txtMaxLevel")
    self.btnDetail = self:getObj("nodeInfo/btnDetail")
    self.nodeDetailRed = self:getObj("nodeInfo/btnDetail/imgRed")
    self.btnSuit = self:getObj("nodeInfo/btnDetail/imgRed")
    self.btnAttribute = self:getObj("nodeInfo/btnAttribute")
    self.btnDocument = self:getObj("nodeInfo/btnDocument")
    self:addClick(self.btnDetail, self.onClickDetail)
    self:addClick(self.btnAttribute, self.onClickAttribute)
    self:addClick(self.btnDocument, self.onClickDocument)
    for i = 1, 5 do
        local btn = self:getButton("nodeSuit/btnSuit" .. i)

        self:addClick(
            btn,
            function()
                UIManager.openWindow("EquipWindow", nil, self.parent.hero)
            end
        )
    end
end

function M:refresh()
    local hero = self.parent.hero
    local config = hero.config
    local groupConfig = Config.HeroGroup[hero.id * 10 + hero.stage]
    self.txtFightPower.text = "[战斗力功能暂未实现]"
    self:setSprite(self.imgType, SpriteTypeIcon[hero.config.hero_type])
    self:setSprite(self.imgStage, "Icon/Hero/stage_" .. groupConfig.icon)
    self:loadSprite(
        SpriteStarIcon[hero:getStar()],
        function(sp)
            self.imgStar.sprite = sp
            self.imgStar:SetNativeSize()
        end
    )
    self.txtName.text = config.name
    self.txtCVName.text = config.cv_name
    self.txtLevel.text = "LV." .. hero.level
    self.txtMaxLevel.text = "/" .. groupConfig.level
    self.nodeDetailRed:SetActive(self.parent.hero:isRed())
    self:updateSuit()
end

function M:updateSuit()
    local list = EquipMgr:getEquipedByHeroId(self.parent.hero.id)
    local funcSetSuitUI = function(obj, data)
        local imgItem = obj.transform:Find("imgItem"):GetComponent(typeof(Image))
        local imgLevelBg = obj.transform:Find("imgLevelBg"):GetComponent(typeof(Image))
        local txtLv = obj.transform:Find("txtLevel"):GetComponent(typeof(Text))
        local stars = obj.transform:Find("nodeStars")
        local imgStage = obj.transform:Find("Image_Stage"):GetComponent(typeof(Image))
        local imgBorder = obj.transform:Find("imgBorder"):GetComponent(typeof(Image))

        local hasData = data ~= nil
        imgItem.gameObject:SetActive(hasData)
        imgLevelBg.gameObject:SetActive(hasData)
        txtLv.gameObject:SetActive(hasData)
        stars.gameObject:SetActive(hasData)
        imgStage.gameObject:SetActive(hasData)
        imgBorder.gameObject:SetActive(hasData)
        if not hasData then
            return
        end

        EquipManager:setQuility(self, imgBorder, data.quality, EquipManager.STAGE_TYPE.BG_BORDER)
        EquipManager:setQuility(self, imgStage, data.quality, EquipManager.STAGE_TYPE.ICON)
        local countSkill = EquipManager:getAwakeSkillCount(data.skills)
        for i = 1, 2 do
            local nodeSkill = imgStage.transform:Find("Image_Skill" .. i).gameObject
            nodeSkill:SetActive(countSkill >= i)
        end

        EquipManager:setEquipIcon(self, imgItem, data.cId)
        txtLv.text = string.format("Lv.%d", data.lv)
        local cfg = Config.Equip[data.cId]
        for i = 1, 6 do
            local objStar = stars.transform:Find("star" .. i).gameObject
            objStar:SetActive(cfg.star >= i)
        end
    end
    for i = 1, 5 do
        local btn = self.rtSuit.transform:Find("btnSuit" .. i)
        funcSetSuitUI(btn.gameObject, list[i])
    end
end

function M:onClickDetail()
    self.parent:openDetail()
end

function M:onClickAttribute()
end

function M:onClickDocument()
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtFightPower, -600, 120, 0.2)
    self:doFadeX(0, self.rtInfo, 700, 0, 0.2)
    self:doFadeX(0.1, self.rtWeapon, 700, 0, 0.2)
    self:doFadeX(0.2, self.rtSuit, 700, 0, 0.2)
    self:doFadeCallback(0.4, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtSuit, 0, 700, 0.2)
    self:doFadeX(0.1, self.rtWeapon, 0, 700, 0.2)
    self:doFadeX(0.2, self.rtFightPower, 120, -600, 0.2)
    self:doFadeX(0.2, self.rtInfo, 0, 700, 0.2)
    self:doFadeCallback(0.4, callback)
end
