return
{
	["id"]=10021,
	["name"]="木桩训练",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Demo01.unity",
	["sceneFile"]="Assets/Scenes/Demo01.unity",
	["soundEventName"]="",
	["desc"]="",
	["cameraEffect"]={
		["templateId"]=0,
		["appoint"]=false,
		["center"]=FixedVector2(524288, 524288) --[[(0.5, 0.5)]],
	},
	["borns"]={
		[1]={
			["uid"]="33c9387813444fac8e6b12a342bd4dca",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(8503951, 10485, -5242880) --[[(8.11, 0.009999752, -5)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 371929920, 0) --[[(0, 354.7, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
	},
	["strongholds"]={
		[1]="Fixed_SH_001",
		[2]="Fixed_SH_002",
	},
	["areas"]={
		[1]="Fixed_BattleArea_001",
		[2]="Fixed_BattleArea_002",
	},
	["walls"]={
		[1]="Fixed_BattleArea_001_Wall",
		[2]="Fixed_BattleArea_002_Wall",
	},
	["triggers"]={
		[1]={
			["id"]=3006,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="刷怪1",
			["loopTimes"]=999,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5e95871022c5460dbcaa5c86b7f17dc3",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="3a7c19f6a41347ebb898f31377db6c87",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5883154833",
							["cid"]=220110205,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(8756069, 0, 1562379) --[[(8.350438, 0, 1.49)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 176275904, 0) --[[(0, 168.1098, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[2]={
			["id"]=3010,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="角色入场",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="cff85ea7618a46218ee4d1f510e491e6",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="4d8254e5604144e8bb5e4187f798e27a",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
			}},
		[3]={
			["id"]=3021,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=999,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5874e5f1346e4c1c806009bd5723f5c0",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="11911500cafa4116a49ea3e9d08a0d51",
					["Type"]="CheckMonsterNum",
					["enable"]=true,
					["num"]=1,
					["relationalOperator"]=1 --[[LESS_THAN(小于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="84df9da95d3d4213a9da6e123048107b",
					["Type"]="CreateMonsters",
					["enable"]=false,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="6685025503",
							["cid"]=220110100,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
	},
}