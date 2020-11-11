return
{
	["id"]=10013,
	["name"]="卡巴拉1号",
	["groupName"]="Demo测试关卡",
	["playStartAnimation"]=true,
	["fadeIn"]=true,
	["sceneName"]="DemoSceneTest.unity",
	["sceneFile"]="Assets/Scenes/DemoSceneTest.unity",
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
			["uid"]="96597823991343d9b5fe32af3e246862",
			["transform"]=
			{
				["id"]=0,
				["name"]="",
				["position"]=FixedVector3(0, -3145, 10485) --[[(0, -0.003, 0.01)]],
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
			["desc"]="角色出生",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="dbabfd6b45c44cc884d18c4e38e714f8",
					["Type"]="Start",
					["enable"]=true,
					["time"]=0,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="cd0d225e09ac420cb45d903dddf30fff",
					["Type"]="ActorEnter",
					["enable"]=true,
				},
				[2]={
					["id"]="116071de492c492381e93627661108bc",
					["Type"]="AISwitch",
					["enable"]=true,
					["delayTime"]=0,
					["switchType"]=0,
					["offTime"]=0,
				},
			}},
		[2]={
			["id"]=3002,
			["enable"]=true,
			["unlimited"]=true,
			["desc"]="刷新怪物",
			["loopTimes"]=1,
			["reachConditionNum"]=0,
			["excuteNum"]=0,
			["triggerExecutType"]=2,
			["triggerNodes"]={
				[1]={
					["id"]="8dc337136cb64dada7728ffc6f9ad7f9",
					["Type"]="Start",
					["enable"]=true,
					["time"]=2000,
				},
			},
			["conditionNodes"]={
			},
			["executeNodes"]={
				[1]={
					["id"]="6b5c066b855d4deb8f6c0d9ec39bab45",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=0,
					["monsters"]={
						[1]={
							["delayTime"]=200,
							["uid"]="ee60dbe4badf4e9ea32b5a75709d0ca6",
							["cid"]=220110010,
							["group"]=2,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(3617588, 0, 10087301) --[[(3.45, 0, 9.62)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[2]={
					["id"]="65714387792d41ee8fdfe5ba2de10e65",
					["Type"]="CreateMonsters",
					["enable"]=true,
					["delayTime"]=0,
					["monsters"]={
						[1]={
							["delayTime"]=200,
							["uid"]="5dd8ae1290154332852d98a7d90fc683",
							["cid"]=220110010,
							["group"]=3,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(17741906, 0, 18675138) --[[(16.92, 0, 17.81)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
					},
				},
				[3]={
					["id"]="ca67538bbe5043eba109fd950c97aff3",
					["Type"]="CreateMonsters",
					["enable"]=false,
					["delayTime"]=0,
					["monsters"]={
						[1]={
							["delayTime"]=200,
							["uid"]="6e227240750747269a33e831bdd273dc",
							["cid"]=220110010,
							["group"]=4,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-19786630, 0, 31237080) --[[(-18.87, 0, 29.79)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[2]={
							["delayTime"]=200,
							["uid"]="bbf7ed5fb89d4fbb8a98101b2e0ec607",
							["cid"]=220110010,
							["group"]=4,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-18738054, 0, 31237080) --[[(-17.87, 0, 29.79)]],
								["scale"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
								["rotation"]=FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
								["size"]=FixedVector3(1048576, 1048576, 1048576) --[[(1, 1, 1)]],
							}
						},
						[3]={
							["delayTime"]=200,
							["uid"]="03ca292dcfdf43fdb7c6b1906c7061b3",
							["cid"]=220110010,
							["group"]=4,
							["tag"]=0,
							["mask"]="",
							["position"]=
							{
								["id"]=0,
								["name"]="",
								["position"]=FixedVector3(-17689478, 0, 31237080) --[[(-16.87, 0, 29.79)]],
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