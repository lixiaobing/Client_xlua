return
{
	["id"]=10025,
	["name"]="天台测试",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="newRoom.unity",
	["sceneFile"]="Assets/Scenes/newRoom.unity",
	["soundEventName"]="",
	["desc"]="",
	["warningEffect"]={
		["type"]=1,
		["duration"]=1500,
		["intensity"]=Fixed64(31457280) --[[30]],
		["offset"]=Fixed64(209716) --[[0.2]],
		["targetID"]="",
	},
	["borns"]={
		[1]={
			["uid"]="917c357d0ff44ffd9434915f6d32de14",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-419430, 682375, 136671392) --[[(-0.4, 0.650764, 130.34)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
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
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="feacff9d64b14d689cb54860d08c7baf",
					["Type"]="Start",
					["enable"]=true,
					["time"]=0,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="a28e8d4b1c2f408a9c777c5c4a257b9e",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
			}},
	},
}