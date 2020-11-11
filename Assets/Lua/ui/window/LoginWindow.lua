---@class LoginWindow:BaseWindow
local LoginWindow = DClass("LoginWindow", BaseWindow)
_G.LoginWindow = LoginWindow

function LoginWindow:onAsset()
    --[[self.assetKeys = {
        "UI/Component/HeroItem",
        "UI/Component/SkillItem"
    }
    
    self.assetComplete = function(index, obj)
        if index == 1 then
            self.heroItemPrefab = obj
        elseif index == 2 then
            self.skillItemPrefab = obj
        end
    end--]]
end

function LoginWindow:onInit()
    self.isSwitch = true;
    self.accountId = PlayerPrefsUtils.getLocalServerAccountID();
    self.password = PlayerPrefsUtils.getLocalServerPassword();

    self._eventTarget = self.transform:GetComponent(typeof(Button))
    self:addEventHandler(self._eventTarget.onClick,self.onTouchAny)
    self:addEventHandler(self.nodes.AccountInput.onEndEdit,self.onAccountEndEdit)
    self:addEventHandler(self.nodes.PasswordInput.onEndEdit,self.onPasswordEndEdit)
    self:addEventHandler(self.nodes.Button_Server.onClick,self.onSwitch)

    self.nodes.AccountInput.text = self.accountId;
    self.nodes.PasswordInput.text = self.password;

    
    self:tweenPush(GameTween.DOFade(self.nodes.ContinueTips,0,0.8):SetLoops(-1,1));

    self:updateServerName();

    self.messager:addListener(Msg.LOGIN_ACCOUNT_SUCCESS, self.onLoginAccountSuccess);
    self.messager:addListener(Msg.LOGIN_CONNECT_SERVER,self.onConnectedServer);
    self.messager:addListener(Msg.LOGIN_ENTER_GAME,self.onEnterGame);
    --AkAudioManager.Instance:PlaySound("UIMusic_Music");
end

function LoginWindow:refreshServerList()
    local serverList = ServerDataMgr:getServerList();
    local selectServerIndex = PlayerPrefsUtils.getLocalServerIndex();
    self.nodes.ServerList:InitPool(#serverList, function(index, obj)
        local server = serverList[index];
        local btn = obj.transform:GetComponent(typeof(Button))
        self:addEventHandler(btn.onClick, function()
            btn.interactable = true
            self:onSelectedSever(index);
            self:onSwitch();
        end)

        local Text = obj.transform:Find("Text"):GetComponent(typeof(Text));
        Text.text = server.name ~= "" and server.name or server.groupName;

        if selectServerIndex == index then
            btn:Select();
        end
    end)
end

function LoginWindow:onAccountEndEdit(event,_inputStr)
    Log(_inputStr)
    self.accountId = _inputStr;
end

function LoginWindow:onPasswordEndEdit(event,_inputStr)
    Log({_inputStr})
    self.password = _inputStr;
end

function LoginWindow:onTouchAny()
    if self.nodes.ServerBoard.activeSelf then
        self:onSwitch();
        return;
    end

    if self.accountId == "" then
        Log("请输入帐号")                                
        MsgCenter.sendMessage(Msg.HINT_COMMON,"请输入帐号" );
        return
    end

    if self.password == "" then
        Log("请输入密码")
        MsgCenter.sendMessage(Msg.HINT_COMMON,"请输入帐号" );
        return
    end

    LogonHelper:loginLocalServer(self.accountId,self.password);
end

function LoginWindow:onSwitch()
    self.nodes.AccountBoard:SetActive(not self.isSwitch);
    self.nodes.ServerBoard:SetActive(self.isSwitch);
    self.isSwitch = not self.isSwitch;

    if self.nodes.ServerBoard.activeSelf then
        Log("refreshServerList")
        self:refreshServerList();
    end
end

function LoginWindow:onSelectedSever(index)
    PlayerPrefsUtils.setLocalServerIndex(index)
    self:updateServerName();
end

function LoginWindow:updateServerName()
    local index = PlayerPrefsUtils.getLocalServerIndex()
    local servers = ServerDataMgr:getServerList()
    --可能导致访问空对象，这里做下兼容
    local server = servers[index] or servers[1];
    self.nodes.Button_Server_Text.text = server.name ~= "" and server.name or server.groupName;
end

function LoginWindow:onLoginAccountSuccess()
    local serverData = ServerDataMgr:getGameServer();
    NetWork:connectServer(serverData.gameServerIp,serverData.gameServerPort);
end

function LoginWindow:onConnectedServer()
    MainPlayer:loginGameServer();
end

function LoginWindow:onEnterGame()
    MainPlayer:enterGame();
    Log("enter game!")

    local dungeon_script = 	PlayerPrefs.GetInt("dungeon_script", 0)
    local tempId  = 99999999 
    if dungeon_script and dungeon_script > 0 then
        local id   = table.keys(Config.DungeonLevel)[1]
        Config.DungeonLevel[tempId] = clone(Config.DungeonLevel[id])
        Config.DungeonLevel[tempId].dungeon_script = dungeon_script
        UIManager.closeAllWindow()
        UIManager.openWindow("LoadSceneWindow",function()
            local selectHeroId = PlayerPrefsUtils.getSelectHeroId()
            if not selectHeroId or selectHeroId == 0 then 
                selectHeroId = 40103
            end
            BattleFactory.enter({selectHeroId}, tempId)
        end)
    else
        UIManager.openWindow("MainWindow")
    end

    PlayerPrefs.SetInt("dungeon_script", 0)

    -- UIManager.openWindow("MainWindow");
    UIManager.closeWindow("LoginWindow")
end