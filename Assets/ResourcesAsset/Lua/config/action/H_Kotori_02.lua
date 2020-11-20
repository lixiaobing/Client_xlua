--action event pack
--H_Kotori_02

return
{
	
	["Attack1"] = {
		[1] = {
			type = "UserState",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true,
			content = "KotoriFocus"
		},
		[2] = {
			type = "AttackWindow",
			time = Fixed64(65011712) --[[62]],
			realTime = Fixed64(1603622) --[[1.529333]],
			toggle = true,
			isClear = true
		},
		[3] = {
			type = "UserState",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2586487) --[[2.466667]],
			toggle = false,
			content = "KotoriFocus"
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
			damageRatio = Fixed64(314573) --[[0.3]]
		},
		[4] = {
			type = "Effect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(235930) --[[0.225]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_attact002",
			boneNogType = "None",
			isGlobalSpace = false,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
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
			damageRatio = Fixed64(349176) --[[0.333]]
		},
		[7] = {
			type = "Attack",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(408945) --[[0.39]],
			filePath = "H_Kotori/attack_Attack2",
			damageRatio = Fixed64(384828) --[[0.367]]
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
			damageRatio = Fixed64(314573) --[[0.3]]
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
			filePath = "Effect/H_Kotori_01/H_Kotori_01_attact003_02",
			boneNogType = "None",
			isGlobalSpace = false,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(34603008) --[[33]],
			realTime = Fixed64(692061) --[[0.66]],
			filePath = "H_Kotori/attack_Attack3",
			damageRatio = Fixed64(262144) --[[0.25]]
		},
		[7] = {
			type = "Attack",
			time = Fixed64(36175872) --[[34.5]],
			realTime = Fixed64(723517) --[[0.69]],
			filePath = "H_Kotori/attack_Attack3",
			damageRatio = Fixed64(262144) --[[0.25]]
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
			damageRatio = Fixed64(209716) --[[0.2]]
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
			damageRatio = Fixed64(314573) --[[0.3]]
		},
		[4] = {
			type = "Effect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(325059) --[[0.31]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_attact004",
			boneNogType = "None",
			isGlobalSpace = false,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Attack",
			time = Fixed64(24117248) --[[23]],
			realTime = Fixed64(498423) --[[0.4753334]],
			filePath = "H_Kotori/attack_Attack4",
			damageRatio = Fixed64(349176) --[[0.333]]
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
			damageRatio = Fixed64(384828) --[[0.367]]
		},
		[8] = {
			type = "Effect",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(801811) --[[0.7646667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_attact004_01",
			boneNogType = "None",
			isGlobalSpace = true,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
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
			damageRatio = Fixed64(314573) --[[0.3]]
		},
		[4] = {
			type = "Effect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(419431) --[[0.4]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill001",
			boneNogType = "None",
			isGlobalSpace = true,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "Effect",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(1118481) --[[1.066667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill001_01",
			boneNogType = "None",
			isGlobalSpace = false,
			isClear = true,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[6] = {
			type = "Attack",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(1230329) --[[1.173333]],
			filePath = "H_Kotori/attack_Skill1",
			damageRatio = Fixed64(314573) --[[0.3]]
		},
		[7] = {
			type = "Effect",
			time = Fixed64(48234496) --[[46]],
			realTime = Fixed64(1286253) --[[1.226667]],
			filePath = "Effect/H_Kotori_01/H_Kotori_01_skill001_chixu",
			boneNogType = "None",
			isGlobalSpace = true,
			isClear = false,
			isCustomLifeTime = false,
			customLifeTime = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(56623104) --[[54]],
			realTime = Fixed64(1509950) --[[1.44]],
			filePath = "H_Kotori/attack_Skill1",
			damageRatio = Fixed64(419431) --[[0.4]]
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
			type = "Attack",
			time = Fixed64(16252928) --[[15.5]],
			realTime = Fixed64(503841) --[[0.4805]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(52429) --[[0.05]]
		},
		[3] = {
			type = "Attack",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(650118) --[[0.62]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(52429) --[[0.05]]
		},
		[4] = {
			type = "Attack",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(812647) --[[0.775]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(52429) --[[0.05]]
		},
		[5] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(975176) --[[0.9300001]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(52429) --[[0.05]]
		},
		[6] = {
			type = "Forward",
			time = Fixed64(39636172) --[[37.8]],
			realTime = Fixed64(1228722) --[[1.1718]],
			filePath = "H_Kotori/curve_Skill3_1"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(44040192) --[[42]],
			realTime = Fixed64(1365246) --[[1.302]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(209716) --[[0.2]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(1462764) --[[1.395]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(209716) --[[0.2]]
		},
		[9] = {
			type = "Attack",
			time = Fixed64(50331648) --[[48]],
			realTime = Fixed64(1560282) --[[1.488]],
			filePath = "H_Kotori/attack_Skill3",
			damageRatio = Fixed64(419431) --[[0.4]]
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
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(76896) --[[0.07333334]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(461373) --[[0.44]]
		},
		[3] = {
			type = "Forward",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(169170) --[[0.1613333]],
			filePath = "H_Kotori/curve_Rush"
		},
		[4] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(538269) --[[0.5133333]],
			toggle = true
		},
		[5] = {
			type = "Super",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(768956) --[[0.7333333]],
			toggle = false
		}
	},
	["RushBack"] = {
		[1] = {
			type = "AttackWindow",
			time = Fixed64(2936012) --[[2.8]],
			realTime = Fixed64(17617) --[[0.0168]],
			toggle = true,
			isClear = false
		},
		[2] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(62915) --[[0.06]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(377488) --[[0.36]]
		},
		[3] = {
			type = "Backward",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(106955) --[[0.102]],
			filePath = "H_Kotori/curve_RushBack"
		},
		[4] = {
			type = "RunWindow",
			time = Fixed64(78643200) --[[75]],
			realTime = Fixed64(471860) --[[0.45]],
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
	}
}