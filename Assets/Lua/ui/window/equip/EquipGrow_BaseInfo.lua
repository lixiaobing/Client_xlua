---@class EquipGrow_BaseInfo
---@field curEquipData EquipMgr_EquipData 当前质点信息
local EquipGrow_BaseInfo = DClass("EquipGrow_BaseInfo", BaseComponent)
_G.EquipGrow_BaseInfo = EquipGrow_BaseInfo

function EquipGrow_BaseInfo:ctor()
    self.messager = Messager.new(self)
end

function EquipGrow_BaseInfo:addListener()
    self.messager:addListener(Msg.EQUIP_GROW_EQUIPDATA, self.onUpdateData)
end

function EquipGrow_BaseInfo:onDispose()
    self.messager:dispose()
end

function EquipGrow_BaseInfo:onStart()
    self:addListener()
    self:onInit()
end

function EquipGrow_BaseInfo:onInit()
end

---@param data EquipMgr_EquipData
function EquipGrow_BaseInfo:onUpdateData(data)
    self.curEquipData = data
    self:onUpdateUI()
end

function EquipGrow_BaseInfo:onUpdateUI()
    local configEquip = Config.Equip[self.curEquipData.cId]
    self.nodes.txtName.text = configEquip.name
    for i = 1, 6 do
        local objStar = self.nodes.starsEquip.transform:Find(string.format("Star%d", i)).gameObject
        objStar:SetActive(i <= configEquip.star)
    end
    self.nodes.txtPlace.text = EquipManager.NAME_PLACE[configEquip.item_position]
    self.nodes.txtDetails.text = configEquip.bg_des
    
    self:setEquipHero()
    EquipManager:setQuility(self, self.nodes.imgStage, self.curEquipData.quality, EquipManager.STAGE_TYPE.ICON)
end

---设置装备英雄
function EquipGrow_BaseInfo:setEquipHero()
    local hasEquip = self.curEquipData.heroId ~= 0
    self.nodes.iconHero.transform.parent.gameObject:SetActive(hasEquip)
    if not hasEquip then
        return
    end
    EquipManager:setHeroIcon(self, self.nodes.iconHero, self.curEquipData.heroId)
end