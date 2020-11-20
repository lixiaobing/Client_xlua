return
{
	["id"]=1,
	["debug"]=true,
	["variables"]={
	},
	["nodes"]={
		[1]={
			["uuid"]="e24c3221f1754a78ad8475d4b1afee7f",
			["Type"]="Root",
			["mark"]="",
			["links"]={
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
			["uuid"]="04174edd75a94372b6bcf92c41f2dd7f",
			["Type"]="Random",
			["mark"]="16",
			["links"]={
				[1]={
					["child"]="06eacb7be3d1432ea3ff60d6e68c9e19",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="cba1f561efae441fbb832382d1ed39f4",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[3]={
					["child"]="993b8761dd7f4158a5a0d7f2097c7ab2",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[4]={
					["child"]="744d3ed793264441aab6edb03409f673",
					["weight"]=Fixed64(52428800) --[[50]],
				},
				[5]={
					["child"]="bb577bc386f34adb80eaed5149f032a2",
					["weight"]=Fixed64(52428800) --[[50]],
				},
			},
		},
		[6]={
			["uuid"]="06eacb7be3d1432ea3ff60d6e68c9e19",
			["Type"]="Sequence",
			["mark"]="17",
			["links"]={
				[1]={
					["child"]="26276f37910b4eb1a3e873009df5dc04",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="a3559a5d6b9645708aad237f256f53e8",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[7]={
			["uuid"]="cba1f561efae441fbb832382d1ed39f4",
			["Type"]="Sequence",
			["mark"]="22",
			["links"]={
				[1]={
					["child"]="33845dea6c1a4e57b893ceee3bbac26d",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="e78fe50b54e6475abd9331a9a46770b5",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[8]={
			["uuid"]="993b8761dd7f4158a5a0d7f2097c7ab2",
			["Type"]="Sequence",
			["mark"]="23",
			["links"]={
				[1]={
					["child"]="e16201619e514564b46ab6267c5ed177",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="213f6e3051dd458686315e92576a3d71",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[9]={
			["uuid"]="744d3ed793264441aab6edb03409f673",
			["Type"]="Sequence",
			["mark"]="26",
			["links"]={
				[1]={
					["child"]="008709912d784e1c81fa8aa6cf33d374",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="921ea49766c34066948724cf752aa50c",
					["weight"]=Fixed64(0) --[[0]],
				},
				[3]={
					["child"]="dee62f5d12f44f1499b38580cb2dc3f6",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[10]={
			["uuid"]="bb577bc386f34adb80eaed5149f032a2",
			["Type"]="Sequence",
			["mark"]="30",
			["links"]={
				[1]={
					["child"]="b0ff4c5fbf124ec5ae718808fa99e9f6",
					["weight"]=Fixed64(0) --[[0]],
				},
				[2]={
					["child"]="9358a006848543a1bb1a1ba03871b6f4",
					["weight"]=Fixed64(0) --[[0]],
				},
				[3]={
					["child"]="55a689b89b17459786837be82a5034e8",
					["weight"]=Fixed64(0) --[[0]],
				},
			},
			["listenCondition"]=false,
		},
		[11]={
			["uuid"]="a3559a5d6b9645708aad237f256f53e8",
			["Type"]="Move",
			["mark"]="19",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(2097152) --[[2]],
			["maxTime"]=Fixed64(2097152000) --[[2000]],
			["distance"]=Fixed64(3145728) --[[3]],
		},
		[12]={
			["uuid"]="26276f37910b4eb1a3e873009df5dc04",
			["Type"]="MoveDir",
			["mark"]="18",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(62914560000) --[[60000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=1 --[[BACK(向后)]],
		},
		[13]={
			["uuid"]="33845dea6c1a4e57b893ceee3bbac26d",
			["Type"]="MoveDir",
			["mark"]="20",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(62914560000) --[[60000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=1 --[[BACK(向后)]],
		},
		[14]={
			["uuid"]="e78fe50b54e6475abd9331a9a46770b5",
			["Type"]="MoveDir",
			["mark"]="21",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(2097152000) --[[2000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=2 --[[LEFT(向左)]],
		},
		[15]={
			["uuid"]="e16201619e514564b46ab6267c5ed177",
			["Type"]="MoveDir",
			["mark"]="24",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(62914560000) --[[60000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=1 --[[BACK(向后)]],
		},
		[16]={
			["uuid"]="213f6e3051dd458686315e92576a3d71",
			["Type"]="MoveDir",
			["mark"]="25",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(2097152000) --[[2000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=3 --[[RIGHT(向右)]],
		},
		[17]={
			["uuid"]="008709912d784e1c81fa8aa6cf33d374",
			["Type"]="MoveDir",
			["mark"]="27",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(62914560000) --[[60000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=1 --[[BACK(向后)]],
		},
		[18]={
			["uuid"]="921ea49766c34066948724cf752aa50c",
			["Type"]="MoveDir",
			["mark"]="28",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(1048576000) --[[1000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=2 --[[LEFT(向左)]],
		},
		[19]={
			["uuid"]="dee62f5d12f44f1499b38580cb2dc3f6",
			["Type"]="MoveDir",
			["mark"]="29",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(2097152000) --[[2000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=3 --[[RIGHT(向右)]],
		},
		[20]={
			["uuid"]="b0ff4c5fbf124ec5ae718808fa99e9f6",
			["Type"]="MoveDir",
			["mark"]="31",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(62914560000) --[[60000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=1 --[[BACK(向后)]],
		},
		[21]={
			["uuid"]="55a689b89b17459786837be82a5034e8",
			["Type"]="MoveDir",
			["mark"]="33",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(2097152000) --[[2000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=2 --[[LEFT(向左)]],
		},
		[22]={
			["uuid"]="9358a006848543a1bb1a1ba03871b6f4",
			["Type"]="MoveDir",
			["mark"]="32",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["moveType"]=0 --[[WALK(走)]],
			["speed"]=Fixed64(1048576) --[[1]],
			["maxTime"]=Fixed64(1048576000) --[[1000]],
			["distance"]=Fixed64(0) --[[0]],
			["dir"]=3 --[[RIGHT(向右)]],
		},
	},
}