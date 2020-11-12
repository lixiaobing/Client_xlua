---@class UIModelGroup
local Model = DClass("Model")

function Model:bind(gameObject)
    -- self.roleObj
    self._mmodel = gameObject.transform
    self.scale   = Vector3.one
end

function Model:rotate(yAngle)
    self._mmodel:Rotate(0, yAngle, 0)
end
function Model:clear()
    if self.roleObj ~= nil then 
        GameObject.Destroy(self.roleObj)
        self.roleObj = nil
    end
    self.loadingPath = nil
end
--是否是空位
function Model:isEmpty()
    return not self.roleObj   
end

--加载模型
function Model:load(path)
    if path == self.loadingPath then 
        return
    end
    self:clear()
    self.loadingPath = path
    self.progress = true
    GameAsset.LoadUIModel(path,function (obj)
        if self.loadingPath == path then 
            self:clear()
            self.roleObj       = GameObject.Instantiate(obj, self._mmodel)
            self.roleObj.layer = LayerMask.NameToLayer("UIModel");
            self.roleObj.transform.localPosition =  Vector3.zero
            self.roleObj.transform.localScale    =  self.scale
            Utils.disableCameraInChildren(self.roleObj)
            Prefab.setLayer(self.roleObj,"UIModel")

            UIUtil.resetUIModel(self.roleObj)
        end
    end)

end

function Model:lookAt(position)
    position.y = self._mmodel.position.y
    -- self._mmodel:LookAt(position)
end

function Model:setScale(scale)
    self.scale = Vector3(scale,scale,scale)
    if self.roleObj then 
        -- self.roleObj.transform.localScale  = self.scale
    end
end

function Model:setPosition(position)
    self._mmodel.position = position
end

local UIModelGroup = DClass("UIModelGroup")
_G.UIModelGroup = UIModelGroup
function UIModelGroup:bind(transform)
    self.transform = transform
    self.models = {}
    self.camera = self.transform:Find("Camera"):GetComponent(typeof(Camera))
    for i = 1 , 3 do
        self.models[i] = Model.new()
        self.models[i]:bind(self.transform:Find("Model"..i))
        -- self.models[i]:lookAt(self.camera.transform.position)
    end
end
function UIModelGroup:getModel(index)
    return self.models[index]
end
function UIModelGroup:loadModel(index,id)
    if self.models[index] ~= nil then  
        local config = Config.Hero[id]
        self.models[index]:load("Model/"..config.model_info.path)
    end
end

function UIModelGroup:doLook()
    for i,model in ipairs(self.models) do
        -- model:lookAt(self.camera.transform.position)
    end
end
function UIModelGroup:setPosition(index)
    local model       = self.models[index]
    local rect        = nil
    local screenPoint = nil
    local ret , worldPoint = RectTransformUtility.ScreenPointToWorldPointInRectangle(rect, screenPoint, self.camera, nil)

end


return UIModelGroup