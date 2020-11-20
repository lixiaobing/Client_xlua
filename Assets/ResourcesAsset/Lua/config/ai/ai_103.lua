return
{
	["id"]=103,
	["debug"]=true,
	["variables"]={
	},
	["nodes"]={
		[1]={
			["uuid"]="e24c3221f1754a78ad8475d4b1afee7f",
			["Type"]="Root",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="3459a9295b0841ee9abd7bc091119d0a",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
		},
		[2]={
			["uuid"]="3459a9295b0841ee9abd7bc091119d0a",
			["Type"]="Selector",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="ffc601d9c2a64c79a7d1bf261da6b8b2",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
		},
		[3]={
			["uuid"]="68ac5009aaf3433ba2edbef103065fcf",
			["Type"]="CheckDistance",
			["mark"]="",
			["links"]={
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["maxDistance"]=Fixed64(3145728) --[[3]],
			["minDistance"]=Fixed64(-1048576) --[[-1]],
		},
		[4]={
			["uuid"]="8a0b8ab4f1ad4cac8919fa8242558682",
			["Type"]="Random",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="ccae79c46735461098e57cbde8f50ef0",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[2]={
					["child"]="e9d4379528474d95bfd48dd3e5759267",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[3]={
					["child"]="7ef19e4928f740529528d0f1c29695d7",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[4]={
					["child"]="05eead14da15415898b47d0eaa6b1714",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[5]={
					["child"]="04fac9e6abf24a1281b017d1bb77e268",
					["weight"]=Fixed64(52428800) --[[50]],
				},
			},
		},
		[5]={
			["uuid"]="c09fdffad1514ae69158c5a2f7f6fd63",
			["Type"]="UseSkill",
			["mark"]="",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=2 --[[GREATER_THAN(大于)]],
			["skillId"]=0,
		},
		[6]={
			["uuid"]="ffc601d9c2a64c79a7d1bf261da6b8b2",
			["Type"]="CountDown",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="fcc1c7d59a2b4c72b194e79aff28785d",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=false,
			["breakPriority"]=2,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(5242880000) --[[5000]],
			["breakCountDonwTime"]=Fixed64(0) --[[0]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(20971520000) --[[20000]],
			["enter"]=false,
		},
		[7]={
			["uuid"]="cedc0b3ccd9a4af9a1a895bcf0717dc3",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="b289c38772ea41009d96aaee08e9179e",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="c09fdffad1514ae69158c5a2f7f6fd63",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[8]={
			["uuid"]="b289c38772ea41009d96aaee08e9179e",
			["Type"]="Move",
			["mark"]="",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(2097152) --[[2]],
			["maxTime"]=Fixed64(5242880000) --[[5000]],
			["distance"]=Fixed64(2097152) --[[2]],
		},
		[9]={
			["uuid"]="ccae79c46735461098e57cbde8f50ef0",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="0e37ad96ff4c49a990bfd40682080d81",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[10]={
			["uuid"]="0e37ad96ff4c49a990bfd40682080d81",
			["Type"]="Idle",
			["mark"]="",
			["links"]={
			},
			["time"]=1000,
		},
		[11]={
			["uuid"]="e9d4379528474d95bfd48dd3e5759267",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
			},
			["listenCondition"]=false,
		},
		[12]={
			["uuid"]="7ef19e4928f740529528d0f1c29695d7",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
			},
			["listenCondition"]=false,
		},
		[13]={
			["uuid"]="05eead14da15415898b47d0eaa6b1714",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
			},
			["listenCondition"]=false,
		},
		[14]={
			["uuid"]="04fac9e6abf24a1281b017d1bb77e268",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
			},
			["listenCondition"]=false,
		},
		[15]={
			["uuid"]="09e572cf9ec74bdeb7591ec624bb6c25",
			["Type"]="CheckDistance",
			["mark"]="",
			["links"]={
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(5242880000) --[[5000]],
			["breakCountDonwTime"]=Fixed64(0) --[[0]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["maxDistance"]=Fixed64(-1048576) --[[-1]],
			["minDistance"]=Fixed64(5242880) --[[5]],
		},
		[16]={
			["uuid"]="07ebc46e8be347f998048ea317a26ba7",
			["Type"]="Move",
			["mark"]="",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(4194304) --[[4]],
			["maxTime"]=Fixed64(5242880000) --[[5000]],
			["distance"]=Fixed64(5242880) --[[5]],
		},
		[17]={
			["uuid"]="01bde77a8d114743af323b906374f56e",
			["Type"]="Idle",
			["mark"]="",
			["links"]={
			},
			["time"]=1000,
		},
		[18]={
			["uuid"]="a0728a956a3f4ba9baf57010f9dd8cd6",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="07ebc46e8be347f998048ea317a26ba7",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="01bde77a8d114743af323b906374f56e",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[19]={
			["uuid"]="9a6e423cdb174616a356e1c88c96d278",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="2f2a196a732d4cd99b763f557a8470e5",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="6b1342b53fa140449002022ef94c7f13",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[20]={
			["uuid"]="2f2a196a732d4cd99b763f557a8470e5",
			["Type"]="Move",
			["mark"]="",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(2097152) --[[2]],
			["maxTime"]=Fixed64(5242880000) --[[5000]],
			["distance"]=Fixed64(2097152) --[[2]],
		},
		[21]={
			["uuid"]="6b1342b53fa140449002022ef94c7f13",
			["Type"]="UseSkill",
			["mark"]="",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=2 --[[GREATER_THAN(大于)]],
			["skillId"]=0,
		},
		[22]={
			["uuid"]="fcc1c7d59a2b4c72b194e79aff28785d",
			["Type"]="Repeat",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="9a6e423cdb174616a356e1c88c96d278",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["repeatTimes"]=2,
		},
	},
}