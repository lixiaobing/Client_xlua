return
{
	["id"]=10023,
	["name"]="完整关卡测试关",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Demo01.unity",
	["sceneFile"]="Assets/Scenes/Demo01.unity",
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
			["uid"]="33c9387813444fac8e6b12a342bd4dca",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(1048576, 1048576, -9542042) --[[(1, 1, -9.1)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 371929920, 0) --[[(0, 354.7, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
	},
	["triggers"]={
		[1]={
			["id"]=3006,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="刷第一波怪物",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="cb466302e33c4361a98072e284d8b657",
					["Type"]="Start",
					["enable"]=true,
					["time"]=0,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="3a7c19f6a41347ebb898f31377db6c87",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=0,
					["monsters"]={
						[1]={
							["delayTime"]=200,
							["uid"]="9e3967e414054876833889a0d7c3508e",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(3145728, 163133, 0) --[[(3, 0.1555758, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=200,
							["uid"]="abef96957d4f4a1898e135b2db981ee5",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(973989, 163133, 2991145) --[[(0.9288683, 0.1555758, 2.852578)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=200,
							["uid"]="830d01e2ce60469e9d7ef75ec702f63c",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-2542589, 163133, 1852253) --[[(-2.424802, 0.1555758, 1.766447)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=200,
							["uid"]="576df4265103446d8a9c43dd8b2c7708",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-2548476, 163133, -1844145) --[[(-2.430417, 0.1555758, -1.758714)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["delayTime"]=200,
							["uid"]="51f222e4e74243569cf43a9b90989f6a",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(964457, 163133, -2994232) --[[(0.9197779, 0.1555758, -2.855522)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
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
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="cff85ea7618a46218ee4d1f510e491e6",
					["Type"]="Start",
					["enable"]=true,
					["time"]=0,
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
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="刷第二波怪物",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="3d035dd3703d4d668f52cb963dacb34a",
					["Type"]="Dead",
					["enable"]=true,
					["selectTargetType"]=2,
					["targetId"]=0,
					["relationalOperator"]=0,
					["num"]=5,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="f05ca88ec34f4277b06f4f427b5b8850",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=0,
					["monsters"]={
						[1]={
							["delayTime"]=200,
							["uid"]="9e3967e414054876833889a0d7c3508e",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(5242880, 163133, 0) --[[(5, 0.1555758, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=200,
							["uid"]="abef96957d4f4a1898e135b2db981ee5",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(1623315, 163133, 4985242) --[[(1.548114, 0.1555758, 4.754297)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=200,
							["uid"]="830d01e2ce60469e9d7ef75ec702f63c",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-4237649, 163133, 3087089) --[[(-4.041337, 0.1555758, 2.944077)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=200,
							["uid"]="576df4265103446d8a9c43dd8b2c7708",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-4247460, 163133, -3073576) --[[(-4.050694, 0.1555758, -2.93119)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["delayTime"]=200,
							["uid"]="7ab8aacf0f2e4abdb4fd46a36be5db6c",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(1607429, 163133, -4990387) --[[(1.532963, 0.1555758, -4.759204)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[4]={
			["id"]=3022,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="刷BOSS",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="062bbc618a0e468eb0ac7bd73d201881",
					["Type"]="Dead",
					["enable"]=true,
					["selectTargetType"]=2,
					["targetId"]=0,
					["relationalOperator"]=0,
					["num"]=10,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="53d6e56fee8c4c02b055e371ab1f0985",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=0,
					["monsters"]={
						[1]={
							["delayTime"]=200,
							["uid"]="9e3967e414054876833889a0d7c3508e",
							["cid"]=220110006,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 163133, 20971) --[[(0, 0.1555758, 0.02)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 152316144, 0) --[[(0, 145.26, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[5]={
			["id"]=3023,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="关卡通关",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="3b3830dd1bfe4d7f8bd5f929c0eda457",
					["Type"]="Dead",
					["enable"]=true,
					["selectTargetType"]=2,
					["targetId"]=0,
					["relationalOperator"]=0,
					["num"]=11,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="625586f9d3e048ce8388a707c9ee226d",
					["Type"]="BattleResult",
					["enable"]=true,
					["delayTime"]=0,
					["battleResultType"]=1,
					["isTimeScale"]=true,
				},
			}},
	},
}