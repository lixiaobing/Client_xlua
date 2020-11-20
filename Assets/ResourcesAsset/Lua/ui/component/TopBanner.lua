local TopBanner = DClass("TopBanner", BaseComponent)
_G.TopBanner = TopBanner

function TopBanner:init()
    self.datas = {}
    for i = 1, 5 do
        self.datas[i] = self.nodes.dataGroup:Find("Data" .. i)
    end

    self.gameObject:SetActive(false)
    self.messager = Messager.new(self)

    self.messager:addListener(Msg.OPEN_WINDOW_FINISH, self.onOpenWindowHandler)
    -- self.messager:addListener(Msg.CLOSE_WINDOW_FINISH, self.onCloseWindowHandler)
    self.messager:addListener(Msg.SHOW_TOPBANNER, self.onShowTopbannerHandler)

    --self.messager:addListener(Msg.ITEMDATA_UPDATE, self.onRefreshData)

    self:addEventHandler(self.nodes.btnBack.onClick, self.onClickBtnBack)
    self:addEventHandler(self.nodes.btnMain.onClick, self.onClickBtnMain)
end

function TopBanner:onOpenWindowHandler(winConfig)
    if winConfig.layer ~= UIConfig.LayerType.Screen then
        return
    end

    self.config = Config.ClientTopBanner[winConfig.name]

    if not self.config then
        self.gameObject:SetActive(false)
        return
    else
        self.gameObject:SetActive(true)
    end

    self.nodes.background.gameObject:SetActive(self.config.show_bg)

    self:showBackButton(self.config.show_btnback)
    self:showMainButton(self.config.show_btnmain)
    self:showTitle(self.config.show_title)

    self:onRefreshData()

    self.localScreenWindow = winConfig
end

function TopBanner:onCloseWindowHandler(winConfig)
    if winConfig.layer ~= UIConfig.LayerType.Screen then
        return
    end
    self.gameObject:SetActive(false)
end

function TopBanner:onShowTopbannerHandler(isShow)
    self.gameObject:SetActive(isShow)
end

function TopBanner:showBackButton(isShow)
    self.nodes.btnBack.gameObject:SetActive(isShow)
end

function TopBanner:showMainButton(isShow)
    self.nodes.btnMain.gameObject:SetActive(isShow)
end

function TopBanner:showTitle(isShow)
    self.nodes.title.gameObject:SetActive(isShow)
    if isShow then
        local titleShow = self.config.title
        if self.titleName and self.config.title == "" then
            titleShow = self.titleName
        else
            titleShow = self.config.title
        end
        self.nodes.title.text = titleShow
    end
end

---要显示动态标题 需要ClientTopBanner配置title为空
function TopBanner:setTitleName(name)
    self.titleName = name
    if self.titleName then
        self.nodes.title.text = self.titleName
    end
end

function TopBanner:setBackHandler(func)
    self.backHandler = func
end

function TopBanner:onClickBtnBack()
    if self.backHandler then
        self.backHandler()
    else
        UIManager.back()
    end
end

function TopBanner:doBack()
    self:onClickBtnBack()
end

function TopBanner:onClickBtnMain()
    UIManager.openWindow("MainWindow")
end

function TopBanner:onRefreshData()
    if self.config then
        for i = 1, 5 do
            if self.config.show_datas[i] then
                local id = self.config.show_datas[i].id
                local type = self.config.show_datas[i].type
                self.datas[i].gameObject:SetActive(true)

                local item = BagMgr:getItemDataByCId(id)
                local box = self.datas[i]
                if item then
                    local valLabel = box:Find("Value"):GetComponent(typeof(Text))
                    local valIcon = box:Find("Icon"):GetComponent(typeof(Image))
                    local valBtn = box:Find("BtnAdd"):GetComponent(typeof(Button))
                    valLabel.text = self:setTopLabel(id)
                    local itemConfig = BagManager.getItemConfigDataById(id)
                    self:setSprite(valIcon, string.format("Icon/ItemIcon/%d", itemConfig.item_icon))
                    self:addEventHandler(
                        valBtn.onClick,
                        function()
                            self:onClickTopAdd(type)
                        end
                    )
                end
            else
                self.datas[i].gameObject:SetActive(false)
            end
        end
    end
end

function TopBanner:onClickTopAdd(type)
    if type == 2 then
        Log("打开兑换金币商城")
    elseif type == 0 then
        Log("打开兑换钻石商城")
    elseif type == 1 then
        Log("打开兑换体力商城")
        UIManager.openWindow("ShipPopup")
    end
end

function TopBanner:setTopLabel(id)
    local item = BagMgr:getItemDataByCId(id)
    if id == ItemType.GOLD or id == ItemType.DIAMOND then
        return item.num
    elseif id == ItemType.PhyPower then
        return item.num .. "/" .. ShipMgr:getPhyPowerUpperLimit()
    end
end
