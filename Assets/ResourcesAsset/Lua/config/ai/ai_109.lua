return
{
	["id"]=109,
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
					["child"]="ec5a7209ae9142f8ab34d50820b74c8c",
					["weight"]=Fixed64(10485760) --[[10]],
				},
			},
		},
		[2]={
			["uuid"]="31f76d47d5cf4203a5f8d475753fd86b",
			["Type"]="UseSkill",
			["mark"]="3333333333333333",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=18,
		},
		[3]={
			["uuid"]="40acd016065c412cb7aae0d630842168",
			["Type"]="UseSkill",
			["mark"]="8",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=23,
		},
		[4]={
			["uuid"]="ec5a7209ae9142f8ab34d50820b74c8c",
			["Type"]="Sequence",
			["mark"]="",
			["links"]={
				[1]={
					["child"]="40acd016065c412cb7aae0d630842168",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[2]={
					["child"]="7052d80e786642eb8b60e2ac3f9fea5a",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[3]={
					["child"]="5306a374e855455d945933a5085ebea5",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[4]={
					["child"]="27d60d3186394116bb7d17e461ff63dc",
					["weight"]=Fixed64(10485760) --[[10]],
				},
			},
			["listenCondition"]=false,
		},
		[5]={
			["uuid"]="530f9c93b1474cb9ab88a20dcfed059a",
			["Type"]="Sequence",
			["mark"]="222222222222222",
			["links"]={
				[1]={
					["child"]="31f76d47d5cf4203a5f8d475753fd86b",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[2]={
					["child"]="40413af4c51a4864ac239fa0f10659a4",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[3]={
					["child"]="19e1c64ee84041c696a9bc491b53b3db",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[4]={
					["child"]="2d72cecc4b3b4b298fc4fb4689c51ecb",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[5]={
					["child"]="6d5a65e6c0084043b103d8cb5d3b4bdb",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[6]={
					["child"]="e806e29da3af45d992a7460121bc0323",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[7]={
					["child"]="7b69eddd236046578f81255fc3312156",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[8]={
					["child"]="14850b820e504d23afd778ff1ee2e3af",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[9]={
					["child"]="f967d95a01d24282abc0fd280f1727de",
					["weight"]=Fixed64(10485760) --[[10]],
				},
				[10]={
					["child"]="fac9ff5fa00747c3b9bf669a93fc2eab",
					["weight"]=Fixed64(10485760) --[[10]],
				},
			},
			["listenCondition"]=false,
		},
		[6]={
			["uuid"]="40413af4c51a4864ac239fa0f10659a4",
			["Type"]="UseSkill",
			["mark"]="44444444444",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=19,
		},
		[7]={
			["uuid"]="19e1c64ee84041c696a9bc491b53b3db",
			["Type"]="UseSkill",
			["mark"]="55555555555555",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=20,
		},
		[8]={
			["uuid"]="7b69eddd236046578f81255fc3312156",
			["Type"]="UseSkill",
			["mark"]="6666666666666666666",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=21,
		},
		[9]={
			["uuid"]="f967d95a01d24282abc0fd280f1727de",
			["Type"]="UseSkill",
			["mark"]="7777777777777777777",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=22,
		},
		[10]={
			["uuid"]="6d5a65e6c0084043b103d8cb5d3b4bdb",
			["Type"]="UseSkill",
			["mark"]="3333333333333333",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=18,
		},
		[11]={
			["uuid"]="e806e29da3af45d992a7460121bc0323",
			["Type"]="UseSkill",
			["mark"]="44444444444",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=19,
		},
		[12]={
			["uuid"]="2d72cecc4b3b4b298fc4fb4689c51ecb",
			["Type"]="Wait",
			["mark"]="",
			["links"]={
			},
			["waitTime"]=Fixed64(1048576000) --[[1000]],
		},
		[13]={
			["uuid"]="14850b820e504d23afd778ff1ee2e3af",
			["Type"]="Wait",
			["mark"]="",
			["links"]={
			},
			["waitTime"]=Fixed64(1048576000) --[[1000]],
		},
		[14]={
			["uuid"]="fac9ff5fa00747c3b9bf669a93fc2eab",
			["Type"]="Wait",
			["mark"]="",
			["links"]={
			},
			["waitTime"]=Fixed64(1048576000) --[[1000]],
		},
		[15]={
			["uuid"]="7052d80e786642eb8b60e2ac3f9fea5a",
			["Type"]="UseSkill",
			["mark"]="8",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=24,
		},
		[16]={
			["uuid"]="5306a374e855455d945933a5085ebea5",
			["Type"]="UseSkill",
			["mark"]="8",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=25,
		},
		[17]={
			["uuid"]="27d60d3186394116bb7d17e461ff63dc",
			["Type"]="UseSkill",
			["mark"]="8",
			["links"]={
			},
			["selectTargetType"]=1 --[[ANY_PLAYER(任意玩家)]],
			["targetId"]=0,
			["camp"]=3 --[[ALL(所有)]],
			["targetState"]=0 --[[HP_MIN(血量最低)]],
			["attackType"]=1 --[[SHORT_RANG(近程)]],
			["relationalOperator"]=5 --[[LESS_THAN_OR_EQUAL(小于等于)]],
			["skillId"]=26,
		},
	},
}