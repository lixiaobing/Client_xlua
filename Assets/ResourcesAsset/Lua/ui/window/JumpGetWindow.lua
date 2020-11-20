---@class JumpGetWindow
local JumpGetWindow = DClass("JumpGetWindow", BaseWindow)
_G.JumpGetWindow = JumpGetWindow

function JumpGetWindow:onAsset()
end


function JumpGetWindow:ctor(data)
    self.jumpIds = data[1][1]
    self.jumpDes = data[1][2]
end

function JumpGetWindow:onInit()
    self.coverCallBack = self.close

    self.nodes.nodeJump:SetActive(false)
    self.nodes.txtNilDes.gameObject:SetActive(false)
    
    if self.jumpDes then
        self.nodes.txtNilDes.gameObject:SetActive(true)
        self.nodes.txtNilDes.text = self.jumpDes
        return
    end

    self.nodes.nodeJump:SetActive(true)

    self.nodes.contentPool:ReloadConfig()
    self.nodes.contentPool:InitPool(
        #self.jumpIds,
        function(index, obj)
            local cfg = self.jumpIds[index]
            local cfgJump = Config.ItemJump[cfg.jumpid]
            local txtDes = obj.transform:Find("Text_Des"):GetComponent(typeof(Text))
            local btnJump = obj.transform:Find("Button_Jump"):GetComponent(typeof(Button))
            local btnDisable = obj.transform:Find("Button_Disactive"):GetComponent(typeof(Button))

            txtDes.text = string.format(cfgJump.name, cfg.count)
            btnDisable.gameObject:SetActive(false)
            btnJump.gameObject:SetActive(true)

            self:addEventHandler(
                btnJump.onClick,
                function()
                    Log("跳转---" .. txtDes.text)
                    self:close()
                end
            )
        end
    )
end
