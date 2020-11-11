---@class EquipBreakPopup
local EquipBreakPopup = DClass("EquipBreakPopup", BaseWindow)
_G.EquipBreakPopup = EquipBreakPopup


function EquipBreakPopup:ctor(data)
    ---@type EquipMgr_EquipData
    self.curEquipData = data[1]
    ---@type EquipMgr_EquipData
    self.lastEquipData = data[2]
end

function EquipBreakPopup:onInit()
    self.coverCallBack = self.close
    self:onInitUI()
end

function EquipBreakPopup:onInitUI()
    local tableCompare = {}

    local dataCompare = {}
    
    self.nodes.txtNextLv.text = self.curEquipData.lv
    self.nodes.txtLastLv.text = self.lastEquipData.lv
    
    self.configEquip = Config.Equip[self.curEquipData.cId]
    local keyAttr = self.configEquip.star * 10 + self.configEquip.item_position
    self.configAttr = Config.EquipAttr[keyAttr]

    for index, value in ipairs(self.configAttr.show_attr) do
        local data0 =
            EquipManager:getEquipAttr(
            self.configAttr,
            self.configAttr.show_attr[index],
            self.curEquipData.quality,
            self.lastEquipData.lv)
        local data1 =
            EquipManager:getEquipAttr(self.configAttr, self.configAttr.show_attr[index], self.curEquipData.quality , self.curEquipData.lv)
        dataCompare = {}
        dataCompare.name = data0.name
        dataCompare.current = data1.num
        dataCompare.next = data0.num
        table.insert(tableCompare, dataCompare)
    end

    
    self.nodes.contentBreak:InitPool(
        #tableCompare,
        function(index, obj)
            local data = tableCompare[index]
            local txtName = obj.transform:Find("txtTitle"):GetComponent(typeof(Text))
            local txtFrom = obj.transform:Find("txtNextValue"):GetComponent(typeof(Text))
            local txtTo = obj.transform:Find("txtLastValue"):GetComponent(typeof(Text))
            txtName.text = data.name
            txtFrom.text = data.current
            txtTo.text = data.next
        end
    )
end
