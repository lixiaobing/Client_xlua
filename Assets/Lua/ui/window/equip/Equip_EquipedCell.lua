---@class Equip_EquipedCell 装备的质点信息
local Equip_EquipedCell = DClass("Equip_EquipedCell", BaseComponent)
_G.Equip_EquipedCell = Equip_EquipedCell

function Equip_EquipedCell:ctor()
    self.messager = Messager.new(self)
end

function Equip_EquipedCell:addListener()
end

function Equip_EquipedCell:onDispose()
    self.messager:dispose()
end

function Equip_EquipedCell:onStart()
    self:onInit()
end

function Equip_EquipedCell:onInit()
    self.canvasGroup = self.transform:GetComponent(typeof(CanvasGroup))
    self.img_Quility = self.transform:Find("Image_Quilty"):GetComponent(typeof(Image))
    self.img_PlaceBg = self.transform:Find("Image_Place"):GetComponent(typeof(Image))
    self.txt_Place = self.transform:Find("Image_Place/Text_Place"):GetComponent(typeof(Text))
    self.starsParent = self.transform:Find("Stars")
    self.img_Icon = self.transform:Find("Image_Icon"):GetComponent(typeof(Image))
    self.txt_Lv = self.transform:Find("Image_Lv/Text_Lv"):GetComponent(typeof(Text))
    self.img_Lock = self.transform:Find("Image_Lock")
    self.img_StageIcon = self.transform:Find("Tage/Image1"):GetComponent(typeof(Image))
    self.img_StageA1 = self.transform:Find("Tage/Image_A1"):GetComponent(typeof(Image))
    self.img_StageA2 = self.transform:Find("Tage/Image_A2"):GetComponent(typeof(Image))
end

---@param data EquipMgr_EquipData
function Equip_EquipedCell:onUpdateUI(data)
    if data then
        local show = EquipManager:checkEquipOwn(data.cId) and 1 or 0.5
        self:setCanvasState(show)
        local config = Config.Equip[data.cId]
        self.img_Lock.gameObject:SetActive(data.locked)
        self.txt_Lv.text = string.format("%d", data.lv)
        self.txt_Place.text = EquipManager.NAME_PLACE[config.item_position]

        self:setStars(config.star)

        EquipManager:setQuility(self, self.img_PlaceBg, config.star, EquipManager.STAGE_TYPE.BG_CUBE)
        EquipManager:setQuility(self, self.img_Quility, config.star, EquipManager.STAGE_TYPE.BG_EQUIPED)
        EquipManager:setQuility(self, self.img_StageIcon, data.quality, EquipManager.STAGE_TYPE.ICON)
        EquipManager:setEquipIcon(self, self.img_Icon, data.cId)

        self:setSkillUI(data)
    else
        self:setCanvasState(0)
    end
end

---设置技能UI
---@param data EquipMgr_EquipData
function Equip_EquipedCell:setSkillUI(data)
    self.img_StageA1.gameObject:SetActive(false)
    self.img_StageA2.gameObject:SetActive(false)
    if not data.skills then
        return
    end
    for key, value in pairs(data.skills) do
        if value.slotId == 1 and value.skillId > 0 then
            self.img_StageA1.gameObject:SetActive(true)
        elseif value.slotId == 2 and value.skillId > 0 then
            self.img_StageA2.gameObject:SetActive(true)
        end
    end
end

function Equip_EquipedCell:setCanvasState(state)
    self.canvasGroup.alpha = state
end

---@param stars number 星级
function Equip_EquipedCell:setStars(stars)
    self:resetStars()
    local startPos = 0
    if stars % 2 == 0 then
        startPos = -10 - (math.floor(stars / 2) - 1) * 20
    else
        startPos = 0 - math.floor(stars / 2) * 20
    end
    for i = 1, stars do
        local starObj = self:getStarObj()
        starObj.transform:SetParent(self.starsParent.transform)
        starObj.transform.localPosition = Vector2(startPos + 20 * (i - 1), -2)
        starObj.transform.localScale = Vector2(1, 1)
    end
end

function Equip_EquipedCell:getStarObj()
    if #self.existStars then
        local showObj = {}
        for index, value in ipairs(self.existStars) do
            if not value.gameObject.activeSelf then
                showObj = value.gameObject
                break
            end
        end
        showObj.gameObject:SetActive(true)
        return showObj
    end
end

function Equip_EquipedCell:resetStars()
    if not self.existStars then
        self.existStars = {}
    end
    for i = 1, 6 do
        local childObj = self.starsParent.transform:Find("star" .. i)
        childObj.gameObject:SetActive(false)
        table.insert(self.existStars, childObj)
    end
end

return Equip_EquipedCell
