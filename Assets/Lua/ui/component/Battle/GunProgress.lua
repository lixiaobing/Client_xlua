---@class GunProgress
local GunProgress = DClass("GunProgress", BaseComponent)
_G.GunProgress = GunProgress

function GunProgress:init(args)
    self.buff = args[1]

    self.progress = self.transform:Find("Value"):GetComponent(typeof(Image))
end

function GunProgress:onUpdate()
    if self.buff then
        self.progress.fillAmount = self.buff:getTimeProgress().number
    end
end

function GunProgress:open()

end

function GunProgress:close(complete)
    if complete then
        complete()
    end
end