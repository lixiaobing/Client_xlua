--action event pack
--M_DEM_21103

return
{
	
	["Skill01"] = {
		[1] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Sound",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(272630) --[[0.26]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "WarningSinal_Monster"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(636136) --[[0.6066667]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21103Skill01_Monster"
		},
		[4] = {
			type = "AttackFlag",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(1022362) --[[0.975]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(56203672) --[[53.6]],
			flagRealTime = Fixed64(1217746) --[[1.161333]],
			flagRange = "Rect",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[5] = {
			type = "Attack",
			time = Fixed64(52219084) --[[49.8]],
			realTime = Fixed64(1131413) --[[1.079]],
			filePath = "M_DEM_21103/attack_Attack_1",
			attackGroupTag = ""
		},
		[6] = {
			type = "AttackWindow",
			time = Fixed64(89128960) --[[85]],
			realTime = Fixed64(1931127) --[[1.841667]],
			toggle = true,
			isClear = true
		},
		[7] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2271914) --[[2.166667]],
			toggle = false
		}
	},
	["Skill04"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Sound",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(209716) --[[0.2]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "WarningSinal_Monster"
		},
		[4] = {
			type = "Sound",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(297097) --[[0.2833334]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21103Skill04_Monster"
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(506812) --[[0.4833333]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35127296) --[[33.5]],
			flagRealTime = Fixed64(585455) --[[0.5583333]],
			flagRange = "Rect",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Forward",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(524288) --[[0.5]],
			filePath = "M_DEM_21103/curve_Skill04"
		},
		[7] = {
			type = "Effect",
			time = Fixed64(35127296) --[[33.5]],
			realTime = Fixed64(585455) --[[0.5583333]],
			filePath = "Effect/M_DEM_21103/M_DEM_21103_Skill_04_SCE_01"
		},
		[8] = {
			type = "Attack",
			time = Fixed64(35232152) --[[33.6]],
			realTime = Fixed64(587203) --[[0.56]],
			filePath = "M_DEM_21103/attack_Attack_2",
			attackGroupTag = ""
		},
		[9] = {
			type = "AttackFlag",
			time = Fixed64(49283072) --[[47]],
			realTime = Fixed64(821385) --[[0.7833334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(53477376) --[[51]],
			flagRealTime = Fixed64(891290) --[[0.85]],
			flagRange = "Sector",
			flagAngle = Fixed64(188743680) --[[180]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[10] = {
			type = "Effect",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(873813) --[[0.8333334]],
			filePath = "Effect/M_DEM_21103/M_DEM_21103_Skill_04_SCE_02"
		},
		[11] = {
			type = "Attack",
			time = Fixed64(53057944) --[[50.6]],
			realTime = Fixed64(884299) --[[0.8433334]],
			filePath = "M_DEM_21103/attack_Attack_3",
			attackGroupTag = ""
		},
		[12] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1747626) --[[1.666667]],
			toggle = false
		}
	},
	["HitFly"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103/curve_HitFly"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitFly_1"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(11534336) --[[11]],
			realTime = Fixed64(196084) --[[0.187]],
			content = "ST_HitFly_2"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(43201332) --[[41.2]],
			realTime = Fixed64(734423) --[[0.7004001]],
			content = "ST_HitFly_3"
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(91750400) --[[87.5]],
			realTime = Fixed64(1559757) --[[1.4875]],
			content = "ST_HitFly_4"
		}
	},
	["Start"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21103Start_Monster"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Start_1"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(33973864) --[[32.4]],
			realTime = Fixed64(396362) --[[0.3780001]],
			content = "ST_Start_2"
		}
	},
	["Walk"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21103Walk_Monster"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Walk_1"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21103Walk_Monster"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_WalkBack_1"
		}
	},
	["Run"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(1048576) --[[1]],
			realTime = Fixed64(4893) --[[0.004666667]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21103RUN_Monster"
		}
	},
	["HitDown"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitDown_1"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(11534336) --[[11]],
			realTime = Fixed64(196084) --[[0.187]],
			content = "ST_HitDown_2"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(43201332) --[[41.2]],
			realTime = Fixed64(734423) --[[0.7004001]],
			content = "ST_HitDown_3"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(91750400) --[[87.5]],
			realTime = Fixed64(1559757) --[[1.4875]],
			content = "ST_HitDown_4"
		}
	},
	["IdleBattle"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_IdleBattle_1"
		},
		[2] = {
			type = "AttackFlag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			flagPosition = FixedVector3(0, 0, 3145728) --[[(0, 0, 3)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(83886080) --[[80]],
			flagRealTime = Fixed64(1342178) --[[1.28]],
			flagRange = "Range",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		}
	}
}