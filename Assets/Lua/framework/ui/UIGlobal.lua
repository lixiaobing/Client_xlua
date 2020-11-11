UIGlobal = {}
local this = UIGlobal

local _messager = nil
local _assets = {}

UIGlobal.loading = nil
UIGlobal.topBanner = nil

function UIGlobal.init()
    if this.onUpdate then
        UpdateBeat:Add(this.onUpdate, this)
    end

    this.readyAsset()

    this.create()
end

function UIGlobal.readyAsset()
    local assetKeys = {
        "UI/Window/VideoWindow",

        "UI/Component/Loading",
        "UI/Component/TopBanner",
        "UI/Component/HintCommon"
    }
    Yield(
        GameAsset.LoadAssets(assetKeys, function(index, obj)
            local key = assetKeys[index]
            _assets[key] = obj
        end)
    )
end

function UIGlobal:onUpdate()
    if Input.GetKeyDown(KeyCode.F6) then
        UIManager.openWindow("GMWindow")
    end

    if Input.touchCount > 3 then
        UIManager.openWindow("GMWindow")
    end
    
    if Input.GetKeyDown(KeyCode.F7) then
        if UIManager.getWindow('BattleWindow') and not UIManager.getWindow('BattleGMWindow') then
            UIManager.openWindow("BattleGMWindow")
        elseif UIManager.getWindow('BattleGMWindow') then
            UIManager.getWindow('BattleGMWindow'):close()
        end
    end

    if Input.GetKeyDown(KeyCode.F8) then
        if UIManager.getWindow('BattleWindow') then
            local win = UIManager.getWindow('BattleHeroDebugWindow')
            if not win then
                UIManager.openWindow("BattleHeroDebugWindow")
            else
                UIManager.closeWindow("BattleHeroDebugWindow")
            end
        end
    end
end

function UIGlobal.create()
    _messager = Messager.new(this)

    this.createUI()
    this.createListeners()
end

function UIGlobal.createUI()
    --全局准备UI
    UIManager.addPrefabCache("VideoWindow", _assets["UI/Window/VideoWindow"], true)

    --全局Loading
    local loadingObj = GameObject.Instantiate(_assets["UI/Component/Loading"])
    loadingObj.transform:SetParent(UIManager.getLayer(UIConfig.LayerType.Loading), false)
    local loading = UIUtil.createComponent(loadingObj, Loading)
    loading:init()
    UIGlobal.loading = loading

    --顶部UI
    local topBannerObj = GameObject.Instantiate(_assets["UI/Component/TopBanner"])
    topBannerObj.transform:SetParent(UIManager.getLayer(UIConfig.LayerType.ScreenUp), false)
    local topBanner = UIUtil.createComponent(topBannerObj, TopBanner)
    topBanner:init()
    UIGlobal.topBanner = topBanner
end

function UIGlobal.createListeners()
    --全局打开窗口
    _messager:addListener(Msg.OPEN_WINDOW, this.openWindowHandler)
    --全局关闭窗口
    _messager:addListener(Msg.CLOSE_WINDOW, this.closeWindowHandler)

    --全局飘字小提示：文本
    _messager:addListener(Msg.HINT_COMMON, this.onHintCommonHandler)
    --全局飘字小提示：道具
    _messager:addListener(Msg.HINT_ITEM, this.onHintItemHandler)
    --全局通知弹窗提示
    _messager:addListener(Msg.NOTIFY, this.onNotifyHandler)
    --全局打开加载提示
    _messager:addListener(Msg.SHOW_LOADING, this.onShowLoadingHandler)
    --全局关闭加载提示
    _messager:addListener(Msg.HIDE_LOADING, this.onHideLoadingHandler)
    --全局锁屏
    _messager:addListener(Msg.LOCK_SCREEN, this.onLockScreenHandler)
    --全局打开道具分解和获得提示
    _messager:addListener(Msg.ITEMTIPS, this.onItemTipsHandler)
    --查看道具基本数据信息
    _messager:addListener(Msg.ITEM_SHOWINFO, this.onShowItemBaseInfo)

    --屏幕变黑
    _messager:addListener(Msg.SCREEN_DARK, this.onScreenDark)
end

function UIGlobal.openWindowHandler(self, winName,...)
    UIManager.openWindow(winName,...)
end

function UIGlobal.closeWindowHandler(self, winName)
    UIManager.closeWindow(winName)
end

function UIGlobal.onScreenDark(self, time, startAlpha, showCallback, hideCallback)
    local darkLayer = UIManager.getLayer(UIConfig.LayerType.Dark)
    darkLayer.gameObject:SetActive(true)

    local image = darkLayer:GetComponent(typeof(Image))
    image.color = Color(0, 0, 0, startAlpha)

    GameTween.DOFade(image, 1, 0.4 * time):OnComplete(
        function()
            if showCallback then
                showCallback()
            end
        end
    )
    GameTween.DOFade(image, 0, 0.6 * time):SetDelay(0.4 * time):OnComplete(
        function()
            darkLayer.gameObject:SetActive(false)
            if hideCallback then
                hideCallback()
            end
        end
    )
end

function UIGlobal.doScreenDarkFadeOut(time)
    time = time or 0.5
    local darkLayer = UIManager.getLayer(UIConfig.LayerType.Dark)
    darkLayer.gameObject:SetActive(true)
    local image = darkLayer:GetComponent(typeof(Image))
    image.color = Color(0, 0, 0, 1)
    GameTween.DOFade(image, 0, time):SetDelay(0.1):OnComplete(
        function()
            darkLayer.gameObject:SetActive(false)
        end
    )
end

local _hintCommonContent = ""
local _hintCommonTime = 0

local _hintDeltaTime = 0.05
local _hintDataList = {}
local _hintCpnList = {}
local _hintIsPlaying = false

--- 显示全局普通文本提示
-- @param content 要显示的文本内容
-- @author lanqibo
function UIGlobal.onHintCommonHandler(_, content)
    -- if _hintCommonContent == content and Time.time - _hintCommonTime < 1 then
    --     return nil
    -- end

    _hintCommonContent = content
    _hintCommonTime = Time.time

    table.insert(_hintDataList, content)

    if not _hintIsPlaying then
        this.checkHintList()
    end
end

-- --- 显示全局道具获取提示
-- -- @param iteamType 要显示的道具类型 1道具2装备
-- -- @param itemid 要显示的道具配置ID
-- -- @param count 获得的数量
-- -- @author lanqibo
-- function UIGlobal.onHintItemHandler(_, iteamType, itemid, count)
--     local cfg = ConfigUtil.getItemConfig(iteamType, itemid)
--     if cfg and cfg.type==4 then
--         local items = ConfigUtil.unpackGift(cfg)
--         for i,v in ipairs(items) do
--             onHintItemHandler(_, v.type, v.id, v.num)
--         end
--         return
--     end

--     table.insert(_hintDataList, {iteamType, itemid, count})

--     if not _hintIsPlaying then
--         checkHintList()
--     end
-- end

function UIGlobal.checkHintList()
    -- Log.debug(hintItemDataList)
    if #_hintDataList > 0 then
        _hintIsPlaying = true
        local data = _hintDataList[1]
        this.playHint(data)
        table.remove(_hintDataList, 1)
    else
        _hintIsPlaying = false
    end
end

function UIGlobal.playHint(data)
    _hintIsPlaying = true

    local startRecord = function(c)
        table.insert(_hintCpnList, c)
    end

    local moveCallback = function(c)
        if #_hintCpnList > 0 then
            local pos = 0
            for i = #_hintCpnList - 1, 1, -1 do
                local height = _hintCpnList[i]:getHeight()
                pos = pos + height + 10
                _hintCpnList[i]:adjustPosY(Vector2(0, pos))
            end
        end
    end

    local destroyCallback = function(c)
        for i, v in ipairs(_hintCpnList) do
            if v == c then
                table.remove(_hintCpnList, i)
                break
            end
        end
    end

    local hintSequence = GameTween.Sequence()
    hintSequence:AppendCallback(
        function()
            local layer = UIManager.getLayer(UIConfig.LayerType.Hints)
            local hint = nil

            if type(data) == "string" then
                local hintObj = GameObject.Instantiate(_assets["UI/Component/HintCommon"])
                hintObj.transform:SetParent(layer, false)
                hint = UIUtil.createComponent(hintObj, HintCommon)
                hint:init(data, moveCallback, destroyCallback)
            -- else
            --     cpn = UIUtil.createComponent('kHintItem', HintItem, layer)
            --     cpn:init(data[1], data[2], data[3], moveCallback, destroyCallback)
            end

            startRecord(hint)
        end
    )
    hintSequence:AppendInterval(_hintDeltaTime)
    hintSequence:OnComplete(
        function()
            this.checkHintList()
        end
    )
end

function UIGlobal.onNotifyHandler(_, data)
    local win = UIManager.getWindow("NotifyWindow")
    if win and win:isAlive() then
        win:setData(data)
    else
        UIManager.openWindow("NotifyWindow", nil, data)
    end
end

---道具获得提示列表
---@type table<UIGlobal_TipItems>
local tipItemSequence = {}
---全局提示道具的获得
function UIGlobal.onItemTipsHandler(_, data)
    if not data then
        Log("提示列表数据为 nil")
    else
        if data then
            table.insert(tipItemSequence, data)
        end
    end

    local windowState = UIManager.getWindow("ItemTipsWindow")
    local openFunc = function()
        if tipItemSequence and #tipItemSequence > 0 then
            for index, value in ipairs(tipItemSequence) do
                UIManager.openWindow(
                    "ItemTipsWindow",
                    function()
                        MsgCenter.sendMessage(Msg.BAG_INIT_ITEMTIPS, value)
                    end
                )
                table.remove(tipItemSequence, index)
                break
            end
        end
    end
    if windowState then
        if not windowState:isShow() then
            openFunc()
        end
    else
        openFunc()
    end
end

---打开通用道具基础信息界面
function UIGlobal.onShowItemBaseInfo(_, data)
    local config = BagManager.getItemConfigDataById(data)
    if config then
        UIManager.openWindow("ItemInfoShowWindow", nil, data)
    else
        Log(string.format("没有找到道具Id：%d 的配置文件", data))
    end
end

function UIGlobal.onShowLoadingHandler(_, clickClose, clickCallback)
    UIGlobal.loading:setData(clickClose, clickCallback)
    UIGlobal.loading:start()
end

function UIGlobal.onHideLoadingHandler(_)
    UIGlobal.loading:stop()
end

function UIGlobal.onLockScreenHandler(_, isLock)
    -- LogError(isLock)
    UIManager.lockScreen(isLock)
end