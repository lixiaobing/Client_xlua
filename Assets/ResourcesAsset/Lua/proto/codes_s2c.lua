local s2c = {}
--[[
	[1] = {--ResEquipBreakthrough
		[1] = {--EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_EQUIP_BREAKTHROUGH = 140100045

--[[
	[1] = {--GetOrderNo
		[1] = 'string':orderNo	[订单号]
		[2] = 'int32':goodsId	[商品id]
	}
--]]
s2c.RECHARGE_GET_ORDER_NO = 980100001

--[[
	[1] = {--ResTaskInfo
		[1] = {--repeated TaskInfo
			[1] = 'int32':cid
			[2] = {--repeated TaskEventInfo
				[1] = 'int32':id
				[2] = 'int32':progress
				[3] = 'bool':isFinish
			},
			[3] = 'int32':status	[ 任务状态 1:进行中 2:完成 3:领奖]
		},
	}
--]]
s2c.TASK_RES_TASK_INFO = 410100011

--[[
	[1] = {--ResHeroDiyAndSystemGoIntoFormation
		[1] = {--FormationInfo
			[1] = {--repeated FormationPostion
				[1] = 'int32':heroId	[ 精灵id]
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
	}
--]]
s2c.HERO_RES_HERO_DIY_AND_SYSTEM_GO_INTO_FORMATION = 140100035

--[[
	[1] = {--ResExploreHeroGoOutFormation
		[1] = 'int32':chapter	[章节Id]
		[2] = {--ExploreGarrisonFmt
			[1] = {--FormationInfo
				[1] = {--repeated FormationPostion
					[1] = 'int32':heroId	[ 精灵id]
					[2] = 'int32':position	[ 精灵位置]
					[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
				},
			},
			[2] = 'repeated int32':condition	[驻守事件达成条件索引,从1开始]
		},
	}
--]]
s2c.EXPLORE_RES_EXPLORE_HERO_GO_OUT_FORMATION = 510300011

--[[
	[1] = {--ResServerTime
		[1] = 'int32':serverTime	[服务器时间]
	}
--]]
s2c.LOGIN_RES_SERVER_TIME = 990100004

--[[
	[1] = {--ResRewardTotalPay
		[1] = 'int32':id	[id]
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.RECHARGE_RES_REWARD_TOTAL_PAY = 980100006

--[[
	[1] = {--RespEnterBattle
	}
--]]
s2c.BATTLE_RESP_ENTER_BATTLE = 220100003

--[[
	[1] = {--ResDungeonTaskInfo
		[1] = {--repeated DungeonTaskInfo
			[1] = 'int32':cid	[任务id]
			[2] = 'int32':progress	[任务进度]
			[3] = 'int32':status	[ 任务状态 1:进行中 2:已完成]
			[4] = 'repeated DungeonTaskInfo':subTask	[子任务]
		},
	}
--]]
s2c.TASK_RES_DUNGEON_TASK_INFO = 410100001

--[[
	[1] = {--RespQueryPlayer
		[1] = {--repeated FriendInfo
			[1] = 'int32':pid	[ 玩家ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':fightPower	[ 战力]
			[4] = 'int32':lvl	[ 等级]
			[5] = 'int32':lastLoginTime	[ 最后登录时间]
			[6] = 'int32':lastHandselTime	[ 最后送礼时间]
			[7] = 'bool':receive	[ 是否能够领取]
			[8] = 'int32':status	[ 状态:1:好友,2:屏蔽,3:申请]
			[9] = 'int32':leaderCid	[ 英雄CID(队长)    // 英雄CID(队长)]
			[10] = 'bool':online	[ 是否在线]
			[11] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[12] = 'int32':time	[ 申请时间/加入黑名单时间等]
			[13] = 'int32':helpCDtime	[ 助战cd结束时间(秒)    // 助战cd结束时间(秒)]
			[14] = 'bool':canSend	[ 是否可以赠送]
			[15] = 'int32':portraitCid	[ 头像CID]
			[16] = 'int32':portraitFrameCid	[ 头像框CID]
			[17] = 'repeated int32':groupGiftIds	[团购礼包id]
		},
	}
--]]
s2c.FRIEND_RESP_QUERY_PLAYER = 610200003

--[[
	[1] = {--ResPullFightData
		[1] = 'bool':isSuccess	[是否成功重连]
		[2] = 'int32':levelCid	[关卡cid]
		[3] = 'int32':chapterId	[章节id]
		[4] = {--repeated ConsoleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
		[5] = {--repeated GateInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1开 2关]
		},
		[6] = {--repeated ObstacleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
		[7] = {--repeated MonsterInfo
			[1] = 'string':monsterId	[ 怪物实体id]
			[2] = 'int32':dropTime	[ 掉落次数]
		},
	}
--]]
s2c.DUNGEON_RES_PULL_FIGHT_DATA = 230100007

--[[
	[1] = {--ResTransformation
		[1] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.ITEM_RES_TRANSFORMATION = 110100004

--[[
	[1] = {--PushExploreArea
		[1] = {--repeated ExploreAreaData
			[1] = 'int32':area	[区域Id]
			[2] = 'int32':totalCnt	[最大探索次数]
			[3] = 'int32':fnshCnt	[已完成探索次数]
			[4] = 'bool':finish	[是否探索完成]
			[5] = 'int32':endTime	[当前次探索完成时间点]
		},
	}
--]]
s2c.EXPLORE_PUSH_EXPLORE_AREA = 510300008

--[[
	[1] = {--ResHeroPropertyChange
		[1] = 'int32':heroId
		[2] = {--repeated HeroAttribute
			[1] = 'int32':attrId
			[2] = 'int32':attrVal
		},
	}
--]]
s2c.HERO_RES_HERO_PROPERTY_CHANGE = 140100006

--[[
	[1] = {--ChatInfo
		[1] = 'int32':channel	[	聊天类型:1.公共 2.私聊;3.帮派 4.系统 5.队伍 6.队伍系统邀请]
		[2] = 'int32':fun	[ 	功能类型:1.聊天 2.深渊组队邀请  6系统消息]
		[3] = 'string':content	[	内容]
		[4] = 'int32':pid	[	说话人的id]
		[5] = 'string':pname	[	说话人名称]
		[6] = 'int32':lvl	[ 	玩家等级]
		[7] = 'int32':helpFightHeroCid
		[8] = 'int32':portraitCid	[玩家头像]
		[9] = 'int32':portraitFrameCid	[玩家头像框]
		[10] = 'int32':titleId	[称号]
		[11] = 'int32':chatFrameCid	[气泡框]
	}
--]]
s2c.CHAT_CHAT_INFO = 610100004

--[[
	[1] = {--ResTotalPayRewardCfg
		[1] = {--repeated TotalPayRewardCfg
			[1] = 'int32':id	[id]
			[2] = 'bool':canReward	[是否可以领取]
			[3] = 'int32':amount	[领取条件(累积充值x金额:分)    //领取条件(累积充值x金额:分)]
			[4] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[5] = 'int32':order	[排序]
			[6] = 'string':des	[描述]
		},
	}
--]]
s2c.RECHARGE_RES_TOTAL_PAY_REWARD_CFG = 980100005

--[[
	[1] = {--ResUnlockedFunction
		[1] = {--repeated FunctionData
			[1] = 'int32':unlockedFunctionId	[ 已解锁的功能id]
			[2] = 'bool':conditionIsMet	[ 条件是否满足]
		},
	}
--]]
s2c.LOGIN_RES_UNLOCKED_FUNCTION = 990100009

--[[
	[1] = {--ResLookDiyEquipScheme
		[1] = {--DiyEquipScheme
			[1] = 'int32':schemeId	[ 自定义方案索引]
			[2] = 'string':name	[ 方案名]
			[3] = 'repeated string':equipIds	[ 装备实例id]
		},
	}
--]]
s2c.HERO_RES_LOOK_DIY_EQUIP_SCHEME = 140100052

--[[
	[1] = {--ResReconnect
	}
--]]
s2c.LOGIN_RES_RECONNECT = 990100002

--[[
	[1] = {--ResItemList
		[1] = {--repeated ItemInfo
			[1] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[2] = 'string':id	[ 实例ID]
			[3] = 'int32':cid	[ 配置ID]
			[4] = 'int32':num	[ 数量]
			[5] = 'int32':outTime	[过期时间]
		},
		[2] = {--repeated EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
		[3] = {--repeated ShipItemInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':star	[ 星级]
		},
	}
--]]
s2c.ITEM_RES_ITEM_LIST = 110100001

--[[
	[1] = {--ResHeroDiyGoOutFormation
		[1] = 'int32':index	[ 操作的阵容]
		[2] = {--FormationInfo
			[1] = {--repeated FormationPostion
				[1] = 'int32':heroId	[ 精灵id]
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
	}
--]]
s2c.HERO_RES_HERO_DIY_GO_OUT_FORMATION = 140100034

--[[
	[1] = {--ResExpireItemList
		[1] = {--repeated ExpireItem
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.ITEM_RES_EXPIRE_ITEM_LIST = 110100003

--[[
	[1] = {--ResPutDownEquip
		[1] = 'int32':heroId	[ 精灵id]
		[2] = {--EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_PUT_DOWN_EQUIP = 140100043

--[[
	[1] = {--ResAcceptTask
		[1] = {--TaskInfo
			[1] = 'int32':cid
			[2] = {--repeated TaskEventInfo
				[1] = 'int32':id
				[2] = 'int32':progress
				[3] = 'bool':isFinish
			},
			[3] = 'int32':status	[ 任务状态 1:进行中 2:完成 3:领奖]
		},
	}
--]]
s2c.TASK_RES_ACCEPT_TASK = 410100012

--[[
	[1] = {--RespChangeRoom
		[1] = {--RespInitChatInfo
			[1] = 'int32':roomId
			[2] = {--repeated ChatInfo
				[1] = 'int32':channel	[	聊天类型:1.公共 2.私聊;3.帮派 4.系统 5.队伍 6.队伍系统邀请]
				[2] = 'int32':fun	[ 	功能类型:1.聊天 2.深渊组队邀请  6系统消息]
				[3] = 'string':content	[	内容]
				[4] = 'int32':pid	[	说话人的id]
				[5] = 'string':pname	[	说话人名称]
				[6] = 'int32':lvl	[ 	玩家等级]
				[7] = 'int32':helpFightHeroCid
				[8] = 'int32':portraitCid	[玩家头像]
				[9] = 'int32':portraitFrameCid	[玩家头像框]
				[10] = 'int32':titleId	[称号]
				[11] = 'int32':chatFrameCid	[气泡框]
			},
		},
	}
--]]
s2c.CHAT_RESP_CHANGE_ROOM = 610100002

--[[
	[1] = {--ResAskSwitch
		[1] = 'bool':openAsk	[是否开启问卷调查]
		[2] = 'string':askUrl	[问卷调查地址]
	}
--]]
s2c.PLAYER_RES_ASK_SWITCH = 510100012

--[[
	[1] = {--ResExploreSpeedUp
	}
--]]
s2c.EXPLORE_RES_EXPLORE_SPEED_UP = 510300003

--[[
	[1] = {--ResHeroDiyAndSystemGoOutFormation
		[1] = {--FormationInfo
			[1] = {--repeated FormationPostion
				[1] = 'int32':heroId	[ 精灵id]
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
	}
--]]
s2c.HERO_RES_HERO_DIY_AND_SYSTEM_GO_OUT_FORMATION = 140100036

--[[
	[1] = {--ResChangeAntiAddiction
		[1] = 'int32':anti	[当前防沉迷状态]
	}
--]]
s2c.PLAYER_RES_CHANGE_ANTI_ADDICTION = 510100011

--[[
	[1] = {--UpdateShipBuilding
		[1] = {--ShipBuilding
			[1] = 'int32':madeNum	[ 已制造的制造数量]
			[2] = 'int32':nextTimestamp	[ 下一个产物制造开始的时间戳(单位:秒)    // 下一个产物制造开始的时间戳(单位:秒)]
			[3] = 'int32':buildingId	[ 建筑id]
			[4] = {--repeated AttributeInfo
				[1] = 'int32':type	[ 属性类型]
				[2] = 'int32':val	[ 属性值]
			},
			[5] = {--repeated DefendedHero
				[1] = 'int32':position	[ 精灵入驻的位置]
				[2] = 'int32':heroId	[ 精灵id]
			},
		},
	}
--]]
s2c.SHIP_UPDATE_SHIP_BUILDING = 510200024

--[[
	[1] = {--ResFightOver
		[1] = 'bool':isSuccess
	}
--]]
s2c.DUNGEON_RES_FIGHT_OVER = 230100006

--[[
	[1] = {--RespFriends
		[1] = {--repeated FriendInfo
			[1] = 'int32':pid	[ 玩家ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':fightPower	[ 战力]
			[4] = 'int32':lvl	[ 等级]
			[5] = 'int32':lastLoginTime	[ 最后登录时间]
			[6] = 'int32':lastHandselTime	[ 最后送礼时间]
			[7] = 'bool':receive	[ 是否能够领取]
			[8] = 'int32':status	[ 状态:1:好友,2:屏蔽,3:申请]
			[9] = 'int32':leaderCid	[ 英雄CID(队长)    // 英雄CID(队长)]
			[10] = 'bool':online	[ 是否在线]
			[11] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[12] = 'int32':time	[ 申请时间/加入黑名单时间等]
			[13] = 'int32':helpCDtime	[ 助战cd结束时间(秒)    // 助战cd结束时间(秒)]
			[14] = 'bool':canSend	[ 是否可以赠送]
			[15] = 'int32':portraitCid	[ 头像CID]
			[16] = 'int32':portraitFrameCid	[ 头像框CID]
			[17] = 'repeated int32':groupGiftIds	[团购礼包id]
		},
		[2] = 'int32':receiveCount	[ 已领取次数]
		[3] = 'int32':lastReceiveTime	[ 最后领取时间]
	}
--]]
s2c.FRIEND_RESP_FRIENDS = 610200001

--[[
	[1] = {--ResShopRefresh
		[1] = 'int32':shopId	[ 商店id]
	}
--]]
s2c.SHOP_RES_SHOP_REFRESH = 710200005

--[[
	[1] = {--ResCancelExplore
		[1] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[2] = {--ExploreSettle
			[1] = 'int32':totalTime	[探索总时间]
			[2] = 'int32':totalArea	[区域总数]
			[3] = 'int32':fnshArea	[区域完成数]
			[4] = {--repeated ExploreGradeReward
				[1] = 'int32':gradeId	[分类id]
				[2] = 'int32':count	[数量]
				[3] = {--repeated RewardsMsg
					[1] = 'int32':id
					[2] = 'int32':num
				},
			},
			[5] = 'int32':assessScore	[评价分数]
			[6] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[7] = 'int32':searchLv	[探索奖励档位]
		},
	}
--]]
s2c.EXPLORE_RES_CANCEL_EXPLORE = 510300005

--[[
	[1] = {--ResShipBuildingHeroEnter
		[1] = 'int32':buildingId	[ 建筑id]
	}
--]]
s2c.SHIP_RES_SHIP_BUILDING_HERO_ENTER = 510200025

--[[
	[1] = {--ResHeroSpecifyDiyFormation
		[1] = 'int32':index	[ 哪一套阵容]
	}
--]]
s2c.HERO_RES_HERO_SPECIFY_DIY_FORMATION = 140100033

--[[
	[1] = {--ResShipItemStarUp
		[1] = {--ShipItemInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':star	[ 星级]
		},
	}
--]]
s2c.SHIP_RES_SHIP_ITEM_STAR_UP = 510200012

--[[
	[1] = {--RespClearFriendReceive
	}
--]]
s2c.FRIEND_RESP_CLEAR_FRIEND_RECEIVE = 610200008

--[[
	[1] = {--GetBuyRecordInfo
		[1] = {--repeated BuyRecordInfo
			[1] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[2] = 'int32':cid
			[3] = 'int32':buy_count	[购买次数]
		},
	}
--]]
s2c.RECHARGE_GET_BUY_RECORD_INFO = 980100002

--[[
	[1] = {--ResHeroStarUpActivateNode
		[1] = 'int32':heroId	[ 精灵id]
		[2] = 'int32':nodeId	[ 激活的节点id]
	}
--]]
s2c.HERO_RES_HERO_STAR_UP_ACTIVATE_NODE = 140100011

--[[
	[1] = {--ResStrengthenEquip
		[1] = {--EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_STRENGTHEN_EQUIP = 140100044

--[[
	[1] = {--ResChargeExchange
		[1] = 'int32':rechargeId	[充值档位id]
		[2] = 'int32':buyCount	[购买数量]
	}
--]]
s2c.RECHARGE_RES_CHARGE_EXCHANGE = 980100007

--[[
	[1] = {--RespRewardInvite
		[1] = {--repeated InviteRewardInfo
			[1] = 'int32':cid	[ 奖励模板ID]
			[2] = 'int32':status	[ 领取状态(0-不可领取 1-可领取 2-已领取)    // 领取状态(0-不可领取 1-可领取 2-已领取)]
		},
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.FRIEND_RESP_REWARD_INVITE = 610200007

--[[
	[1] = {--UpdateItemRecoverInfo
		[1] = {--repeated ItemRecover
			[1] = 'int32':id	[ 道具id]
			[2] = 'int32':timestamp	[ 当前恢复的完成时间戳(未来的某个时间)     // 当前恢复的完成时间戳(未来的某个时间)]
		},
	}
--]]
s2c.ITEM_UPDATE_ITEM_RECOVER_INFO = 110100012

--[[
	[1] = {--RespOperate
		[1] = 'int32':type	[ 操作类型]
		[2] = 'repeated int32':targets	[ 目标ID]
	}
--]]
s2c.FRIEND_RESP_OPERATE = 610200004

--[[
	[1] = {--ResUpdateDungeonTask
		[1] = {--repeated DungeonTaskInfo
			[1] = 'int32':cid	[任务id]
			[2] = 'int32':progress	[任务进度]
			[3] = 'int32':status	[ 任务状态 1:进行中 2:已完成]
			[4] = 'repeated DungeonTaskInfo':subTask	[子任务]
		},
	}
--]]
s2c.TASK_RES_UPDATE_DUNGEON_TASK = 410100003

--[[
	[1] = {--ResDeleteDiyEquipScheme
		[1] = 'int32':schemeId	[ 自定义方案的id]
	}
--]]
s2c.HERO_RES_DELETE_DIY_EQUIP_SCHEME = 140100050

--[[
	[1] = {--ResDestroyObstacle
		[1] = {--ObstacleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
	}
--]]
s2c.DUNGEON_RES_DESTROY_OBSTACLE = 230100005

--[[
	[1] = {--ResPutDownAllEquips
		[1] = {--repeated EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_PUT_DOWN_ALL_EQUIPS = 140100041

--[[
	[1] = {--ResNumChange
		[1] = 'int32':buildingId	[ 建筑id]
		[2] = 'int32':madeNum	[ 已制造的制造数量]
		[3] = 'int32':nextTimestamp	[ 下一个产物制造开始的时间戳(单位:秒)    // 下一个产物制造开始的时间戳(单位:秒)]
	}
--]]
s2c.SHIP_RES_NUM_CHANGE = 510200026

--[[
	[1] = {--ReskillMonster
		[1] = 'string':monsterId	[ 怪物实体id]
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[3] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[4] = 'int32':dropTime	[ 掉落次数]
	}
--]]
s2c.DUNGEON_RESKILL_MONSTER = 230100011

--[[
	[1] = {--RespBattleResult
		[1] = {--BattleResult(enum)
			'v4':BattleResult
		},
	}
--]]
s2c.BATTLE_RESP_BATTLE_RESULT = 220100006

--[[
	[1] = {--ResUpdateTask
		[1] = {--repeated TaskInfo
			[1] = 'int32':cid
			[2] = {--repeated TaskEventInfo
				[1] = 'int32':id
				[2] = 'int32':progress
				[3] = 'bool':isFinish
			},
			[3] = 'int32':status	[ 任务状态 1:进行中 2:完成 3:领奖]
		},
	}
--]]
s2c.TASK_RES_UPDATE_TASK = 410100014

--[[
	[1] = {--ResExploreHeroGoIntoFormation
		[1] = 'int32':chapter	[章节Id]
		[2] = {--ExploreGarrisonFmt
			[1] = {--FormationInfo
				[1] = {--repeated FormationPostion
					[1] = 'int32':heroId	[ 精灵id]
					[2] = 'int32':position	[ 精灵位置]
					[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
				},
			},
			[2] = 'repeated int32':condition	[驻守事件达成条件索引,从1开始]
		},
	}
--]]
s2c.EXPLORE_RES_EXPLORE_HERO_GO_INTO_FORMATION = 510300010

--[[
	[1] = {--ResUseEquipScheme
		[1] = 'bool':type	[ true:使用推荐方案 false:使用自定义方案]
		[2] = 'int32':schemeId	[ 方案的id]
		[3] = 'int32':heroId	[ 精灵id]
	}
--]]
s2c.HERO_RES_USE_EQUIP_SCHEME = 140100051

--[[
	[1] = {--ResShopsAllInfo
		[1] = {--repeated ShopData
			[1] = 'int32':id	[ 商店id]
			[2] = {--repeated GoodsData
				[1] = 'int32':id	[ 商品id	商品配置表id]
				[2] = 'int32':buyNum	[ 已经购买的次数]
				[3] = 'int32':start	[ 开放时间戳]
				[4] = 'int32':close	[ 结束时间戳]
			},
			[3] = {--UpdateType(enum)
				'v4':UpdateType
			},
			[4] = 'int32':start	[ 开放时间戳]
			[5] = 'int32':close	[ 结束时间戳]
			[6] = 'int32':refreshNum	[ 已刷新次数]
		},
	}
--]]
s2c.SHOP_RES_SHOPS_ALL_INFO = 710200001

--[[
	[1] = {--ResReceiveDungeonTask
		[1] = 'int32':cid	[任务id]
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.TASK_RES_RECEIVE_DUNGEON_TASK = 410100004

--[[
	[1] = {--ResSetEquipLock
		[1] = {--EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_SET_EQUIP_LOCK = 140100053

--[[
	[1] = {--ResAcceptDungeonTask
		[1] = {--DungeonTaskInfo
			[1] = 'int32':cid	[任务id]
			[2] = 'int32':progress	[任务进度]
			[3] = 'int32':status	[ 任务状态 1:进行中 2:已完成]
			[4] = 'repeated DungeonTaskInfo':subTask	[子任务]
		},
	}
--]]
s2c.TASK_RES_ACCEPT_DUNGEON_TASK = 410100002

--[[
	[1] = {--ResAllShipItemAttrs
		[1] = {--repeated AttributeInfo
			[1] = 'int32':type	[ 属性类型]
			[2] = 'int32':val	[ 属性值]
		},
	}
--]]
s2c.SHIP_RES_ALL_SHIP_ITEM_ATTRS = 510200002

--[[
	[1] = {--ResShipAllInfo
		[1] = {--repeated AttributeInfo
			[1] = 'int32':type	[ 属性类型]
			[2] = 'int32':val	[ 属性值]
		},
		[2] = {--repeated ShipBuilding
			[1] = 'int32':madeNum	[ 已制造的制造数量]
			[2] = 'int32':nextTimestamp	[ 下一个产物制造开始的时间戳(单位:秒)    // 下一个产物制造开始的时间戳(单位:秒)]
			[3] = 'int32':buildingId	[ 建筑id]
			[4] = {--repeated AttributeInfo
				[1] = 'int32':type	[ 属性类型]
				[2] = 'int32':val	[ 属性值]
			},
			[5] = {--repeated DefendedHero
				[1] = 'int32':position	[ 精灵入驻的位置]
				[2] = 'int32':heroId	[ 精灵id]
			},
		},
		[3] = {--repeated ShipTalent
			[1] = 'int32':talentId	[ 科技id]
			[2] = 'int32':level	[当前科技等级]
		},
	}
--]]
s2c.SHIP_RES_SHIP_ALL_INFO = 510200001

--[[
	[1] = {--RespRecommendFriends
		[1] = {--repeated FriendInfo
			[1] = 'int32':pid	[ 玩家ID]
			[2] = 'string':name	[ 名字]
			[3] = 'int32':fightPower	[ 战力]
			[4] = 'int32':lvl	[ 等级]
			[5] = 'int32':lastLoginTime	[ 最后登录时间]
			[6] = 'int32':lastHandselTime	[ 最后送礼时间]
			[7] = 'bool':receive	[ 是否能够领取]
			[8] = 'int32':status	[ 状态:1:好友,2:屏蔽,3:申请]
			[9] = 'int32':leaderCid	[ 英雄CID(队长)    // 英雄CID(队长)]
			[10] = 'bool':online	[ 是否在线]
			[11] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[12] = 'int32':time	[ 申请时间/加入黑名单时间等]
			[13] = 'int32':helpCDtime	[ 助战cd结束时间(秒)    // 助战cd结束时间(秒)]
			[14] = 'bool':canSend	[ 是否可以赠送]
			[15] = 'int32':portraitCid	[ 头像CID]
			[16] = 'int32':portraitFrameCid	[ 头像框CID]
			[17] = 'repeated int32':groupGiftIds	[团购礼包id]
		},
	}
--]]
s2c.FRIEND_RESP_RECOMMEND_FRIENDS = 610200002

--[[
	[1] = {--ResPutOnEquip
		[1] = {--repeated EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_PUT_ON_EQUIP = 140100042

--[[
	[1] = {--ResShopBuyGoods
		[1] = 'int32':shopId	[ 商店id]
	}
--]]
s2c.SHOP_RES_SHOP_BUY_GOODS = 710200002

--[[
	[1] = {--ResEventChange
		[1] = {--repeated ConsoleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
		[2] = {--repeated GateInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1开 2关]
		},
		[3] = {--repeated ObstacleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
	}
--]]
s2c.DUNGEON_RES_EVENT_CHANGE = 230100008

--[[
	[1] = {--ResFunctionSwitch
		[1] = {--repeated FunctionSwitch
			[1] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[2] = 'int32':switchType
			[3] = 'bool':open
		},
	}
--]]
s2c.LOGIN_RES_FUNCTION_SWITCH = 990100005

--[[
	[1] = {--ResUpdateGoods
		[1] = 'int32':shopId	[ 商店id]
		[2] = {--GoodsData
			[1] = 'int32':id	[ 商品id	商品配置表id]
			[2] = 'int32':buyNum	[ 已经购买的次数]
			[3] = 'int32':start	[ 开放时间戳]
			[4] = 'int32':close	[ 结束时间戳]
		},
	}
--]]
s2c.SHOP_RES_UPDATE_GOODS = 710200004

--[[
	[1] = {--ResNumChanges
		[1] = {--repeated ResNumChange
			[1] = 'int32':buildingId	[ 建筑id]
			[2] = 'int32':madeNum	[ 已制造的制造数量]
			[3] = 'int32':nextTimestamp	[ 下一个产物制造开始的时间戳(单位:秒)    // 下一个产物制造开始的时间戳(单位:秒)]
		},
	}
--]]
s2c.SHIP_RES_NUM_CHANGES = 510200027

--[[
	[1] = {--ResHeroDiyGoIntoFormation
		[1] = 'int32':index	[ 操作的阵容]
		[2] = {--FormationInfo
			[1] = {--repeated FormationPostion
				[1] = 'int32':heroId	[ 精灵id]
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
	}
--]]
s2c.HERO_RES_HERO_DIY_GO_INTO_FORMATION = 140100032

--[[
	[1] = {--ResUpdateShops
		[1] = {--repeated ShopData
			[1] = 'int32':id	[ 商店id]
			[2] = {--repeated GoodsData
				[1] = 'int32':id	[ 商品id	商品配置表id]
				[2] = 'int32':buyNum	[ 已经购买的次数]
				[3] = 'int32':start	[ 开放时间戳]
				[4] = 'int32':close	[ 结束时间戳]
			},
			[3] = {--UpdateType(enum)
				'v4':UpdateType
			},
			[4] = 'int32':start	[ 开放时间戳]
			[5] = 'int32':close	[ 结束时间戳]
			[6] = 'int32':refreshNum	[ 已刷新次数]
		},
	}
--]]
s2c.SHOP_RES_UPDATE_SHOPS = 710200003

--[[
	[1] = {--ResShipBuildingUnlock
		[1] = {--ShipBuilding
			[1] = 'int32':madeNum	[ 已制造的制造数量]
			[2] = 'int32':nextTimestamp	[ 下一个产物制造开始的时间戳(单位:秒)    // 下一个产物制造开始的时间戳(单位:秒)]
			[3] = 'int32':buildingId	[ 建筑id]
			[4] = {--repeated AttributeInfo
				[1] = 'int32':type	[ 属性类型]
				[2] = 'int32':val	[ 属性值]
			},
			[5] = {--repeated DefendedHero
				[1] = 'int32':position	[ 精灵入驻的位置]
				[2] = 'int32':heroId	[ 精灵id]
			},
		},
	}
--]]
s2c.SHIP_RES_SHIP_BUILDING_UNLOCK = 510200021

--[[
	[1] = {--ResShipBuildingTakeProduct
		[1] = 'int32':buildingId	[ 建筑id]
		[2] = {--repeated Products
			[1] = 'int32':grade	[ 档位(低中高)    // 档位(低中高)]
			[2] = 'int32':num	[ 此档位对应的制造次数]
			[3] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
		},
	}
--]]
s2c.SHIP_RES_SHIP_BUILDING_TAKE_PRODUCT = 510200023

--[[
	[1] = {--RespBattleFrame
		[1] = {--BattleFrame
			[1] = 'int32':sequence
			[2] = 'int32':tick	[ 单位ms,目前定长帧:30]
			[3] = {--repeated BattlePlayerInput
				[1] = 'int32':joystick
				[2] = 'int32':button
			},
		},
	}
--]]
s2c.BATTLE_RESP_BATTLE_FRAME = 220100005

--[[
	[1] = {--RespGMCallBack
	}
--]]
s2c.CHAT_RESP_GMCALL_BACK = 610100005

--[[
	[1] = {--ResShipTalentUnlock
		[1] = {--ShipTalent
			[1] = 'int32':talentId	[ 科技id]
			[2] = 'int32':level	[当前科技等级]
		},
	}
--]]
s2c.SHIP_RES_SHIP_TALENT_UNLOCK = 510200031

--[[
	[1] = {--ResChangeShowedHero
		[1] = 'int32':showedHero	[ 某一个精灵id]
	}
--]]
s2c.HERO_RES_CHANGE_SHOWED_HERO = 140100003

--[[
	[1] = {--ResBackgroundInfo
		[1] = 'int32':dayBackground	[ 白天背景]
		[2] = 'int32':nightBackground	[夜晚背景]
		[3] = 'int32':dayBGM	[白天bgm]
		[4] = 'int32':nightBGM	[夜晚bgm]
	}
--]]
s2c.PLAYER_RES_BACKGROUND_INFO = 510100015

--[[
	[1] = {--ResShipBuildingSpeedUp
		[1] = 'int32':buildingId	[ 建筑id]
		[2] = {--repeated Products
			[1] = 'int32':grade	[ 档位(低中高)    // 档位(低中高)]
			[2] = 'int32':num	[ 此档位对应的制造次数]
			[3] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
		},
	}
--]]
s2c.SHIP_RES_SHIP_BUILDING_SPEED_UP = 510200022

--[[
	[1] = {--ResShipTalentLevelUp
		[1] = {--ShipTalent
			[1] = 'int32':talentId	[ 科技id]
			[2] = 'int32':level	[当前科技等级]
		},
	}
--]]
s2c.SHIP_RES_SHIP_TALENT_LEVEL_UP = 510200032

--[[
	[1] = {--ResStartBattle
		[1] = 'int32':levelId
		[2] = 'string':roomId	[ 战斗ID]
		[3] = 'string':fightServerHost	[ 战斗服务器地址]
		[4] = 'int32':fightServerPort	[ 战斗服务器端口]
		[5] = {--repeated BattlePlayer
			[1] = 'int32':id
			[2] = 'string':name
			[3] = 'repeated int32':heroList	[ 测试:填英雄id即可]
		},
	}
--]]
s2c.BATTLE_RES_START_BATTLE = 220100001

--[[
	[1] = {--ResShipItemUnlock
	}
--]]
s2c.SHIP_RES_SHIP_ITEM_UNLOCK = 510200011

--[[
	[1] = {--ResDungeonInfo
		[1] = {--repeated DungeonChapterInfo
			[1] = 'int32':id
			[2] = {--repeated DungeonInfo
				[1] = 'int32':id
			},
			[3] = 'int32':lastDungeon	[上次保存点关卡]
		},
	}
--]]
s2c.DUNGEON_RES_DUNGEON_INFO = 230100001

--[[
	[1] = {--RespBindInviteCode
		[1] = 'string':inviteCode	[ 邀请码]
	}
--]]
s2c.FRIEND_RESP_BIND_INVITE_CODE = 610200006

--[[
	[1] = {--BuyRecordInfo
		[1] = {--ChangeType(enum)
			'v4':ChangeType
		},
		[2] = 'int32':cid
		[3] = 'int32':buy_count	[购买次数]
	}
--]]
s2c.RECHARGE_BUY_RECORD_INFO = 980100009

--[[
	[1] = {--setPlayerInfo
	}
--]]
s2c.PLAYERSET_PLAYER_INFO = 510100001

--[[
	[1] = {--ResItemRecoverInfo
		[1] = {--repeated ItemRecover
			[1] = 'int32':id	[ 道具id]
			[2] = 'int32':timestamp	[ 当前恢复的完成时间戳(未来的某个时间)     // 当前恢复的完成时间戳(未来的某个时间)]
		},
	}
--]]
s2c.ITEM_RES_ITEM_RECOVER_INFO = 110100011

--[[
	[1] = {--GetRechargeCfg
		[1] = {--repeated RechargeGiftBagCfg
			[1] = {--RechargeCfg
				[1] = 'int32':id
				[2] = 'float':price	[价格]
			},
			[2] = 'int32':type	[所属界面]
			[3] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[4] = 'string':name
			[5] = 'string':icon
			[6] = 'bool':tag
			[7] = 'string':tagDes
			[8] = 'string':tagDes2
			[9] = 'string':des1
			[10] = 'string':des2
			[11] = 'int32':order	[排序]
			[12] = 'int32':startDate	[开始时间]
			[13] = 'int32':endDate	[结束时间]
			[14] = 'int32':buyCount	[限制购买次数]
			[15] = 'int32':resetType	[重置类型 0.不重置 1.每日重置 2.每周重置 3.每月重置]
			[16] = 'int32':resetDate	[重置时间 默认为周一.一日重置,否则周日=1,周一=2,以此类推]
			[17] = 'repeated int32':playerLevel	[玩家等级限制]
			[18] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[19] = 'string':name2
			[20] = 'string':des3
			[21] = 'int32':tagIcon
			[22] = 'int32':interfaceType	[显示类型]
			[23] = 'int32':buyType	[购买方式 0rmb充值 1代币兑换]
			[24] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[25] = 'repeated int32':packType	[可使用代金券类型]
			[26] = 'int32':originalPrice
			[27] = 'int32':discount
			[28] = 'int32':triggerEndDate
			[29] = 'bool':isTrigger
			[30] = 'int32':days	[持续领取天数]
			[31] = 'string':extendData	[扩展数据]
		},
	}
--]]
s2c.RECHARGE_GET_RECHARGE_CFG = 980100003

--[[
	[1] = {--ResTipInfo
		[1] = 'int32':status	[状态值:0-默认(无需确认) 1-确认后消失 2-确认后返回登录 3-确认后关闭游戏    //状态值:0-默认(无需确认) 1-确认后消失 2-确认后返回登录 3-确认后关闭游戏]
		[2] = 'string':content	[提示内容]
		[3] = 'int32':errCode
	}
--]]
s2c.PLAYER_RES_TIP_INFO = 510100017

--[[
	[1] = {--ResTotalPayRewardInfo
		[1] = 'int32':totalPay	[累积充值金额(单位:分)    //累积充值金额(单位:分)]
		[2] = 'repeated int32':rewardIds	[已领取过的累充奖励id集合]
	}
--]]
s2c.RECHARGE_RES_TOTAL_PAY_REWARD_INFO = 980100004

--[[
	[1] = {--RespGetFriendInviteInfo
		[1] = 'bool':open	[ 功能是否开启]
		[2] = 'bool':showInviteCode	[ 是否显示邀请码(达到指定等级后显示自己的邀请码)    // 是否显示邀请码(达到指定等级后显示自己的邀请码)]
		[3] = 'int32':limitLev	[邀请码限制等级]
		[4] = 'string':selfInviteCode	[自己的邀请码]
		[5] = 'string':bindInviteCode	[已绑定的别人的邀请码]
		[6] = 'int32':maxBindNum	[邀请码最大可绑定数量]
		[7] = {--repeated InviteRewardInfo
			[1] = 'int32':cid	[ 奖励模板ID]
			[2] = 'int32':status	[ 领取状态(0-不可领取 1-可领取 2-已领取)    // 领取状态(0-不可领取 1-可领取 2-已领取)]
		},
		[8] = 'int32':bindNum	[自己的邀请码已被绑定的次数]
	}
--]]
s2c.FRIEND_RESP_GET_FRIEND_INVITE_INFO = 610200005

--[[
	[1] = {--ResAntiAddictionInfo
		[1] = 'int32':status	[状态值: 0-未认证 1-认证未成年 2-认证已成年    //状态值: 0-未认证 1-认证未成年 2-认证已成年]
		[2] = 'int32':time	[累积在线时长(小时)    //累积在线时长(小时)]
	}
--]]
s2c.PLAYER_RES_ANTI_ADDICTION_INFO = 510100018

--[[
	[1] = {--RespTargetPlayerInfo
		[1] = {--PlayerInfo
			[1] = 'int32':pid	[ 玩家ID]
			[2] = 'string':name	[ 玩家名称]
			[3] = 'int32':lvl	[ 玩家等级]
			[4] = 'int64':exp	[ 玩家经验]
			[5] = 'int32':vip_lvl	[ VIP等级]
			[6] = 'int64':vip_exp	[ VIP经验]
			[7] = {--Language(enum)
				'v4':Language
			},
			[8] = 'string':remark	[ 宣言]
			[9] = 'int32':helpFightHeroCid	[ 助战英雄ID]
			[10] = {--repeated PlayerAttr
				[1] = {--PlayerAttrKey(enum)
					'v4':PlayerAttrKey
				},
				[2] = 'int32':attrVal	[ 属性值]
			},
			[11] = 'bool':isFirstLogin	[是否初次登录]
			[12] = 'string':clientDiscreteData	[客户端离散数据]
			[13] = 'string':settings	[ 设置信息]
			[14] = 'repeated int32':recoverTimeList	[体力精力回复时间]
			[15] = 'int32':portraitCid	[ 玩家头像CID]
			[16] = 'int32':portraitFrameCid	[ 玩家头像框CID]
			[18] = 'int32':unionId	[ 玩家社团Id]
			[19] = 'string':unionName	[ 玩家社团名]
			[20] = 'int32':titleId	[ 称号id]
			[21] = 'int32':createTime	[ 建号时间]
		},
	}
--]]
s2c.PLAYER_RESP_TARGET_PLAYER_INFO = 510100006

--[[
	[1] = {--PushExploreGarrisonFmt
		[1] = 'int32':id	[章节Id]
		[2] = {--ExploreGarrisonFmt
			[1] = {--FormationInfo
				[1] = {--repeated FormationPostion
					[1] = 'int32':heroId	[ 精灵id]
					[2] = 'int32':position	[ 精灵位置]
					[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
				},
			},
			[2] = 'repeated int32':condition	[驻守事件达成条件索引,从1开始]
		},
	}
--]]
s2c.EXPLORE_PUSH_EXPLORE_GARRISON_FMT = 510300012

--[[
	[1] = {--ResEquipAwake
		[1] = {--EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_EQUIP_AWAKE = 140100046

--[[
	[1] = {--ResUnlockOneHero
		[1] = 'bool':successful	[ 解锁是否成功]
		[2] = {--HeroInfo
			[1] = 'int32':id	[ 精灵的protoid]
			[2] = 'int32':level	[ 等级]
			[3] = 'int32':exp	[ 精灵升级的当前经验值]
			[4] = 'int32':stage	[ 精灵的当前等阶]
			[5] = 'int32':star	[ 精灵的稀有度]
			[6] = 'int32':dressId	[ 精灵的时装id]
			[7] = {--repeated HeroAttribute
				[1] = 'int32':attrId
				[2] = 'int32':attrVal
			},
			[8] = {--repeated HeroSkillTypeInfo
				[1] = 'int32':skillType	[ 技能类型]
				[2] = 'int32':skillLevel	[ 根据规则同一个类型的小技能共享一个等级]
			},
			[9] = 'repeated int32':nodes	[ 精灵当前稀有度已激活的节点id集合]
			[10] = 'repeated string':equipIds	[ 装备实例id]
		},
	}
--]]
s2c.HERO_RES_UNLOCK_ONE_HERO = 140100002

--[[
	[1] = {--RecordClientErr
	}
--]]
s2c.PLAYER_RECORD_CLIENT_ERR = 510100009

--[[
	[1] = {--UpdateBackgroundTime
		[1] = 'int32':time	[ 1白天2夜晚]
	}
--]]
s2c.PLAYER_UPDATE_BACKGROUND_TIME = 510100016

--[[
	[1] = {--RechargeSuccess
		[1] = 'int32':cid
		[2] = 'int32':buyCount	[购买数量]
	}
--]]
s2c.RECHARGE_RECHARGE_SUCCESS = 980100008

--[[
	[1] = {--ResPickupReward
		[1] = 'int32':itemId	[ 道具id]
		[2] = 'int32':num
	}
--]]
s2c.DUNGEON_RES_PICKUP_REWARD = 230100012

--[[
	[1] = {--PushExploreTaskInfo
		[1] = 'int32':id	[章节Id]
		[2] = {--repeated ExploreTaskInfo
			[1] = 'int32':area	[区域Id]
			[2] = 'repeated int32':taskIds	[探索事件暨任务id]
		},
	}
--]]
s2c.EXPLORE_PUSH_EXPLORE_TASK_INFO = 510300013

--[[
	[1] = {--ResConsoleReaward
		[1] = 'int32':consoleId
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[3] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.DUNGEON_RES_CONSOLE_REAWARD = 230100009

--[[
	[1] = {--ResLogout
		[1] = {--LogoutType(enum)
			'v4':LogoutType
		},
	}
--]]
s2c.LOGIN_RES_LOGOUT = 990100006

--[[
	[1] = {--ResSetBackground
		[1] = 'int32':dayBackground	[ 白天背景]
		[2] = 'int32':nightBackground	[夜晚背景]
		[3] = 'int32':dayBGM	[白天bgm]
		[4] = 'int32':nightBGM	[夜晚bgm]
	}
--]]
s2c.PLAYER_RES_SET_BACKGROUND = 510100014

--[[
	[1] = {--ResFightPrepare
		[1] = {--BattleFormationInfo
			[1] = {--repeated BattleFormationPosition
				[1] = {--HeroInfo
					[1] = 'int32':id	[ 精灵的protoid]
					[2] = 'int32':level	[ 等级]
					[3] = 'int32':exp	[ 精灵升级的当前经验值]
					[4] = 'int32':stage	[ 精灵的当前等阶]
					[5] = 'int32':star	[ 精灵的稀有度]
					[6] = 'int32':dressId	[ 精灵的时装id]
					[7] = {--repeated HeroAttribute
						[1] = 'int32':attrId
						[2] = 'int32':attrVal
					},
					[8] = {--repeated HeroSkillTypeInfo
						[1] = 'int32':skillType	[ 技能类型]
						[2] = 'int32':skillLevel	[ 根据规则同一个类型的小技能共享一个等级]
					},
					[9] = 'repeated int32':nodes	[ 精灵当前稀有度已激活的节点id集合]
					[10] = 'repeated string':equipIds	[ 装备实例id]
				},
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
	}
--]]
s2c.DUNGEON_RES_FIGHT_PREPARE = 230100002

--[[
	[1] = {--UpdateRefreshTime
		[1] = 'repeated int32':recoverTimeList	[体力精力回复时间]
	}
--]]
s2c.PLAYER_UPDATE_REFRESH_TIME = 510100019

--[[
	[1] = {--MailInfoList
		[1] = {--repeated MailInfo
			[1] = {--ChangeType(enum)
				'v4':ChangeType
			},
			[2] = 'string':id	[ 邮件ID]
			[3] = 'int32':senderId	[ 发送者id]
			[4] = 'string':senderName	[ 发送者名字]
			[5] = 'int32':createTime	[ 创建时间]
			[6] = 'int32':modifiedTime	[ 邮件时间]
			[7] = 'int32':status	[ 状态]
			[8] = 'string':title	[ 邮件标题]
			[9] = 'string':body	[ 邮件正文]
			[10] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[11] = 'int32':mailType	[1是普通邮件,3是特殊邮件]
		},
	}
--]]
s2c.MAIL_MAIL_INFO_LIST = 610300002

--[[
	[1] = {--ResReceiveTask
		[1] = 'int32':taskId	[任务Id]
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.TASK_RES_RECEIVE_TASK = 410100013

--[[
	[1] = {--RespScrollingInfo
		[1] = 'int32':scrollId	[  scroll表id]
		[2] = 'repeated string':params	[ 参数列表]
	}
--]]
s2c.CHAT_RESP_SCROLLING_INFO = 610100006

--[[
	[1] = {--ResFightStart
		[1] = 'int32':levelCid	[关卡cid]
		[2] = 'int32':chapterId	[章节id]
		[3] = {--repeated ConsoleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
		[4] = {--repeated GateInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1开 2关]
		},
		[5] = {--repeated ObstacleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
		[6] = {--repeated MonsterInfo
			[1] = 'string':monsterId	[ 怪物实体id]
			[2] = 'int32':dropTime	[ 掉落次数]
		},
	}
--]]
s2c.DUNGEON_RES_FIGHT_START = 230100003

--[[
	[1] = {--ResHeroSkillLevelUp
		[1] = 'int32':heroId	[ 精灵id]
		[2] = {--HeroSkillTypeInfo
			[1] = 'int32':skillType	[ 技能类型]
			[2] = 'int32':skillLevel	[ 根据规则同一个类型的小技能共享一个等级]
		},
	}
--]]
s2c.HERO_RES_HERO_SKILL_LEVEL_UP = 140100021

--[[
	[1] = {--ResHeroStarUpStarUp
		[1] = 'int32':heroId	[ 精灵id]
		[2] = 'int32':star	[ 精灵稀有度]
		[3] = {--repeated HeroSkillTypeInfo
			[1] = 'int32':skillType	[ 技能类型]
			[2] = 'int32':skillLevel	[ 根据规则同一个类型的小技能共享一个等级]
		},
	}
--]]
s2c.HERO_RES_HERO_STAR_UP_STAR_UP = 140100012

--[[
	[1] = {--RespOperation
		[1] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.MAIL_RESP_OPERATION = 610300001

--[[
	[1] = {--ResNoticeList
		[1] = {--repeated NoticeInfo
			[1] = 'int32':id	[ 公告ID]
			[2] = 'int32':inx	[ 排序序号]
			[3] = 'int32':type	[ 公告类型]
			[4] = 'string':tag	[ 公告标签]
			[5] = 'string':title	[ 公告标题]
			[6] = 'string':context	[ 公告内容]
			[7] = 'string':contextImg	[ 内容图片]
		},
	}
--]]
s2c.LOGIN_RES_NOTICE_LIST = 990100007

--[[
	[1] = {--ResHeroFormations
		[1] = {--repeated FormationInfo
			[1] = {--repeated FormationPostion
				[1] = 'int32':heroId	[ 精灵id]
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
		[2] = {--FormationInfo
			[1] = {--repeated FormationPostion
				[1] = 'int32':heroId	[ 精灵id]
				[2] = 'int32':position	[ 精灵位置]
				[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
			},
		},
		[3] = 'int32':specifiedDiyFormationIndex	[ 玩家指定的自定义阵容索引(用于战斗)    // 玩家指定的自定义阵容索引(用于战斗)]
	}
--]]
s2c.HERO_RES_HERO_FORMATIONS = 140100031

--[[
	[1] = {--ResHeroLevelUpAddExp
		[1] = 'int32':level	[ 新等级]
		[2] = 'int32':exp	[ 返回新的经验值]
		[3] = 'int32':heroId	[ 精灵id]
	}
--]]
s2c.HERO_RES_HERO_LEVEL_UP_ADD_EXP = 140100004

--[[
	[1] = {--ResReceiveExploreAward
		[1] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[2] = {--ExploreSettle
			[1] = 'int32':totalTime	[探索总时间]
			[2] = 'int32':totalArea	[区域总数]
			[3] = 'int32':fnshArea	[区域完成数]
			[4] = {--repeated ExploreGradeReward
				[1] = 'int32':gradeId	[分类id]
				[2] = 'int32':count	[数量]
				[3] = {--repeated RewardsMsg
					[1] = 'int32':id
					[2] = 'int32':num
				},
			},
			[5] = 'int32':assessScore	[评价分数]
			[6] = {--repeated RewardsMsg
				[1] = 'int32':id
				[2] = 'int32':num
			},
			[7] = 'int32':searchLv	[探索奖励档位]
		},
	}
--]]
s2c.EXPLORE_RES_RECEIVE_EXPLORE_AWARD = 510300004

--[[
	[1] = {--ResUseItemResult
		[1] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.ITEM_RES_USE_ITEM_RESULT = 110100002

--[[
	[1] = {--ResBattleLoadComplete
	}
--]]
s2c.BATTLE_RES_BATTLE_LOAD_COMPLETE = 220100002

--[[
	[1] = {--ResEquipAwakeSelect
		[1] = {--EquipInfo
			[1] = {--ItemInfo
				[1] = {--ChangeType(enum)
					'v4':ChangeType
				},
				[2] = 'string':id	[ 实例ID]
				[3] = 'int32':cid	[ 配置ID]
				[4] = 'int32':num	[ 数量]
				[5] = 'int32':outTime	[过期时间]
			},
			[2] = 'int32':heroId	[ 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)    // 被哪个精灵穿戴(为0表示没有精灵穿戴此装备)]
			[3] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[4] = {--repeated AwakeSkill
				[1] = 'int32':heroId	[ 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)    // 精灵id(技能只对该精灵生效;为0表示所有精灵都可使用该技能)]
				[2] = 'int32':skillId	[ 觉醒得到的技能]
				[3] = 'int32':slotId	[ 槽位id(该技能属于装备的哪个槽位)    // 槽位id(该技能属于装备的哪个槽位)]
			},
			[5] = 'int32':level	[ 装备等级]
			[6] = 'int32':stage	[ 装备等阶]
			[7] = 'int32':exp	[ 当前经验值]
			[8] = 'bool':locked	[ 是否被锁定]
			[9] = 'repeated int32':schemeIds	[ 记录当前装备被哪些自定义方案使用]
		},
	}
--]]
s2c.HERO_RES_EQUIP_AWAKE_SELECT = 140100047

--[[
	[1] = {--ResStartExplore
		[1] = {--ExploreData
			[1] = 'int32':chapter	[章节Id]
			[2] = 'bool':finish	[是否探索完成]
			[3] = {--repeated ExploreAreaData
				[1] = 'int32':area	[区域Id]
				[2] = 'int32':totalCnt	[最大探索次数]
				[3] = 'int32':fnshCnt	[已完成探索次数]
				[4] = 'bool':finish	[是否探索完成]
				[5] = 'int32':endTime	[当前次探索完成时间点]
			},
			[4] = 'int32':endTime	[探索完成时间点]
			[5] = {--repeated ExploreGradeReward
				[1] = 'int32':gradeId	[分类id]
				[2] = 'int32':count	[数量]
				[3] = {--repeated RewardsMsg
					[1] = 'int32':id
					[2] = 'int32':num
				},
			},
			[6] = 'int32':searchLv	[探索奖励档位]
		},
	}
--]]
s2c.EXPLORE_RES_START_EXPLORE = 510300002

--[[
	[1] = {--PushChapterInfo
		[1] = {--repeated ChapterInfo
			[1] = 'int32':id	[章节Id]
			[2] = {--ExploreGarrisonFmt
				[1] = {--FormationInfo
					[1] = {--repeated FormationPostion
						[1] = 'int32':heroId	[ 精灵id]
						[2] = 'int32':position	[ 精灵位置]
						[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
					},
				},
				[2] = 'repeated int32':condition	[驻守事件达成条件索引,从1开始]
			},
			[3] = 'repeated int32':areas	[已激活区域id]
			[4] = {--GarrisonEvent
				[1] = 'int32':id	[事件Id]
				[2] = 'bool':finish	[是否完成]
				[3] = 'int32':endTime	[完成时间点,战斗事件则可忽略]
			},
			[5] = {--repeated ExploreTaskInfo
				[1] = 'int32':area	[区域Id]
				[2] = 'repeated int32':taskIds	[探索事件暨任务id]
			},
		},
	}
--]]
s2c.EXPLORE_PUSH_CHAPTER_INFO = 510300007

--[[
	[1] = {--ResPing
	}
--]]
s2c.LOGIN_RES_PING = 990100003

--[[
	[1] = {--ResClientLoadSuccess
	}
--]]
s2c.LOGIN_RES_CLIENT_LOAD_SUCCESS = 990100008

--[[
	[1] = {--ResOperateConsole
		[1] = {--ConsoleInfo
			[1] = 'int32':id
			[2] = 'int32':status	[ 1已激活 2已完成]
		},
	}
--]]
s2c.DUNGEON_RES_OPERATE_CONSOLE = 230100004

--[[
	[1] = {--ResChatMsg
		[1] = 'int32':time	[禁言截止时间]
	}
--]]
s2c.CHAT_RES_CHAT = 610100001

--[[
	[1] = {--ResEnterGame
		[1] = 'int32':serverTime	[服务器时间]
		[2] = {--PlayerInfo
			[1] = 'int32':pid	[ 玩家ID]
			[2] = 'string':name	[ 玩家名称]
			[3] = 'int32':lvl	[ 玩家等级]
			[4] = 'int64':exp	[ 玩家经验]
			[5] = 'int32':vip_lvl	[ VIP等级]
			[6] = 'int64':vip_exp	[ VIP经验]
			[7] = {--Language(enum)
				'v4':Language
			},
			[8] = 'string':remark	[ 宣言]
			[9] = 'int32':helpFightHeroCid	[ 助战英雄ID]
			[10] = {--repeated PlayerAttr
				[1] = {--PlayerAttrKey(enum)
					'v4':PlayerAttrKey
				},
				[2] = 'int32':attrVal	[ 属性值]
			},
			[11] = 'bool':isFirstLogin	[是否初次登录]
			[12] = 'string':clientDiscreteData	[客户端离散数据]
			[13] = 'string':settings	[ 设置信息]
			[14] = 'repeated int32':recoverTimeList	[体力精力回复时间]
			[15] = 'int32':portraitCid	[ 玩家头像CID]
			[16] = 'int32':portraitFrameCid	[ 玩家头像框CID]
			[18] = 'int32':unionId	[ 玩家社团Id]
			[19] = 'string':unionName	[ 玩家社团名]
			[20] = 'int32':titleId	[ 称号id]
			[21] = 'int32':createTime	[ 建号时间]
		},
		[3] = 'int32':queue	[当前排队序号]
		[4] = 'int32':queueTime	[预计排队时间(分钟)    //预计排队时间(分钟)]
	}
--]]
s2c.LOGIN_RES_ENTER_GAME = 990100001

--[[
	[1] = {--ResObstacleReward
		[1] = 'int32':obstacleId
		[2] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
		[3] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.DUNGEON_RES_OBSTACLE_REWARD = 230100010

--[[
	[1] = {--ResHeroLevelUpBreakthrough
		[1] = 'bool':successful	[ 突破是否成功]
		[2] = 'int32':stage	[ 突破后的阶数]
		[3] = 'int32':level	[ 突破后的等级(目前默认1级)    // 突破后的等级(目前默认1级)]
		[4] = 'int32':heroId	[ 精灵id]
	}
--]]
s2c.HERO_RES_HERO_LEVEL_UP_BREAKTHROUGH = 140100005

--[[
	[1] = {--ResAddDiyEquipScheme
		[1] = {--DiyEquipScheme
			[1] = 'int32':schemeId	[ 自定义方案索引]
			[2] = 'string':name	[ 方案名]
			[3] = 'repeated string':equipIds	[ 装备实例id]
		},
	}
--]]
s2c.HERO_RES_ADD_DIY_EQUIP_SCHEME = 140100049

--[[
	[1] = {--RespInitChatInfo
		[1] = 'int32':roomId
		[2] = {--repeated ChatInfo
			[1] = 'int32':channel	[	聊天类型:1.公共 2.私聊;3.帮派 4.系统 5.队伍 6.队伍系统邀请]
			[2] = 'int32':fun	[ 	功能类型:1.聊天 2.深渊组队邀请  6系统消息]
			[3] = 'string':content	[	内容]
			[4] = 'int32':pid	[	说话人的id]
			[5] = 'string':pname	[	说话人名称]
			[6] = 'int32':lvl	[ 	玩家等级]
			[7] = 'int32':helpFightHeroCid
			[8] = 'int32':portraitCid	[玩家头像]
			[9] = 'int32':portraitFrameCid	[玩家头像框]
			[10] = 'int32':titleId	[称号]
			[11] = 'int32':chatFrameCid	[气泡框]
		},
	}
--]]
s2c.CHAT_RESP_INIT_CHAT_INFO = 610100003

--[[
	[1] = {--PlayerInfo
		[1] = 'int32':pid	[ 玩家ID]
		[2] = 'string':name	[ 玩家名称]
		[3] = 'int32':lvl	[ 玩家等级]
		[4] = 'int64':exp	[ 玩家经验]
		[5] = 'int32':vip_lvl	[ VIP等级]
		[6] = 'int64':vip_exp	[ VIP经验]
		[7] = {--Language(enum)
			'v4':Language
		},
		[8] = 'string':remark	[ 宣言]
		[9] = 'int32':helpFightHeroCid	[ 助战英雄ID]
		[10] = {--repeated PlayerAttr
			[1] = {--PlayerAttrKey(enum)
				'v4':PlayerAttrKey
			},
			[2] = 'int32':attrVal	[ 属性值]
		},
		[11] = 'bool':isFirstLogin	[是否初次登录]
		[12] = 'string':clientDiscreteData	[客户端离散数据]
		[13] = 'string':settings	[ 设置信息]
		[14] = 'repeated int32':recoverTimeList	[体力精力回复时间]
		[15] = 'int32':portraitCid	[ 玩家头像CID]
		[16] = 'int32':portraitFrameCid	[ 玩家头像框CID]
		[18] = 'int32':unionId	[ 玩家社团Id]
		[19] = 'string':unionName	[ 玩家社团名]
		[20] = 'int32':titleId	[ 称号id]
		[21] = 'int32':createTime	[ 建号时间]
	}
--]]
s2c.PLAYER_PLAYER_INFO = 510100003

--[[
	[1] = {--ResExploreInfo
		[1] = {--repeated ChapterInfo
			[1] = 'int32':id	[章节Id]
			[2] = {--ExploreGarrisonFmt
				[1] = {--FormationInfo
					[1] = {--repeated FormationPostion
						[1] = 'int32':heroId	[ 精灵id]
						[2] = 'int32':position	[ 精灵位置]
						[3] = 'bool':specifiedBySystem	[ 此位置是否由系统指定]
					},
				},
				[2] = 'repeated int32':condition	[驻守事件达成条件索引,从1开始]
			},
			[3] = 'repeated int32':areas	[已激活区域id]
			[4] = {--GarrisonEvent
				[1] = 'int32':id	[事件Id]
				[2] = 'bool':finish	[是否完成]
				[3] = 'int32':endTime	[完成时间点,战斗事件则可忽略]
			},
			[5] = {--repeated ExploreTaskInfo
				[1] = 'int32':area	[区域Id]
				[2] = 'repeated int32':taskIds	[探索事件暨任务id]
			},
		},
		[2] = {--ExploreData
			[1] = 'int32':chapter	[章节Id]
			[2] = 'bool':finish	[是否探索完成]
			[3] = {--repeated ExploreAreaData
				[1] = 'int32':area	[区域Id]
				[2] = 'int32':totalCnt	[最大探索次数]
				[3] = 'int32':fnshCnt	[已完成探索次数]
				[4] = 'bool':finish	[是否探索完成]
				[5] = 'int32':endTime	[当前次探索完成时间点]
			},
			[4] = 'int32':endTime	[探索完成时间点]
			[5] = {--repeated ExploreGradeReward
				[1] = 'int32':gradeId	[分类id]
				[2] = 'int32':count	[数量]
				[3] = {--repeated RewardsMsg
					[1] = 'int32':id
					[2] = 'int32':num
				},
			},
			[6] = 'int32':searchLv	[探索奖励档位]
		},
	}
--]]
s2c.EXPLORE_RES_EXPLORE_INFO = 510300001

--[[
	[1] = {--PushExploreData
		[1] = {--ExploreData
			[1] = 'int32':chapter	[章节Id]
			[2] = 'bool':finish	[是否探索完成]
			[3] = {--repeated ExploreAreaData
				[1] = 'int32':area	[区域Id]
				[2] = 'int32':totalCnt	[最大探索次数]
				[3] = 'int32':fnshCnt	[已完成探索次数]
				[4] = 'bool':finish	[是否探索完成]
				[5] = 'int32':endTime	[当前次探索完成时间点]
			},
			[4] = 'int32':endTime	[探索完成时间点]
			[5] = {--repeated ExploreGradeReward
				[1] = 'int32':gradeId	[分类id]
				[2] = 'int32':count	[数量]
				[3] = {--repeated RewardsMsg
					[1] = 'int32':id
					[2] = 'int32':num
				},
			},
			[6] = 'int32':searchLv	[探索奖励档位]
		},
	}
--]]
s2c.EXPLORE_PUSH_EXPLORE_DATA = 510300009

--[[
	[1] = {--ResReceiveGarrisonAward
		[1] = {--repeated RewardsMsg
			[1] = 'int32':id
			[2] = 'int32':num
		},
	}
--]]
s2c.EXPLORE_RES_RECEIVE_GARRISON_AWARD = 510300006

--[[
	[1] = {--ResDiyEquipSchemeChangeName
		[1] = {--DiyEquipScheme
			[1] = 'int32':schemeId	[ 自定义方案索引]
			[2] = 'string':name	[ 方案名]
			[3] = 'repeated string':equipIds	[ 装备实例id]
		},
	}
--]]
s2c.HERO_RES_DIY_EQUIP_SCHEME_CHANGE_NAME = 140100048

--[[
	[1] = {--ResGetHerosInfo
		[1] = {--repeated HeroInfo
			[1] = 'int32':id	[ 精灵的protoid]
			[2] = 'int32':level	[ 等级]
			[3] = 'int32':exp	[ 精灵升级的当前经验值]
			[4] = 'int32':stage	[ 精灵的当前等阶]
			[5] = 'int32':star	[ 精灵的稀有度]
			[6] = 'int32':dressId	[ 精灵的时装id]
			[7] = {--repeated HeroAttribute
				[1] = 'int32':attrId
				[2] = 'int32':attrVal
			},
			[8] = {--repeated HeroSkillTypeInfo
				[1] = 'int32':skillType	[ 技能类型]
				[2] = 'int32':skillLevel	[ 根据规则同一个类型的小技能共享一个等级]
			},
			[9] = 'repeated int32':nodes	[ 精灵当前稀有度已激活的节点id集合]
			[10] = 'repeated string':equipIds	[ 装备实例id]
		},
		[2] = 'int32':showedHero	[ 看板娘id (前台接待的单词太复杂,不用)    // 看板娘id (前台接待的单词太复杂,不用)]
		[3] = {--repeated DiyEquipScheme
			[1] = 'int32':schemeId	[ 自定义方案索引]
			[2] = 'string':name	[ 方案名]
			[3] = 'repeated string':equipIds	[ 装备实例id]
		},
	}
--]]
s2c.HERO_RES_GET_HEROS_INFO = 140100001

return s2c