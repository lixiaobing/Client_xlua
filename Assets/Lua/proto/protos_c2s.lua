local tblProto = {
	files = {
		[1] = 'C2S/C2SBattleMsg',
		[2] = 'C2S/C2SChatMsg',
		[3] = 'C2S/C2SDungeonMsg',
		[4] = 'C2S/C2SExploreMsg',
		[5] = 'C2S/C2SFriendMsg',
		[6] = 'C2S/C2SHeroMsg',
		[7] = 'C2S/C2SItemMsg',
		[8] = 'C2S/C2SLoginMsg',
		[9] = 'C2S/C2SMailMsg',
		[10] = 'C2S/C2SPlayerMsg',
		[11] = 'C2S/C2SRechargeMsg',
		[12] = 'C2S/C2SShipMsg',
		[13] = 'C2S/C2SShopMsg',
		[14] = 'C2S/C2STaskMsg',
	},
	names = {
		[990100008] = 'phanta.dal2.protobuf.c2s.ReqClientLoadSuccess',
		[610100001] = 'phanta.dal2.protobuf.c2s.ReqChatMsg',
		[140100044] = 'phanta.dal2.protobuf.c2s.ReqStrengthenEquip',
		[980100001] = 'phanta.dal2.protobuf.c2s.GetOrderNo',
		[140100003] = 'phanta.dal2.protobuf.c2s.ReqChangeShowedHero',
		[110100011] = 'phanta.dal2.protobuf.c2s.ReqItemRecoverInfo',
		[410100003] = 'phanta.dal2.protobuf.c2s.ReqEventChange',
		[510100004] = 'phanta.dal2.protobuf.c2s.GetFormations',
		[140100035] = 'phanta.dal2.protobuf.c2s.ReqHeroDiyAndSystemGoIntoFormation',
		[610200004] = 'phanta.dal2.protobuf.c2s.ReqOperate',
		[140100042] = 'phanta.dal2.protobuf.c2s.ReqPutOnEquip',
		[510100014] = 'phanta.dal2.protobuf.c2s.ReqSetBackground',
		[990100001] = 'phanta.dal2.protobuf.c2s.ReqEnterGame',
		[510300005] = 'phanta.dal2.protobuf.c2s.ReqCancelExplore',
		[510100012] = 'phanta.dal2.protobuf.c2s.ReqAskSwitch',
		[140100041] = 'phanta.dal2.protobuf.c2s.ReqPutDownAllEquips',
		[510100013] = 'phanta.dal2.protobuf.c2s.ReqWelfareInfo',
		[510100003] = 'phanta.dal2.protobuf.c2s.GetPlayerInfo',
		[230100006] = 'phanta.dal2.protobuf.c2s.ReqFightOver',
		[110100003] = 'phanta.dal2.protobuf.c2s.ReqOpenBag',
		[140100049] = 'phanta.dal2.protobuf.c2s.ReqAddDiyEquipScheme',
		[230100001] = 'phanta.dal2.protobuf.c2s.ReqDungeonInfo',
		[980100004] = 'phanta.dal2.protobuf.c2s.GetTotalPayRewardInfo',
		[980100007] = 'phanta.dal2.protobuf.c2s.ReqChargeExchange',
		[410100001] = 'phanta.dal2.protobuf.c2s.ReqDungeonTaskInfo',
		[980100006] = 'phanta.dal2.protobuf.c2s.ReqRewardTotalPay',
		[410100013] = 'phanta.dal2.protobuf.c2s.ReqReceiveTask',
		[140100021] = 'phanta.dal2.protobuf.c2s.ReqHeroSkillLevelUp',
		[230100003] = 'phanta.dal2.protobuf.c2s.ReqFightStart',
		[610300002] = 'phanta.dal2.protobuf.c2s.GetMails',
		[140100046] = 'phanta.dal2.protobuf.c2s.ReqEquipAwake',
		[140100048] = 'phanta.dal2.protobuf.c2s.ReqDiyEquipSchemeChangeName',
		[510300004] = 'phanta.dal2.protobuf.c2s.ReqReceiveExploreAward',
		[510200032] = 'phanta.dal2.protobuf.c2s.ReqShipTalentLevelUp',
		[140100045] = 'phanta.dal2.protobuf.c2s.ReqEquipBreakthrough',
		[220100002] = 'phanta.dal2.protobuf.c2s.ReqBattleLoadComplete',
		[410100002] = 'phanta.dal2.protobuf.c2s.ReqAcceptDungeonTask',
		[610100003] = 'phanta.dal2.protobuf.c2s.ReqInitChatInfo',
		[510100015] = 'phanta.dal2.protobuf.c2s.ReqBackgroundInfo',
		[610200006] = 'phanta.dal2.protobuf.c2s.ReqBindInviteCode',
		[610200002] = 'phanta.dal2.protobuf.c2s.ReqRecommendFriends',
		[410100004] = 'phanta.dal2.protobuf.c2s.ReqReceiveDungeonTask',
		[510100010] = 'phanta.dal2.protobuf.c2s.Settings',
		[710200001] = 'phanta.dal2.protobuf.c2s.ReqShopsAllInfo',
		[410100011] = 'phanta.dal2.protobuf.c2s.ReqTaskInfo',
		[230100004] = 'phanta.dal2.protobuf.c2s.ReqOperateConsole',
		[610200001] = 'phanta.dal2.protobuf.c2s.ReqFriends',
		[140100005] = 'phanta.dal2.protobuf.c2s.ReqHeroLevelUpBreakthrough',
		[710200002] = 'phanta.dal2.protobuf.c2s.ReqShopBuyGoods',
		[710200005] = 'phanta.dal2.protobuf.c2s.ReqShopRefresh',
		[510300001] = 'phanta.dal2.protobuf.c2s.ReqExploreInfo',
		[510200011] = 'phanta.dal2.protobuf.c2s.ReqShipItemUnlock',
		[140100011] = 'phanta.dal2.protobuf.c2s.ReqHeroStarUpActivateNode',
		[510200001] = 'phanta.dal2.protobuf.c2s.ReqShipAllInfo',
		[510200012] = 'phanta.dal2.protobuf.c2s.ReqShipItemStarUp',
		[510200023] = 'phanta.dal2.protobuf.c2s.ReqShipBuildingTakeProduct',
		[510100011] = 'phanta.dal2.protobuf.c2s.ReqChangeAntiAddiction',
		[140100053] = 'phanta.dal2.protobuf.c2s.ReqSetEquipLock',
		[140100043] = 'phanta.dal2.protobuf.c2s.ReqPutDownEquip',
		[510300002] = 'phanta.dal2.protobuf.c2s.ReqStartExplore',
		[140100032] = 'phanta.dal2.protobuf.c2s.ReqHeroDiyGoIntoFormation',
		[510200025] = 'phanta.dal2.protobuf.c2s.ReqShipBuildingHeroEnter',
		[230100005] = 'phanta.dal2.protobuf.c2s.ReqDestroyObstacle',
		[980100005] = 'phanta.dal2.protobuf.c2s.GetTotalPayRewardCfg',
		[140100050] = 'phanta.dal2.protobuf.c2s.ReqDeleteDiyEquipScheme',
		[220100006] = 'phanta.dal2.protobuf.c2s.ReqBattleResult',
		[990100002] = 'phanta.dal2.protobuf.c2s.ReqReconnect',
		[510300010] = 'phanta.dal2.protobuf.c2s.ReqExploreHeroGoIntoFormation',
		[410100012] = 'phanta.dal2.protobuf.c2s.ReqAcceptTask',
		[140100051] = 'phanta.dal2.protobuf.c2s.ReqUseEquipScheme',
		[510200022] = 'phanta.dal2.protobuf.c2s.ReqShipBuildingSpeedUp',
		[230100012] = 'phanta.dal2.protobuf.c2s.ReqPickupReward',
		[510100002] = 'phanta.dal2.protobuf.c2s.OperateFormation',
		[220100001] = 'phanta.dal2.protobuf.c2s.ReqStartBattle',
		[510100005] = 'phanta.dal2.protobuf.c2s.ChangeHelpFightHero',
		[230100002] = 'phanta.dal2.protobuf.c2s.ReqFightPrepare',
		[510300003] = 'phanta.dal2.protobuf.c2s.ReqExploreSpeedUp',
		[140100004] = 'phanta.dal2.protobuf.c2s.ReqHeroLevelUpAddExp',
		[140100036] = 'phanta.dal2.protobuf.c2s.ReqHeroDiyAndSystemGoOutFormation',
		[140100034] = 'phanta.dal2.protobuf.c2s.ReqHeroDiyGoOutFormation',
		[610100002] = 'phanta.dal2.protobuf.c2s.ReqChangeRoom',
		[510200031] = 'phanta.dal2.protobuf.c2s.ReqShipTalentUnlock',
		[510100008] = 'phanta.dal2.protobuf.c2s.ReqHelpFightPlayers',
		[510100001] = 'phanta.dal2.protobuf.c2s.SetPlayerInfo',
		[610200007] = 'phanta.dal2.protobuf.c2s.ReqRewardInvite',
		[510100016] = 'phanta.dal2.protobuf.c2s.PanelStayTime',
		[610300001] = 'phanta.dal2.protobuf.c2s.MailHandleMsg',
		[140100012] = 'phanta.dal2.protobuf.c2s.ReqHeroStarUpStarUp',
		[990100003] = 'phanta.dal2.protobuf.c2s.ReqPing',
		[140100001] = 'phanta.dal2.protobuf.c2s.ReqGetHerosInfo',
		[990100009] = 'phanta.dal2.protobuf.c2s.ReqUnlockedFunction',
		[990100005] = 'phanta.dal2.protobuf.c2s.ReqFunctionSwitch',
		[140100031] = 'phanta.dal2.protobuf.c2s.ReqHeroFormations',
		[230100007] = 'phanta.dal2.protobuf.c2s.ReqPullFightData',
		[510100007] = 'phanta.dal2.protobuf.c2s.ReqSwitchFormation',
		[140100002] = 'phanta.dal2.protobuf.c2s.ReqUnlockOneHero',
		[110100004] = 'phanta.dal2.protobuf.c2s.ReqTransformation',
		[980100002] = 'phanta.dal2.protobuf.c2s.GetBuyRecordInfo',
		[610200005] = 'phanta.dal2.protobuf.c2s.ReqGetFriendInviteInfo',
		[140100047] = 'phanta.dal2.protobuf.c2s.ReqEquipAwakeSelect',
		[140100033] = 'phanta.dal2.protobuf.c2s.ReqHeroSpecifyDiyFormation',
		[110100002] = 'phanta.dal2.protobuf.c2s.ReqUseItem',
		[510300006] = 'phanta.dal2.protobuf.c2s.ReqReceiveGarrisonAward',
		[510300011] = 'phanta.dal2.protobuf.c2s.ReqExploreHeroGoOutFormation',
		[110100001] = 'phanta.dal2.protobuf.c2s.ReqGetItems',
		[510100006] = 'phanta.dal2.protobuf.c2s.ReqTargetPlayerInfo',
		[230100011] = 'phanta.dal2.protobuf.c2s.ReqkillMonster',
		[510100009] = 'phanta.dal2.protobuf.c2s.RecordClientErr',
		[990100004] = 'phanta.dal2.protobuf.c2s.ReqServerTime',
		[980100003] = 'phanta.dal2.protobuf.c2s.GetRechargeCfg',
		[220100004] = 'phanta.dal2.protobuf.c2s.ReqBattlePlayerInput',
		[610200003] = 'phanta.dal2.protobuf.c2s.ReqQueryPlayer',
	}
}
return tblProto