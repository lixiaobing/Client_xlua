---@class ItemInfoShowWindow
---@field idShow number 道具cId
local ItemInfoShowWindow = DClass("ItemInfoShowWindow", BaseWindow)
_G.ItemInfoShowWindow = ItemInfoShowWindow

function ItemInfoShowWindow:ctor(data)
    Log(string.format("查看道具基础信息 id: %d", data[1]))
    self.idShow = data[1]
    self.itemConfig = BagManager.getItemConfigDataById(self.idShow)
end

---刷新道具信息界面
---@param cId number 道具cId
function ItemInfoShowWindow:onUpdateUI()
    if not self.itemConfig then
        Log(string.format("道具ID：%d 没有找到对应配置文件", self.idShow))
        return nil
    end
    self:onUpdateNodeItem()
    self:onUpdateDetail()
    self:onUpdateGet()
end

function ItemInfoShowWindow:onInit()
    self.coverCallBack = self.close

    self:initNodeItem()
    self:initNodeDetail()
    self:initNodeGet()

    self:onShowNodeDetail(true)
    self:onUpdateUI()
end

function ItemInfoShowWindow:initNodeItem()
    self.img_BgLine = self.nodes.NodeItem.transform:Find("Item/Image_BgLine"):GetComponent(typeof(Image))
    self.img_BgLine.gameObject:SetActive(false)
    self.img_Bg = self.nodes.NodeItem.transform:Find("Item/Image_Bg"):GetComponent(typeof(Image))
    self.img_Icon = self.nodes.NodeItem.transform:Find("Item/Image_Icon"):GetComponent(typeof(Image))
    self.prefab_Star = self.nodes.NodeItem.transform:Find("Image_StarBG")
    self.parent_Star = self.nodes.NodeItem.transform:Find("Stars")
    self.txt_Name = self.nodes.NodeItem.transform:Find("Item/Text_Name"):GetComponent(typeof(Text))

    self.listAllStars = {}
end

function ItemInfoShowWindow:initNodeDetail()
    self.txt_DesTitle = self.nodes.NodeDetail.transform:Find("Text_D"):GetComponent(typeof(Text))
    self.txt_Des = self.nodes.NodeDetail.transform:Find("Text_Des"):GetComponent(typeof(Text))
    self.btn_Get = self.nodes.NodeDetail.transform:Find("Button_Get"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btn_Get.onClick,
        function()
            self:onClickGet()
        end
    )
end
function ItemInfoShowWindow:initNodeGet()
    self.txt_GetDesTitle = self.nodes.NodeGet.transform:Find("Text_D"):GetComponent(typeof(Text))
    self.txt_GetDes = self.nodes.NodeGet.transform:Find("Text_NoGetDes"):GetComponent(typeof(Text))
    self.btn_GetDetail = self.nodes.NodeGet.transform:Find("Button_Detail"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btn_GetDetail.onClick,
        function()
            self:onClickDetail()
        end
    )
    self.content = self.nodes.NodeGet.transform:Find("View/Viewport/ContentV"):GetComponent(typeof(ScrollPoolVertical))
end

function ItemInfoShowWindow:onClickGet()
    self:onShowNodeDetail(false)
end

function ItemInfoShowWindow:onClickDetail()
    self:onShowNodeDetail(true)
end

function ItemInfoShowWindow:onShowNodeDetail(show)
    self.nodes.NodeDetail.gameObject:SetActive(show)
    self.nodes.NodeGet.gameObject:SetActive(not show)
end

---刷新头像
function ItemInfoShowWindow:onUpdateNodeItem()
    self.txt_Name.text = self.itemConfig.name
    local pathQualityLine = string.format("%sGoods_Quality%02d", BagManager.pathItemQuality, self.itemConfig.item_bg)
    self:setSprite(self.img_BgLine, pathQualityLine)

    local pathQuality = string.format("%sQuality_Big%02d", BagManager.pathItemQuality, self.itemConfig.item_bg)
    self:setSprite(self.img_Bg, pathQuality)
    self:setSprite(self.img_Icon, BagManager.pathItemIcon .. self.itemConfig.item_icon)

    for key, value in pairs(self.listAllStars) do
        value.gameObject:SetActive(false)
    end

    for i = 1, self.itemConfig.star_max do
        local starShow = self:getStarObj(i)
        local star = starShow.transform:Find("Image_Star")
        star.gameObject:SetActive(self.itemConfig.star >= i)
    end
end
--获取可服用的星星
function ItemInfoShowWindow:getStarObj(index)
    if index > #self.listAllStars then
        local star = GameObject.Instantiate(self.prefab_Star, self.parent_Star.transform)
        star.transform.localScale = Vector2(1, 1)
        star.gameObject:SetActive(true)
        table.insert(self.listAllStars, star.gameObject)
        return star.gameObject
    else
        for key, value in pairs(self.listAllStars) do
            if not value.gameObject.activeSelf then
                value.gameObject:SetActive(true)
                return value.gameObject
            end
        end
    end
end

---刷新描述
function ItemInfoShowWindow:onUpdateDetail()
    self.txt_DesTitle.text = self.itemConfig.des
    self.txt_Des.text = self.itemConfig.bg_des
end

---刷新跳转
function ItemInfoShowWindow:onUpdateGet()
    local itemGo = self.itemConfig.item_go
    if itemGo == nil or #itemGo <= 0 then
        self.txt_GetDesTitle.gameObject:SetActive(true)
        self.txt_GetDes.gameObject:SetActive(true)
        self.content.gameObject:SetActive(false)
        self.txt_GetDes.text = self.itemConfig.jump_des
    else
        self.txt_GetDesTitle.gameObject:SetActive(false)
        self.txt_GetDes.gameObject:SetActive(false)
        self.content.gameObject:SetActive(true)
        self:initView()
    end
end

---初始化跳转列表
function ItemInfoShowWindow:initView()
    local configGo = self.itemConfig.item_go

    self.listPathView = {}
    self.content:InitPool(
        #configGo,
        function(index, obj)
            local value = configGo[index]
            local config = Config.ItemJump[value]
            local text_Des = obj.transform:Find("Text_Des"):GetComponent(typeof(Text))
            local btn_Go = obj.transform:Find("Button_Go"):GetComponent(typeof(Button))
            self:addEventHandler(
                btn_Go.onClick,
                function()
                    self:goFuncion(config)
                end
            )
            local btn_Disable = obj.transform:Find("Button_Disable"):GetComponent(typeof(Button))
            self:addEventHandler(
                btn_Disable.onClick,
                function()
                    self:disableFuncion(config)
                end
            )

            btn_Disable.gameObject:SetActive(false)
            ---暂时关闭未开放按钮

            text_Des.text = config.name

            local _item = {}
            _item.obj = obj
            table.insert(self.listPathView, _item)
        end
    )
end
