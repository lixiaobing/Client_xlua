return
{
	["id"]=10030,
	["name"]="尼尔测试",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Test_Nier.unity",
	["sceneFile"]="Assets/Scenes/Test_Nier.unity",
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
				["position"]=FixedVector3(180564784, 64809864, -36700160) --[[(172.2, 61.8075, -35)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
	},
	["strongholds"]={
	},
	["areas"]={
	},
	["walls"]={
	},
	["triggers"]={
		[1]={
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
				[2]={
					["id"]="45db841cbe804384b1dd167e5f14c932",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="1003035",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(114189928, 1059061, -104647888) --[[(108.9, 1.01, -99.8)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="1003021",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(80488696, 1059061, -96311704) --[[(76.76, 1.01, -91.85)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="1003022",
							["cid"]=220110008,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(67769464, 1059061, -71093456) --[[(64.63, 1.01, -67.8)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[2]={
			["id"]=3013,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5ef7943d996a42468cf25ba2a290c673",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="41f6a7c56f15483abac49c4e642c165a",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="838597cb9dbb4c088921feafa9286cf5",
							["cid"]=2302,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(184339664, 56448952, -58258884) --[[(175.8, 53.83392, -55.56)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 287145216, 0) --[[(0, 273.843, 0)]],
								["size"]=FixedVector3(2097152, 3145728, 1048576) --[[(2, 3, 1)]],
							}
						},
						[2]={
							["uid"]="c0a4ba27cf4241b19e7bc05e6459dd91",
							["cid"]=2302,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(68031608, 19713228, -220106592) --[[(64.88, 18.8, -209.91)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(2097152, 3145728, 1048576) --[[(2, 3, 1)]],
							}
						},
						[3]={
							["uid"]="6b179013915547378ecebf28ebc26423",
							["cid"]=2302,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-5305794, -8378122, -25931284) --[[(-5.06, -7.99, -24.73)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(2097152, 3145728, 1048576) --[[(2, 3, 1)]],
							}
						},
						[4]={
							["uid"]="5207e61fe603460e836f6309a5b1aeff",
							["cid"]=2302,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-55805216, 10496246, -79828088) --[[(-53.22, 10.01, -76.13)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(2097152, 3145728, 1048576) --[[(2, 3, 1)]],
							}
						},
						[5]={
							["uid"]="e72bab8edc304d1f88f92732b8ce1ffa",
							["cid"]=2302,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-45088768, 10496246, -138726608) --[[(-43, 10.01, -132.3)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(2097152, 3145728, 1048576) --[[(2, 3, 1)]],
							}
						},
						[6]={
							["uid"]="a4de12a354664f09be9b119bac1cdf3a",
							["cid"]=2302,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(34254716, 18884854, 126379592) --[[(32.66784, 18.01, 120.525)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 95640184, 0) --[[(0, 91.20959, 0)]],
								["size"]=FixedVector3(2097152, 3145728, 1048576) --[[(2, 3, 1)]],
							}
						},
					},
				},
			}},
		[3]={
			["id"]=3014,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="7cb6ea0c36894d5e8fd20a44b9752400",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="0e63fa2d3bed4f85b085cd400ff434f7",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="7760e5a3f92d47799315ec96f5d43b29",
							["cid"]=2020,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(104008256, 1719664, -124612768) --[[(99.19, 1.64, -118.84)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="88f76b17799d467c85aff6821aaf4b95",
							["cid"]=2020,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-59947088, 2621440, 87556096) --[[(-57.17, 2.5, 83.5)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["uid"]="3a7d8be3fce3426390b1df7f063d693a",
							["cid"]=2020,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(194793968, 11534336, 111893544) --[[(185.77, 11, 106.71)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["uid"]="274dcbb58c1345dca03034ff18714c2f",
							["cid"]=2020,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-46368032, 1048576, -97685344) --[[(-44.22, 1, -93.16)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["uid"]="4b5c375b870e4a3d941e57dee39b73f0",
							["cid"]=2020,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-140897152, 1048576, 9489613) --[[(-134.37, 1, 9.05)]],
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