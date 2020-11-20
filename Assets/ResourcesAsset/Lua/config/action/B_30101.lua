--action event pack
--B_30101

return
{
	
	["HitSoft"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = ""
		},
		[2] = {
			type = "Backward",
			time = Fixed64(4718592) --[[4.5]],
			realTime = Fixed64(31458) --[[0.03]],
			filePath = "B_30101/curve_HitSoft"
		}
	},
	["HitFly"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = ""
		},
		[2] = {
			type = "Backward",
			time = Fixed64(9017754) --[[8.6]],
			realTime = Fixed64(54107) --[[0.05160001]],
			filePath = "B_30101/curve_HitFly"
		}
	},
	["HitFlowUp"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true,
			flowUpPower = Fixed64(12582912) --[[12]]
		}
	},
	["Skill_2_3"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(230686) --[[0.22]]
		},
		[2] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(384478) --[[0.3666667]],
			filePath = "B_30101/curve_Skill_2_3"
		},
		[3] = {
			type = "AttackFlag",
			time = Fixed64(45088768) --[[43]],
			realTime = Fixed64(826628) --[[0.7883334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(50331648) --[[48]],
			flagRealTime = Fixed64(922746) --[[0.88]],
			flagRange = "Sector",
			flagAngle = Fixed64(125829120) --[[120]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[4] = {
			type = "Attack",
			time = Fixed64(48234496) --[[46]],
			realTime = Fixed64(884299) --[[0.8433334]],
			filePath = "B_30101/attack_Skill_2_3",
			attackGroupTag = ""
		},
		[5] = {
			type = "EffectSave",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(961194) --[[0.9166667]]
		}
	},
	["Skill_1_2"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(25165824) --[[24]],
			lookTargetRealTime = Fixed64(369098) --[[0.352]]
		},
		[2] = {
			type = "Forward",
			time = Fixed64(14680064) --[[14]],
			realTime = Fixed64(215308) --[[0.2053333]],
			filePath = "B_30101/curve_Skill_1_2"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(307582) --[[0.2933334]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack2_Boss"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(384478) --[[0.3666667]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(28311552) --[[27]],
			realTime = Fixed64(415236) --[[0.396]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(34603008) --[[33]],
			flagRealTime = Fixed64(507510) --[[0.484]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(461373) --[[0.44]],
			filePath = "B_30101/attack_Skill_1_2",
			attackGroupTag = ""
		}
	},
	["Skill_1_3"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(20971520) --[[20]],
			lookTargetRealTime = Fixed64(447392) --[[0.4266667]]
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
			akEventName = "Attack3_Boss"
		},
		[5] = {
			type = "Forward",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(335545) --[[0.32]],
			filePath = "B_30101/curve_Skill_1_3"
		},
		[6] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(559241) --[[0.5333334]]
		},
		[7] = {
			type = "AttackFlag",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(581610) --[[0.5546667]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(31457280) --[[30]],
			flagRealTime = Fixed64(671089) --[[0.64]],
			flagRange = "Sector",
			flagAngle = Fixed64(188743680) --[[180]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(626350) --[[0.5973334]],
			filePath = "B_30101/attack_Skill_1_3",
			attackGroupTag = ""
		},
		[9] = {
			type = "AttackFlag",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(648719) --[[0.6186667]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(760567) --[[0.7253334]],
			flagRange = "Sector",
			flagAngle = Fixed64(188743680) --[[180]],
			flagRadius = Fixed64(6291456) --[[6]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[10] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(671089) --[[0.64]],
			filePath = "B_30101/attack_Skill_1_3_1",
			attackGroupTag = ""
		},
		[11] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2236962) --[[2.133333]],
			toggle = false
		}
	},
	["Skill_1_4"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[3] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(26214400) --[[25]],
			lookTargetRealTime = Fixed64(620407) --[[0.5916667]]
		},
		[4] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack4_Boss"
		},
		[6] = {
			type = "Forward",
			time = Fixed64(6291456) --[[6]],
			realTime = Fixed64(148898) --[[0.142]],
			filePath = "B_30101/curve_Skill_1_4"
		},
		[7] = {
			type = "AttackFlag",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(645224) --[[0.6153334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(55574528) --[[53]],
			flagRealTime = Fixed64(1315264) --[[1.254333]],
			flagRange = "Rect",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(719673) --[[0.6863334]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[9] = {
			type = "Attack",
			time = Fixed64(37748736) --[[36]],
			realTime = Fixed64(893387) --[[0.8520001]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(45088768) --[[43]],
			realTime = Fixed64(1067101) --[[1.017667]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1240815) --[[1.183333]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[12] = {
			type = "Forward",
			time = Fixed64(53477376) --[[51]],
			realTime = Fixed64(1265632) --[[1.207]],
			filePath = "B_30101/curve_Skill_1_4_1"
		},
		[13] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2481630) --[[2.366667]],
			toggle = false
		}
	},
	["RushF"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushF"
		}
	},
	["RushL"] = {
		[1] = {
			type = "Leftward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushL_1"
		}
	},
	["RushR"] = {
		[1] = {
			type = "Rightward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushR_1"
		}
	},
	["Skill_2_1"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		}
	},
	["Skill05Start"] = {
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
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Skill2_Boss"
		},
		[4] = {
			type = "LookTarget",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(436906) --[[0.4166667]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(104857600) --[[100]],
			lookTargetRealTime = Fixed64(873813) --[[0.8333334]]
		}
	},
	["RushB"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushB"
		}
	},
	["Skill_1_1"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(5242880) --[[5]],
			lookTargetTime = Fixed64(24117248) --[[23]],
			lookTargetRealTime = Fixed64(337642) --[[0.322]]
		},
		[2] = {
			type = "Sound",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(176161) --[[0.168]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack1_Boss"
		},
		[3] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(293602) --[[0.28]],
			filePath = "B_30101/curve_Skill_1_1"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(367002) --[[0.35]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(440402) --[[0.42]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(499123) --[[0.476]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(455082) --[[0.434]],
			filePath = "B_30101/attack_Skill_1_1",
			attackGroupTag = ""
		}
	},
	["Skill05Loop"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(104857600) --[[100]],
			lookTargetRealTime = Fixed64(349525) --[[0.3333333]]
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		}
	},
	["Walk"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Footstep_Boss"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Footstep_Boss"
		}
	},
	["RushF2"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushF"
		}
	},
	["RushB2"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushB"
		},
		[2] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Super",
			time = Fixed64(1048576) --[[1]],
			realTime = Fixed64(6292) --[[0.006]],
			toggle = true
		}
	},
	["RushL2"] = {
		[1] = {
			type = "Leftward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushL_1"
		},
		[2] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(20971520) --[[20]],
			lookTargetTime = Fixed64(104857600) --[[100]],
			lookTargetRealTime = Fixed64(629146) --[[0.6]]
		},
		[3] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "Super",
			time = Fixed64(1048576) --[[1]],
			realTime = Fixed64(6292) --[[0.006]],
			toggle = true
		}
	},
	["RushR2"] = {
		[1] = {
			type = "Rightward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "B_30101/curve_RushR_1"
		},
		[2] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(20971520) --[[20]],
			lookTargetTime = Fixed64(104857600) --[[100]],
			lookTargetRealTime = Fixed64(629146) --[[0.6]]
		},
		[3] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "Super",
			time = Fixed64(1048576) --[[1]],
			realTime = Fixed64(6292) --[[0.006]],
			toggle = true
		}
	},
	["Skill_1_1c"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(5242880) --[[5]],
			lookTargetTime = Fixed64(24117248) --[[23]],
			lookTargetRealTime = Fixed64(337642) --[[0.322]]
		},
		[2] = {
			type = "Sound",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(176161) --[[0.168]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack1_Boss"
		},
		[3] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(293602) --[[0.28]],
			filePath = "B_30101/curve_Skill_1_1"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(367002) --[[0.35]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(440402) --[[0.42]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(499123) --[[0.476]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(455082) --[[0.434]],
			filePath = "B_30101/attack_Skill_1_1",
			attackGroupTag = ""
		}
	},
	["Skill_1_2c"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(25165824) --[[24]],
			lookTargetRealTime = Fixed64(369098) --[[0.352]]
		},
		[2] = {
			type = "Forward",
			time = Fixed64(14680064) --[[14]],
			realTime = Fixed64(215308) --[[0.2053333]],
			filePath = "B_30101/curve_Skill_1_2"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(307582) --[[0.2933334]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack2_Boss"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(384478) --[[0.3666667]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(28311552) --[[27]],
			realTime = Fixed64(415236) --[[0.396]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(34603008) --[[33]],
			flagRealTime = Fixed64(507510) --[[0.484]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(461373) --[[0.44]],
			filePath = "B_30101/attack_Skill_1_2",
			attackGroupTag = ""
		}
	},
	["Skill_1_3c"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(20971520) --[[20]],
			lookTargetRealTime = Fixed64(447392) --[[0.4266667]]
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
			akEventName = "Attack3_Boss"
		},
		[5] = {
			type = "Forward",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(335545) --[[0.32]],
			filePath = "B_30101/curve_Skill_1_3"
		},
		[6] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(559241) --[[0.5333334]]
		},
		[7] = {
			type = "AttackFlag",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(581610) --[[0.5546667]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(31457280) --[[30]],
			flagRealTime = Fixed64(671089) --[[0.64]],
			flagRange = "Sector",
			flagAngle = Fixed64(188743680) --[[180]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(626350) --[[0.5973334]],
			filePath = "B_30101/attack_Skill_1_3",
			attackGroupTag = ""
		},
		[9] = {
			type = "AttackFlag",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(648719) --[[0.6186667]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(760567) --[[0.7253334]],
			flagRange = "Sector",
			flagAngle = Fixed64(188743680) --[[180]],
			flagRadius = Fixed64(6291456) --[[6]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[10] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(671089) --[[0.64]],
			filePath = "B_30101/attack_Skill_1_3_1",
			attackGroupTag = ""
		},
		[11] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2236962) --[[2.133333]],
			toggle = false
		}
	},
	["Skill_1_1b"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(5242880) --[[5]],
			lookTargetTime = Fixed64(24117248) --[[23]],
			lookTargetRealTime = Fixed64(337642) --[[0.322]]
		},
		[2] = {
			type = "Sound",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(176161) --[[0.168]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack1_Boss"
		},
		[3] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(293602) --[[0.28]],
			filePath = "B_30101/curve_Skill_1_1"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(367002) --[[0.35]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(440402) --[[0.42]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(499123) --[[0.476]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(455082) --[[0.434]],
			filePath = "B_30101/attack_Skill_1_1",
			attackGroupTag = ""
		}
	},
	["Skill_1_2b"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(25165824) --[[24]],
			lookTargetRealTime = Fixed64(369098) --[[0.352]]
		},
		[2] = {
			type = "Forward",
			time = Fixed64(14680064) --[[14]],
			realTime = Fixed64(215308) --[[0.2053333]],
			filePath = "B_30101/curve_Skill_1_2"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(307582) --[[0.2933334]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack2_Boss"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(384478) --[[0.3666667]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(28311552) --[[27]],
			realTime = Fixed64(415236) --[[0.396]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(34603008) --[[33]],
			flagRealTime = Fixed64(507510) --[[0.484]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(461373) --[[0.44]],
			filePath = "B_30101/attack_Skill_1_2",
			attackGroupTag = ""
		}
	},
	["Skill_1_4d"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[3] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(26214400) --[[25]],
			lookTargetRealTime = Fixed64(620407) --[[0.5916667]]
		},
		[4] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack4_Boss"
		},
		[6] = {
			type = "Forward",
			time = Fixed64(6291456) --[[6]],
			realTime = Fixed64(148898) --[[0.142]],
			filePath = "B_30101/curve_Skill_1_4"
		},
		[7] = {
			type = "AttackFlag",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(645224) --[[0.6153334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(55574528) --[[53]],
			flagRealTime = Fixed64(1315264) --[[1.254333]],
			flagRange = "Rect",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(719673) --[[0.6863334]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[9] = {
			type = "Attack",
			time = Fixed64(37748736) --[[36]],
			realTime = Fixed64(893387) --[[0.8520001]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(45088768) --[[43]],
			realTime = Fixed64(1067101) --[[1.017667]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1240815) --[[1.183333]],
			filePath = "B_30101/attack_Skill_1_4",
			attackGroupTag = ""
		},
		[12] = {
			type = "Forward",
			time = Fixed64(53477376) --[[51]],
			realTime = Fixed64(1265632) --[[1.207]],
			filePath = "B_30101/curve_Skill_1_4_1"
		},
		[13] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2481630) --[[2.366667]],
			toggle = false
		}
	},
	["Skill_1_1d"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(5242880) --[[5]],
			lookTargetTime = Fixed64(24117248) --[[23]],
			lookTargetRealTime = Fixed64(337642) --[[0.322]]
		},
		[2] = {
			type = "Sound",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(176161) --[[0.168]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack1_Boss"
		},
		[3] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(293602) --[[0.28]],
			filePath = "B_30101/curve_Skill_1_1"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(367002) --[[0.35]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(440402) --[[0.42]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(35651584) --[[34]],
			flagRealTime = Fixed64(499123) --[[0.476]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(455082) --[[0.434]],
			filePath = "B_30101/attack_Skill_1_1",
			attackGroupTag = ""
		}
	},
	["Skill_1_2d"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(25165824) --[[24]],
			lookTargetRealTime = Fixed64(369098) --[[0.352]]
		},
		[2] = {
			type = "Forward",
			time = Fixed64(14680064) --[[14]],
			realTime = Fixed64(215308) --[[0.2053333]],
			filePath = "B_30101/curve_Skill_1_2"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(307582) --[[0.2933334]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Attack2_Boss"
		},
		[4] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(384478) --[[0.3666667]]
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(28311552) --[[27]],
			realTime = Fixed64(415236) --[[0.396]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(34603008) --[[33]],
			flagRealTime = Fixed64(507510) --[[0.484]],
			flagRange = "Sector",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(461373) --[[0.44]],
			filePath = "B_30101/attack_Skill_1_2",
			attackGroupTag = ""
		}
	},
	["Skill_5"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(786432) --[[0.7500001]]
		},
		[2] = {
			type = "Attack",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1572864) --[[1.5]],
			filePath = "B_30101/attack_Skill_5",
			attackGroupTag = ""
		},
		[3] = {
			type = "AttackFlag",
			time = Fixed64(54525952) --[[52]],
			realTime = Fixed64(1635779) --[[1.56]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(73400320) --[[70]],
			flagRealTime = Fixed64(2202010) --[[2.1]],
			flagRange = "Sector",
			flagAngle = Fixed64(377487360) --[[360]],
			flagRadius = Fixed64(5767168) --[[5.5]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[4] = {
			type = "Attack",
			time = Fixed64(56623104) --[[54]],
			realTime = Fixed64(1698694) --[[1.62]],
			filePath = "B_30101/attack_Skill_5",
			attackGroupTag = ""
		},
		[5] = {
			type = "Forward",
			time = Fixed64(56623104) --[[54]],
			realTime = Fixed64(1698694) --[[1.62]],
			filePath = "B_30101/curve_Skill_5"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(60817408) --[[58]],
			realTime = Fixed64(1824523) --[[1.74]],
			filePath = "B_30101/attack_Skill_5",
			attackGroupTag = ""
		},
		[7] = {
			type = "Attack",
			time = Fixed64(65011712) --[[62]],
			realTime = Fixed64(1950352) --[[1.86]],
			filePath = "B_30101/attack_Skill_5",
			attackGroupTag = ""
		},
		[8] = {
			type = "Attack",
			time = Fixed64(69206016) --[[66]],
			realTime = Fixed64(2076181) --[[1.98]],
			filePath = "B_30101/attack_Skill_5",
			attackGroupTag = ""
		}
	},
	["Skill05End"] = {
		[1] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(3145728) --[[3]],
			lookTargetTime = Fixed64(20971520) --[[20]],
			lookTargetRealTime = Fixed64(356516) --[[0.34]]
		},
		[2] = {
			type = "EffectSave",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(213910) --[[0.204]]
		},
		[3] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(356516) --[[0.34]],
			filePath = "B_30101/curve_Skill_2_3"
		},
		[4] = {
			type = "IgnoreCollision",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(356516) --[[0.34]],
			toggle = true
		},
		[5] = {
			type = "AttackFlag",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(392168) --[[0.374]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(45088768) --[[43]],
			flagRealTime = Fixed64(766510) --[[0.731]],
			flagRange = "Rect",
			flagAngle = Fixed64(125829120) --[[120]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(392168) --[[0.374]],
			filePath = "B_30101/attack_Skill05End_1",
			attackGroupTag = ""
		},
		[7] = {
			type = "AttackFlag",
			time = Fixed64(45088768) --[[43]],
			realTime = Fixed64(766510) --[[0.731]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(50331648) --[[48]],
			flagRealTime = Fixed64(855639) --[[0.816]],
			flagRange = "Sector",
			flagAngle = Fixed64(125829120) --[[120]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[8] = {
			type = "IgnoreCollision",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(802161) --[[0.765]],
			toggle = false
		},
		[9] = {
			type = "Attack",
			time = Fixed64(48234496) --[[46]],
			realTime = Fixed64(819987) --[[0.782]],
			filePath = "B_30101/attack_Skill05End",
			attackGroupTag = ""
		},
		[10] = {
			type = "EffectSave",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(891290) --[[0.85]]
		}
	},
	["Skill_4"] = {
		[1] = {
			type = "EffectSave",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]]
		},
		[2] = {
			type = "LookTarget",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			lookTargetSpeed = Fixed64(5242880) --[[5]],
			lookTargetTime = Fixed64(73400320) --[[70]],
			lookTargetRealTime = Fixed64(2250943) --[[2.146667]]
		},
		[3] = {
			type = "AttackFlag",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(803908) --[[0.7666667]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(73400320) --[[70]],
			flagRealTime = Fixed64(2250943) --[[2.146667]],
			flagRange = "Rect",
			flagAngle = Fixed64(157286400) --[[150]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(0, 0, 0) --[[(0, 0, 0)]]
		},
		[4] = {
			type = "Attack",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(1125472) --[[1.073333]],
			filePath = "B_30101/attack_Skill_4",
			attackGroupTag = ""
		},
		[5] = {
			type = "Attack",
			time = Fixed64(50331648) --[[48]],
			realTime = Fixed64(1543504) --[[1.472]],
			filePath = "B_30101/attack_Skill_4",
			attackGroupTag = ""
		},
		[6] = {
			type = "Attack",
			time = Fixed64(71303168) --[[68]],
			realTime = Fixed64(2186631) --[[2.085333]],
			filePath = "B_30101/attack_Skill_4",
			attackGroupTag = ""
		}
	}
}