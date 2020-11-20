---@class ItemInfoWindow_NodeGet
---@field itemData Bag_ItemData
local ItemInfoWindow_NodeGet = DClass("ItemInfoWindow_NodeGet", BaseComponent)
_G.ItemInfoWindow_NodeGet = ItemInfoWindow_NodeGet

function ItemInfoWindow_NodeGet:ctor(data)
end

function ItemInfoWindow_NodeGet:onInit()
end

function ItemInfoWindow_NodeGet:init(data, cpnParent)
    self:initUI()

    self:updateData(data, cpnParent)
end

function ItemInfoWindow_NodeGet:initUI()
    self.txt_DesTitle = self.transform:Find("Text_D"):GetComponent(typeof(Text))
    self.txt_Des = self.transform:Find("Text_NoGetDes"):GetComponent(typeof(Text))
    self.btn_Detail = self.transform:Find("Button_Detail"):GetComponent(typeof(Button))
    self:addEventHandler(
        self.btn_Detail.onClick,
        function()
            self:onClickDetail()
        end
    )

    self.content = self.transform:Find("View/Viewport/ContentV"):GetComponent(typeof(ScrollPoolVertical))
end

function ItemInfoWindow_NodeGet:updateData(data, cpnParent)
    self.itemData = data
    self.cpnParent = cpnParent

    self:onUpdateUI()
end

function ItemInfoWindow_NodeGet:onUpdateUI()
    local itemGo = self.itemData.config.item_go
    if itemGo == nil or #itemGo <= 0 then
        self.txt_DesTitle.gameObject:SetActive(true)
        self.txt_Des.gameObject:SetActive(true)
        self.content.gameObject:SetActive(false)
        self.txt_Des.text = self.itemData.config.jump_des
    else
        self.txt_DesTitle.gameObject:SetActive(false)
        self.txt_Des.gameObject:SetActive(false)
        self.content.gameObject:SetActive(true)
        self:initView()
    end
end

function ItemInfoWindow_NodeGet:onClickDetail()
    Log("切换到详情界面.....")
    self.cpnParent:setNodeState(ItemInfoWindow.NodeState.Detial)
end

function ItemInfoWindow_NodeGet:initView()
    local configGo = self.itemData.config.item_go
    
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

---获得元素
function ItemInfoWindow_NodeGet:GetObj(index, value)
    local obj = nil
    obj = GameObject.Instantiate(self.prefab_Path)
    obj.transform:SetParent(self.contentPath, false)
    obj.transform.localScale = Vector2(1, 1)
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

    return _item
end

function ItemInfoWindow_NodeGet:goFuncion(config)
    Log("跳转到功能：" .. tostring(config.id))
end
function ItemInfoWindow_NodeGet:disableFuncion(config)
    Log("disableFuncion功能：" .. tostring(config.func_id))
end
