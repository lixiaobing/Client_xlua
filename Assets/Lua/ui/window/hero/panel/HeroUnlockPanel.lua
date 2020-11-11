--[[
    角色解锁面板
    @Liukeming 2020-6-5
]]

local M = DClass('HeroUnlockPanel', HeroBasePanel)
_G.HeroUnlockPanel = M

function M:onInit()
    self.imgType = self:getImage('imgType')
    self.imgStar = self:getImage('imgStar')
    self.txtName = self:getText('txtName')
    self.txtCVName = self:getText('txtCVName')
    self.txtDesc = self:getText('txtDesc')
    self.btnUnlock = self:getObj('btnUnlock')
    self:addClick(self.btnUnlock, function() self:onClickUnlock() end)
    self.txtAttributes = {} --六维数值
    self.matProgresses = {} --六维雷达位置
    self.valProgresses = {} --上次雷达位置
    for i = 1,6 do
        local txtAttribute = self:getText('Attribute/attrText' .. i .. '/Text')
        table.insert(self.txtAttributes, txtAttribute)

        --设置可移动遮罩shader
        local shader = Shader.Find("UI/ImageMask")
        local imgProgress = self:getImage('Attribute/attrs/attr' .. i .. '/img')
        local matProgress = Material(shader)
        imgProgress.material = matProgress
        matProgress:SetTexture('_MaskTex', imgProgress.sprite.texture)
        matProgress:SetFloat('_FillX', 1)
        matProgress:SetFloat('_FillY', 1) --遮罩初始偏移为0
        matProgress:SetFloat('_MaxAlpha', 1) --使用图片自己做遮罩，因此设置最大值1即可
        table.insert(self.matProgresses, matProgress)

        table.insert(self.valProgresses, 0)
    end
    self.nodeCost = self:getObj('nodeCost')
    self.imgItemBg = self:getImage('nodeCost')
    self.imgItem = self:getImage('nodeCost/imgItem')
    self.txtCost = self:getText('nodeCost/txtCost')
    self:addClickByPath('nodeCost', function() self:onClickItem() end)
end

function M:onShow()
    self:refresh()
end

function M:refresh()
    local role = self.parent.hero
    local config = role.config
    self:setSprite(self.imgType, SpriteTypeIcon[role.config.hero_type])
    self:loadSprite(SpriteStarIcon[role.config.default_star], function(sp)
        self.imgStar.sprite = sp
        self.imgStar:SetNativeSize()
    end)
    self.txtName.text = config.name
    self.txtCVName.text = config.cv_name
    self.txtDesc.text = config.des
    --六维
    for i=1,6 do
        self.txtAttributes[i].text = config.hero_radar[i]
    end
    for i=1,6 do
        local matProgress = self.matProgresses[i]
        local y1 = self.valProgresses[i]
        local y2 = 0.2 + (config.hero_radar_per[i] / 100) * 0.8 --变换0.2作为最低属性，否则面板会侧漏，不好看 
        self.valProgresses[i] = y2
        self.parent.tween:addTo(y1, y2, 0.2, function(y)
            matProgress:SetFloat('_FillY', y)
        end)
    end
    --消耗道具图标
    local itemID = role.config.hero_chip
    local itemConfig = BagManager.getItemConfigDataById(itemID)
    self.nodeCost:SetActive(false)
    self:setSprite(self.imgItemBg, BagManager.pathItemQuality .. string.format("Quality_Samll%02d", itemConfig.quality))
    self:loadSprite(BagManager.pathItemIcon .. itemConfig.item_icon, function(sp)
        self.imgItem.sprite = sp
        self.nodeCost:SetActive(true)
    end)
    --消耗数量
    local count = UIUtil.getItemCount(itemID)
    local cost = role.config.hero_chip_num
    local unlockable = count >= cost
    self:setButtonGray(self.btnUnlock, not unlockable)
    self.txtCost.text = Utils.getCostTextWithColor(count, unlockable) .. '/' .. cost
end

function M:onClickUnlock()
    HeroMgr:unlock(self.parent.hero.id, function(hero)
        self.parent.panels.headPanel:refresh()
        self.parent:refreshMainPanel()
    end)
end

function M:onClickItem()
    MsgCenter.sendMessage(Msg.ITEM_SHOWINFO, self.parent.hero.config.hero_chip)
end

function M:onFadeIn(callback)
    self:doFadeX(0, self.rtNode, 650, 0, 0.3, callback)
end

function M:onFadeOut(callback)
    self:doFadeX(0, self.rtNode, 0, 650, 0.3, callback)
end