return
{
	["id"]=21001,
	["name"]="贫民窟",
	["groupName"]="001-开放世界-四糸乃",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="Test_City02.unity",
	["sceneFile"]="Assets/Scenes/Test_City02.unity",
	["soundEventName"]="",
	["desc"]="",
	["cameraEffect"]={
		["templateId"]=0,
		["appoint"]=false,
		["center"]=FixedVector2(524288, 524288) --[[(0.5, 0.5)]],
	},
	["borns"]={
		[1]={
			["uid"]="ea0590bcd5154e9982f8d4dd6939dea7",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-8378122, -17647294, -43652220) --[[(-7.99, -16.82977, -41.63)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
		[1]={
			["uid"]="08d3cecb58dd49cda26db633ee99f332",
			["cid"]=1,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-40863008, 335544, -36595304) --[[(-38.97, 0.32, -34.9)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[2]={
			["uid"]="49f9c460ab2e4ac3800be97880f51fb0",
			["cid"]=2,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-38986056, 387974, -36595304) --[[(-37.18, 0.37, -34.9)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[3]={
			["uid"]="0d76e967a54241fdab494c775a04f39c",
			["cid"]=3,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-36951820, 262144, -36595304) --[[(-35.24, 0.25, -34.9)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["strongholds"]={
	},
	["areas"]={
	},
	["walls"]={
	},
	["triggers"]={
		[1]={
			["id"]=3001,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="角色入场",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="7ae5964ecbec4e84b23a86fb2d082e19",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="12e9a4d4d4a84c359184d9cca60a1346",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
				[2]={
					["id"]="d241b84f0fef4a60a4a2579d4beab406",
					["Type"]="SetRunFast",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["runFast"]=false,
				},
			}},
		[2]={
			["id"]=3005,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="报纸1",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="415872f5162d4039813b433290b6256e",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="24483dca17454553a9e4a754c26ad79f",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100102,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="887e879580b14a238ada478023fb1aa0",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="f0d1679f6b0f4e2cbb0f426ad8275ccd",
							["cid"]=2001,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-42100328, 2359296, 41439724) --[[(-40.15, 2.25, 39.52)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 188743680, 0) --[[(0, 180, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="f97a3355cf134e529f406769f2fc65a4",
							["cid"]=2005,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-59192116, 2359296, 40380660) --[[(-56.45, 2.25, 38.51)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="28dd4a68587c48dabb0d2b3d10559d1e",
					["Type"]="CreateAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["effectPath"]="Effect/Common/Level_AirWall_01_hebing",
					["wall"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-28017950, 2139095, 4288676) --[[(-26.72, 2.04, 4.09)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
					["effect"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-26969374, 3316646, 4519362) --[[(-25.72, 3.163, 4.31)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 188743680, 0) --[[(0, 180, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
				[3]={
					["id"]="46d75f11d2f84db6a733aa8a890bb441",
					["Type"]="CreateAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["effectPath"]="Effect/Common/Level_AirWall_01_hebing",
					["wall"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-26161972, 440401, 24547164) --[[(-24.95, 0.42, 23.41)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
					["effect"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-26109544, 3418357, 24735908) --[[(-24.9, 3.26, 23.59)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			}},
		[3]={
			["id"]=3006,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="报纸2",
			["loopTimes"]=999,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="6bfc941d13ee4ccd847c5d7c8478a3d3",
					["Type"]="TaskStateChange",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="66e8bcdf11704c8a80a118837f49a318",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100104,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="2aa2a067ee38482f9c8eb682bec5f0bb",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="e87c8fd563d7421b95537ee0d538ff78",
							["cid"]=2002,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-41240496, 1059061, -55522100) --[[(-39.33, 1.009999, -52.95)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="845c87647ada4b8a8dfc426376e33189",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3006,
					["active"]=false,
				},
			}},
		[4]={
			["id"]=3007,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="传送门",
			["loopTimes"]=999,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="198316336fc843e9a60ac02c6970e425",
					["Type"]="TaskStateChange",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="a3116cfcb95540fbb6cd684aba83f5f1",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100104,
					["parentId"]=0,
					["taskStatus"]=2 --[[Done(完成(已提交任务))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="6b5cf1766d7f4b629a897161a36c63b8",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="620e226451f14b3e9c0677334076d762",
							["cid"]=3,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-64676168, 1117964, -45738884) --[[(-61.68, 1.066174, -43.62)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 188743680, 0) --[[(0, 180, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="a28ae6ab09304605bae6f8ce901e02b7",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3007,
					["active"]=false,
				},
			}},
		[5]={
			["id"]=3008,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="触发报纸1",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="7a8936c22c564834b9fd7cd4f78e9785",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2001,
							["num"]=1,
							["relationalOperator"]=0 --[[EQUAL(等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="898321db503b42988f4dba38d10a4729",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=0,
					["parentId"]=0,
					["taskStatus"]=0 --[[None(未开始(没有接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="324769fdcc334944b713b12b47c85dbd",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20004,
				},
			}},
		[6]={
			["id"]=3009,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="7ec453891c56415e81eeb4d5b304a16a",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="bf2f94bc88074d5e85f1e58bf0974cc6",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="1f1d0c59aecf43b7beaeaae89dfb2812",
							["cid"]=220110201,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-33260830, 2359296, 19188940) --[[(-31.72, 2.25, 18.3)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="f137eda852d740f7ac479fbf0a23131c",
							["cid"]=220110202,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-36252420, 2359296, 6880755) --[[(-34.573, 2.25, 6.562)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 313220992, 0) --[[(0, 298.7108, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="87cb4176dbda4066b20d9db3cc4ce321",
							["cid"]=220110203,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-48402268, 2359296, 19188940) --[[(-46.16, 2.25, 18.3)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 188743680, 0) --[[(0, 180, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5ec6cc7eb58d4d69ae576d6d663b0c64",
							["cid"]=220110204,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-48402268, 2359296, 35777412) --[[(-46.16, 2.25, 34.12)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[7]={
			["id"]=3011,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="1.调查报纸信息，触发剧情对话2。",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="2aff4b8a136841a9ba340917e50451a7",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2002,
							["num"]=1,
							["relationalOperator"]=0 --[[EQUAL(等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="a6bf3ea529364c97aee8c3781cf01eff",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=0,
					["parentId"]=0,
					["taskStatus"]=0 --[[None(未开始(没有接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="401cd19b0e7b4ef08c3ebba791b88f5a",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20005,
				},
			}},
		[8]={
			["id"]=3014,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="开场刷怪",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="6c3693517f9e4c9e8ff5da6f1a82e6bb",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=1 --[[CUBE(立方体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-2474639, -18318622, -32505856) --[[(-2.36, -17.47, -31)]],
						["scale"]=FixedVector3(16777216, 16777216, 16777216) --[[(16, 16, 16)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="92a6798721f5429f8cdd04daf11df3fe",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100102,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="1efbc2c36a174c02aaccbdba9f0e82e2",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="bc5d97bce6ff48a586382696f14ba39d",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-2894072, -17656972, -28136634) --[[(-2.760003, -16.839, -26.83319)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 203271200, 0) --[[(0, 193.8545, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="9cbccf5696d74aa0bd1f295e123a2e14",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-4989554, -17656972, -26039482) --[[(-4.75841, -16.839, -24.83319)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 203271200, 0) --[[(0, 193.8545, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="014f625047ab438ab1fddf93fe565042",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-7088374, -17656972, -28133294) --[[(-6.76, -16.839, -26.83)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 203271200, 0) --[[(0, 193.8545, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="0f1600a5710442bb91d213fa904ab84c",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-4996234, -17656972, -30233780) --[[(-4.764781, -16.839, -28.83318)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 203271200, 0) --[[(0, 193.8545, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[9]={
			["id"]=3018,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="区域任务1",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="456269cfaa754242a7b677eb01e544cc",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-26864518, 2558526, -6910116) --[[(-25.62, 2.44, -6.59)]],
						["scale"]=FixedVector3(4194304, 4194304, 4194304) --[[(4, 4, 4)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="05d0f4a7eca245c3a0b0d8ca7685fbd3",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100103,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="a33ee5aad16343a8835a7138d08085bd",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20024,
				},
			}},
		[10]={
			["id"]=3019,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="出生对话",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="06ca29fd410d46c399d23136092add1d",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="a2162dae1c6d4246b811068d58b996f5",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100102,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="4125303d8b994cb4bfba88228d47ab68",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20001,
				},
				[2]={
					["id"]="c769dc59c1d742e8bed39a40887f396f",
					["Type"]="AcceptTask",
					["enable"]=false,
					["delayTime"]=Fixed64(0) --[[0]],
					["taskId"]=20100201,
					["subTaskId"]=0,
				},
			}},
		[11]={
			["id"]=3020,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="楼梯对话",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="110e328017794b309cc56ffe151b0224",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-19262342, -3523215, -8063549) --[[(-18.37, -3.36, -7.69)]],
						["scale"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="b5571d490e034351a0072c3742db56cf",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100102,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="5f1b9fdd54c44600b235bcffd3d1dfc3",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20002,
				},
				[2]={
					["id"]="3cdbea44798f48918ed8434c6621b028",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3009,
					["active"]=true,
				},
			}},
		[12]={
			["id"]=3022,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="检查门1",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="7454bfa199294445ae90209ac1a9d3bd",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2003,
							["num"]=1,
							["relationalOperator"]=4 --[[GREATER_THAN_OR_EQUAL(大于等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="a7e83dd638e549a2a9e5917249e7f243",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20003,
				},
			}},
		[13]={
			["id"]=3023,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="检查门2",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="1fab926463ad4ea1a1c29a6fb7847117",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2004,
							["num"]=1,
							["relationalOperator"]=4 --[[GREATER_THAN_OR_EQUAL(大于等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="de65a0a26f1f477bad12ca4f9b9ddb93",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=2306001,
					["titleId"]=0,
				},
			}},
		[14]={
			["id"]=3024,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="找到钥匙",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="5ec76ff498f042b1a3143d6a28c58860",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2005,
							["num"]=1,
							["relationalOperator"]=0 --[[EQUAL(等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="54a87efdff32477c9183096c5a45b6da",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20011,
				},
				[2]={
					["id"]="7133aec07a6a46708d8cc780f168732f",
					["Type"]="DestoryConsole",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="2c93d34931054ac9b3a52e6f3ee9c2a1",
				},
				[3]={
					["id"]="a255e1b87d794e93b6df9a03716f73be",
					["Type"]="DestoryConsole",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="80d48e23d460410fa0eaca84e7818955",
				},
				[4]={
					["id"]="c770cab13a364981b6487a1e7a2d9c57",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="9404ea14ba24460d9addf8c278c2cfe3",
							["cid"]=2006,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-26434600, 2359296, 25786580) --[[(-25.21, 2.25, 24.592)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="ed1f4cdbf5ac4bbf84f8ca4f76c16dcd",
							["cid"]=2007,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-26945258, 2474639, 5464129) --[[(-25.697, 2.36, 5.211)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[5]={
					["id"]="23fb8d0c7b7e42bfb456303e37241efb",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=2306003,
					["titleId"]=0,
				},
			}},
		[15]={
			["id"]=3025,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="开外侧门",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="c940e251c96e499a8323186dd74d3bf9",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2006,
							["num"]=1,
							["relationalOperator"]=0 --[[EQUAL(等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="3a85c93aaa244a7d92b26e8272c816ab",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="46d75f11d2f84db6a733aa8a890bb441",
				},
				[2]={
					["id"]="bac119c719c74cf28489593a9592afa2",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=2306002,
					["titleId"]=0,
				},
			}},
		[16]={
			["id"]=3026,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="开内侧门",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="d992b588548e46a38db11b10483b63df",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2007,
							["num"]=1,
							["relationalOperator"]=0 --[[EQUAL(等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="b3fe6de21c2c40ba8b35a935097cb3ed",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="28dd4a68587c48dabb0d2b3d10559d1e",
				},
				[2]={
					["id"]="931aa538b29144118eca7ce579f59e27",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=2306002,
					["titleId"]=0,
				},
			}},
		[17]={
			["id"]=3027,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="fa0d8286d830444ca8e45bc4d3061fab",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="8b490e0b402f4943b50cc2da76aa255b",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="d44d02f3d9b343b0becc157812647c4f",
							["cid"]=2100,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(1929380, -17647294, -56329504) --[[(1.84, -16.82977, -53.72)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="51743b7839364726834e6aa443c346e4",
							["cid"]=2101,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-17710448, -9008526, 6163529) --[[(-16.89, -8.5912, 5.878)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["uid"]="08cd41b626494d1c931fe64c84c7a2db",
							["cid"]=2102,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-24274534, 2359296, 36029072) --[[(-23.15, 2.25, 34.36)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["uid"]="986083c992534b21859ba79de12c9d0b",
							["cid"]=2103,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-47185920, 2422211, -23907532) --[[(-45, 2.31, -22.8)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[18]={
			["id"]=3028,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="4c4fa4549a2446ea8b275269a0ab4c39",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="08b8bd198fcc436bbf344830e2b31fd7",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100201,
					["parentId"]=0,
					["taskStatus"]=0 --[[None(未开始(没有接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="cc68110752a94c82b37a3c48d31bfe2c",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="2f010070d0974f539f9c027c2c5d979c",
							["cid"]=2026,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-11513364, -17689476, -55585012) --[[(-10.98, -16.87, -53.01)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[19]={
			["id"]=3029,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="513e5ae37dd24498978584de8a4ddf7c",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2026,
							["num"]=1,
							["relationalOperator"]=4 --[[GREATER_THAN_OR_EQUAL(大于等于)]],
						},
					},
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="9d772cfd4d8b45ae98140b09e6acfe4c",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20001,
				},
				[2]={
					["id"]="270f56c0ac0e4130ba3084c6205bbc53",
					["Type"]="AcceptTask",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["taskId"]=20100201,
					["subTaskId"]=0,
				},
			}},
		[20]={
			["id"]=3030,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="d5a2cb5507df4495b418e54c2fe63036",
					["Type"]="TaskStateChange",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="a214a77a2b1e42a189120dedaee8bbac",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100201,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="e89f218fcefa4df8963af0f2d9234e9c",
					["Type"]="DestoryConsole",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="2f010070d0974f539f9c027c2c5d979c",
				},
				[2]={
					["id"]="73a5ebc0dc4545ffaea637b268dfa2c8",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3030,
					["active"]=false,
				},
			}},
		[21]={
			["id"]=3031,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="大门查看",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="855a39e57b6c4b099f82a8253a5ee127",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="fa96c19b0c404abd9f7e245859923fb3",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=20100102,
					["parentId"]=0,
					["taskStatus"]=1 --[[Accepted(进行中(已接取))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="445d14df8efe4043a75b4ddbb01b90a3",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="2c93d34931054ac9b3a52e6f3ee9c2a1",
							["cid"]=2004,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-26057114, 3424585, 24070062) --[[(-24.85, 3.265938, 22.955)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="80d48e23d460410fa0eaca84e7818955",
							["cid"]=2003,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-26911704, 2316305, 4760535) --[[(-25.665, 2.209, 4.54)]],
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