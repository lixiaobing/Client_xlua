---@class ItemInfoWindow_NodeSpecial
---@field itemData Bag_ItemData
local ItemInfoWindow_NodeSpecial = DClass("ItemInfoWindow_NodeSpecial", BaseComponent)
_G.ItemInfoWindow_NodeSpecial = ItemInfoWindow_NodeSpecial

function ItemInfoWindow_NodeSpecial:ctor(data)
end

function ItemInfoWindow_NodeSpecial:onInit()
end

function ItemInfoWindow_NodeSpecial:onUpdate()
    self:onUpdateTime()
end

function ItemInfoWindow_NodeSpecial:onUpdateTime()
    self.gameObject:SetActive(self.itemData.outTime > 0)
    if self.curLeftTime <= 0 and self.itemData.outTime > 0 then
        BagMgr:removeOneItem(self.itemData.cId)
        return nil
    else
        local day, hour, min, sec, mil = TimeUtils.format(self.itemData.outTime, true)
        local timeData = TimeUtils.getLeftTime(self.itemData.outTime)
        self.curLeftTime = timeData.tScond
        day = timeData.day
        hour = timeData.hour
        min = timeData.minute
        sec = timeData.scond
        local timeShow = ""
        if tonumber(day) > 0 then
            timeShow =
                string.format(
                "%s%s%s%s%s%s%s%s%s",
                Lang(GL_TEXT_LEFT),
                day,
                Lang(GL_TIME_DAY),
                hour,
                Lang(GL_TIME_HOUR),
                min,
                Lang(GL_TIME_MINUTE),
                sec,
                Lang(GL_TIME_SECOND)
            )
        else
            if tonumber(hour) > 0 then
                timeShow =
                    string.format(
                    "%s%s%s%s%s%s%s",
                    Lang(GL_TEXT_LEFT),
                    hour,
                    Lang(GL_TIME_HOUR),
                    min,
                    Lang(GL_TIME_MINUTE),
                    sec,
                    Lang(GL_TIME_SECOND)
                )
            else
                if tonumber(min) > 0 then
                    timeShow =
                        string.format(
                        "%s%s%s%s%s",
                        Lang(GL_TEXT_LEFT),
                        min,
                        Lang(GL_TIME_MINUTE),
                        sec,
                        Lang(GL_TIME_SECOND)
                    )
                else
                    if tonumber(sec) > 0 then
                        timeShow = string.format("%s%s%s", Lang(GL_TEXT_LEFT), sec, Lang(GL_TIME_SECOND))
                    end
                end
            end
        end
        if self.txt_time then
            self.txt_time.text = timeShow
        end
    end
end

function ItemInfoWindow_NodeSpecial:init(data, cpnParent)
    self.itemData = data
    self.cpnParent = cpnParent

    self.txt_time = self.transform:Find("Text_Special"):GetComponent(typeof(Text))

    if data.outTime and data.outTime > 0 then
        self.curLeftTime = data.outTime
    else
        self.curLeftTime = 0
    end
    --self.txt_time.text = Utils.splitConfigNameById "剩余时间。。。"
end
