---@class VideoWindow
local VideoWindow = DClass("VideoWindow", BaseWindow)
_G.VideoWindow = VideoWindow

function VideoWindow:onAsset()
    self.assetKeys = {self.url}

    self.assetComplete = function(index, obj)
        self.clipPrefab = obj
    end
end

function VideoWindow:ctor(data)
    self.url   = data[1]
    self.closeCallFunc = data[2]
end

function VideoWindow:onInit()
    self.container    = self.transform:Find("Container")
    self.rawImage     =  self.container:GetComponent(typeof(RawImage))
    self.rawImage.texture:Release() --解决残留帧问题
    self.videoPlayer  = self.transform:Find("VideoPlayer"):GetComponent(typeof(VideoPlayer))
    self.button = self.transform:Find("Button"):GetComponent(typeof(Button))
    self:addEventHandler(self.button.onClick, self.onButtonClick)
    self.button.gameObject:SetActive(true)
    --视频路径
    self.videoPlayer.clip      = self.clipPrefab
    self.videoPlayer.isLooping = false
    -- self.videoPlayer:Play()
    self._onPlayComplete = handler(self.onPlayComplete,self)
    self.videoPlayer.loopPointReached = self.videoPlayer.loopPointReached +  self._onPlayComplete
    self.delayTask =  StartDelayTask(function ()
            self.delayTask = nil
            self.button.gameObject:SetActive(true)
    end,2)
end

function VideoWindow:onPlayComplete()
    self:close()
end


--跳过
function VideoWindow:onButtonClick()
    if not self.isCloseing then
        self:close()
    end
end

function VideoWindow:doClose()
    

end

function VideoWindow:onOpen()
    self.videoPlayer:Play()
end
--]]
--关闭 
function VideoWindow:onClose()
    if self.delayTask then 
        StopDelayTask(self.delayTask)
        self.delayTask = nil
    end
    if self.closeCallFunc then 
        self.closeCallFunc()
    end
    if self._onPlayComplete then
        self.videoPlayer.loopPointReached = self.videoPlayer.loopPointReached -  self._onPlayComplete
        self._onPlayComplete = nil
    end
end

