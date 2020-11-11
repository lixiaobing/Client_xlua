--action event pack
--M_DEM_21103Controller

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
			akEventName = "WarningSinal_Monster"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(431664) --[[0.4116667]],
			filePath = "Effect/Common/Warning_Signal",
			boneNogType = "Head",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(499821) --[[0.4766667]]
		},
		[4] = {
			type = "Sound",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(636136) --[[0.6066667]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21103Skill01_Monster"
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(1022362) --[[0.975]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(56203672) --[[53.6]],
			flagRealTime = Fixed64(1217746) --[[1.161333]],
			flagRange = "Rectangle",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagWide = Fixed64(2097152) --[[2]],
			flagLong = Fixed64(3145728) --[[3]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(52219084) --[[49.8]],
			realTime = Fixed64(1131413) --[[1.079]],
			filePath = "M_DEM_21103/attack_Attack_1",
			damageRatio = Fixed64(1048576) --[[1]]
		},
		[7] = {
			type = "Effect",
			time = Fixed64(52848232) --[[50.4]],
			realTime = Fixed64(1145045) --[[1.092]],
			filePath = "Effect/Monster/M_DEM_21103/M_DEM_21103_Skill_01_SCE",
			boneNogType = "None",
			isGlobalSpace = true,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "AttackWindow",
			time = Fixed64(89128960) --[[85]],
			realTime = Fixed64(1931127) --[[1.841667]],
			toggle = true,
			isClear = true
		},
		[9] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2271914) --[[2.166667]],
			toggle = false
		}
	},
	["Skill04"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/Common/Warning_Signal",
			boneNogType = "Head",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = true,
			customLifeTime = Fixed64(401954) --[[0.3833334]]
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
			akEventName = "WarningSinal_Monster"
		},
		[4] = {
			type = "Sound",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(297097) --[[0.2833334]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21103Skill04_Monster"
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(506812) --[[0.4833333]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(35127296) --[[33.5]],
			flagRealTime = Fixed64(585455) --[[0.5583333]],
			flagRange = "Rectangle",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagWide = Fixed64(3145728) --[[3]],
			flagLong = Fixed64(2621440) --[[2.5]]
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
			filePath = "Effect/Monster/M_DEM_21103/M_DEM_21103_Skill_04_SCE_01",
			boneNogType = "None",
			isGlobalSpace = true,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(35232152) --[[33.6]],
			realTime = Fixed64(587203) --[[0.56]],
			filePath = "M_DEM_21103/attack_Attack_2",
			damageRatio = Fixed64(524288) --[[0.5]]
		},
		[9] = {
			type = "AttackFlag",
			time = Fixed64(49283072) --[[47]],
			realTime = Fixed64(821385) --[[0.7833334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(53477376) --[[51]],
			flagRealTime = Fixed64(891290) --[[0.85]],
			flagRange = "Sector",
			flagAngle = Fixed64(188743680) --[[180]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagWide = Fixed64(3145728) --[[3]],
			flagLong = Fixed64(3145728) --[[3]]
		},
		[10] = {
			type = "Effect",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(873813) --[[0.8333334]],
			filePath = "Effect/Monster/M_DEM_21103/M_DEM_21103_Skill_04_SCE_02",
			boneNogType = "None",
			isGlobalSpace = true,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[11] = {
			type = "Attack",
			time = Fixed64(53057944) --[[50.6]],
			realTime = Fixed64(884299) --[[0.8433334]],
			filePath = "M_DEM_21103/attack_Attack_3",
			damageRatio = Fixed64(524288) --[[0.5]]
		},
		[12] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1747626) --[[1.666667]],
			toggle = false
		}
	},
	["HitHeavy"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(8493466) --[[8.1]],
			realTime = Fixed64(62286) --[[0.0594]],
			filePath = "M_DEM_21103/curve_HitHeavy"
		}
	},
	["HitSoft"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103/curve_HitSoft"
		}
	},
	["HitFlowDown"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103/curve_HitFlowDown"
		}
	},
	["HitFly"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103/curve_HitFly"
		}
	},
	["HitBeatBack"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(3774873) --[[3.6]],
			realTime = Fixed64(27682) --[[0.0264]],
			filePath = "M_DEM_21103/curve_HitBeatBack_1"
		}
	},
	["Start"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21103Start_Monster"
		}
	},
	["Walk"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21103Walk_Monster"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21103Walk_Monster"
		}
	},
	["TurnRight"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			akEventName = "M21103Walk_Monster"
		}
	},
	["TurnLeft"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			akEventName = "M21103Walk_Monster"
		}
	},
	["Run"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(1048576) --[[1]],
			realTime = Fixed64(4893) --[[0.004666667]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21103RUN_Monster"
		}
	}
}