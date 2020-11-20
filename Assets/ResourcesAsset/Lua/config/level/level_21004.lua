return
{
	["id"]=21004,
	["name"]="天台",
	["groupName"]="001-开放世界-四糸乃",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="VirusCity_002_Rooftop.unity",
	["sceneFile"]="Assets/Scenes/VirusCity_002_Rooftop.unity",
	["soundEventName"]="",
	["desc"]="",
	["cameraEffect"]={
		["templateId"]=0,
		["appoint"]=false,
		["center"]=FixedVector2(524288, 524288) --[[(0.5, 0.5)]],
	},
	["borns"]={
		[1]={
			["uid"]="e5309d1097ec478e928cf08a236b8893",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-109685240, 849081, 19912458) --[[(-104.604, 0.8097463, 18.99)]],
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
			["id"]=3001,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="出生",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="54586d7760a94707844403b69ab86466",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="1d1fa7ceee2e408d9cdfaa4afa43aeee",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
				[2]={
					["id"]="09c1aac1598c4db1abd3aba6ee17cf8c",
					["Type"]="CreateAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["effectPath"]="Effect/Common/Level_AirWall_01_hebing",
					["wall"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-91509224, 0, 19430114) --[[(-87.27, 0, 18.53)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
					["effect"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-91418000, 1822426, 19524486) --[[(-87.183, 1.738, 18.62)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
				[3]={
					["id"]="4ba6b1246cb94450bc02e58f642d70ab",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=true,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-35588668, 734003, 19021168) --[[(-33.94, 0.7, 18.14)]],
						["scale"]=FixedVector3(1258292, 1258292, 1258292) --[[(1.2, 1.2, 1.2)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[4]={
					["id"]="8b0b3fd1ee184c7b9e01a512df029069",
					["Type"]="CreateConsoles",
					["enable"]=false,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="1b45642b447049c884c7852a493777ae",
							["cid"]=2115,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-30031216, 869621, 3030385) --[[(-28.64, 0.8293352, 2.89)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[5]={
					["id"]="54bdec71b8f540559f884f597fdf8cc4",
					["Type"]="SetRunFast",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["runFast"]=false,
				},
			}},
		[2]={
			["id"]=3002,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="出生对话",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="51af686e9f0b46989e559e9f28c182a9",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="11282115cf8f48cc91c4af16425f08d8",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20019,
				},
			}},
		[3]={
			["id"]=3003,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="第一波",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="8130fc12870f409f988c8d2ef538248a",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(2097152000) --[[2000]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="7e45bf2568674f9ba29d9116a7a8b96c",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="0cc9eb47886640fd9892d2944f334619",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-101851904, 858784, 24065596) --[[(-97.13354, 0.819, 22.95074)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 286930048, 0) --[[(0, 273.6378, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="abc8869f03264d16862f2f287357f5f4",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-104247952, 849081, 20781372) --[[(-99.41859, 0.8097467, 19.81866)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 286930048, 0) --[[(0, 273.6378, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="59ea1a52434440b5b339e665bdf7c4b6",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-103638464, 849083, 17118524) --[[(-98.83734, 0.8097486, 16.3255)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 286930048, 0) --[[(0, 273.6378, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="35f617e4edd04288b7a2467aa85a5bae",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-100482736, 793773, 15688581) --[[(-95.8278, 0.757, 14.9618)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 286930048, 0) --[[(0, 273.6378, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="9d492d3258384e66aa4017451c99764c",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-100266144, 845152, 21632122) --[[(-95.62125, 0.806, 20.63)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 286930048, 0) --[[(0, 273.6378, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[4]={
			["id"]=3004,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="第二波",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="9894447c6d304ecb9679b59bdef572c3",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="9e41caf3a5104435ac22f36fc9111446",
					["Type"]="CheckMonsterDeadNum",
					["enable"]=true,
					["num"]=5,
					["relationalOperator"]=0 --[[EQUAL(等于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="fae3982164bf45be94cefef2adb90321",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20027,
				},
				[2]={
					["id"]="1364c15ff3ad4600918643b0b837d459",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(524288000) --[[500]],
							["uid"]="fa08dfb3c11240a391bf6f9f5fdd86c7",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-111898600, 855638, 23707462) --[[(-106.7148, 0.816, 22.6092)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 150107360, 0) --[[(0, 143.1535, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(1048576000) --[[1000]],
							["uid"]="a592ef27e31d4243b3e287fba9114007",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-112374176, 855638, 16938012) --[[(-107.1684, 0.816, 16.15335)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 79650320, 0) --[[(0, 75.96046, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(1572864000) --[[1500]],
							["uid"]="1944466ac459461fa4f24a98ca1e3cc4",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-102018784, 843056, 18045762) --[[(-97.29269, 0.804, 17.20978)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 298974976, 0) --[[(0, 285.1248, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(2097152000) --[[2000]],
							["uid"]="da223ccdb96948f0af48f0f676b2f095",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-101976528, 846200, 21741924) --[[(-97.2524, 0.807, 20.73471)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 253696928, 0) --[[(0, 241.9442, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["delayTime"]=Fixed64(2097152000) --[[2000]],
							["uid"]="5cf7fcaf04e74085b00aafe7a94bd6dc",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-103641088, 846200, 19935042) --[[(-98.83984, 0.807, 19.01154)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 250639456, 0) --[[(0, 239.0284, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[5]={
			["id"]=3005,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="任务判断",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="c4f4337269c2431589802bca75c257ff",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-14501806, 0, 19849544) --[[(-13.83, 0, 18.93)]],
						["scale"]=FixedVector3(7340032, 7340032, 7340032) --[[(7, 7, 7)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(5242880, 5242880, 0) --[[(5, 5, 0)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="492bf408451c40e9bfbcb9abebecccab",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20030,
				},
			}},
		[6]={
			["id"]=3007,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="46edc22e10614a1f90a09ad898e8dc39",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="152ea763d8674a5192392ced7ff48990",
					["Type"]="CheckMonsterDeadNum",
					["enable"]=true,
					["num"]=11,
					["relationalOperator"]=0 --[[EQUAL(等于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="b282b3f16dbf42fea0c0b227938a37d1",
					["Type"]="BattleResult",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["battleResultType"]=1 --[[VICTORY(胜利)]],
					["isTimeScale"]=true,
				},
			}},
		[7]={
			["id"]=3008,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="杀完所有怪",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="e75a43dfe89c4ba7a047de01f5b6add0",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="aac9768b45594854ab5e58356bb3162c",
					["Type"]="CheckMonsterDeadNum",
					["enable"]=true,
					["num"]=10,
					["relationalOperator"]=0 --[[EQUAL(等于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="197c632c67804a93a84cc0f3c1e424d0",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="09c1aac1598c4db1abd3aba6ee17cf8c",
				},
				[2]={
					["id"]="9e1c8a14f48e4ffebfd35767042cdb2a",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20028,
				},
				[3]={
					["id"]="d2ac6ab352aa44069ef5a54f3841a19c",
					["Type"]="ShaderSwitch",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["shaderType"]=1 --[[WallFlow(WallFlow)]],
					["shaderId"]=21001,
					["shaderEnabled"]=false,
				},
			}},
		[8]={
			["id"]=3009,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="f1dc40060d134ea891335d3167b0e65d",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="b5bacb98246e4a00bb91445318ea3342",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="e7ed8af4de94493daec4b8866d78aeb7",
							["cid"]=2025,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(6406800, -146781, 19671286) --[[(6.11, -0.1399813, 18.76)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[9]={
			["id"]=3010,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="4d159e84a085465a8308de4a09d4aedb",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2025,
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
					["id"]="3fcdc0547dc449b0a6efc43bb8d481c2",
					["Type"]="PlayPlot",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["fadeInTime"]=0,
					["fadeOutTime"]=0,
					["prefab"]="Timeline/creeps02@StartAcion",
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(19608372, -149946, 20594032) --[[(18.7, -0.143, 19.64)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, -94371840, 0) --[[(0, -90, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					},
					["events"]={
						[1]={
							["Type"]="MonsterEnter",
							["triggerTime"]=1,
							["pause"]=false,
							["uid"]="2d7a03c737b441d2932913bdb866ea6b",
							["cid"]=220110006,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(19608372, -149946, 20594032) --[[(18.7, -0.143, 19.64)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, -94371840, 0) --[[(0, -90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							},
						},
						[2]={
							["Type"]="SlowScale",
							["triggerTime"]=2700,
							["pause"]=false,
							["timeScale"]=1000,
							["duration"]=3000,
						},
						[3]={
							["Type"]="Transmit",
							["triggerTime"]=0,
							["pause"]=false,
							["uid"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(11010048, 0, 20594032) --[[(10.5, 0, 19.64)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							},
						},
						[4]={
							["Type"]="EnterShow",
							["triggerTime"]=2614,
							["pause"]=false,
							["cid"]=220110006,
							["duration"]=2000,
						},
					},
				},
				[2]={
					["id"]="76ea0cfe05a24c20aa5936e3a720850a",
					["Type"]="AISwitch",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["switchType"]=2 --[[OFF_TIME(关闭一段时间)]],
					["offTime"]=Fixed64(6606028800) --[[6300]],
				},
			}},
		[10]={
			["id"]=3011,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="643681db95ad413c9f08985ffd6c56e9",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-69059216, 0, 18874368) --[[(-65.86, 0, 18)]],
						["scale"]=FixedVector3(7340032, 7340032, 7340032) --[[(7, 7, 7)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(5242880, 5242880, 5242880) --[[(5, 5, 5)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="84871942d7d043faa2fdff084e4daf61",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20029,
				},
			}},
		[11]={
			["id"]=3012,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="7662be26d16148f8941fabbcbc649641",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-109806880, 985661, 19146998) --[[(-104.72, 0.94, 18.26)]],
						["scale"]=FixedVector3(10485760, 10485760, 10485760) --[[(10, 10, 10)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="168fb1f84bd145ae9c866d024851340e",
					["Type"]="SetArea",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["area"]=20004,
				},
			}},
	},
}