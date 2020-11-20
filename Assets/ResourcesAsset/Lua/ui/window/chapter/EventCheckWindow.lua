local EventCheckWindow = DClass("EventCheckWindow", BaseWindow)
_G.EventCheckWindow = EventCheckWindow

function EventCheckWindow:ctor(data)
    self.consoleId = data[1]
    self.config    = Config.DungeonConsole[self.consoleId]
    -- self.config.type  = 5 --TODO 测试用
    self.pageNum   = #self.config.desc
    self.pageIndex = 1
    if not Utils.stringIsNullOrEmpty(self.config.music) then 
        AudioManager.PlaySound(self.config.music)
    end
end
function EventCheckWindow:onInit()
    self.nodes.camera.depth = 1 
    self.nodes.uiGesture:AddHandler(UIGestureType.All, function(e) self:onGestureHandler(e) end)
    
    if self.pageNum > 1 then 
        self.nodes.btnPre.gameObject:SetActive(true)
        self.nodes.btnNext.gameObject:SetActive(true)
        self.nodes.textPage.gameObject:SetActive(true)
    else
        self.nodes.btnPre.gameObject:SetActive(false)
        self.nodes.btnNext.gameObject:SetActive(false)
        self.nodes.textPage.gameObject:SetActive(false)
    end
    --上一页
    self:addEventHandler(self.nodes.btnPre.onClick, function()
        if self.pageIndex > 1 then 
            self.pageIndex  = self.pageIndex -1
        -- else
        --     self.pageIndex = self.pageNum
        end
        self:showInfo()
    end)
    --下一页
    self:addEventHandler(self.nodes.btnNext.onClick, function()
        if self.pageIndex < self.pageNum then 
            self.pageIndex  = self.pageIndex + 1
        -- else
        --     self.pageIndex = 1
        end
        self:showInfo()
    end)

    --返回按钮
    self:addEventHandler(self.nodes.btnBack.onClick, function()
        self:close()
    end)

    self.nodes.title.text    = self.config.title
    if self.config.type == 3 then
        UIUtil.setSprite(self.nodes.imagePic,self.config.pic_path,true)
    elseif self.config.type == 4 then --模型
        self.nodes.imagePic.gameObject:SetActive(false)
        self.nodes.uiModel:LoadModel(self.config.model_path, 0)
    end
    self:showInfo()
end

function EventCheckWindow:onOpen()
    AudioManager.PlaySound('View_Map')
end


function EventCheckWindow:onGestureHandler(event)
    if event.type == UIGestureType.Move then
        self.nodes.uiModel:RotateModel(-event.deltaPosition.x)
    -- elseif event.type == UIGestureType.Click then
    --     if self.isHideUI then
    --         self.nodes.container:SetActive(true)
    --         MsgCenter.sendMessage(Msg.SHOW_TOPBANNER, true)
    --         self.isHideUI = false
    --     end
    end
end

function EventCheckWindow:showInfo()

    self.nodes.textPage.text = string.format("%s/%s",self.pageIndex,self.pageNum)

    self.nodes.desc.text     = Lang(self.config.desc[self.pageIndex])



end

function EventCheckWindow:onButtonClick(sort)
    -- if self.notify.callback then
    --     self.notify.callback(sort)
    -- end
    -- self:close()
end


--3.关闭UI（UIManager销毁UI前处理）
function EventCheckWindow:onClose()
    
end