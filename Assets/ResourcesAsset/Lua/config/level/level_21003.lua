return
{
	["id"]=21003,
	["name"]="研究大楼",
	["groupName"]="001-开放世界-四糸乃",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="VirusCity_001_Room.unity",
	["sceneFile"]="Assets/Scenes/VirusCity_001_Room.unity",
	["soundEventName"]="",
	["desc"]="",
	["cameraEffect"]={
		["templateId"]=0,
		["appoint"]=false,
		["center"]=FixedVector2(524288, 524288) --[[(0.5, 0.5)]],
	},
	["borns"]={
		[1]={
			["uid"]="708f6b8dc04c42479794b472b1a11304",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(46284144, 696606, 94372) --[[(44.14, 0.6643357, 0.09)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 277210560, 0) --[[(0, 264.3686, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
	},
	["props"]={
		[1]={
			["uid"]="ae426db9712f4192a90d6a82a0a2e879",
			["cid"]=2,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(14365491, 83886, 11345592) --[[(13.7, 0.08, 10.82)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(373510240, 0, 0) --[[(356.2071, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[2]={
			["uid"]="7a549c9fa35e47ad8d6e5908a8e46abe",
			["cid"]=2,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(12813599, 1824523, 12006195) --[[(12.22, 1.74, 11.45)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 339517024) --[[(0, 0, 323.7887)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[3]={
			["uid"]="230cd65c7a0c4742a3da398213e9265a",
			["cid"]=3,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(14606664, -1027604, 12341740) --[[(13.93, -0.98, 11.77)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(7908637, 0, 0) --[[(7.542264, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[4]={
			["uid"]="e22270bc66634791938837f4e489c7bc",
			["cid"]=4,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-36427532, 7392461, -25585254) --[[(-34.74, 7.05, -24.4)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(13072972, 0, 0) --[[(12.46736, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[5]={
			["uid"]="c31f4503f9824a82bec7ff9040f6d05e",
			["cid"]=4,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-34802236, 8598323, -25648168) --[[(-33.19, 8.2, -24.46)]],
				["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
				["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
				["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
			}
		},
		[6]={
			["uid"]="5098f216befa45b7a4ad9c6eaacaa269",
			["cid"]=4,
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(-34802236, 7413433, -26203914) --[[(-33.19, 7.07, -24.99)]],
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
			["desc"]="出生位置",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="d7628780ba4b4be0b2fd88541afbc390",
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
					["id"]="7c6a3888de5b4d9991fca5acd0a427b0",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=true,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-429916, 8336179, -26570916) --[[(-0.41, 7.95, -25.34)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 188743680, 0) --[[(0, 180, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[3]={
					["id"]="51f2e9cd46044edfbcbc284cbe6568c7",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=false,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(459276, 8632926, 25962742) --[[(0.438, 8.233, 24.76)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[4]={
					["id"]="f002f61c8b404235a713bfd9e7a9a188",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=false,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-19063112, 9093251, -31377588) --[[(-18.18, 8.672, -29.924)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[5]={
					["id"]="90d63f0c7be842ba893214c7d19b69bc",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=false,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-37604032, 9093251, -31377588) --[[(-35.862, 8.672, -29.924)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[6]={
					["id"]="62ba4e1a45f6454dab7032ad4b252d1e",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=false,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-37604032, 9093251, 31677480) --[[(-35.862, 8.672, 30.21)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[7]={
					["id"]="7b3730dbe8bf40f992a6d487d293da74",
					["Type"]="CreateGate",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["cid"]=1,
					["active"]=false,
					["gate"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-19021168, 9093251, 31677480) --[[(-18.14, 8.672, 30.21)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 524288) --[[(10, 10, 0.5)]],
					},
				},
				[8]={
					["id"]="2713a6248021430bbea92a064c299550",
					["Type"]="CreateAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["effectPath"]="Effect/Common/Level_AirWall_01_hebing",
					["wall"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-73966552, 10265559, -230686) --[[(-70.54, 9.79, -0.22)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
						["size"]=FixedVector3(5242880, 5242880, 524288) --[[(5, 5, 0.5)]],
					},
					["effect"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-73863792, 10265559, -94357) --[[(-70.442, 9.79, -0.08998641)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
				[9]={
					["id"]="6127b71f925f4cedb5eca9ac3d5f3f83",
					["Type"]="CreateConsoles",
					["enable"]=false,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="d570254ea3054291975aaaf58fc165e9",
							["cid"]=2026,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(24878514, 714716, 5144314) --[[(23.726, 0.6816068, 4.906)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[2]={
			["id"]=3009,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="出生对话",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="a732230d3eae415094f1fab278e163ff",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="1331bfc4a392424dafc2e44fbc946862",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20010,
				},
				[2]={
					["id"]="c3a0a13949924bff941024130bd46d80",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="bb53a0ebc0a24dd7a87d765f421ae7be",
							["cid"]=2020,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-1069547, 8785809, -54148464) --[[(-1.02, 8.3788, -51.64)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 188743680, 0) --[[(0, 180, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="f1af85ba7873405a87b7125d6e1db480",
							["cid"]=2021,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(25304236, 857736, 79691) --[[(24.132, 0.818, 0.076)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["uid"]="4588b48ac26f492e82937949cba54a96",
							["cid"]=2022,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-38126224, 8776581, 39076232) --[[(-36.36, 8.37, 37.266)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[3]={
			["id"]=3010,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="观察电梯",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="f3eb38f48f6747fbb82203d0fb908614",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-7560233, 8598323, 125829) --[[(-7.21, 8.2, 0.12)]],
						["scale"]=FixedVector3(2097152, 2097152, 2097152) --[[(2, 2, 2)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="7d814e7733d54088be5ae293b6b2b490",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20012,
				},
			}},
		[4]={
			["id"]=3011,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="创建电梯",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="95f0a9ad51fa428e9a3b5def6e55c33f",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="9e2660fbf35b4604b2efa5cd7790970d",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="1764f155edea4262a1a831d6b7407506",
							["cid"]=2011,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-73267152, 8557429, -3289383) --[[(-69.873, 8.161, -3.137)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="01ab5772107d47c395e15d492ae0d1ee",
							["cid"]=2018,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-50658804, 8205107, -361758) --[[(-48.312, 7.825, -0.345)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[5]={
			["id"]=3012,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="调查电梯",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="40ac378571074e88870fcd7698dfc617",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2011,
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
					["id"]="ec664afb076c43b0b7733b9137c6273c",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20013,
				},
			}},
		[6]={
			["id"]=3013,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="调查控制",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="f86156e9099c4e77ae8c11abdf2cfe60",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2018,
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
					["id"]="b8904800d3584772b485114cbeea280b",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20017,
				},
			}},
		[7]={
			["id"]=3015,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="ID卡事件",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="2e5fca8c62494ce08eed107eb6914fbe",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="dd514caf037044869da6303620dc2762",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="6b03df324ae64324a99de97f4a89e39b",
							["cid"]=2012,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-16441672, 8776581, 40087060) --[[(-15.68, 8.37, 38.23)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="c16e8e856e7041d08c909310d16285ab",
							["cid"]=2016,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(1929380, 8787067, 60377008) --[[(1.84, 8.38, 57.58)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["uid"]="265b19284c5a498b90490e8f75953087",
							["cid"]=2017,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-25459426, 9475669, 59412316) --[[(-24.28, 9.036702, 56.66)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[8]={
			["id"]=3018,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="手表",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="e2b0bbe9c34d46038bd3288455b02b3c",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2016,
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
					["id"]="cf3d74ffdb534d28ba1537564d9b1485",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20016,
				},
			}},
		[9]={
			["id"]=3019,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="生日贺卡",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="c9dfddbb28344a42b947f846b78732a4",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2017,
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
					["id"]="34a1bb41aca54890acd5a4ee0513f67a",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20015,
				},
			}},
		[10]={
			["id"]=3020,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="ID卡",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=1 --[[SEQUENCE(顺序)]],
			["triggerNodes"]={
				[1]={
					["id"]="0135860dd53d48899fbb0d6c3714007b",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2012,
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
					["id"]="efa8d4630a7a4cd79688058a25c78005",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="012b011db87c4ab8b2b2ad6791dfce67",
							["cid"]=2013,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-73482112, 8491368, -3314548) --[[(-70.078, 8.098, -3.161)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="d94e4245499a4fada7b5f9cca1d7da47",
							["cid"]=2019,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-50672436, 8432648, -346030) --[[(-48.325, 8.042, -0.33)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="01ec2766866848e49ba4dd37417988a8",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["dialogId"]=20014,
				},
				[3]={
					["id"]="c2cad8ef0c03453c8002fda735db6469",
					["Type"]="ControlTrigger",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["triggerId"]=3026,
					["active"]=true,
				},
				[4]={
					["id"]="18b13b79d5c5404c9df6b37c745a4ace",
					["Type"]="DestoryConsole",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="1764f155edea4262a1a831d6b7407506",
				},
				[5]={
					["id"]="27249b2e09db4aea8838447c82d2458f",
					["Type"]="DestoryConsole",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="01ab5772107d47c395e15d492ae0d1ee",
				},
				[6]={
					["id"]="14d59168e61c4cce999889e51cbfd99e",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=2306016,
					["titleId"]=0,
				},
			}},
		[11]={
			["id"]=3021,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="任务判断",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="15a0cf2f74484dfda6df8841a7ea314d",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(46380612, 554696, 24118) --[[(44.232, 0.529, 0.023)]],
						["scale"]=FixedVector3(8388608, 8388608, 8388608) --[[(8, 8, 8)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="5d4197c251a04fcdbcaf9fd2f45a9f8c",
					["Type"]="SetArea",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["area"]=20002,
				},
			}},
		[12]={
			["id"]=3023,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="调查控制",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="025ea85695a544cea99dd0f96584c1d3",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2019,
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
					["id"]="8a094e34a13a454ea40e6caae52cfa36",
					["Type"]="ShowTip",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["tipId"]=2306004,
					["titleId"]=0,
				},
				[2]={
					["id"]="90e019ff4a7c4411b086b9ca62b1503e",
					["Type"]="SetGateState",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="51f2e9cd46044edfbcbc284cbe6568c7",
					["active"]=true,
				},
				[3]={
					["id"]="701c4324dbc2406f8be77ca795524870",
					["Type"]="SetGateState",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="f002f61c8b404235a713bfd9e7a9a188",
					["active"]=true,
				},
				[4]={
					["id"]="25beab0fc03c4ac5946714fc20f075a7",
					["Type"]="SetGateState",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="90d63f0c7be842ba893214c7d19b69bc",
					["active"]=true,
				},
				[5]={
					["id"]="69edb1b0c1734f6a82288efc5894fea0",
					["Type"]="SetGateState",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="62ba4e1a45f6454dab7032ad4b252d1e",
					["active"]=true,
				},
				[6]={
					["id"]="fbbc4e62bcff460fb1e4322eb34704b5",
					["Type"]="SetGateState",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["uid"]="7b3730dbe8bf40f992a6d487d293da74",
					["active"]=true,
				},
			}},
		[13]={
			["id"]=3024,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="f0667525ee8e4197b75386e997ae77da",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2019,
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
					["id"]="39fcea0cbb034137aee338e024fc4cc7",
					["Type"]="ShowDialog",
					["enable"]=true,
					["delayTime"]=Fixed64(20990394368) --[[20018]],
					["dialogId"]=0,
				},
				[2]={
					["id"]="47a860a84ac646cb979fcaabe7ea3e49",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="d98f47ce5ac54ff7aa620807a429ab66",
				},
				[3]={
					["id"]="51a8aea72b174f4eaf56ee6c80ccac3b",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="88e40addcf94461aa3a1f8bb82c20767",
				},
				[4]={
					["id"]="a35a2a9ad78547f68c4461533d9c3ea0",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="ba0d4bfb87a54fdd997732d310bb9e3c",
				},
				[5]={
					["id"]="de03133bff9e4e498f0823d495717da9",
					["Type"]="DestoryAirWall",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["wallId"]="7c79134d567843268dc9163d84dcc55e",
				},
			}},
		[14]={
			["id"]=3025,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="左侧刷怪",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="590a102fb44e46ce89906ecf4b0542e3",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-28699526, 9846129, -78129400) --[[(-27.37, 9.39, -74.51)]],
						["scale"]=FixedVector3(15728640, 15728640, 15728640) --[[(15, 15, 15)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="02ab66d102f3435280c4209e2aa13ef2",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="b35a52d3e50f4c4ab61fa5e9e1e9f11c",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-30313682, 10029105, -79598896) --[[(-28.90938, 9.5645, -75.91142)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 101337784, 0) --[[(0, 96.64324, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="c3113e28e05f44749396a7500871b36d",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-28535870, 10029105, -77567944) --[[(-27.21393, 9.5645, -73.97456)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 101337784, 0) --[[(0, 96.64324, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="3487c1c823cd489bb352e474a00cce7a",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-30573928, 10029105, -74944776) --[[(-29.15757, 9.5645, -71.47291)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 101337784, 0) --[[(0, 96.64324, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="209ad823f79f43b098ac6debd79c421c",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-32767012, 10029105, -76824816) --[[(-31.24906, 9.5645, -73.26585)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 101337784, 0) --[[(0, 96.64324, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="bf6be1ec15b14f16a1196b16af0700de",
					["Type"]="SetRunFast",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["runFast"]=false,
				},
			}},
		[15]={
			["id"]=3026,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="右侧刷怪",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="d4f123b2e31e4301abf5a0d55e44421d",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=2 --[[SPHERE(球体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(-28290580, 9846129, 81484840) --[[(-26.98, 9.39, 77.71)]],
						["scale"]=FixedVector3(15728640, 15728640, 15728640) --[[(15, 15, 15)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="82e8813c63ee42a781d5be6ce7f0d338",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="e457eb653300455d8e5351a544446648",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-27419846, 10087479, 78398792) --[[(-26.1496, 9.62017, 74.76691)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 72658112, 0) --[[(0, 69.29218, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="0114f70b47384270b6bff0a2b1f5cfd6",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-26404862, 10087479, 79943336) --[[(-25.18164, 9.62017, 76.23991)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 72658112, 0) --[[(0, 69.29218, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="e41f6748f73b416da41f172bb9d081a4",
							["cid"]=220110008,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-27559240, 10087479, 81386672) --[[(-26.28254, 9.62017, 77.61638)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 72658112, 0) --[[(0, 69.29218, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="b0162f58c34a4d0cb157853cf0d611c4",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-29291582, 10087479, 82163992) --[[(-27.93463, 9.62017, 78.35769)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 72658112, 0) --[[(0, 69.29218, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="604ae6912d804b77b45b72066f25efd0",
							["cid"]=220110007,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-29206034, 10029105, 77667504) --[[(-27.85304, 9.5645, 74.0695)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 72658112, 0) --[[(0, 69.29218, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="458807c803234520a16c2344609501dd",
					["Type"]="SetRunFast",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["runFast"]=false,
				},
			}},
		[16]={
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
					["id"]="b2dfd48b3e3a4aaa9cadb347d1b7116f",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="70482e84158c42b68e2049ee5fa40d08",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="1ed70b989b984d2fb07a8e7cebabba26",
							["cid"]=2110,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(15927869, 1061181, -10045358) --[[(15.19, 1.012022, -9.58)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 94371840, 0) --[[(0, 90, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="4b853d2ae26c41dd9ee02a5c284c09c0",
							["cid"]=2111,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-23582474, 8797551, -24484250) --[[(-22.49, 8.389998, -23.35)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["uid"]="fb09b1ef6ab84779af6ef4ce9a2514f6",
							["cid"]=2112,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-32117882, 8649664, 24788336) --[[(-30.63, 8.248962, 23.64)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["uid"]="fcdd25e4c3134826b9f7f7658f324256",
							["cid"]=2113,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-32788972, 8776581, -59601060) --[[(-31.27, 8.37, -56.84)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[5]={
							["uid"]="6f3e3440bc6546378d2b06b1dc615822",
							["cid"]=2114,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(8745124, 7528775, 32212254) --[[(8.34, 7.179999, 30.72)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 283115520, 0) --[[(0, 270, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[17]={
			["id"]=3028,
			["enable"]=false,
			["unlimited"]=false,
			["desc"]="支线",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="1f438f9f0f2a45f59a17e6d56f37afcc",
					["Type"]="ConsoleCount",
					["enable"]=true,
					["consoles"]={
						[1]={
							["cid"]=2026,
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
					["id"]="34c0f04e4cc44a43bbe4218ad6339eec",
					["Type"]="AcceptTask",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["taskId"]=20100201,
					["subTaskId"]=0,
				},
			}},
		[18]={
			["id"]=3029,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="48e9e09178264b74916c460d80f6784f",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="19151a326f3e4b498386e8a2d7469986",
					["Type"]="CheckMonsterDeadNum",
					["enable"]=true,
					["num"]=5,
					["relationalOperator"]=0 --[[EQUAL(等于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="a2b6e1aa785a4935a9743042e14b302e",
					["Type"]="SetRunFast",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["runFast"]=true,
				},
			}},
		[19]={
			["id"]=3030,
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="a3302867d3384e00ac313e1d531c7051",
					["Type"]="MonsterDead",
					["enable"]=true,
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="1bc5588cc0734559a11e1abd2ae403cc",
					["Type"]="CheckMonsterDeadNum",
					["enable"]=true,
					["num"]=10,
					["relationalOperator"]=0 --[[EQUAL(等于)]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="a7ba5e83d1884a0b9f17f346310592b4",
					["Type"]="SetRunFast",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["runFast"]=true,
				},
			}},
	},
}