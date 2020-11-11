--action event pack
--M_DEM_21101

return
{
	
	["Skill01"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(1384121) --[[1.32]],
			filePath = "M_DEM_21101/curve_Back1"
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
			isCustomLifeTime = false,
			customLifeTime = Fixed64(545259) --[[0.52]]
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			akEventName = "M21101Skill04_Monster"
		},
		[4] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			akEventName = "Warning_Sinal"
		},
		[5] = {
			type = "Effect",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(524288) --[[0.5]],
			filePath = "Effect/Monster/M_DEM_21101/M_DEM_21101_skill_4_Fire",
			boneNogType = "RightHand",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Bullet",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(545259) --[[0.52]],
			damageRatio = Fixed64(1048576) --[[1]],
			bulletShootPosition = FixedVector3(209716, 2516583, 1572864) --[[(0.2, 2.4, 1.5)]],
			bulletShootDirection = FixedVector3(0, 10485760, 4194304) --[[(0, 10, 4)]],
			bulletId = Fixed64(12582912) --[[12]],
			bulletCount = Fixed64(1048576) --[[1]],
			bulletInterval = Fixed64(0) --[[0]]
		},
		[7] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2097152) --[[2]],
			toggle = true
		}
	},
	["Skill03Loop"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/Common/Warnning_Line_loop",
			boneNogType = "LeftHand",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		}
	},
	["Skill03Start"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/Common/Warning_Signal",
			boneNogType = "Head",
			isGlobalSpace = false,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21101Skill03Start_Monster"
		},
		[4] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "Warning_SinalRemotely"
		}
	},
	["Start"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21101Star_Monster"
		},
		[2] = {
			type = "Effect",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(283116) --[[0.27]],
			filePath = "Effect/Common/AttackSmallGas",
			boneNogType = "None",
			isGlobalSpace = false,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[3] = {
			type = "Effect",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(283116) --[[0.27]],
			filePath = "Effect/Common/BigDust_2",
			boneNogType = "None",
			isGlobalSpace = false,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		}
	},
	["HitBeatBack"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(1048576) --[[1]],
			realTime = Fixed64(22719) --[[0.02166667]],
			filePath = "M_DEM_21101/curve_HitBeatBack"
		}
	},
	["Skill03End"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/Monster/M_DEM_21101/M_DEM_21101_skill_3_Line_Clear",
			boneNogType = "LeftHand",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(320865) --[[0.306]]
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "AttackFlag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(681575) --[[0.6500001]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(772451) --[[0.7366668]],
			flagRange = "Rectangle",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagWide = Fixed64(419431) --[[0.4]],
			flagLong = Fixed64(20971520) --[[20]]
		},
		[4] = {
			type = "Effect",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(704293) --[[0.6716667]],
			filePath = "Effect/Monster/M_DEM_21101/M_DEM_21101_skill_4_Fire",
			boneNogType = "LeftHand",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Bullet",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(704293) --[[0.6716667]],
			damageRatio = Fixed64(1048576) --[[1]],
			bulletShootPosition = FixedVector3(0, 912262, 681574) --[[(0, 0.87, 0.65)]],
			bulletShootDirection = FixedVector3(0, 0, 1048576) --[[(0, 0, 1)]],
			bulletId = Fixed64(13631488) --[[13]],
			bulletCount = Fixed64(1048576) --[[1]],
			bulletInterval = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2271915) --[[2.166667]],
			toggle = false
		}
	},
	["Walk"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21101Walk_Monster"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			akEventName = "M21101Walk_Monster"
		}
	},
	["TurnLeft"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			akEventName = "M21101Walk_Monster"
		}
	},
	["TurnRight"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			akEventName = "M21101Walk_Monster"
		}
	}
}