local c2s = {}
--[[
	[1] = {--ReqClientLoadSuccess
	}
--]]
c2s.LOGIN_REQ_CLIENT_LOAD_SUCCESS = 990100008

--[[
	[1] = {--ReqChatMsg
		[1] = 'int32':channel	[	聊天类型:1.公共 2.私聊;3.帮派 4.系统 5.队伍]
		[2] = 'int32':fun	[ 	功能类型:1.聊天 2.深渊组队邀请]
		[3] = 'string':content	[  内容;]
		[4] = 'int32':playerId	[  私聊玩家编号]
	}
--]]
c2s.CHAT_REQ_CHAT = 610100001

--[[
	[1] = {--ReqStrengthenEquip
		[1] = 'string':equipId	[ 装备实例id]
		[2] = 'repeated string':consumeEquipIds	[ 被消耗的装备]
		[3] = {--repeated ItemData
			[1] = 'int32':itemId
			[2] = 'int32':itemNum
		},
	}
--]]
c2s.HERO_REQ_STRENGTHEN_EQUIP = 140100044

--[[
	[1] = {--GetOrderNo
		[1] = 'int32':goodsId	[商品id]
		[2] = 'string':extinfo	[额外信息 json]
	}
--]]
c2s.RECHARGE_GET_ORDER_NO = 980100001

--[[
	[1] = {--ReqChangeShowedHero
		[1] = 'int32':showedHero	[ 某一个精灵ID]
	}
--]]
c2s.HERO_REQ_CHANGE_SHOWED_HERO = 140100003

--[[
	[1] = {--ReqItemRecoverInfo
	}
--]]
c2s.ITEM_REQ_ITEM_RECOVER_INFO = 110100011

--[[
	[1] = {--ReqEventChange
		[1] = 'int32':eventType	[ 事件类型 0 任务由于不用保存进度并且是由客户端判断的 所以客户端直接通知服务器完成]
		[2] = 'string':param	[ 事件参数 0 ["id":任务id] 由于子任务id是唯一的,所以是子任务就发子任务id]
	}
--]]
c2s.TASK_REQ_EVENT_CHANGE = 410100003

--[[
	[1] = {--GetFormations
	}
--]]
c2s.PLAYER_GET_FORMATIONS = 510100004

--[[
	[1] = {--ReqHeroDiyAndSystemGoIntoFormation
		[1] = 'int32':dungeonId	[ 关卡id]
		[2] = 'int32':heroId	[ 精灵id]
		[3] = 'int32':position	[ 上阵的位置]
	}
--]]
c2s.HERO_REQ_HERO_DIY_AND_SYSTEM_GO_INTO_FORMATION = 140100035

--[[
	[1] = {--ReqOperate
		[1] = 'int32':type	[ 操作类型]
		[2] = 'repeated int32':targets	[ 目标ID]
	}
--]]
c2s.FRIEND_REQ_OPERATE = 610200004

--[[
	[1] = {--ReqPutOnEquip
		[1] = 'int32':heroId	[ 精灵id]
		[2] = 'string':equipId	[ 装备实例id]
	}
--]]
c2s.HERO_REQ_PUT_ON_EQUIP = 140100042

--[[
	[1] = {--ReqSetBackground
		[1] = 'int32':dayBackground	[ 白天背景]
		[2] = 'int32':nightBackground	[夜晚背景]
		[3] = 'int32':dayBGM	[白天bgm]
		[4] = 'int32':nightBGM	[夜晚bgm]
	}
--]]
c2s.PLAYER_REQ_SET_BACKGROUND = 510100014

--[[
	[1] = {--ReqEnterGame
		[1] = 'string':token	[ 信息]
		[2] = 'int32':anti	[ 防沉迷状态: 1-认证已成年 2-认证未成年 3-未认证    // 防沉迷状态: 1-认证已成年 2-认证未成年 3-未认证]
	}
--]]
c2s.LOGIN_REQ_ENTER_GAME = 990100001

--[[
	[1] = {--ReqCancelExplore
	}
--]]
c2s.EXPLORE_REQ_CANCEL_EXPLORE = 510300005

--[[
	[1] = {--ReqAskSwitch
	}
--]]
c2s.PLAYER_REQ_ASK_SWITCH = 510100012

--[[
	[1] = {--ReqPutDownAllEquips
		[1] = 'int32':heroId	[ 精灵id]
	}
--]]
c2s.HERO_REQ_PUT_DOWN_ALL_EQUIPS = 140100041

--[[
	[1] = {--ReqWelfareInfo
	}
--]]
c2s.PLAYER_REQ_WELFARE_INFO = 510100013

--[[
	[1] = {--GetPlayerInfo
	}
--]]
c2s.PLAYER_GET_PLAYER_INFO = 510100003

--[[
	[1] = {--ReqFightOver
	}
--]]
c2s.DUNGEON_REQ_FIGHT_OVER = 230100006

--[[
	[1] = {--ReqOpenBag
	}
--]]
c2s.ITEM_REQ_OPEN_BAG = 110100003

--[[
	[1] = {--ReqAddDiyEquipScheme
		[1] = 'string':name	[ 方案名]
		[2] = 'int32':heroId	[ 哪个精灵当前穿戴的装备作为方案保存]
	}
--]]
c2s.HERO_REQ_ADD_DIY_EQUIP_SCHEME = 140100049

--[[
	[1] = {--ReqDungeonInfo
	}
--]]
c2s.DUNGEON_REQ_DUNGEON_INFO = 230100001

--[[
	[1] = {--GetTotalPayRewardInfo
	}
--]]
c2s.RECHARGE_GET_TOTAL_PAY_REWARD_INFO = 980100004

--[[
	[1] = {--ReqChargeExchange
		[1] = 'int32':rechargeId	[充值档位id]
		[2] = 'string':discountId	[折扣券道具id]
		[3] = 'int32':redPackId	[社团红包id]
		[4] = 'string':bless	[社团红包祝福]
		[5] = 'int32':buyCount	[兑换数量]
	}
--]]
c2s.RECHARGE_REQ_CHARGE_EXCHANGE = 980100007

--[[
	[1] = {--ReqDungeonTaskInfo
	}
--]]
c2s.TASK_REQ_DUNGEON_TASK_INFO = 410100001

--[[
	[1] = {--ReqRewardTotalPay
		[1] = 'int32':id	[奖励id]
	}
--]]
c2s.RECHARGE_REQ_REWARD_TOTAL_PAY = 980100006

--[[
	[1] = {--ReqReceiveTask
		[1] = 'int32':taskId	[任务Id]
	}
--]]
c2s.TASK_REQ_RECEIVE_TASK = 410100013

--[[
	[1] = {--ReqHeroSkillLevelUp
		[1] = 'int32':heroId	[ 精灵id]
		[2] = 'int32':skillType	[ 技能类型]
	}
--]]
c2s.HERO_REQ_HERO_SKILL_LEVEL_UP = 140100021

--[[
	[1] = {--ReqFightStart
		[1] = 'int32':levelCid	[主线副本这里传的是章节上一次关卡保存点]
	}
--]]
c2s.DUNGEON_REQ_FIGHT_START = 230100003

--[[
	[1] = {--GetMails
	}
--]]
c2s.MAIL_GET_MAILS = 610300002

--[[
	[1] = {--ReqEquipAwake
		[1] = 'string':equipId	[ 装备实例id]
		[2] = 'string':consumeEquipId	[ 被消耗的装备]
		[3] = 'int32':itemId	[ 被消耗的道具]
		[4] = 'int32':slotId	[ 装备的槽位id]
		[5] = 'int32':heroId	[ 选择绑定的精灵id进行觉醒(填0则表示对所有精灵适用)    // 选择绑定的精灵id进行觉醒(填0则表示对所有精灵适用)]
	}
--]]
c2s.HERO_REQ_EQUIP_AWAKE = 140100046

--[[
	[1] = {--ReqDiyEquipSchemeChangeName
		[1] = 'int32':schemeId	[ 自定义方案的id]
		[2] = 'string':newName	[ 新名字]
	}
--]]
c2s.HERO_REQ_DIY_EQUIP_SCHEME_CHANGE_NAME = 140100048

--[[
	[1] = {--ReqReceiveExploreAward
	}
--]]
c2s.EXPLORE_REQ_RECEIVE_EXPLORE_AWARD = 510300004

--[[
	[1] = {--ReqShipTalentLevelUp
		[1] = 'int32':talentId	[ 科技id]
	}
--]]
c2s.SHIP_REQ_SHIP_TALENT_LEVEL_UP = 510200032

--[[
	[1] = {--ReqEquipBreakthrough
		[1] = 'string':equipId	[ 装备实例id]
	}
--]]
c2s.HERO_REQ_EQUIP_BREAKTHROUGH = 140100045

--[[
	[1] = {--ReqBattleLoadComplete
		[1] = 'int32':playerInputId
		[2] = 'string':roomId
	}
--]]
c2s.BATTLE_REQ_BATTLE_LOAD_COMPLETE = 220100002

--[[
	[1] = {--ReqAcceptDungeonTask
		[1] = 'int32':taskId	[任务Id]
		[2] = 'int32':subTaskId	[子任务id]
	}
--]]
c2s.TASK_REQ_ACCEPT_DUNGEON_TASK = 410100002

--[[
	[1] = {--ReqInitChatInfo
	}
--]]
c2s.CHAT_REQ_INIT_CHAT_INFO = 610100003

--[[
	[1] = {--ReqBackgroundInfo
	}
--]]
c2s.PLAYER_REQ_BACKGROUND_INFO = 510100015

--[[
	[1] = {--ReqBindInviteCode
		[1] = 'string':inviteCode	[ 邀请码]
	}
--]]
c2s.FRIEND_REQ_BIND_INVITE_CODE = 610200006

--[[
	[1] = {--ReqRecommendFriends
	}
--]]
c2s.FRIEND_REQ_RECOMMEND_FRIENDS = 610200002

--[[
	[1] = {--ReqReceiveDungeonTask
		[1] = 'int32':taskId	[任务Id  不能是子任务id]
	}
--]]
c2s.TASK_REQ_RECEIVE_DUNGEON_TASK = 410100004

--[[
	[1] = {--Settings
		[1] = 'string':data	[数据]
	}
--]]
c2s.PLAYER_SETTINGS = 510100010

--[[
	[1] = {--ReqShopsAllInfo
	}
--]]
c2s.SHOP_REQ_SHOPS_ALL_INFO = 710200001

--[[
	[1] = {--ReqTaskInfo
	}
--]]
c2s.TASK_REQ_TASK_INFO = 410100011

--[[
	[1] = {--ReqOperateConsole
		[1] = 'int32':consoleId	[控制台id]
	}
--]]
c2s.DUNGEON_REQ_OPERATE_CONSOLE = 230100004

--[[
	[1] = {--ReqFriends
	}
--]]
c2s.FRIEND_REQ_FRIENDS = 610200001

--[[
	[1] = {--ReqHeroLevelUpBreakthrough
		[1] = 'int32':heroId	[ 精灵id]
	}
--]]
c2s.HERO_REQ_HERO_LEVEL_UP_BREAKTHROUGH = 140100005

--[[
	[1] = {--ReqShopBuyGoods
		[1] = 'int32':shopId	[ 商店id]
		[2] = 'int32':goodsId	[ 商品id]
		[3] = 'int32':buyNum	[ 购买数量]
	}
--]]
c2s.SHOP_REQ_SHOP_BUY_GOODS = 710200002

--[[
	[1] = {--ReqShopRefresh
		[1] = 'int32':shopId	[ 商店id]
	}
--]]
c2s.SHOP_REQ_SHOP_REFRESH = 710200005

--[[
	[1] = {--ReqExploreInfo
	}
--]]
c2s.EXPLORE_REQ_EXPLORE_INFO = 510300001

--[[
	[1] = {--ReqShipItemUnlock
		[1] = 'int32':templateId	[ 信物的模板id]
	}
--]]
c2s.SHIP_REQ_SHIP_ITEM_UNLOCK = 510200011

--[[
	[1] = {--ReqHeroStarUpActivateNode
		[1] = 'int32':heroId	[ 精灵id]
		[2] = 'int32':nodeId	[ 节点id]
	}
--]]
c2s.HERO_REQ_HERO_STAR_UP_ACTIVATE_NODE = 140100011

--[[
	[1] = {--ReqShipAllInfo
	}
--]]
c2s.SHIP_REQ_SHIP_ALL_INFO = 510200001

--[[
	[1] = {--ReqShipItemStarUp
		[1] = 'string':shipItemId
	}
--]]
c2s.SHIP_REQ_SHIP_ITEM_STAR_UP = 510200012

--[[
	[1] = {--ReqShipBuildingTakeProduct
		[1] = 'int32':buildingId	[ 建筑id]
	}
--]]
c2s.SHIP_REQ_SHIP_BUILDING_TAKE_PRODUCT = 510200023

--[[
	[1] = {--ReqChangeAntiAddiction
		[1] = 'int32':anti	[当前防沉迷状态]
	}
--]]
c2s.PLAYER_REQ_CHANGE_ANTI_ADDICTION = 510100011

--[[
	[1] = {--ReqSetEquipLock
		[1] = 'string':equipId	[ 装备实例id]
		[2] = 'bool':lock	[ true:锁定 false:解锁]
	}
--]]
c2s.HERO_REQ_SET_EQUIP_LOCK = 140100053

--[[
	[1] = {--ReqPutDownEquip
		[1] = 'int32':heroId	[ 精灵id]
		[2] = 'string':equipId	[ 装备实例id]
	}
--]]
c2s.HERO_REQ_PUT_DOWN_EQUIP = 140100043

--[[
	[1] = {--ReqStartExplore
		[1] = 'int32':chapter	[章节Id]
	}
--]]
c2s.EXPLORE_REQ_START_EXPLORE = 510300002

--[[
	[1] = {--ReqHeroDiyGoIntoFormation
		[1] = 'int32':index	[ 对哪一套阵容进行上阵操作]
		[2] = 'int32':heroId	[ 上阵的精灵id]
		[3] = 'int32':position	[ 精灵上阵选择的位置]
	}
--]]
c2s.HERO_REQ_HERO_DIY_GO_INTO_FORMATION = 140100032

--[[
	[1] = {--ReqShipBuildingHeroEnter
		[1] = 'int32':buildingId	[ 建筑id]
		[2] = 'int32':heroId	[ 精灵id]
		[3] = 'int32':position	[ 精灵入驻的位置]
	}
--]]
c2s.SHIP_REQ_SHIP_BUILDING_HERO_ENTER = 510200025

--[[
	[1] = {--ReqDestroyObstacle
		[1] = 'int32':obstacleId	[控制台id]
	}
--]]
c2s.DUNGEON_REQ_DESTROY_OBSTACLE = 230100005

--[[
	[1] = {--GetTotalPayRewardCfg
	}
--]]
c2s.RECHARGE_GET_TOTAL_PAY_REWARD_CFG = 980100005

--[[
	[1] = {--ReqDeleteDiyEquipScheme
		[1] = 'int32':schemeId	[ 自定义方案的id]
	}
--]]
c2s.HERO_REQ_DELETE_DIY_EQUIP_SCHEME = 140100050

--[[
	[1] = {--ReqBattleResult
{},
	}
--]]
c2s.BATTLE_REQ_BATTLE_RESULT = 220100006

--[[
	[1] = {--ReqReconnect
		[1] = 'string':token	[ 信息]
		[2] = 'int32':anti	[ 防沉迷状态: 1-认证已成年 2-认证未成年 3-未认证    // 防沉迷状态: 1-认证已成年 2-认证未成年 3-未认证]
	}
--]]
c2s.LOGIN_REQ_RECONNECT = 990100002

--[[
	[1] = {--ReqExploreHeroGoIntoFormation
		[1] = 'int32':chapter	[章节Id]
		[2] = 'int32':heroId	[上阵的精灵id]
		[3] = 'int32':position	[精灵上阵选择的位置]
	}
--]]
c2s.EXPLORE_REQ_EXPLORE_HERO_GO_INTO_FORMATION = 510300010

--[[
	[1] = {--ReqAcceptTask
		[1] = 'int32':taskId	[任务Id]
	}
--]]
c2s.TASK_REQ_ACCEPT_TASK = 410100012

--[[
	[1] = {--ReqUseEquipScheme
		[1] = 'bool':type	[ true:使用推荐方案 false:使用自定义方案]
		[2] = 'int32':schemeId	[ 方案的id]
		[3] = 'int32':heroId	[ 精灵id]
		[4] = 'repeated string':equipIds	[ 推荐方案(发送装备id)    // 推荐方案(发送装备id)]
	}
--]]
c2s.HERO_REQ_USE_EQUIP_SCHEME = 140100051

--[[
	[1] = {--ReqShipBuildingSpeedUp
		[1] = 'int32':buildingId	[ 建筑id]
		[2] = 'int32':madeNum	[ 加速的制造数量]
	}
--]]
c2s.SHIP_REQ_SHIP_BUILDING_SPEED_UP = 510200022

--[[
	[1] = {--ReqPickupReward
		[1] = 'int32':itemId	[ 道具id]
		[2] = 'int32':num
	}
--]]
c2s.DUNGEON_REQ_PICKUP_REWARD = 230100012

--[[
	[1] = {--OperateFormation
		[1] = 'int32':formationType
		[2] = 'string':sourceHeroId
		[3] = 'string':targetHeroId
	}
--]]
c2s.PLAYER_OPERATE_FORMATION = 510100002

--[[
	[1] = {--ReqStartBattle
		[1] = 'int32':levelId
	}
--]]
c2s.BATTLE_REQ_START_BATTLE = 220100001

--[[
	[1] = {--ChangeHelpFightHero
		[1] = 'string':heroId
	}
--]]
c2s.PLAYER_CHANGE_HELP_FIGHT_HERO = 510100005

--[[
	[1] = {--ReqFightPrepare
		[1] = 'int32':levelCid	[主线副本这里传的是章节上一次关卡保存点]
	}
--]]
c2s.DUNGEON_REQ_FIGHT_PREPARE = 230100002

--[[
	[1] = {--ReqExploreSpeedUp
		[1] = 'int32':count	[ 加速次数]
	}
--]]
c2s.EXPLORE_REQ_EXPLORE_SPEED_UP = 510300003

--[[
	[1] = {--ReqHeroLevelUpAddExp
		[1] = {--repeated ItemData
			[1] = 'int32':itemId
			[2] = 'int32':itemNum
		},
		[2] = 'int32':heroId	[ 精灵id]
	}
--]]
c2s.HERO_REQ_HERO_LEVEL_UP_ADD_EXP = 140100004

--[[
	[1] = {--ReqHeroDiyAndSystemGoOutFormation
		[1] = 'int32':dungeonId	[ 关卡id]
		[2] = 'int32':position	[ 下阵的位置]
	}
--]]
c2s.HERO_REQ_HERO_DIY_AND_SYSTEM_GO_OUT_FORMATION = 140100036

--[[
	[1] = {--ReqHeroDiyGoOutFormation
		[1] = 'int32':index	[ 对哪一套阵容进行上阵操作]
		[2] = 'int32':position	[ 下阵的位置]
	}
--]]
c2s.HERO_REQ_HERO_DIY_GO_OUT_FORMATION = 140100034

--[[
	[1] = {--ReqChangeRoom
		[1] = 'int32':roomId	[房间号  < 0 则随机,否则转到指定房间]
	}
--]]
c2s.CHAT_REQ_CHANGE_ROOM = 610100002

--[[
	[1] = {--ReqShipTalentUnlock
		[1] = 'int32':talentId	[ 科技id]
	}
--]]
c2s.SHIP_REQ_SHIP_TALENT_UNLOCK = 510200031

--[[
	[1] = {--ReqHelpFightPlayers
	}
--]]
c2s.PLAYER_REQ_HELP_FIGHT_PLAYERS = 510100008

--[[
	[1] = {--SetPlayerInfo
		[1] = 'string':playerName	[ 玩家名字]
		[2] = 'string':remark	[ 玩家宣言]
	}
--]]
c2s.PLAYER_SET_PLAYER_INFO = 510100001

--[[
	[1] = {--ReqRewardInvite
		[1] = 'int32':cid	[ 对应邀请奖励配置表id]
	}
--]]
c2s.FRIEND_REQ_REWARD_INVITE = 610200007

--[[
	[1] = {--PanelStayTime
		[1] = 'int32':id	[面板功能id]
		[2] = 'int32':time	[面板停留时长]
	}
--]]
c2s.PLAYER_PANEL_STAY_TIME = 510100016

--[[
	[1] = {--MailHandleMsg
		[1] = 'repeated string':ids	[ 邮件ID]
		[2] = {--MailOperationType(enum)
			'v4':MailOperationType
		},
	}
--]]
c2s.MAIL_MAIL_HANDLE = 610300001

--[[
	[1] = {--ReqHeroStarUpStarUp
		[1] = 'int32':heroId	[ 精灵id]
	}
--]]
c2s.HERO_REQ_HERO_STAR_UP_STAR_UP = 140100012

--[[
	[1] = {--ReqPing
	}
--]]
c2s.LOGIN_REQ_PING = 990100003

--[[
	[1] = {--ReqGetHerosInfo
	}
--]]
c2s.HERO_REQ_GET_HEROS_INFO = 140100001

--[[
	[1] = {--ReqUnlockedFunction
	}
--]]
c2s.LOGIN_REQ_UNLOCKED_FUNCTION = 990100009

--[[
	[1] = {--ReqFunctionSwitch
	}
--]]
c2s.LOGIN_REQ_FUNCTION_SWITCH = 990100005

--[[
	[1] = {--ReqHeroFormations
	}
--]]
c2s.HERO_REQ_HERO_FORMATIONS = 140100031

--[[
	[1] = {--ReqPullFightData
		[1] = 'int32':levelCid	[主线副本这里传的是客户端当前关卡id]
	}
--]]
c2s.DUNGEON_REQ_PULL_FIGHT_DATA = 230100007

--[[
	[1] = {--ReqSwitchFormation
		[1] = 'int32':formationType
	}
--]]
c2s.PLAYER_REQ_SWITCH_FORMATION = 510100007

--[[
	[1] = {--ReqUnlockOneHero
		[1] = 'int32':id	[ 精灵id]
	}
--]]
c2s.HERO_REQ_UNLOCK_ONE_HERO = 140100002

--[[
	[1] = {--ReqTransformation
		[1] = 'string':itemId
		[2] = 'int32':num
	}
--]]
c2s.ITEM_REQ_TRANSFORMATION = 110100004

--[[
	[1] = {--GetBuyRecordInfo
	}
--]]
c2s.RECHARGE_GET_BUY_RECORD_INFO = 980100002

--[[
	[1] = {--ReqGetFriendInviteInfo
	}
--]]
c2s.FRIEND_REQ_GET_FRIEND_INVITE_INFO = 610200005

--[[
	[1] = {--ReqEquipAwakeSelect
		[1] = 'string':equipId	[ 装备实例id]
		[2] = 'bool':selectNew	[ 选择新技能]
		[3] = 'int32':slotId	[ 槽位id]
	}
--]]
c2s.HERO_REQ_EQUIP_AWAKE_SELECT = 140100047

--[[
	[1] = {--ReqHeroSpecifyDiyFormation
		[1] = 'int32':index	[ 哪一套阵容]
	}
--]]
c2s.HERO_REQ_HERO_SPECIFY_DIY_FORMATION = 140100033

--[[
	[1] = {--ReqUseItem
		[1] = 'string':itemId
		[2] = 'int32':num
		[3] = 'int32':selectedId	[ 自选宝箱 选择的配置道具id]
	}
--]]
c2s.ITEM_REQ_USE_ITEM = 110100002

--[[
	[1] = {--ReqReceiveGarrisonAward
		[1] = 'int32':chapter	[章节Id]
	}
--]]
c2s.EXPLORE_REQ_RECEIVE_GARRISON_AWARD = 510300006

--[[
	[1] = {--ReqExploreHeroGoOutFormation
		[1] = 'int32':chapter	[章节Id]
		[2] = 'int32':position	[下阵的位置]
	}
--]]
c2s.EXPLORE_REQ_EXPLORE_HERO_GO_OUT_FORMATION = 510300011

--[[
	[1] = {--ReqGetItems
	}
--]]
c2s.ITEM_REQ_GET_ITEMS = 110100001

--[[
	[1] = {--ReqTargetPlayerInfo
		[1] = 'int32':targetPid
	}
--]]
c2s.PLAYER_REQ_TARGET_PLAYER_INFO = 510100006

--[[
	[1] = {--ReqkillMonster
		[1] = 'string':monsterId	[ 怪物实体id]
	}
--]]
c2s.DUNGEON_REQKILL_MONSTER = 230100011

--[[
	[1] = {--RecordClientErr
		[1] = 'string':err	[数据]
	}
--]]
c2s.PLAYER_RECORD_CLIENT_ERR = 510100009

--[[
	[1] = {--ReqServerTime
	}
--]]
c2s.LOGIN_REQ_SERVER_TIME = 990100004

--[[
	[1] = {--GetRechargeCfg
	}
--]]
c2s.RECHARGE_GET_RECHARGE_CFG = 980100003

--[[
	[1] = {--ReqBattlePlayerInput
{},
		[2] = 'int32':playerInputId	[ 输入id,测试阶段客户端使用 RespBattleEnter.players 索引即可, 之后服务器分配给玩家,防止作弊]
	}
--]]
c2s.BATTLE_REQ_BATTLE_PLAYER_INPUT = 220100004

--[[
	[1] = {--ReqQueryPlayer
		[1] = 'int32':pid	[ 玩家ID]
	}
--]]
c2s.FRIEND_REQ_QUERY_PLAYER = 610200003

return c2s