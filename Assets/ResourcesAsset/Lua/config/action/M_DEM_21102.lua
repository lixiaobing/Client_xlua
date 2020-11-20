--action event pack
--M_DEM_21102

return
{
	
	["Skill01"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21102Skill01_Monster"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(24641536) --[[23.5]],
			realTime = Fixed64(739247) --[[0.705]],
			filePath = "Effect/M_DEM_21102/M_DEM_21102_Skill01_1"
		},
		[4] = {
			type = "Sound",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(912262) --[[0.8700001]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "WarningSinal_Monster"
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(42991616) --[[41]],
			realTime = Fixed64(1289749) --[[1.23]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(47185920) --[[45]],
			flagRealTime = Fixed64(1415578) --[[1.35]],
			flagRange = "Sector",
			flagAngle = Fixed64(125829120) --[[120]],
			flagRadius = Fixed64(4718592) --[[4.5]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Effect",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(1415578) --[[1.35]],
			filePath = "Effect/M_DEM_21102/M_DEM_21102_Skill01_2"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(48234496) --[[46]],
			realTime = Fixed64(1447035) --[[1.38]],
			filePath = "M_DEM_21102/attack_Skill01",
			attackGroupTag = ""
		},
		[8] = {
			type = "Attack",
			time = Fixed64(58720256) --[[56]],
			realTime = Fixed64(1761608) --[[1.68]],
			filePath = "M_DEM_21102/attack_Skill01",
			attackGroupTag = ""
		},
		[9] = {
			type = "Attack",
			time = Fixed64(69206016) --[[66]],
			realTime = Fixed64(2076181) --[[1.98]],
			filePath = "M_DEM_21102/attack_Skill01",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(79691776) --[[76]],
			realTime = Fixed64(2390754) --[[2.28]],
			filePath = "M_DEM_21102/attack_Skill01",
			attackGroupTag = ""
		}
	},
	["Skill02Start"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/M_DEM_21102/M_DEM_21102_Skill02Loop"
		},
		[2] = {
			type = "IgnoreCollision",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "M21102Skill02Start_Monster"
		},
		[5] = {
			type = "Sound",
			time = Fixed64(34603008) --[[33]],
			realTime = Fixed64(369099) --[[0.352]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "WarningSinal_Monster"
		},
		[6] = {
			type = "Effect",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(559241) --[[0.5333334]],
			filePath = "Effect/M_DEM_21102/M_DEM_21102_Skill01_2"
		}
	},
	["Skill02Loop"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/M_DEM_21102/M_DEM_21102_Skill02Loop"
		},
		[2] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21102/curve_Skill02Loop"
		},
		[3] = {
			type = "IgnoreCollision",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "Attack",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21102/attack_Skill02Loop",
			attackGroupTag = ""
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(104857600) --[[100]],
			flagRealTime = Fixed64(349525) --[[0.3333333]],
			flagRange = "Rect",
			flagAngle = Fixed64(8388608) --[[8]],
			flagRadius = Fixed64(8388608) --[[8]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		}
	},
	["Skill02End"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21102/curve_Skill02End"
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "IgnoreCollision",
			time = Fixed64(103809024) --[[99]],
			realTime = Fixed64(1314915) --[[1.254]],
			toggle = false
		},
		[4] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1328196) --[[1.266667]],
			toggle = false
		}
	},
	["Start"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "M21102Start_Monster"
		}
	},
	["HitBeatBack"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(2097152) --[[2]],
			realTime = Fixed64(13981) --[[0.01333333]],
			filePath = "M_DEM_21102/curve_HitBeatBack"
		}
	},
	["Walk"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21102Walk_Monster"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "M21102Walk_Monster"
		}
	}
}