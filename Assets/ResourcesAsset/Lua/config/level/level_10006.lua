return
{
	["id"]=10006,
	["name"]="KYZ测试",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Test_Demo01_bloom.unity",
	["sceneFile"]="Assets/Scenes/Test_Demo01_bloom.unity",
	["soundEventName"]="",
	["desc"]="",
	["cameraEffect"]={
		["templateId"]=0,
		["appoint"]=false,
		["center"]=FixedVector2(524288, 524288) --[[(0.5, 0.5)]],
	},
	["borns"]={
		[1]={
			["uid"]="4dc95f60831d456785f6546aaeced439",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(859832, 163133, 5242880) --[[(0.82, 0.1555758, 5)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
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
			["id"]=3004,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="37041b1754034124bfd3be5437d61451",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="786a981bd4114085815182de09725f33",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
				[2]={
					["id"]="bf3751c5c0734e878f3d403138b145da",
					["Type"]="CreateEffect",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["childs"]={
						[1]={
							["name"]="effect_3a2d4a19",
							["durationTime"]=Fixed64(-1048576) --[[-1]],
							["tag"]=0,
							["effectPath"]="Effect/Common/Level_Point_01",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-31457, 0, 0) --[[(-0.03, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["name"]="effect_2a28b60c",
							["durationTime"]=Fixed64(-1048576) --[[-1]],
							["tag"]=0,
							["effectPath"]="Effect/Common/Level_Point_01",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-5253366, 0, 0) --[[(-5.01, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["name"]="effect_36023a30",
							["durationTime"]=Fixed64(-1048576) --[[-1]],
							["tag"]=0,
							["effectPath"]="Effect/Common/Level_Point_01",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-10464788, 0, 0) --[[(-9.98, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["name"]="effect_c0ce1b9c",
							["durationTime"]=Fixed64(-1048576) --[[-1]],
							["tag"]=0,
							["effectPath"]="Effect/Common/Level_Point_01",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-15718154, 0, 0) --[[(-14.99, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["name"]="effect_336b7d75",
							["durationTime"]=Fixed64(-1048576) --[[-1]],
							["tag"]=0,
							["effectPath"]="Effect/Common/Level_Point_01",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-20856176, 0, 0) --[[(-19.89, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[2]={
			["id"]=3005,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="a35e913f1a1b4eeb82b169e99245661f",
					["Type"]="Dead",
					["enable"]=true,
					["selectTargetType"]=2 --[[ANY_MONSTER(任意怪物)]],
					["targetId"]=0,
					["relationalOperator"]=0 --[[EQUAL(等于)]],
					["num"]=9,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="4af2ba8eee624163adffac40b0982a9a",
					["Type"]="BattleResult",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["battleResultType"]=1 --[[VICTORY(胜利)]],
					["isTimeScale"]=true,
				},
			}},
		[3]={
			["id"]=3006,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="86fbf032cc58448fb319e31590968087",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-218753920, 53240396, 152043520) --[[(-208.62, 50.774, 145)]],
						["scale"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="3f065e1f7fd9417eb29e2479d7e2dd00",
					["Type"]="FixCamera",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["topHeight"]=Fixed64(10485760) --[[10]],
					["cameraMode"]=2 --[[TOP(顶视)]],
					["sideLength"]=Fixed64(10485760) --[[10]],
					["sideForward"]=FixedVector3(0, 0, 1048576) --[[(0, 0, 1)]],
				},
				[2]={
					["id"]="fa8195a196c043b09b39357e6056e669",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3008,
					["active"]=true,
				},
			}},
		[4]={
			["id"]=3007,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="d1c68d0e5660467489bb72b98248d1eb",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-135801072, 43882904, 200980560) --[[(-129.51, 41.85, 191.67)]],
						["scale"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="6d16907e3aed4852b021fb0f70a4b3c1",
					["Type"]="FixCamera",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["topHeight"]=Fixed64(10485760) --[[10]],
					["cameraMode"]=1 --[[SIDE(侧面)]],
					["sideLength"]=Fixed64(10485760) --[[10]],
					["sideForward"]=FixedVector3(1048576, 0, 0) --[[(1, 0, 0)]],
				},
			}},
		[5]={
			["id"]=3008,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="1349370774e34a6e8e38265e978fa1b6",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=1 --[[CUBE(立方体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-228012848, 53236204, 146601408) --[[(-217.45, 50.77, 139.81)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="7150e5bc41f44f1a9d640b2349b50b0d",
					["Type"]="ResumCamera",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
				},
				[2]={
					["id"]="650a8a09cbdf42a68df528ea22b752ab",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3006,
					["active"]=true,
				},
			}},
		[6]={
			["id"]=3009,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="81c26ebc0c424a69abc5d570a5a8d0dd",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-111945976, 27331134, 192431520) --[[(-106.76, 26.065, 183.517)]],
						["scale"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="f59dd61f2f8e482a8d7017adb8b85cdc",
					["Type"]="ResumCamera",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
				},
			}},
	},
}