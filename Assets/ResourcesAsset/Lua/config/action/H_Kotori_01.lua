--action event pack
--H_Kotori_01

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
			type = "Effect",
			time = Fixed64(16777216) --[[16]],
			realTime = Fixed64(223696) --[[0.2133333]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_Attack1"
		},
		[3] = {
			type = "Forward",
			time = Fixed64(16986932) --[[16.2]],
			realTime = Fixed64(226493) --[[0.216]],
			filePath = "H_Kotori/curve_Attack1"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(265639) --[[0.2533333]],
			filePath = "H_Kotori/attack_Attack1",
			attackGroupTag = ""
		},
		[5] = {
			type = "CameraEffect",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(265639) --[[0.2533333]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(307582) --[[0.2933334]],
			filePath = "H_Kotori/attack_Attack1",
			attackGroupTag = ""
		},
		[7] = {
			type = "Attack",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(349525) --[[0.3333333]],
			filePath = "H_Kotori/attack_Attack1",
			attackGroupTag = ""
		},
		[8] = {
			type = "AttackWindow",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(391469) --[[0.3733333]],
			toggle = true,
			isClear = false
		},
		[9] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(978671) --[[0.9333333]],
			toggle = true
		}
	},
	["Attack2"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Kotori/curve_Attack2"
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Attack",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(235930) --[[0.225]],
			filePath = "H_Kotori/attack_Attack2",
			attackGroupTag = ""
		},
		[4] = {
			type = "Effect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(235930) --[[0.225]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_Attack2"
		},
		[5] = {
			type = "CameraEffect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(235930) --[[0.225]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(346031) --[[0.33]],
			filePath = "H_Kotori/attack_Attack2",
			attackGroupTag = ""
		},
		[7] = {
			type = "Attack",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(408945) --[[0.39]],
			filePath = "H_Kotori/attack_Attack2",
			attackGroupTag = ""
		},
		[8] = {
			type = "AttackWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(471860) --[[0.45]],
			toggle = true,
			isClear = false
		},
		[9] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(1101005) --[[1.05]],
			toggle = true
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
			type = "Forward",
			time = Fixed64(15518925) --[[14.8]],
			realTime = Fixed64(310379) --[[0.296]],
			filePath = "H_Kotori/curve_Attack3"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(398458) --[[0.38]],
			filePath = "H_Kotori/attack_Attack3",
			attackGroupTag = ""
		},
		[4] = {
			type = "CameraEffect",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(398458) --[[0.38]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(398458) --[[0.38]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_Attack3"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(34603008) --[[33]],
			realTime = Fixed64(692061) --[[0.66]],
			filePath = "H_Kotori/attack_Attack3",
			attackGroupTag = ""
		},
		[7] = {
			type = "Attack",
			time = Fixed64(36175872) --[[34.5]],
			realTime = Fixed64(723517) --[[0.69]],
			filePath = "H_Kotori/attack_Attack3",
			attackGroupTag = ""
		},
		[8] = {
			type = "CameraEffect",
			time = Fixed64(36175872) --[[34.5]],
			realTime = Fixed64(723517) --[[0.69]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "Attack",
			time = Fixed64(38273024) --[[36.5]],
			realTime = Fixed64(765461) --[[0.73]],
			filePath = "H_Kotori/attack_Attack3",
			attackGroupTag = ""
		},
		[10] = {
			type = "AttackWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1048576) --[[1]],
			toggle = true,
			isClear = false
		},
		[11] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(1468006) --[[1.4]],
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
			time = Fixed64(7130317) --[[6.8]],
			realTime = Fixed64(147360) --[[0.1405333]],
			filePath = "H_Kotori/curve_Attack4"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(325059) --[[0.31]],
			filePath = "H_Kotori/attack_Attack4",
			attackGroupTag = ""
		},
		[4] = {
			type = "Effect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(325059) --[[0.31]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_Attack4"
		},
		[5] = {
			type = "Attack",
			time = Fixed64(24117248) --[[23]],
			realTime = Fixed64(498423) --[[0.4753334]],
			filePath = "H_Kotori/attack_Attack4",
			attackGroupTag = ""
		},
		[6] = {
			type = "CameraEffect",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(801811) --[[0.7646667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[7] = {
			type = "Attack",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(801811) --[[0.7646667]],
			filePath = "H_Kotori/attack_Attack4_1",
			attackGroupTag = ""
		},
		[8] = {
			type = "Effect",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(801811) --[[0.7646667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_Attack4_1"
		},
		[9] = {
			type = "RunWindow",
			time = Fixed64(60817408) --[[58]],
			realTime = Fixed64(1256893) --[[1.198667]],
			toggle = true
		}
	},
	["Skill1"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Kotori/curve_Skill1"
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Attack",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(419431) --[[0.4]],
			filePath = "H_Kotori/attack_Skill1",
			attackGroupTag = ""
		},
		[4] = {
			type = "Effect",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(475355) --[[0.4533333]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill1_1"
		},
		[5] = {
			type = "Effect",
			time = Fixed64(45088768) --[[43]],
			realTime = Fixed64(1202367) --[[1.146667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill1_2"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(1230329) --[[1.173333]],
			filePath = "H_Kotori/attack_Skill1",
			attackGroupTag = ""
		},
		[7] = {
			type = "Attack",
			time = Fixed64(56623104) --[[54]],
			realTime = Fixed64(1509950) --[[1.44]],
			filePath = "H_Kotori/attack_Skill1",
			attackGroupTag = ""
		},
		[8] = {
			type = "Effect",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(1537911) --[[1.466667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill1_3"
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
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill3_1"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(8912896) --[[8.5]],
			realTime = Fixed64(276300) --[[0.2635]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill3_1"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(16252928) --[[15.5]],
			realTime = Fixed64(503841) --[[0.4805]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		},
		[5] = {
			type = "Attack",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(650118) --[[0.62]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		},
		[6] = {
			type = "Attack",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(812647) --[[0.775]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		},
		[7] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(975176) --[[0.9300001]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		},
		[8] = {
			type = "Effect",
			time = Fixed64(34603008) --[[33]],
			realTime = Fixed64(1072694) --[[1.023]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill3_2"
		},
		[9] = {
			type = "Forward",
			time = Fixed64(39636172) --[[37.8]],
			realTime = Fixed64(1228722) --[[1.1718]],
			filePath = "H_Kotori/curve_Skill3_1"
		},
		[10] = {
			type = "Attack",
			time = Fixed64(44040192) --[[42]],
			realTime = Fixed64(1365246) --[[1.302]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(1462764) --[[1.395]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		},
		[12] = {
			type = "Attack",
			time = Fixed64(50331648) --[[48]],
			realTime = Fixed64(1560282) --[[1.488]],
			filePath = "H_Kotori/attack_Skill3",
			attackGroupTag = ""
		}
	},
	["Rush"] = {
		[1] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "ModelDisappear",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "CameraEffect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			cameraEffectId = Fixed64(1155530752) --[[1102]]
		},
		[4] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(76896) --[[0.07333334]],
			toggle = true,
			spaceTime = Fixed64(20971520) --[[20]],
			spaceRealTime = Fixed64(153791) --[[0.1466667]]
		},
		[5] = {
			type = "Forward",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(169170) --[[0.1613333]],
			filePath = "H_Kotori/curve_Rush"
		},
		[6] = {
			type = "ModelDisappear",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(192239) --[[0.1833333]],
			toggle = false
		},
		[7] = {
			type = "Super",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(384478) --[[0.3666667]],
			toggle = false
		},
		[8] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(538269) --[[0.5133333]],
			toggle = true
		},
		[9] = {
			type = "RushWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(538269) --[[0.5133333]],
			toggle = true
		}
	},
	["RushBack"] = {
		[1] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = false
		},
		[2] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_rush"
		},
		[3] = {
			type = "CameraEffect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			cameraEffectId = Fixed64(1155530752) --[[1102]]
		},
		[4] = {
			type = "ModelDisappear",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(2936012) --[[2.8]],
			realTime = Fixed64(19573) --[[0.01866667]],
			toggle = true,
			isClear = false
		},
		[6] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(69905) --[[0.06666667]],
			toggle = true,
			spaceTime = Fixed64(20971520) --[[20]],
			spaceRealTime = Fixed64(139810) --[[0.1333333]]
		},
		[7] = {
			type = "Backward",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(118839) --[[0.1133333]],
			filePath = "H_Kotori/curve_RushBack"
		},
		[8] = {
			type = "ModelDisappear",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(174762) --[[0.1666667]],
			toggle = false
		},
		[9] = {
			type = "Super",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(349525) --[[0.3333333]],
			toggle = false
		},
		[10] = {
			type = "RushWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(489335) --[[0.4666667]],
			toggle = true
		},
		[11] = {
			type = "RunWindow",
			time = Fixed64(78643200) --[[75]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
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
			type = "CameraSpecial",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(4089447) --[[3.9]],
			toggle = false
		}
	},
	["Run"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Kotori/Run"
		}
	},
	["AttackS"] = {
		[1] = {
			type = "UserState",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true,
			content = "KotoriFocus",
			isClear = true
		},
		[2] = {
			type = "CameraEffect",
			time = Fixed64(16777216) --[[16]],
			realTime = Fixed64(234882) --[[0.224]],
			cameraEffectId = Fixed64(1049624576) --[[1001]]
		},
		[3] = {
			type = "Attack",
			time = Fixed64(16777216) --[[16]],
			realTime = Fixed64(234882) --[[0.224]],
			filePath = "H_Kotori/AttackS",
			attackGroupTag = ""
		},
		[4] = {
			type = "Effect",
			time = Fixed64(16777216) --[[16]],
			realTime = Fixed64(234882) --[[0.224]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_AttackS"
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(58720256) --[[56]],
			realTime = Fixed64(822084) --[[0.784]],
			toggle = true,
			isClear = false
		},
		[6] = {
			type = "UserState",
			time = Fixed64(102760448) --[[98]],
			realTime = Fixed64(1438647) --[[1.372]],
			toggle = false,
			content = "KotoriFocus",
			isClear = false
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
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill4_1"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(27996980) --[[26.7]],
			realTime = Fixed64(2053112) --[[1.958]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill4_2"
		},
		[4] = {
			type = "Effect",
			time = Fixed64(39845888) --[[38]],
			realTime = Fixed64(2922032) --[[2.786667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill4_3"
		},
		[5] = {
			type = "Effect",
			time = Fixed64(80740352) --[[77]],
			realTime = Fixed64(5920960) --[[5.646667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill4_4"
		},
		[6] = {
			type = "CameraSpecial",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(6920602) --[[6.6]],
			toggle = false
		}
	},
	["Skill2"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(349525) --[[0.3333333]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill2_1"
		},
		[2] = {
			type = "Effect",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(734004) --[[0.7]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill2_2"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(1048576) --[[1]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill2_3"
		},
		[4] = {
			type = "Effect",
			time = Fixed64(58720256) --[[56]],
			realTime = Fixed64(1957342) --[[1.866667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill2_4"
		}
	},
	["Win"] = {
		[1] = {
			type = "CameraSpecial",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "CameraSpecial",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(3145728) --[[3]],
			toggle = false
		}
	},
	["Change"] = {
		[1] = {
			type = "SkillWindow",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(134218) --[[0.128]],
			toggle = true
		},
		[2] = {
			type = "AttackWindow",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(134218) --[[0.128]],
			toggle = true,
			isClear = false
		},
		[3] = {
			type = "RunWindow",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(134218) --[[0.128]],
			toggle = true
		},
		[4] = {
			type = "RushWindow",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(134218) --[[0.128]],
			toggle = true
		}
	}
}