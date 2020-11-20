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
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "M21101Skill04_Battle"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "WarningSinal_Battle"
		},
		[4] = {
			type = "None",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(524288) --[[0.5]],
			filePath = "Effect/M_DEM_21101/M_DEM_21101_skill_4_Fire"
		},
		[6] = {
			type = "Bullet",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(545259) --[[0.52]],
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
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(12582912) --[[12]],
			lookTargetTime = Fixed64(104857600) --[[100]],
			lookTargetRealTime = Fixed64(768956) --[[0.7333333]]
		}
	},
	["Skill03Start"] = {
		[1] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21101Skill03Start_Battle"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "WarningSinalRemotely_Battle"
		},
		[4] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(12582912) --[[12]],
			lookTargetTime = Fixed64(104857600) --[[100]],
			lookTargetRealTime = Fixed64(349525) --[[0.3333333]]
		}
	},
	["Start"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21101Star_Battle"
		}
	},
	["Skill03End"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/M_DEM_21101/M_DEM_21101_skill_3_Line_Clear"
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
			mute = false,
			akEventName = ""
		},
		[4] = {
			type = "AttackFlag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(681575) --[[0.6500001]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(772451) --[[0.7366668]],
			flagRange = "Rect",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(704293) --[[0.6716667]],
			filePath = "Effect/M_DEM_21101/M_DEM_21101_skill_3_Fire"
		},
		[6] = {
			type = "Bullet",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(704293) --[[0.6716667]],
			bulletShootPosition = FixedVector3(0, 912262, 681574) --[[(0, 0.87, 0.65)]],
			bulletShootDirection = FixedVector3(0, 0, 1048576) --[[(0, 0, 1)]],
			bulletId = Fixed64(13631488) --[[13]],
			bulletCount = Fixed64(1048576) --[[1]],
			bulletInterval = Fixed64(0) --[[0]]
		},
		[7] = {
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
			mute = false,
			akEventName = "M21101Walk_Battle"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21101Walk_Battle"
		}
	}
}