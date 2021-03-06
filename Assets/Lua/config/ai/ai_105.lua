return
{
	["id"]=105,
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
					["child"]="b30a17cd148a44628e5666ce2bbbcd6d",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
		},
		[2]={
			["uuid"]="ffc601d9c2a64c79a7d1bf261da6b8b2",
			["Type"]="CountDown",
			["mark"]="",
			["links"]={
			},
			["breakListen"]=false,
			["breakPriority"]=2,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(5242880000) --[[5000]],
			["breakCountDonwTime"]=Fixed64(0) --[[0]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(3670016000) --[[3500]],
			["enter"]=false,
		},
		[3]={
			["uuid"]="7a753fec83b841ab8d7606e89012a8c5",
			["Type"]="CheckDistance",
			["mark"]="4",
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
			["maxDistance"]=Fixed64(2097152) --[[2]],
			["minDistance"]=Fixed64(-1048576) --[[-1]],
		},
		[4]={
			["uuid"]="e496c83e47d14466bb1b416956131943",
			["Type"]="CheckAttactSize",
			["mark"]="3",
			["links"]={
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=1 --[[LESS_THAN(小于)]],
		},
		[5]={
			["uuid"]="d11076d44b11468bacfa96771a07914c",
			["Type"]="UseSkill",
			["mark"]="7",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=1 --[[LESS_THAN(小于)]],
			["skillId"]=15,
		},
		[6]={
			["uuid"]="b39f0440977d4056853b57b45e7fb7ec",
			["Type"]="CheckCanMove",
			["mark"]="5",
			["links"]={
				[1]={
					["child"]="4aa488a7ff06407c9b30d75f71633e68",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["angle"]=Fixed64(188743680) --[[180]],
			["distance"]=Fixed64(3145728) --[[3]],
		},
		[7]={
			["uuid"]="18bf051221904d92843c4d6fd712756a",
			["Type"]="CheckDistance",
			["mark"]="3",
			["links"]={
				[1]={
					["child"]="86de91f7f7674a42b832f1ef78967946",
					["weight"]=Fixed64(0) --[[0]],
				},
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
			["minDistance"]=Fixed64(0) --[[0]],
		},
		[8]={
			["uuid"]="b30a17cd148a44628e5666ce2bbbcd6d",
			["Type"]="Random",
			["mark"]="1",
			["links"]={
				[1]={
					["child"]="758614d139a847faadb255321ef30119",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[2]={
					["child"]="05dcefa108ad4e91b6d567c0f3c1d07b",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
		},
		[9]={
			["uuid"]="05dcefa108ad4e91b6d567c0f3c1d07b",
			["Type"]="CountDown",
			["mark"]="21",
			["links"]={
				[1]={
					["child"]="8e5cf15e371e4752b91b3582426ab620",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=true,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(3145728000) --[[3000]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(8388608000) --[[8000]],
			["enter"]=false,
		},
		[10]={
			["uuid"]="8e5cf15e371e4752b91b3582426ab620",
			["Type"]="UseSkill",
			["mark"]="22",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=1 --[[LESS_THAN(小于)]],
			["skillId"]=13,
		},
		[11]={
			["uuid"]="be8015701ced4f059e69f13cf910fa7a",
			["Type"]="CheckDistance",
			["mark"]="11",
			["links"]={
				[1]={
					["child"]="7dfebae673454771b17d7d18fc956dbd",
					["weight"]=Fixed64(0) --[[0]],
				},
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
			["maxDistance"]=Fixed64(103809024) --[[99]],
			["minDistance"]=Fixed64(7340032) --[[7]],
		},
		[12]={
			["uuid"]="7dfebae673454771b17d7d18fc956dbd",
			["Type"]="UseSkill",
			["mark"]="14",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=1 --[[LESS_THAN(小于)]],
			["skillId"]=12,
		},
		[13]={
			["uuid"]="12c5a9a79b09455b9197c11fc38dea67",
			["Type"]="CheckDistance",
			["mark"]="13",
			["links"]={
				[1]={
					["child"]="625618ad029f436e8f0e13cb70834d76",
					["weight"]=Fixed64(0) --[[0]],
				},
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
			["maxDistance"]=Fixed64(7340032) --[[7]],
			["minDistance"]=Fixed64(3145728) --[[3]],
		},
		[14]={
			["uuid"]="ac29fe7334e74c28a8e0a2602d2a7653",
			["Type"]="UseSkill",
			["mark"]="15",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=1 --[[LESS_THAN(小于)]],
			["skillId"]=11,
		},
		[15]={
			["uuid"]="758614d139a847faadb255321ef30119",
			["Type"]="Selector",
			["mark"]="2",
			["links"]={
				[1]={
					["child"]="18bf051221904d92843c4d6fd712756a",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="be8015701ced4f059e69f13cf910fa7a",
					["weight"]=Fixed64(0) --[[0]],
				},
				[3]={
					["child"]="12c5a9a79b09455b9197c11fc38dea67",
					["weight"]=Fixed64(0) --[[0]],
				},
				[4]={
					["child"]="f22fbc322a1d4fd183a14eea17ce0712",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
		},
		[16]={
			["uuid"]="86de91f7f7674a42b832f1ef78967946",
			["Type"]="Random",
			["mark"]="4",
			["links"]={
				[1]={
					["child"]="b39f0440977d4056853b57b45e7fb7ec",
					["weight"]=Fixed64(31457280) --[[30]],
				},
				[2]={
					["child"]="4bf786ce125f4d488a318b8e79075650",
					["weight"]=Fixed64(10485760) --[[10]],
				},
			},
		},
		[17]={
			["uuid"]="4bf786ce125f4d488a318b8e79075650",
			["Type"]="CountDown",
			["mark"]="8",
			["links"]={
				[1]={
					["child"]="b5af5e132e624497ac03d1a1bce5d198",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(10485760000) --[[10000]],
			["enter"]=false,
		},
		[18]={
			["uuid"]="4aa488a7ff06407c9b30d75f71633e68",
			["Type"]="CountDown",
			["mark"]="6",
			["links"]={
				[1]={
					["child"]="d11076d44b11468bacfa96771a07914c",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(5242880000) --[[5000]],
			["enter"]=false,
		},
		[19]={
			["uuid"]="b5af5e132e624497ac03d1a1bce5d198",
			["Type"]="UseSkill",
			["mark"]="9",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=0 --[[ALL(所有)]],
			["relationalOperator"]=1 --[[LESS_THAN(小于)]],
			["skillId"]=12,
		},
		[20]={
			["uuid"]="625618ad029f436e8f0e13cb70834d76",
			["Type"]="CountDown",
			["mark"]="14",
			["links"]={
				[1]={
					["child"]="ac29fe7334e74c28a8e0a2602d2a7653",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(5242880000) --[[5000]],
			["enter"]=false,
		},
		[21]={
			["uuid"]="f22fbc322a1d4fd183a14eea17ce0712",
			["Type"]="CountDown",
			["mark"]="16",
			["links"]={
				[1]={
					["child"]="3ca13922ff4e441eadd48098087b02dc",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["breakListen"]=false,
			["breakPriority"]=1,
			["breakTimes"]=-1,
			["breakProtectTime"]=Fixed64(0) --[[0]],
			["breakCountDonwTime"]=Fixed64(1048576000) --[[1000]],
			["canBreakOther"]=false,
			["canBreakSelf"]=false,
			["time"]=Fixed64(3145728000) --[[3000]],
			["enter"]=false,
		},
		[22]={
			["uuid"]="3ca13922ff4e441eadd48098087b02dc",
			["Type"]="Patrol",
			["mark"]="",
			["links"]={
			},
			["times"]=4,
			["speed"]=Fixed64(1048576) --[[1]],
			["stayTime"]=Fixed64(0) --[[0]],
			["radius"]=Fixed64(10485760) --[[10]],
			["minDistance"]=Fixed64(3145728) --[[3]],
		},
	},
}