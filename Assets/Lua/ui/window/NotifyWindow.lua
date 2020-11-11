-- @brief: 二次确认通知窗口
local NotifyWindow = DClass("NotifyWindow", BaseWindow)
_G.NotifyWindow = NotifyWindow

-- data = {}
-- data.title = "Title"         							弹窗标题
-- data.content = "content"     							弹出内容
-- data.buttonNames = {"Button1", "Button2", "Button3"}		按钮名称组（小于等于3个）
-- data.buttonTypes = {1,2,3}								和名称对应的按钮样式（默认1）
-- data.callback = function(sort) end  						点击某个按钮后的反馈（sort表示按钮序号）
--
-- MsgCenter.sendMessage(Msg.NOTIFY, data)

--1.初始化UI（第一次打开UI处理，用于界面初始化:组件关联、变量赋值，事件绑定）
function NotifyWindow:onInit()
	self.title = self.nodes["titleLabel"]
    self.content = self.nodes["contentLabel"]
    self.buttons = {}
    for i=1,3 do
    	local btn = self.nodes.buttonBox:Find("Button"..i):GetComponent(typeof(Button))
    	self.buttons[i] = btn
    	self:addEventHandler(btn.onClick, self.onButtonClick, i)
    end

    self.spacings = {0, 60, 20}
    self.buttonGroup = self.nodes.buttonGroup

    self:setData(self.data[1])
end

function NotifyWindow:setData(data)
    self.notify = data

    self.notify.title = self.notify.title or "提示"
    self.title.text = self.notify.title

    self.notify.content = self.notify.content or ""
    self.content.text = self.notify.content

    self.notify.buttonNames = self.notify.buttonNames or {}
    self.notify.buttonTypes = self.notify.buttonTypes or {}

    local buttonCount = #self.notify.buttonNames
    self.buttonGroup.spacing = self.spacings[buttonCount>0 and buttonCount or 1]

    for i,btn in ipairs(self.buttons) do
        local name = self.notify.buttonNames[i]
        local type = self.notify.buttonTypes[i] or 1
        if name then
            btn.gameObject:SetActive(true)
            local label = btn.transform:Find("Text"):GetComponent(typeof(Text))
            label.text = name
            
            --local btnLib = btn.transform:GetComponent(typeof(ResLibrary))
            --btnLib:changeNormalState(type)
        else
            btn.gameObject:SetActive(false)
        end
    end
end

function NotifyWindow:onButtonClick(sort)
    if self.notify.callback then
        self.notify.callback(sort)
    end
    self:close()
end


--3.关闭UI（UIManager销毁UI前处理）
function NotifyWindow:onClose()
    
end