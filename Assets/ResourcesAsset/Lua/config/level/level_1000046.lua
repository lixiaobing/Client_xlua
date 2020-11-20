return
{
	["id"]=1000046,
	["name"]="Test",
	["groupName"]="未分组",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Demo01.unity",
	["sceneFile"]="Assets/Scenes/Demo01.unity",
	["soundEventName"]="",
	["desc"]="",
	["warningEffect"]={
		["type"]=1 --[[RadialBlur(径像模糊)]],
		["duration"]=Fixed64(1572864000) --[[1500]],
		["intensity"]=Fixed64(31457280) --[[30]],
		["offset"]=Fixed64(209716) --[[0.2]],
		["targetID"]="",
	},
	["borns"]={
		[1]={
			["uid"]="c58a3d121d9147fbb8ad7ef3d1cd5365",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(0, 677381, 0) --[[(0, 0.646, 0)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
	},
	["triggers"]={
		[1]={
			["id"]=3001,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="638f20ab6df44cea9ff1bc4b6d9198ca",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="8db5f41cbc2c439bbe9f024661f0f8e9",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
			}},
		[2]={
			["id"]=3002,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="6da9c643677e4636a6ad4d75824454ad",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=1 --[[CUBE(立方体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(10926162, 314573, 0) --[[(10.42, 0.3, 0)]],
						["scale"]=FixedVector3(2097152, 2097152, 2097152) --[[(2, 2, 2)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
			}},
		[3]={
			["id"]=3003,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="d1afdd876a6746ed8b96964a74ccb572",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(5242880000) --[[5000]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="db3f02beeff54b24bd0bfaa8ff3b9f9e",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=0,
					["titleId"]=1,
				},
			}},
	},
}