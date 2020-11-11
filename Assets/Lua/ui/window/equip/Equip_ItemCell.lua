---@class Equip_ItemCell 质点信息
local Equip_ItemCell = DClass("Equip_ItemCell", BaseComponent)
_G.Equip_ItemCell = Equip_ItemCell

function Equip_ItemCell:ctor()
    self.messager = Messager.new(self)
end

function Equip_ItemCell:addListener()
end

function Equip_ItemCell:onDispose()
    self.messager:dispose()
end

function Equip_ItemCell:onStart()
    self:onInit()
end

function Equip_ItemCell:onInit()
    if self.canvasGroup then
        Log("已经初始化。。。。。")
       return 
    end
    self.canvasGroup = self.transform:GetComponent(typeof(CanvasGroup))
    self.img_Quility = self.transform:Find("Image_Quilty"):GetComponent(typeof(Image))
    self.txt_Place = self.transform:Find("Image_Place/Text_Place"):GetComponent(typeof(Text))
    self.tableStars = {}
    for i = 1, 6 do
        local star = self.transform:Find(string.format("Stars/Image%d", i))
        self.tableStars[i] = star.gameObject
    end

    self.img_Icon = self.transform:Find("Image_Icon"):GetComponent(typeof(Image))
    self.txt_Lv = self.transform:Find("Image_Lv/Text_Lv"):GetComponent(typeof(Text))
    self.img_Lock = self.transform:Find("Image_Lock")
    self.img_StageIcon = self.transform:Find("Tage/Image1"):GetComponent(typeof(Image))
    self.img_A1 = self.transform:Find("Image_Awaken1"):GetComponent(typeof(Image))
    self.img_A2 = self.transform:Find("Image_Awaken2"):GetComponent(typeof(Image))
end

---设置技能UI
---@param data EquipMgr_EquipData
function Equip_ItemCell:setSkillUI(data)
    self.img_A1.gameObject:SetActive(false)
    self.img_A2.gameObject:SetActive(false)
    if not data.skills then
        return
    end
    for key, value in pairs(data.skills) do
        if value.slotId == 1 and value.skillId > 0 then
            self.img_A1.gameObject:SetActive(true)
        elseif value.slotId == 2 and value.skillId > 0 then
            self.img_A2.gameObject:SetActive(true)
        end
    end
end

---@param data EquipMgr_EquipData
function Equip_ItemCell:onUpdateUI(data)
    if data then
        local show = EquipManager:checkEquipOwn(data.cId) and 1 or 0.5
        self:setCanvasState(show)
        local config = Config.Equip[data.cId]
        self.img_Lock.gameObject:SetActive(data.locked)
        self.txt_Lv.text = string.format("Lv.%d", data.lv)
        self.txt_Place.text = EquipManager.NAME_PLACE[config.item_position]

        EquipManager:setEquipIcon(self, self.img_Icon, data.cId)
        EquipManager:setQuility(self, self.img_Quility, config.star, EquipManager.STAGE_TYPE.TITLE)
        EquipManager:setQuility(self, self.img_StageIcon, data.quality, EquipManager.STAGE_TYPE.ICON)

        self:setStars(config.star)
        self:setSkillUI(data)
    else
        self:setCanvasState(0)
    end
end

function Equip_ItemCell:setCanvasState(state)
    self.canvasGroup.alpha = state
end

---@param stars number 星级
function Equip_ItemCell:setStars(stars)
    for i = 1, 6 do
        self.tableStars[i]:SetActive(i <= stars)
    end
end

return Equip_ItemCell
