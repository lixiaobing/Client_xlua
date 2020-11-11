---@class MonsterHp
local MonsterHp = DClass("MonsterHp", BaseComponent)
_G.MonsterHp = MonsterHp

function MonsterHp:init(rect, target)
    self.target = target

    self.container = rect

    self.rect = self.transform:GetComponent(typeof(RectTransform))
    self.cvs = self.transform:GetComponent(typeof(CanvasGroup))
    self.bar = self.transform:Find("Bar"):GetComponent(typeof(Image))

    self.cvs.alpha = 1
    self:refresh()
end

function MonsterHp:refresh()
    self.bar.fillAmount = self.target.attr:getHpPercent().number
    self.startTime = Time.time
end

function MonsterHp:onUpdate()
    if not self.target or self.bar.fillAmount == 0 then
        self.cvs.alpha = 0
        self.target = nil
        return
    end

    local sp = CameraUtility.getCamera():WorldToScreenPoint(self.target.controller.position:ToViewVector()+Vector3(0,1.6,0))

    local inRect = RectTransformUtility.RectangleContainsScreenPoint(self.container, sp, UIManager.UICamera)

    if inRect then
        local b, p = RectTransformUtility.ScreenPointToLocalPointInRectangle(self.container, sp, UIManager.UICamera, nil)
        if b then
            self.rect.anchoredPosition = p
        else
            self.cvs.alpha = 0
            self.target = nil
        end
    
        if Time.time - self.startTime <= 3 then
            self.cvs.alpha = 0
        else
            self.cvs.alpha = self.cvs.alpha - 0.02
            if self.cvs.alpha<=0 then
                self.cvs.alpha = 0
                self.target = nil
            end
        end
    else
        self.cvs.alpha = 0
        self.target = nil
    end
end