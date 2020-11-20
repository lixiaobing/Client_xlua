return
{
	["id"]=1000050,
	["name"]="测试关卡",
	["groupName"]="测试分组",
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
			["id"]=0,
			["uid"]="5247427852542852295",
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="4949593008484102324",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=1 --[[CUBE(立方体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(11555308, 0, 12876513) --[[(11.02, 0, 12.28)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(10485760, 10485760, 10485760) --[[(10, 10, 10)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="5568625947311492540",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5050408879434813281",
							["cid"]=220110204,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(16137585, 0, 15298724) --[[(15.39, 0, 14.59)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="4736730096631091754",
							["cid"]=220110101,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(12614370, 0, 16808674) --[[(12.03, 0, 16.03)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="5164437599602730884",
					["Type"]="CreateConsoles",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["consoles"]={
						[1]={
							["uid"]="5252389179448955468",
							["cid"]=1,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(15109980, 0, 32505856) --[[(14.41, 0, 31)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["uid"]="5712754867805367299",
							["cid"]=1,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["uid"]="5713769800957527575",
							["cid"]=1,
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[2]={
			["id"]=0,
			["uid"]="5678263800164092101",
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5423355337674126662",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(1048576) --[[1]],
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="4928531820511024081",
					["Type"]="PlayVideo",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["url"]="Video/1",
				},
			}},
		[3]={
			["id"]=0,
			["uid"]="4896837030080470406",
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5593657550400644612",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=1 --[[CUBE(立方体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(0, 0, -17196646) --[[(0, 0, -16.4)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="4867959699613919331",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="4702929065720402783",
							["cid"]=220110013,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(21747466, 0, -3428843) --[[(20.74, 0, -3.27)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="4836417220153801734",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(16871588, 0, -3428843) --[[(16.09, 0, -3.27)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[4]={
			["id"]=0,
			["uid"]="4812872844446141452",
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5138539831535938662",
					["Type"]="Area",
					["enable"]=true,
					["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
					["targetId"]=0,
					["areaType"]=1 --[[CUBE(立方体)]],
					["position"]=
					{
						["id"]=0,
						["name"]="",
						["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
						["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
						["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
					}
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="5557129600782457202",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=0,
					["parentId"]=0,
					["taskStatus"]=2 --[[Done(完成(已提交任务))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="4906890351649214613",
					["Type"]="SetArea",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["area"]=0,
				},
				[2]={
					["id"]="5475150306457146835",
					["Type"]="AcceptTask",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["taskId"]=0,
					["subTaskId"]=0,
				},
			}},
		[5]={
			["id"]=0,
			["uid"]="4763855609395720305",
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5630547528884489472",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="5052583705745478693",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=0,
					["parentId"]=0,
					["taskStatus"]=2 --[[Done(完成(已提交任务))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="5599762036658686311",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5238123718972303388",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 5253366) --[[(0, 0, 5.01)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5709689797877119889",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 2747269) --[[(0, 0, 2.62)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
			}},
		[6]={
			["id"]=0,
			["uid"]="5271117280045669371",
			["enable"]=true,
			["unlimited"]=false,
			["desc"]="",
			["loopTimes"]=-1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2 --[[PARALLEL(并行)]],
			["triggerNodes"]={
				[1]={
					["id"]="5190403492305506568",
					["Type"]="Start",
					["enable"]=true,
					["time"]=Fixed64(0) --[[0]],
				},
			},
			["conditionNodes"]={
				[1]={
					["id"]="5403307031803253547",
					["Type"]="CheckTask",
					["enable"]=true,
					["taskId"]=0,
					["parentId"]=0,
					["taskStatus"]=2 --[[Done(完成(已提交任务))]],
				},
			},
			["executeNodes"]={
				[1]={
					["id"]="5120707118602532289",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=Fixed64(0) --[[0]],
					["monsters"]={
						[1]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5566171467815476310",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, -4771021) --[[(0, 0, -4.55)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5053071555093428114",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5445384352352240293",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-3837788, 0, -1342177) --[[(-3.66, 0, -1.28)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[4]={
							["delayTime"]=Fixed64(209715200) --[[200]],
							["uid"]="5058694438148011490",
							["cid"]=220110007,
							["level"]=0,
							["group"]=0,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
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