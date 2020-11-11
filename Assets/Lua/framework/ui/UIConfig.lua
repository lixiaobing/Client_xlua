-- @brief: UI窗口配置
-- @version: 1.0.0
-- @author lanqibo
-- @date: 8/8/2019
-- All rights reserved
UIConfig = {}
local this = UIConfig

UILayerNames = {
    UI = "UI",
    UIBg = "UIBg",
    UIBlack = "UIBlack",
    UIModel = "UIModel"
}

local LayerType = {
    Pool = 1, -- 缓存池
    Main = 2, -- 常驻UI
    Screen = 3, -- 全屏窗口
    ScreenUp = 4, -- 全屏窗口(公用)
    Window = 5, -- 常规窗口
    Popup1 = 6, -- 一级弹窗
    Popup2 = 7, -- 二级弹窗
    Popup3 = 8, -- 三级弹窗
    Popup4 = 9, -- 四级弹窗
    Popup5 = 10, -- 五级弹窗
    Guide1 = 11, -- 引导层
    Guide2 = 12, -- 引导时弹出的UI
    Loading = 13, -- 转场加载
    Notify = 14, -- 二次确认弹窗
    Hints = 15, -- 小提示
    Lock = 16, -- 锁定层
    Dark = 17, -- 黑屏层
    Popup = 99 -- 弹窗标识
}

local Layers = {
    "pool",
    "main",
    "screen",
    "screenup",
    "window",
    "popup1",
    "popup2",
    "popup3",
    "popup4",
    "popup5",
    "guide1",
    "guide2",
    "loading",
    "notify",
    "hints",
    "lock",
    "dark"
}

local BgConfig = {
    LoadSceneWindow = "bg_loadscene",
    SelectLevelWindow = "bg_main",
    LoginWindow = "bg_main",
    ChapterGarrisonWindow = "bg_window2",
    ChapterTaskWindow = "bg_window", --todo:老版本任务界面，即将被替换
    HeroWindow = "bg_sprite",
    HeroStageupWindow = "bg_sprite_stageup",
    HeroStarupWindow = "bg_sprite_stageup",
    HeroSelectWindow = "bg_window", --角色选择界面
    FormationWindow = "bg_window3", --阵容界面
    BagMainWindow = "bg_window", --背包界面
    EquipWindow = "bg_window",
    EquipSuitWindow = "bg_window",
    EquipGrowWindow = "bg_window",
    EquipStageupWindow = "bg_window",
    ShipWindow = "ship/bg_paintingback1",
    ShipTokenWindow = "bg_window",
    ShipScienceWindow = "bg_window",
    ShipMakeWindow = "bg_window",
    ShipPresenceWindow = "bg_window2",
    ShipPresenceSelectWindow = "bg_window2",
}

local CoverLayers = {6, 7, 8, 9, 10, 11, 13, 14}
local CoverDefaultColor = Color(0, 0, 0, 0.8)
local CoverColors = {
    BattlePauseWindow = Color(0, 0, 0, 0.95)
}

local Settings = {}

UIConfig.LayerType = LayerType
UIConfig.Layers = Layers
UIConfig.BgConfig = BgConfig
UIConfig.CoverLayers = CoverLayers
UIConfig.CoverDefaultColor = CoverDefaultColor
UIConfig.CoverColors = CoverColors
UIConfig.Settings = Settings

function UIConfig.getLayerTypeByName(name)
    for i, v in ipairs(Layers) do
        if v == name then
            return i
        end
    end
    return 0
end

--------------------------------------
-- @FuncName：add_setting
-- @Function：添加界面关系映射表
-- @param：window_name   窗口名字
-- @param：window_class  窗口类名
-- @param：window_path  窗口预制体所在路径
-- @param：window_layer  窗口所在层
-- @param：is_cache    窗口是否被缓存
--------------------------------------
local addSetting = function(window_name, window_class, window_path, window_layer, is_cache)
    Settings[window_name] = {}

    local set = Settings[window_name]
    --UI Prefab名称
    set.name = window_name
    --UI控制类
    set.class = window_class
    --Bundle名称
    set.path = window_path
    --所在层次
    set.layer = window_layer
    --是否缓存UI
    set.cache = is_cache
end

local initSetting = function()
    addSetting("TestAssetWindow", TestAssetWindow, "TestAssetWindow", UIConfig.LayerType.Popup, false)

    addSetting("ItemTipsWindow", ItemTipsWindow, "ItemTipsWindow", UIConfig.LayerType.Popup, true)

    addSetting("NotifyWindow", NotifyWindow, "NotifyWindow", UIConfig.LayerType.Popup, true)

    addSetting("LoadSceneWindow", LoadSceneWindow, "LoadSceneWindow", UIConfig.LayerType.Loading, false)

    addSetting("MainWindow", MainWindow, "MainWindow", UIConfig.LayerType.Screen, false)
    addSetting("BattleWindow", BattleWindow, "BattleWindow", UIConfig.LayerType.Screen, false)
    addSetting("BattleClearWindow", BattleClearWindow, "BattleClearWindow", UIConfig.LayerType.Window, false)
    addSetting("BattleGMWindow", BattleGMWindow, "GM/BattleGMWindow", UIConfig.LayerType.Window, false)
    addSetting("BattleHeroDebugWindow", BattleHeroDebugWindow, "GM/BattleHeroDebugWindow", UIConfig.LayerType.Window, false)

    addSetting("SelectLevelWindow", SelectLevelWindow, "SelectLevelWindow", UIConfig.LayerType.Screen, false)
    addSetting("BattlePauseWindow", BattlePauseWindow, "BattlePauseWindow", UIConfig.LayerType.Notify, false)
    addSetting("DialogWindow", DialogWindow, "DialogWindow", UIConfig.LayerType.Window, false)
    addSetting("NarratorWindow", NarratorWindow, "NarratorWindow", UIConfig.LayerType.Window, false)
    addSetting("BlockbusterWindow", BlockbusterWindow, "BlockbusterWindow", UIConfig.LayerType.Window, false)
    addSetting("VideoWindow", VideoWindow, "VideoWindow", UIConfig.LayerType.Window, false)
    addSetting("BossEnterShowWindow", BossEnterShowWindow, "BossEnterShowWindow", UIConfig.LayerType.Window, false)
    --角色场景跳转
    addSetting("LevelTransmitWindow", LevelTransmitWindow, "LevelTransmitWindow", UIConfig.LayerType.Window, false)
    addSetting("PositionTransmitWindow", PositionTransmitWindow, "PositionTransmitWindow", UIConfig.LayerType.Window, false)

    addSetting("BagMainWindow", BagMainWindow, "Bag/BagMainWindow", UIConfig.LayerType.Screen, false, true)
    addSetting("ItemInfoWindow", ItemInfoWindow, "Bag/ItemInfoWindow", UIConfig.LayerType.Popup, false)
    addSetting("ItemBoxUseWindow", ItemBoxUseWindow, "Bag/ItemBoxUseWindow", UIConfig.LayerType.Popup, false)
    addSetting("ItemBoxDetialWindow", ItemBoxDetialWindow, "Bag/ItemBoxDetialWindow", UIConfig.LayerType.Popup, false)

    addSetting("LoginWindow", LoginWindow, "LoginWindow", UIConfig.LayerType.Screen, false)
    
    addSetting("BoxRewardWindow", BoxRewardWindow, "Chapter/BoxRewardWindow", UIConfig.LayerType.Window, false)
    addSetting("TaskRewardWindow", TaskRewardWindow, "Chapter/TaskRewardWindow", UIConfig.LayerType.Window, false)
    addSetting("TaskDetailsWindow", TaskDetailsWindow, "Chapter/TaskDetailsWindow", UIConfig.LayerType.Popup, false)
    addSetting("EventCheckWindow", EventCheckWindow, "Chapter/EventCheckWindow", UIConfig.LayerType.Window, false)

    --关卡/挂机系统
    addSetting("ChapterWindow", ChapterWindow, "Chapter/ChapterWindow", UIConfig.LayerType.Screen, false)
    addSetting("ChapterDetailWindow", ChapterDetailWindow, "Chapter/ChapterDetailWindow", UIConfig.LayerType.Screen, false)
    addSetting("ChapterTopInfoWindow", ChapterTopInfoWindow, "Chapter/ChapterTopInfoWindow", UIConfig.LayerType.Screen, false)
    addSetting("ChapterTopShopWindow", ChapterTopShopWindow, "Chapter/ChapterTopShopWindow", UIConfig.LayerType.Screen, false)
    addSetting("ChapterTopAreaWindow", ChapterTopAreaWindow, "Chapter/ChapterTopAreaWindow", UIConfig.LayerType.Screen, false)
    addSetting("ChapterSearchConfirmWindow", ChapterSearchConfirmWindow, "Chapter/ChapterSearchConfirmWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterSearchSpeedUpWindow", ChapterSearchSpeedUpWindow, "Chapter/ChapterSearchSpeedUpWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterSearchResultWindow", ChapterSearchResultWindow, "Chapter/ChapterSearchResultWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterSearchRewardWindow", ChapterSearchRewardWindow, "Chapter/ChapterSearchRewardWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterSearchSpeedUpWindow", ChapterSearchSpeedUpWindow, "Chapter/ChapterSearchSpeedUpWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterSearchEventWindow", ChapterSearchEventWindow, "Chapter/ChapterSearchEventWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterGarrisonWindow", ChapterGarrisonWindow, "Chapter/ChapterGarrisonWindow", UIConfig.LayerType.Screen, false)
    addSetting("ChapterGarrisonFormationWindow", ChapterGarrisonFormationWindow, "Chapter/ChapterGarrisonFormationWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterGarrisonRewardWindow", ChapterGarrisonRewardWindow, "Chapter/ChapterGarrisonRewardWindow", UIConfig.LayerType.Popup, false)
    addSetting("ChapterTaskWindow", ChapterTaskWindow, "Chapter/ChapterTaskWindow", UIConfig.LayerType.Screen, false)
    
    --任务（常规）系统
    addSetting("TaskWindow", TaskWindow, "Task/TaskWindow", UIConfig.LayerType.Screen, false)

    addSetting("HeroWindow", HeroWindow, "Hero/HeroWindow", UIConfig.LayerType.Screen, false)
    addSetting("HeroStageupWindow", HeroStageupWindow, "Hero/HeroStageupWindow", UIConfig.LayerType.Screen, false)
    addSetting("HeroStarupWindow", HeroStarupWindow, "Hero/HeroStarupWindow", UIConfig.LayerType.Screen, false)
    
    addSetting("EquipWindow", EquipWindow, "Equip/EquipWindow", UIConfig.LayerType.Screen, false)
    addSetting("EquipSuitWindow", EquipSuitWindow, "Equip/EquipSuitWindow", UIConfig.LayerType.Screen, false)
    addSetting("EquipGrowWindow", EquipGrowWindow, "Equip/EquipGrowWindow", UIConfig.LayerType.Screen, false)

    --上阵角色选择
    addSetting("HeroSelectWindow", HeroSelectWindow, "Formation/HeroSelectWindow", UIConfig.LayerType.Screen, false)
    --阵行界面
    addSetting("FormationWindow", FormationWindow, "Formation/FormationWindow", UIConfig.LayerType.Screen, false)

    addSetting("ItemInfoShowWindow", ItemInfoShowWindow, "ItemInfoShowWindow", UIConfig.LayerType.Popup, false)
    addSetting("GMWindow", GMWindow, "GM/GMWindow", UIConfig.LayerType.Popup, false)
    addSetting("EquipInfoWindow", EquipInfoWindow, "EquipInfoWindow", UIConfig.LayerType.Popup, false)
    addSetting("JumpGetWindow", JumpGetWindow, "JumpGetWindow", UIConfig.LayerType.Popup, false)
    addSetting("EquipUsedWindow", EquipUsedWindow, "Equip/EquipUsedWindow", UIConfig.LayerType.Popup, false)
    addSetting("EquipSuitInBagWindow", EquipSuitInBagWindow, "EquipSuitInBagWindow", UIConfig.LayerType.Popup, false)
    addSetting("EquipInfoPopupWindow", EquipInfoPopupWindow, "Equip/EquipInfoPopupWindow", UIConfig.LayerType.Popup, false)
    addSetting("EquipBreakPopup", EquipBreakPopup, "Equip/EquipBreakPopup", UIConfig.LayerType.Popup, false)
    addSetting("EquipStageupWindow", EquipStageupWindow, "Equip/EquipStageupWindow", UIConfig.LayerType.Screen, false)
    addSetting("EquipOwnChangeSuitPopup", EquipOwnChangeSuitPopup, "Equip/EquipOwnChangeSuitPopup", UIConfig.LayerType.Popup, false)

    addSetting("ShipWindow", ShipWindow, "Ship/ShipWindow", UIConfig.LayerType.Screen, false)
    addSetting("ShipPopup", ShipPopup, "Ship/ShipPopup", UIConfig.LayerType.Popup, false)
    addSetting("ShipTokenWindow", ShipTokenWindow, "Ship/ShipTokenWindow", UIConfig.LayerType.Screen, false)
    addSetting("ShipScienceWindow", ShipScienceWindow, "Ship/ShipScienceWindow", UIConfig.LayerType.Screen, false)
    addSetting("ShipMakeWindow", ShipMakeWindow, "Ship/ShipMakeWindow", UIConfig.LayerType.Screen, false)
    addSetting("ShipMake_SpeedPopup", ShipMake_SpeedPopup, "Ship/ShipMake_SpeedPopup", UIConfig.LayerType.Popup, false)
    addSetting("ShipMake_DetailPopup", ShipMake_DetailPopup, "Ship/ShipMake_DetailPopup", UIConfig.LayerType.Popup, false)
    addSetting("ShipMake_RecievePopup", ShipMake_RecievePopup, "Ship/ShipMake_RecievePopup", UIConfig.LayerType.Popup, false)
   
    addSetting("ShipPresenceWindow", ShipPresenceWindow, "Ship/ShipPresenceWindow", UIConfig.LayerType.Screen, false)
    addSetting("ShipPresenceSelectWindow", ShipPresenceSelectWindow, "Ship/ShipPresenceSelectWindow", UIConfig.LayerType.Screen, false)
    addSetting("ShipPresence_HeroTipPopup", ShipPresence_HeroTipPopup, "Ship/ShipPresence_HeroTipPopup", UIConfig.LayerType.Popup, false)
    addSetting("ShipToken_SuccessPopup", ShipToken_SuccessPopup, "Ship/ShipToken_SuccessPopup", UIConfig.LayerType.Popup, false)

    addSetting("MultiFightWaitingWindow", MultiFightWaitingWindow, "MultiFightWaitingWindow", UIConfig.LayerType.Screen, false)
end

function UIConfig.init()
    initSetting()
    UIManager.init()
end
