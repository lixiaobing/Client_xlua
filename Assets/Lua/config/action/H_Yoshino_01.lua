--action event pack
--H_Yoshino_01

return
{
	
	["Attack1"] = {
		[1] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "AttackFlag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(26214400) --[[25]],
			flagRealTime = Fixed64(235930) --[[0.225]],
			flagRange = "Rectangle",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagWide = Fixed64(1048576) --[[1]],
			flagLong = Fixed64(20971520) --[[20]]
		},
		[3] = {
			type = "Bullet",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(188744) --[[0.18]],
			bulletShootPosition = FixedVector3(0, 1258292, 0) --[[(0, 1.2, 0)]],
			bulletShootDirection = FixedVector3(0, 0, 1048576) --[[(0, 0, 1)]],
			bulletId = Fixed64(10485760) --[[10]],
			bulletCount = Fixed64(1048576) --[[1]],
			bulletInterval = Fixed64(0) --[[0]]
		},
		[4] = {
			type = "Effect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(188744) --[[0.18]],
			filePath = "Effect/H_Yoshino_01/Yoshino_attack_1"
		},
		[5] = {
			type = "Forward",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(188744) --[[0.18]],
			filePath = "H_Yoshino/curve_Attack1"
		},
		[6] = {
			type = "Sound",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(188744) --[[0.18]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoAttack1_Battle"
		},
		[7] = {
			type = "CameraEffect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(188744) --[[0.18]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "AttackWindow",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(330301) --[[0.315]],
			toggle = true,
			isClear = false
		}
	},
	["Attack2"] = {
		[1] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "AttackFlag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(36700160) --[[35]],
			flagRealTime = Fixed64(354768) --[[0.3383333]],
			flagRange = "Rectangle",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(0) --[[0]],
			flagWide = Fixed64(1048576) --[[1]],
			flagLong = Fixed64(20971520) --[[20]]
		},
		[3] = {
			type = "Forward",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(182453) --[[0.174]],
			filePath = "H_Yoshino/curve_Attack2"
		},
		[4] = {
			type = "Bullet",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(182453) --[[0.174]],
			bulletShootPosition = FixedVector3(0, 1258292, 0) --[[(0, 1.2, 0)]],
			bulletShootDirection = FixedVector3(0, 0, 1048576) --[[(0, 0, 1)]],
			bulletId = Fixed64(11534336) --[[11]],
			bulletCount = Fixed64(1048576) --[[1]],
			bulletInterval = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Sound",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(182453) --[[0.174]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoAttack2_Battle"
		},
		[6] = {
			type = "CameraEffect",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(182453) --[[0.174]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[7] = {
			type = "Effect",
			time = Fixed64(20656948) --[[19.7]],
			realTime = Fixed64(199684) --[[0.1904334]],
			filePath = "Effect/H_Yoshino_01/Yoshino_attack_2"
		},
		[8] = {
			type = "Bullet",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(283814) --[[0.2706667]],
			bulletShootPosition = FixedVector3(0, 1258292, 0) --[[(0, 1.2, 0)]],
			bulletShootDirection = FixedVector3(0, 0, 1048576) --[[(0, 0, 1)]],
			bulletId = Fixed64(11534336) --[[11]],
			bulletCount = Fixed64(1048576) --[[1]],
			bulletInterval = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "CameraEffect",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(283814) --[[0.2706667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[10] = {
			type = "AttackWindow",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(405449) --[[0.3866667]],
			toggle = true,
			isClear = false
		}
	},
	["Attack3"] = {
		[1] = {
			type = "RushWindow",
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
			akEventName = "PYoshinoAttack3_Battle"
		},
		[3] = {
			type = "AttackFlag",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(136315) --[[0.13]],
			flagPosition = FixedVector3(0, 0, 5242880) --[[(0, 0, 5)]],
			flagTime = Fixed64(49283072) --[[47]],
			flagRealTime = Fixed64(640680) --[[0.6110001]],
			flagRange = "Sector",
			flagAngle = Fixed64(377487360) --[[360]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(0) --[[0]]
		},
		[4] = {
			type = "Forward",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(245367) --[[0.234]],
			filePath = "H_Yoshino/curve_Attack3"
		},
		[5] = {
			type = "CameraEffect",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(299893) --[[0.286]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(23488102) --[[22.4]],
			realTime = Fixed64(305346) --[[0.2912]],
			filePath = "H_Yoshino/attack_Attack3",
			attackGroupTag = ""
		},
		[7] = {
			type = "CameraEffect",
			time = Fixed64(23488102) --[[22.4]],
			realTime = Fixed64(305346) --[[0.2912]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(29150412) --[[27.8]],
			realTime = Fixed64(378956) --[[0.3614]],
			filePath = "H_Yoshino/attack_Attack3_1",
			attackGroupTag = ""
		},
		[9] = {
			type = "CameraEffect",
			time = Fixed64(29150412) --[[27.8]],
			realTime = Fixed64(378956) --[[0.3614]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[10] = {
			type = "Attack",
			time = Fixed64(38063308) --[[36.3]],
			realTime = Fixed64(494824) --[[0.4719]],
			filePath = "H_Yoshino/attack_Attack3_1",
			attackGroupTag = ""
		},
		[11] = {
			type = "CameraEffect",
			time = Fixed64(38063308) --[[36.3]],
			realTime = Fixed64(494824) --[[0.4719]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[12] = {
			type = "CameraEffect",
			time = Fixed64(47710208) --[[45.5]],
			realTime = Fixed64(620233) --[[0.5915]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[13] = {
			type = "Attack",
			time = Fixed64(47710208) --[[45.5]],
			realTime = Fixed64(620233) --[[0.5915]],
			filePath = "H_Yoshino/attack_Attack3_1",
			attackGroupTag = ""
		},
		[14] = {
			type = "AttackWindow",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(749732) --[[0.715]],
			toggle = true,
			isClear = false
		},
		[15] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(954205) --[[0.91]],
			toggle = true
		}
	},
	["Attack4"] = {
		[1] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Forward",
			time = Fixed64(6291456) --[[6]],
			realTime = Fixed64(73401) --[[0.07000001]],
			filePath = "H_Yoshino/curve_Attack4"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(183501) --[[0.175]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoAttack4_Battle"
		},
		[4] = {
			type = "AttackFlag",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(354768) --[[0.3383334]],
			flagPosition = FixedVector3(0, 0, 5242880) --[[(0, 0, 5)]],
			flagTime = Fixed64(48234496) --[[46]],
			flagRealTime = Fixed64(562736) --[[0.5366667]],
			flagRange = "Sector",
			flagAngle = Fixed64(377487360) --[[360]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(40894464) --[[39]],
			realTime = Fixed64(477103) --[[0.455]],
			filePath = "Effect/H_Yoshino_01/Yoshino_attack_4_1"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(538269) --[[0.5133334]],
			filePath = "H_Yoshino/attack_Attack4",
			attackGroupTag = ""
		},
		[7] = {
			type = "CameraEffect",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(672836) --[[0.6416667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "CameraEffect",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(672836) --[[0.6416667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(978671) --[[0.9333334]],
			toggle = true,
			isClear = true
		},
		[10] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(978671) --[[0.9333334]],
			toggle = true
		}
	},
	["Skill4"] = {
		[1] = {
			type = "CameraSpecial",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill4_chuxian"
		},
		[4] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoSkill4_Battle"
		},
		[5] = {
			type = "Speedbreaker",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "SceneDark",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[7] = {
			type = "Effect",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(4823450) --[[4.6]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill4_att"
		},
		[8] = {
			type = "CameraEffect",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(4823450) --[[4.6]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "Attack",
			time = Fixed64(63229132) --[[60.3]],
			realTime = Fixed64(4847567) --[[4.623]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(66060288) --[[63]],
			realTime = Fixed64(5064623) --[[4.83]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(68157440) --[[65]],
			realTime = Fixed64(5225404) --[[4.983334]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[12] = {
			type = "Attack",
			time = Fixed64(70254592) --[[67]],
			realTime = Fixed64(5386185) --[[5.136667]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[13] = {
			type = "Attack",
			time = Fixed64(72351744) --[[69]],
			realTime = Fixed64(5546968) --[[5.29]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[14] = {
			type = "Attack",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(5707749) --[[5.443334]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[15] = {
			type = "Attack",
			time = Fixed64(76546048) --[[73]],
			realTime = Fixed64(5868530) --[[5.596667]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[16] = {
			type = "Attack",
			time = Fixed64(78643200) --[[75]],
			realTime = Fixed64(6029312) --[[5.75]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[17] = {
			type = "Attack",
			time = Fixed64(80740352) --[[77]],
			realTime = Fixed64(6190094) --[[5.903334]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[18] = {
			type = "Attack",
			time = Fixed64(82837504) --[[79]],
			realTime = Fixed64(6350875) --[[6.056667]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[19] = {
			type = "Attack",
			time = Fixed64(84934656) --[[81]],
			realTime = Fixed64(6511657) --[[6.21]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[20] = {
			type = "Attack",
			time = Fixed64(87031808) --[[83]],
			realTime = Fixed64(6672439) --[[6.363334]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[21] = {
			type = "Attack",
			time = Fixed64(89128960) --[[85]],
			realTime = Fixed64(6833220) --[[6.516667]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[22] = {
			type = "Attack",
			time = Fixed64(92169832) --[[87.9]],
			realTime = Fixed64(7066354) --[[6.739]],
			filePath = "H_Yoshino/attack_Skill4",
			attackGroupTag = ""
		},
		[23] = {
			type = "Speedbreaker",
			time = Fixed64(92169832) --[[87.9]],
			realTime = Fixed64(7066354) --[[6.739]],
			toggle = false
		},
		[24] = {
			type = "CameraSpecial",
			time = Fixed64(98146712) --[[93.6]],
			realTime = Fixed64(7524582) --[[7.176]],
			toggle = false
		},
		[25] = {
			type = "SceneDark",
			time = Fixed64(98566144) --[[94]],
			realTime = Fixed64(7556738) --[[7.206667]],
			toggle = false
		},
		[26] = {
			type = "Super",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(8039083) --[[7.666667]],
			toggle = false
		}
	},
	["Start"] = {
		[1] = {
			type = "CameraSpecial",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Yoshino_01/Yoshino_01_Start_hand"
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "Showup_Battle"
		},
		[4] = {
			type = "Effect",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(1761608) --[[1.68]],
			filePath = "Effect/H_Yoshino_01/Yoshino_01_Start"
		},
		[5] = {
			type = "CameraSpecial",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(6291456) --[[6]],
			toggle = false
		}
	},
	["Win"] = {
		[1] = {
			type = "CameraSpecial",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		}
	},
	["Rush"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Yoshino/curve_Rush"
		},
		[2] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoRush_Battle"
		},
		[4] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(59419) --[[0.05666667]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(356516) --[[0.34]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(118839) --[[0.1133333]],
			filePath = "Effect/H_Yoshino_01/Yoshino_Rush_01"
		},
		[6] = {
			type = "ModelDisappear",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(118839) --[[0.1133333]],
			toggle = true
		},
		[7] = {
			type = "Effect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(118839) --[[0.1133333]],
			filePath = "Effect/H_Yoshino_01/Yoshino_Rush_Trail"
		},
		[8] = {
			type = "Effect",
			time = Fixed64(68157440) --[[65]],
			realTime = Fixed64(386226) --[[0.3683334]],
			filePath = "Effect/H_Yoshino_01/Yoshino_Rush_02"
		},
		[9] = {
			type = "ModelDisappear",
			time = Fixed64(68157440) --[[65]],
			realTime = Fixed64(386226) --[[0.3683334]],
			toggle = false
		},
		[10] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(475355) --[[0.4533334]],
			toggle = true
		},
		[11] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(475355) --[[0.4533334]],
			toggle = true,
			isClear = true
		},
		[12] = {
			type = "Super",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(534774) --[[0.5100001]],
			toggle = false
		}
	},
	["RushBack"] = {
		[1] = {
			type = "RunWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoRush_Battle"
		},
		[4] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(55924) --[[0.05333333]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(335545) --[[0.32]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(111848) --[[0.1066667]],
			filePath = ""
		},
		[6] = {
			type = "Backward",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(117441) --[[0.112]],
			filePath = "H_Yoshino/curve_RushBack"
		},
		[7] = {
			type = "ModelDisappear",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(117441) --[[0.112]],
			toggle = true
		},
		[8] = {
			type = "Effect",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(117441) --[[0.112]],
			filePath = ""
		},
		[9] = {
			type = "ModelDisappear",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(357914) --[[0.3413334]],
			toggle = false
		},
		[10] = {
			type = "Effect",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(357914) --[[0.3413334]],
			filePath = ""
		},
		[11] = {
			type = "AttackWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(391469) --[[0.3733334]],
			toggle = true,
			isClear = true
		},
		[12] = {
			type = "Super",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(503317) --[[0.48]],
			toggle = false
		}
	},
	["Skill1"] = {
		[1] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
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
			mute = false,
			akEventName = "PYoshinoSkill1_Battle"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(603980) --[[0.576]],
			filePath = "H_Yoshino/attack_Skill1",
			attackGroupTag = ""
		},
		[5] = {
			type = "CameraEffect",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(603980) --[[0.576]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "CameraEffect",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(603980) --[[0.576]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[7] = {
			type = "Attack",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(1207960) --[[1.152]],
			filePath = "H_Yoshino/attack_Skill1_1",
			attackGroupTag = ""
		},
		[8] = {
			type = "CameraEffect",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(1207960) --[[1.152]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "CameraEffect",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(1207960) --[[1.152]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[10] = {
			type = "Trap",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(1321205) --[[1.26]],
			trapPosition = FixedVector3(0, 0, 5242880) --[[(0, 0, 5)]],
			trapDirection = FixedVector3(-1048576, 0, 0) --[[(-1, 0, 0)]],
			trapId = Fixed64(1048576) --[[1]]
		},
		[11] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1509950) --[[1.44]],
			toggle = true
		},
		[12] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1887437) --[[1.8]],
			toggle = false
		}
	},
	["Skill2"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill_2_01"
		},
		[2] = {
			type = "RushWindow",
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
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "PYoshinoSkill2_Battle"
		},
		[5] = {
			type = "Effect",
			time = Fixed64(6291456) --[[6]],
			realTime = Fixed64(209716) --[[0.2]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill_2_02"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(1118481) --[[1.066667]],
			filePath = "H_Yoshino/attack_Skill2",
			attackGroupTag = ""
		},
		[7] = {
			type = "CameraEffect",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(1118481) --[[1.066667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "Effect",
			time = Fixed64(34603008) --[[33]],
			realTime = Fixed64(1153434) --[[1.1]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill_2"
		},
		[9] = {
			type = "CameraEffect",
			time = Fixed64(42991616) --[[41]],
			realTime = Fixed64(1433054) --[[1.366667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[10] = {
			type = "RunWindow",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(1922389) --[[1.833333]],
			toggle = true
		},
		[11] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(3495253) --[[3.333333]],
			toggle = false
		}
	},
	["Skill3"] = {
		[1] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
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
			mute = false,
			akEventName = "PYoshinoSkill3_Battle"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(468364) --[[0.4466667]],
			filePath = "H_Yoshino/attack_Skill3",
			attackGroupTag = ""
		},
		[5] = {
			type = "CameraEffect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(468364) --[[0.4466667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "CameraEffect",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(468364) --[[0.4466667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[7] = {
			type = "Effect",
			time = Fixed64(21181236) --[[20.2]],
			realTime = Fixed64(473048) --[[0.4511333]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill3_shou"
		},
		[8] = {
			type = "Effect",
			time = Fixed64(21181236) --[[20.2]],
			realTime = Fixed64(473048) --[[0.4511333]],
			filePath = "Effect/H_Yoshino_01/Yoshino_skill3_yanwu"
		},
		[9] = {
			type = "Attack",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(585455) --[[0.5583333]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(702546) --[[0.67]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(819637) --[[0.7816667]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[12] = {
			type = "Attack",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(936728) --[[0.8933333]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[13] = {
			type = "Attack",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(1053818) --[[1.005]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[14] = {
			type = "Attack",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1170910) --[[1.116667]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[15] = {
			type = "Attack",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(1288001) --[[1.228333]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[16] = {
			type = "Attack",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(1405092) --[[1.34]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[17] = {
			type = "Attack",
			time = Fixed64(68157440) --[[65]],
			realTime = Fixed64(1522183) --[[1.451667]],
			filePath = "H_Yoshino/attack_Skill3_1",
			attackGroupTag = ""
		},
		[18] = {
			type = "Attack",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(1639274) --[[1.563333]],
			filePath = "H_Yoshino/attack_Skill3_2",
			attackGroupTag = ""
		},
		[19] = {
			type = "CameraEffect",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(1662692) --[[1.585667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[20] = {
			type = "CameraEffect",
			time = Fixed64(75497472) --[[72]],
			realTime = Fixed64(1686111) --[[1.608]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[21] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2341820) --[[2.233333]],
			toggle = false
		}
	},
	["RunFast"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Yoshino_01/Yoshino_01_RunFast"
		}
	},
	["RunLoopStop"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "FlatshoesFootStop_Battle"
		}
	},
	["HitFly"] = {
		[1] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Yoshino/curve_HitFly"
		},
		[3] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1572864) --[[1.5]],
			toggle = false
		}
	},
	["RunLoop"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "FlatshoesFootstep_Battle"
		},
		[2] = {
			type = "Sound",
			time = Fixed64(56518248) --[[53.9]],
			realTime = Fixed64(301430) --[[0.2874667]],
			volume = Fixed64(1048576) --[[1]],
			mute = false,
			akEventName = "FlatshoesFootstep_Battle"
		}
	},
	["Run"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(73401) --[[0.07000001]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "FlatshoesFootstep_Battle"
		}
	},
	["Collect"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "Collect_Battle"
		}
	},
	["Change"] = {
		[1] = {
			type = "SkillWindow",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(268436) --[[0.256]],
			toggle = true
		},
		[2] = {
			type = "AttackWindow",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(268436) --[[0.256]],
			toggle = true,
			isClear = false
		},
		[3] = {
			type = "RunWindow",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(268436) --[[0.256]],
			toggle = true
		},
		[4] = {
			type = "RushWindow",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(268436) --[[0.256]],
			toggle = true
		}
	}
}