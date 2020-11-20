return
{
	["id"]=10022,
	["name"]="对战训练",
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
				["position"]=FixedVector3(-4669309, -46582, 19624100) --[[(-4.453, -0.04442406, 18.715)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
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
			["desc"]="刷怪",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="cb466302e33c4361a98072e284d8b657",
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
							["uid"]="5718580376",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(199229, -46582, 25773998) --[[(0.19, -0.04442453, 24.58)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718694366",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-4225761, -46582, 28447866) --[[(-4.03, -0.04442453, 27.13)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718719234",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(4938793, -46582, 28437382) --[[(4.71, -0.04442453, 27.12)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718748524",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(4729078, -46582, 24347934) --[[(4.51, -0.04442453, 23.22)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718773532",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(199229, -46582, 14501806) --[[(0.19, -0.04442453, 13.83)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[6]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718798582",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(199229, -46582, 11377050) --[[(0.19, -0.04442453, 10.85)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[7]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718822632",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(199229, -46582, 9070182) --[[(0.19, -0.04442453, 8.65)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[8]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718849353",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(4624220, -46582, 15644754) --[[(4.41, -0.04442453, 14.92)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[9]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718876455",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-5096079, -46582, 15120466) --[[(-4.86, -0.04442453, 14.42)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[10]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718906255",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-2862612, -46582, 11324621) --[[(-2.73, -0.04442453, 10.8)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[11]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5718928983",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(199229, -46582, 19881000) --[[(0.19, -0.04442453, 18.96)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
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
			["desc"]="入场",
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
			["id"]=3011,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="刷怪",
			["loopTimes"]=9999,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="72046bfe33a640f1abcee9de707992b2",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="3aea3b37ec2c497e891e5eebba103c53",
					["Type"]="CheckMonsterNum",
					["enable"]=true,
					["num"]=1,
					["relationalOperator"]=1 --[[LESS_THAN(小于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="dad8d8dd5a7c449e8416397c1d6922d9",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="6685089921",
							["cid"]=220110101,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(199229, -46582, 32338084) --[[(0.19, -0.04442453, 30.84)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 266967456, 0) --[[(0, 254.6, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
	},
}