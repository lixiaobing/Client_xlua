---@class EquipGrow_Awaken
---@field curEquipData EquipMgr_EquipData 当前质点信息
---@field openedFold EquipGrow_Awaken_FoldData 当前打开的折叠框
local EquipGrow_Awaken = DClass("EquipGrow_Awaken", BaseComponent)
_G.EquipGrow_Awaken = EquipGrow_Awaken

---@class EquipGrow_Awaken_FoldData
---@field node table
---@field index number

function EquipGrow_Awaken:ctor()
    self.messager = Messager.new(self)
    self.listSkillSlotItem = {}
    self.openedFold = {}
end

function EquipGrow_Awaken:initPrefab(prefab)
    self.equipCell = prefab
end

function EquipGrow_Awaken:addListener()
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.onUpdateData)
end

function EquipGrow_Awaken:onDispose()
    self.messager:dispose()
end

function EquipGrow_Awaken:onStart()
    self:addListener()
    self:onInit()
end

function EquipGrow_Awaken:onInitUI()
    self:onUpdateUI()
end

function EquipGrow_Awaken:onInit()
    self:addEventHandler(self.nodes.btnClosePopups.onClick, self.onClosePopups)

    self.nodes.btnClosePopups.gameObject:SetActive(false)
end

---@param data EquipMgr_EquipData
function EquipGrow_Awaken:onUpdateData(data, updateUI)
    self.curEquipData = data
    if updateUI then
        self:onUpdateUI()
    end
end

function EquipGrow_Awaken:onUpdateUI()
    self:onClosePopups()
    self:showAwakenSkill()
end

---显示技能框个数
function EquipGrow_Awaken:showAwakenSkill()
    self.nodes.prefabBtnAwake.gameObject:SetActive(false)

    self:clearAllSlotObjs()
    self.listSlot = {}
    local countSkills = self.curEquipData.skills and #self.curEquipData.skills or 0
    for i = 1, countSkills do
        self:initSkillSlotUI(i)
    end
end

---清理所有技能槽UI
function EquipGrow_Awaken:clearAllSlotObjs()
    for key, value in pairs(self.listSkillSlotItem) do
        GameObject.Destroy(value)
    end
    self.listSkillSlotItem = {}
end

---初始化技能槽
function EquipGrow_Awaken:initSkillSlotUI(index)
    local objSlot = GameObject.Instantiate(self.nodes.prefabBtnAwake.gameObject)
    objSlot.gameObject:SetActive(true)
    objSlot.transform:SetParent(self.nodes.parentAwakens)
    objSlot.transform.localScale = Vector3(1, 1, 1)
    objSlot.transform:GetComponent(typeof(RectTransform)).anchoredPosition3D = Vector3(220, 240 - 135 * (index - 1), 0)
    objSlot.name = string.format("SkillSlot_%d", index)

    self:updateSkillSlotUI(index, objSlot)
    table.insert(self.listSkillSlotItem, objSlot)
end

---刷新技能槽位置
function EquipGrow_Awaken:updataSlotsPosition(ctrlIndex, isOpen)
    isOpen = false
    for index, value in ipairs(self.listSlot) do
        value.btnSelf:GetComponent(typeof(RectTransform)).anchoredPosition3D = Vector3(220, 240 - 135 * (index - 1), 0)
        value.nodeFold:SetActive(false)

        if index == ctrlIndex then
            value.nodeFold:SetActive(not value.isOpenedFold)
            isOpen = not value.isOpenedFold
            value.isOpenedFold = not value.isOpenedFold
        else
            value.isOpenedFold = false
        end

        if isOpen then
            self:resetSelectedData()
            if index > ctrlIndex then
                value.btnSelf:GetComponent(typeof(RectTransform)).anchoredPosition3D = Vector3(220, 240 - 135 * (index - 1) - 425, 0)
            elseif index == ctrlIndex then
                --value.nodeFold:SetActive(isOpen)
            else
            end
        end
    end
end

---重置选中信息
function EquipGrow_Awaken:resetSelectedData()
    self.selectedEquipId = ""
    self.selectedItemId = 0
    self.selectedHeroId = 0
end

---刷新技能槽UI
function EquipGrow_Awaken:updateSkillSlotUI(index, node)
    local skillData = self.curEquipData.skills[index]
    local slotId = skillData.slotId
    local skillCache = {}
    for key, value in pairs(self.curEquipData.skillsCache) do
        if value.slotId == slotId then
            skillCache = value
            break
        end
    end

    local slotData = {}
    slotData.index = index
    slotData.btnSelf = node:GetComponent(typeof(Button))
    local imgAdd = node.transform:Find("Image_Add")
    slotData.nodeAwakedSkill = node.transform:Find("Image_Awaked").gameObject
    slotData.nodeFold = node.transform:Find("Fold_Awaken").gameObject
    slotData.nodeFold:SetActive(false)
    slotData.isOpenedFold = false
    self:addEventHandler(
        slotData.btnSelf.onClick,
        function()
            if skillCache.skillId > 0 then
                MsgCenter.sendMessage(Msg.EQUIP_GROW_SHOWAWAKEN, true)
            else
                local isOpen = not slotData.isOpenedFold
                self:updataSlotsPosition(index, not slotData.isOpenedFold)
                --slotData.isOpenedFold = not slotData.isOpenedFold
                if isOpen then
                    self:setSlotFoldUI(slotData.nodeFold, index)
                end
            end
        end
    )

    imgAdd.gameObject:SetActive(skillData.skillId <= 0)
    slotData.nodeAwakedSkill.gameObject:SetActive(skillData.skillId > 0)
    if skillData.skillId > 0 then
        self:setSkillAwakedSlotUI(slotData.nodeAwakedSkill, skillData)
    end

    table.insert(self.listSlot, slotData)
end

---设置已有技能的技能槽UI
---@param data EquipMgr_AwakeSkill
function EquipGrow_Awaken:setSkillAwakedSlotUI(node, data)
    local imgIcon = node.transform:Find("Image_Icon"):GetComponent(typeof(Image))
    local txtName = node.transform:Find("Text_Name"):GetComponent(typeof(Text))
    local txtAttr = node.transform:Find("Text_Attr"):GetComponent(typeof(Text))
    local nodeBinding = node.transform:Find("Image_Binding").gameObject
    local imgHeroIcon = nodeBinding.transform:Find("Image_Icon"):GetComponent(typeof(Image))

    local cfgSkill = Config.EquipSkill[data.skillId]
    EquipManager:setSkillIcon(self, imgIcon, cfgSkill.id)
    txtName.text = cfgSkill.name
    txtAttr.text = cfgSkill.Des
    nodeBinding:SetActive(data.heroId > 0)
    if data.heroId > 0 then
        EquipManager:setHeroIcon(self, imgHeroIcon, data.heroId)
    end
end

---设置技能折叠槽UI
function EquipGrow_Awaken:setSlotFoldUI(node, index)
    ---@type  EquipMgr_AwakeSkill
    local data = self.curEquipData.skills[index]
    local btnSelectEquip = node.transform:Find("NodeAwaken/Button_SelectEquip"):GetComponent(typeof(Button))
    local btnSelectHero = node.transform:Find("NodeAwaken/Button_SelectHero"):GetComponent(typeof(Button))
    local btnAwake = node.transform:Find("NodeAwaken/Button_Awaken"):GetComponent(typeof(Button))

    self:addEventHandler(
        btnSelectEquip.onClick,
        function()
            self:onOpenPopupEquips(self.curEquipData.gId)
        end
    )
    self:addEventHandler(
        btnSelectHero.onClick,
        function()
            self:onOpenPopupHero(EquipMgr:getCurSelectHero().id)
        end
    )
    self:addEventHandler(
        btnAwake.onClick,
        function()
            ---@type HERO_REQ_EQUIP_AWAKE
            local sdata = {}
            sdata.equipId = self.curEquipData.gId
            sdata.heroId = self.selectedHeroId
            sdata.slotId = data.slotId
            sdata.itemId = self.selectedItemId
            sdata.consumeEquipId = self.selectedEquipId

            if sdata.consumeEquipId == "" and sdata.itemId == 0 then
                return
            end
            EquipMgr:sendEquipAwake(sdata)
        end
    )

    self.openedFold.node = node
    self.openedFold.index = index
    self.curEquipData.heroId = EquipMgr:getCurSelectHero().id

    self:setSeletedEquipUI(node, nil)
    self:setSelectedHeroUI(node, 0)
 --data.heroId)
end

---设置选中的英雄头像
function EquipGrow_Awaken:setSelectedHeroUI(node, heroId)
    local nodeHero = node.transform:Find("NodeAwaken/Button_SelectHero").gameObject
    local nodeSelectEquip = node.transform:Find("NodeAwaken/Button_SelectEquip").gameObject

    local nodeAdd = nodeHero.transform:Find("Image_Add").gameObject
    local imgIcon = nodeHero.transform:Find("Image_Icon"):GetComponent(typeof(Image))

    if EquipManager:checkCanBindingHeroByEquipGid(self.selectedEquipId, self.selectedItemId) or heroId > 0 then
        nodeHero:SetActive(true)
        nodeSelectEquip:GetComponent(typeof(RectTransform)).anchoredPosition3D = Vector3(-120, -280, 0)
    else
        nodeHero:SetActive(false)
        nodeSelectEquip:GetComponent(typeof(RectTransform)).anchoredPosition3D = Vector3(0, -280, 0)
        return
    end

    nodeAdd:SetActive(heroId <= 0)
    imgIcon.gameObject:SetActive(heroId > 0)
    if heroId > 0 then
        EquipManager:setHeroIcon(self, imgIcon, heroId)
    end
end

---设置选中的消耗Ui
---@param data EquipGrow_Awaken_CostData
function EquipGrow_Awaken:setSeletedEquipUI(node, data)
    local nodeSelect = node.transform:Find("NodeAwaken/Button_SelectEquip").gameObject
    local nodeAdd = nodeSelect.transform:Find("Image_Add").gameObject
    local nodeEquip = nodeSelect.transform:Find("Image_Equip").gameObject
    nodeAdd:SetActive(data == nil)
    nodeEquip:SetActive(data ~= nil)

    local imgCostIcon = node.transform:Find("NodeAwaken/Image_Cost/Image_Icon"):GetComponent(typeof(Image))
    local txtCost = node.transform:Find("NodeAwaken/Image_Cost/Text"):GetComponent(typeof(Text))

    txtCost.text = 0
    if data == nil then
        return
    end
    local imgIcon = nodeEquip.transform:Find("Image_EquipIcon"):GetComponent(typeof(Image))
    local imgStage = nodeEquip.transform:Find("Image_Stage"):GetComponent(typeof(Image))

    local txtPlace = nodeEquip.transform:Find("Image_Place/Text_Place"):GetComponent(typeof(Text))
    local txtLv = nodeEquip.transform:Find("Image_Lv/Text"):GetComponent(typeof(Text))

    for i = 1, 6 do
        local starObj = nodeEquip.transform:Find("Stars/Image" .. i).gameObject
        starObj:SetActive(i <= data.star)
    end

    if data.isEquip then
        local cfg = Config.Equip[data.cId]
        EquipManager:setEquipIcon(self, imgIcon, data.cId)
        EquipManager:setQuility(self, imgStage, cfg.star, EquipManager.STAGE_TYPE.TITLE)
        txtPlace.text = EquipManager.NAME_PLACE[cfg.item_position]
        txtLv.text = string.format("Lv.%d", data.cLv)
        txtCost.text = cfg.gold
    else
        ---@type BagMgr_BagItemInfo
        local itemData = BagMgr:getItemDataByGid(data.gId)
        local cfg = BagManager.getItemConfigDataById(itemData.cId)
        BagManager.setItemIcon(self, imgIcon, itemData.cId)
        EquipManager:setQuility(self, imgStage, cfg.star, EquipManager.STAGE_TYPE.BG_CUBE)
        txtPlace.text = ""
        txtLv.text = ""
        txtCost.text = 0
    end
end

--关闭弹框
function EquipGrow_Awaken:onClosePopups()
    self.nodes.btnClosePopups.gameObject:SetActive(false)
    self.nodes.popupEquips:SetActive(false)
    self.nodes.popupHero.gameObject:SetActive(false)
end

---打开消耗道具选择框
function EquipGrow_Awaken:onOpenPopupEquips(gId)
    self.nodes.btnClosePopups.gameObject:SetActive(true)
    self.nodes.popupEquips:SetActive(true)
    local listCostItems = EquipManager:getCostAwakeShows(gId)

    self.nodes.contentEquip:InitPool(
        #listCostItems,
        function(index, obj)
            local gIdShow = listCostItems[index]
            local isEquip = false
            ---@type EquipMgr_EquipData
            local equipData = EquipMgr:getEquipDataByGid(gIdShow)
            if equipData == nil then
                isEquip = false
            else
                isEquip = true
            end
            local selectNode = obj.transform:Find("Image_Select").gameObject
            selectNode:SetActive(false)
            local imgIcon = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local imgStage = obj.transform:Find("Image_Quilty"):GetComponent(typeof(Image))

            local txtPlace = obj.transform:Find("Image_Place/Text_Place"):GetComponent(typeof(Text))
            local txtLv = obj.transform:Find("Image_Lv/Text_Lv"):GetComponent(typeof(Text))
            local imgStageIcon = obj.transform:Find("Tage/Image1"):GetComponent(typeof(Image))
            local imgLock = obj.transform:Find("Image_Lock").gameObject
            local awake1 = obj.transform:Find("Image_Awaken1").gameObject
            local awake2 = obj.transform:Find("Image_Awaken2").gameObject
            imgStageIcon.gameObject:SetActive(isEquip)
            awake1:SetActive(isEquip)
            awake2:SetActive(isEquip)
            imgLock:SetActive(isEquip)

            local btnSelf = obj:GetComponent(typeof(Button))

            ---@type EquipGrow_Awaken_CostData
            local data = {}

            data.gId = gIdShow
            data.isEquip = isEquip
            imgStageIcon.gameObject:SetActive(isEquip)
            if isEquip then
                local cfg = Config.Equip[equipData.cId]

                data.cId = equipData.cId
                data.cLv = equipData.lv
                data.star = cfg.star
                data.quality = equipData.quality

                local cpt_Equip = self:createComponent(obj.gameObject, Equip_ItemCell)
                cpt_Equip:onUpdateUI(equipData)
            else
                ---@type BagMgr_BagItemInfo
                local itemData = BagMgr:getItemDataByGid(gIdShow)
                local cfg = BagManager.getItemConfigDataById(itemData.cId)
                BagManager.setItemIcon(self, imgIcon, itemData.cId)
                EquipManager:setQuility(self, imgStage, cfg.star, EquipManager.STAGE_TYPE.BG_CUBE)
                txtPlace.text = ""
                txtLv.text = ""

                data.cLv = 0
                data.cId = itemData.cId
                data.star = cfg.star
                data.quality = cfg.quality

                for i = 1, 6 do
                    local starObj = obj.transform:Find("Stars/Image" .. i).gameObject
                    starObj:SetActive(i <= data.star)
                end
            end

            self:addEventHandler(
                btnSelf.onClick,
                function()
                    self:onSelectEquip(data)
                end
            )
        end
    )
end

---打开英雄选择框
function EquipGrow_Awaken:onOpenPopupHero(oldHeroId)
    self.nodes.btnClosePopups.gameObject:SetActive(true)
    self.nodes.popupHero.gameObject:SetActive(true)
    local listHero = HeroMgr:getAllHeros(false)

    self.nodes.contentHero:InitPool(
        #listHero,
        function(index, obj)
            local dHero = listHero[index]
            local imgIcon = obj.transform:Find("Image_Icon"):GetComponent(typeof(Image))
            local nodeCurrent = obj.transform:Find("Image_Current").gameObject
            local imgIconBg = obj.transform:Find("Image_IconBg"):GetComponent(typeof(Image))
            local btnHero = obj:GetComponent(typeof(Button))
            nodeCurrent:SetActive(dHero.id == oldHeroId)
            if imgIcon then
                EquipManager:setHeroIcon(self, imgIcon, dHero.id)
                EquipManager:setHeroTypeIcon(self, imgIconBg, dHero.id)
            end

            self:addEventHandler(
                btnHero.onClick,
                function()
                    self:onSelectHero(dHero.id)
                    self:onClosePopups()
                end
            )
        end
    )
end

---选中绑定英雄
function EquipGrow_Awaken:onSelectHero(id)
    self.selectedHeroId = id
    self:setSelectedHeroUI(self.openedFold.node, id)
end

---选中消耗的道具
---@class EquipGrow_Awaken_CostData
---@field gId string
---@field cId number
---@field isEquip boolean
---@field cLv number
---@field star number
---@field quality number

---选中的消耗道具
---@param data EquipGrow_Awaken_CostData
function EquipGrow_Awaken:onSelectEquip(data)
    if data.isEquip then
        self.selectedEquipId = data.gId
    else
        self.selectedItemId = data.cId
    end

    local funcSelect = function()
        self:setSeletedEquipUI(self.openedFold.node, data)
        if EquipManager:checkCanBindingHeroByEquipGid(self.selectedEquipId, self.selectedItemId) then
            self:setSelectedHeroUI(self.openedFold.node, self.curEquipData.heroId)
            self.selectedHeroId = self.curEquipData.heroId
        else
            self:setSelectedHeroUI(self.openedFold.node, 0)
        end
        self:onClosePopups()
    end

    local equipData = EquipMgr:getEquipDataByGid(self.selectedEquipId)
    local isLockStar, des = EquipManager:checkEquipLockOrStar(equipData)
    if equipData and isLockStar == 1 then
        local tData = {}
        tData.title = ""
        tData.content = string.format(Lang(GL_EquipGrow_Intensify_QueRenXiao), des) --"确认消耗%s的装备吗？"
        tData.buttonNames = {Lang(GL_BUTTON_SURE), Lang(GL_BUTTON_CANNEL)}
        tData.buttonTypes = {1, 2}
        tData.callback = function(sort)
            if sort == 1 then
                funcSelect()
            end
        end

        MsgCenter.sendMessage(Msg.NOTIFY, tData)
    else
        funcSelect()
    end
end
