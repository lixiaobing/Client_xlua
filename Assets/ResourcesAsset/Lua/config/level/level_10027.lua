return
{
	["id"]=10027,
	["name"]="跳跃测试",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Test_OpenWorld.unity",
	["sceneFile"]="Assets/Scenes/Test_OpenWorld.unity",
	["soundEventName"]="",
	["desc"]="",
	["cameraEffect"]={
		["templateId"]=0,
		["appoint"]=false,
		["center"]=FixedVector2(524288, 524288) --[[(0.5, 0.5)]],
	},
	["borns"]={
		[1]={
			["uid"]="d5f8a12ad83d4b6aaa19a4da184eb6b9",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-88615160, -10969644, 34267464) --[[(-84.51, -10.46147, 32.68)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
	},
	["strongholds"]={
		[1]="Fixed_001",
	},
	["areas"]={
		[1]="Fixed_BattleArea_001",
	},
	["walls"]={
		[1]="Fixed_wall",
	},
	["triggers"]={
		[1]={
			["id"]=3001,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="玩家出生点位置",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="31e02ed779f344a49e16f105aee1f2a8",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="cc38fbc60da1412180a5b17e36b254b8",
					["Type"]="PlayPlot",
					["enable"]=false,
					["delayTime"]=Fixed64(0) --[[0]],
					["fadeInTime"]=0,
					["fadeOutTime"]=0,
					["prefab"]="Timeline/creeps02@StartAcion",
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					},
					["events"]={
					},
				},
				[2]={
					["id"]="59930226117d4f57846c727d200a1cab",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
			}},
		[2]={
			["id"]=3002,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="9468b34561184373b3fdf1070aa87077",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="95cc53e6a30c485a822f77a3523ec34a",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="fedd5bad753b492186a64a3fee086825",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-90867496, -10969644, 38828768) --[[(-86.658, -10.46147, 37.03)]],
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