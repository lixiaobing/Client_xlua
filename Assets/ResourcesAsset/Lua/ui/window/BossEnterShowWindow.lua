---@class VideoWindow
local BossEnterShowWindow = DClass("BossEnterShowWindow", BaseWindow)
_G.BossEnterShowWindow = BossEnterShowWindow
function BossEnterShowWindow:ctor(data)
	self.monsterId     = data[1]
    -- self.duration = self.data.duration                   
end

function BossEnterShowWindow:onInit()
    self.animator   = self.transform:GetComponent(typeof(Animator))-- 获取物体上的animator组建
    self.stateInfo  = self.animator:GetCurrentAnimatorStateInfo(0) 
    local panelInfo = self.transform:Find("PanelInfo")
	self.textName      = panelInfo:Find("TextName"):GetComponent(typeof(Text))
	self.textNameFirst = panelInfo:Find("TextNameFirst"):GetComponent(typeof(Text))
	self.textDesc      = panelInfo:Find("TextDesc"):GetComponent(typeof(Text))
	local monster = Config.Monster[self.monsterId]
	if monster then
		self.textName.text      = monster.name
		self.textNameFirst.text = string.sub(monster.name,1,3)
		self.textDesc.text      = monster.desc
	end
--[[    --延迟关闭
    StartDelayTask(function()
        self:close()
    end,self.duration*0.001)--]]
end

--[[function BossEnterShowWindow:onUpdate()

end

function BossEnterShowWindow:onClose()

end--]]

