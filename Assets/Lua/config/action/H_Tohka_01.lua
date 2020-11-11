--action event pack
--H_Tohka_01

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
			type = "SkillWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[5] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tohka/NewEffectSet"
		},
		[7] = {
			type = "Forward",
			time = Fixed64(10171187) --[[9.7]],
			realTime = Fixed64(169520) --[[0.1616667]],
			filePath = "H_Tohka/curve_Attack_1"
		},
		[8] = {
			type = "Effect",
			time = Fixed64(16252928) --[[15.5]],
			realTime = Fixed64(270882) --[[0.2583334]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_001"
		},
		[9] = {
			type = "Attack",
			time = Fixed64(17301504) --[[16.5]],
			realTime = Fixed64(288359) --[[0.275]],
			filePath = "H_Tohka/Tohka_Attack_1",
			attackGroupTag = ""
		},
		[10] = {
			type = "AttackFlag",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(349525) --[[0.3333333]],
			flagPosition = FixedVector3(0, 1048576, 0) --[[(0, 1, 0)]],
			flagTime = Fixed64(31457280) --[[30]],
			flagRealTime = Fixed64(524288) --[[0.5]],
			flagRange = "Sector",
			flagAngle = Fixed64(377487360) --[[360]],
			flagRadius = Fixed64(2621440) --[[2.5]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(2621440) --[[2.5]]
		},
		[11] = {
			type = "BehaviorTag",
			time = Fixed64(23907532) --[[22.8]],
			realTime = Fixed64(398458) --[[0.38]],
			content = "ST_Idle"
		},
		[12] = {
			type = "AttackWindow",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(454383) --[[0.4333334]],
			toggle = true,
			isClear = false
		},
		[13] = {
			type = "RunWindow",
			time = Fixed64(40475032) --[[38.6]],
			realTime = Fixed64(674584) --[[0.6433333]],
			toggle = true
		},
		[14] = {
			type = "AttackWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(1048576) --[[1]],
			toggle = true,
			isClear = true
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
			type = "SkillWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[5] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "Forward",
			time = Fixed64(6081741) --[[5.8]],
			realTime = Fixed64(101362) --[[0.09666667]],
			filePath = "H_Tohka/curve_Attack_2"
		},
		[7] = {
			type = "Effect",
			time = Fixed64(12058624) --[[11.5]],
			realTime = Fixed64(200977) --[[0.1916667]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_002"
		},
		[8] = {
			type = "Attack",
			time = Fixed64(14365491) --[[13.7]],
			realTime = Fixed64(239425) --[[0.2283333]],
			filePath = "H_Tohka/Tohka_Attack_2",
			attackGroupTag = ""
		},
		[9] = {
			type = "AttackFlag",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(314573) --[[0.3]],
			flagPosition = FixedVector3(0, 1048576, 0) --[[(0, 1, 0)]],
			flagTime = Fixed64(31457280) --[[30]],
			flagRealTime = Fixed64(524288) --[[0.5]],
			flagRange = "Sector",
			flagAngle = Fixed64(377487360) --[[360]],
			flagRadius = Fixed64(2621440) --[[2.5]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(0) --[[0]]
		},
		[10] = {
			type = "BehaviorTag",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(349525) --[[0.3333333]],
			content = "ST_Idle"
		},
		[11] = {
			type = "AttackWindow",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(419431) --[[0.4]],
			toggle = true,
			isClear = false
		},
		[12] = {
			type = "RunWindow",
			time = Fixed64(37748736) --[[36]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		},
		[13] = {
			type = "AttackWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(1048576) --[[1]],
			toggle = true,
			isClear = true
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
			type = "SkillWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[5] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "Forward",
			time = Fixed64(12268339) --[[11.7]],
			realTime = Fixed64(204473) --[[0.195]],
			filePath = "H_Tohka/curve_Attack_4"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(20866662) --[[19.9]],
			realTime = Fixed64(347778) --[[0.3316667]],
			filePath = "H_Tohka/Tohka_Attack_4",
			attackGroupTag = ""
		},
		[8] = {
			type = "Effect",
			time = Fixed64(20866662) --[[19.9]],
			realTime = Fixed64(347778) --[[0.3316667]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_004"
		},
		[9] = {
			type = "Effect",
			time = Fixed64(20866662) --[[19.9]],
			realTime = Fixed64(347778) --[[0.3316667]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_004_1"
		},
		[10] = {
			type = "AttackFlag",
			time = Fixed64(24117248) --[[23]],
			realTime = Fixed64(401954) --[[0.3833334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(31457280) --[[30]],
			flagRealTime = Fixed64(524288) --[[0.5]],
			flagRange = "Sector",
			flagAngle = Fixed64(283115520) --[[270]],
			flagRadius = Fixed64(2621440) --[[2.5]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(2097152) --[[2]]
		},
		[11] = {
			type = "Effect",
			time = Fixed64(41628468) --[[39.7]],
			realTime = Fixed64(693808) --[[0.6616667]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_004_01"
		},
		[12] = {
			type = "Attack",
			time = Fixed64(42467328) --[[40.5]],
			realTime = Fixed64(707789) --[[0.675]],
			filePath = "H_Tohka/Tohka_Attack_4_1",
			attackGroupTag = ""
		},
		[13] = {
			type = "BehaviorTag",
			time = Fixed64(50331648) --[[48]],
			realTime = Fixed64(838861) --[[0.8]],
			content = "ST_Idle"
		},
		[14] = {
			type = "AttackFlag",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(873813) --[[0.8333334]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(57671680) --[[55]],
			flagRealTime = Fixed64(961194) --[[0.9166667]],
			flagRange = "Sector",
			flagAngle = Fixed64(283115520) --[[270]],
			flagRadius = Fixed64(2621440) --[[2.5]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(0) --[[0]]
		},
		[15] = {
			type = "AttackWindow",
			time = Fixed64(54525952) --[[52]],
			realTime = Fixed64(908766) --[[0.8666667]],
			toggle = true,
			isClear = false
		},
		[16] = {
			type = "CameraEffect",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(961194) --[[0.9166667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[17] = {
			type = "CameraEffect",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(961194) --[[0.9166667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[18] = {
			type = "RunWindow",
			time = Fixed64(68157440) --[[65]],
			realTime = Fixed64(1135957) --[[1.083333]],
			toggle = true
		},
		[19] = {
			type = "AttackWindow",
			time = Fixed64(79691776) --[[76]],
			realTime = Fixed64(1328196) --[[1.266667]],
			toggle = true,
			isClear = true
		}
	},
	["Attack5"] = {
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
			filePath = "Effect/H_Tohka_01/Tohka_attact_005_wuqi"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_005_juqi"
		},
		[4] = {
			type = "CameraEffect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[5] = {
			type = "SkillWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[7] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[8] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[9] = {
			type = "AttackFlag",
			time = Fixed64(13631488) --[[13]],
			realTime = Fixed64(249911) --[[0.2383333]],
			flagPosition = FixedVector3(0, 0, -1048576) --[[(0, 0, -1)]],
			flagTime = Fixed64(36700160) --[[35]],
			flagRealTime = Fixed64(672836) --[[0.6416667]],
			flagRange = "Rectangle",
			flagAngle = Fixed64(283115520) --[[270]],
			flagRadius = Fixed64(2621440) --[[2.5]],
			flagWide = Fixed64(4194304) --[[4]],
			flagLong = Fixed64(4194304) --[[4]]
		},
		[10] = {
			type = "Effect",
			time = Fixed64(20447232) --[[19.5]],
			realTime = Fixed64(374866) --[[0.3575]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_005"
		},
		[11] = {
			type = "Forward",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(403702) --[[0.385]],
			filePath = "H_Tohka/curve_Attack_5"
		},
		[12] = {
			type = "Attack",
			time = Fixed64(23907532) --[[22.8]],
			realTime = Fixed64(438304) --[[0.418]],
			filePath = "H_Tohka/Tohka_Attack_5",
			attackGroupTag = ""
		},
		[13] = {
			type = "CameraEffect",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(480597) --[[0.4583333]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[14] = {
			type = "BehaviorTag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(576717) --[[0.55]],
			content = "ST_Idle"
		},
		[15] = {
			type = "CameraEffect",
			time = Fixed64(34498152) --[[32.9]],
			realTime = Fixed64(632466) --[[0.6031667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[16] = {
			type = "AttackWindow",
			time = Fixed64(36280728) --[[34.6]],
			realTime = Fixed64(665147) --[[0.6343333]],
			toggle = true,
			isClear = true
		},
		[17] = {
			type = "RunWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(865076) --[[0.825]],
			toggle = true
		}
	},
	["IdleRelax"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["RunLoop"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Sound",
			time = Fixed64(16357786) --[[15.6]],
			realTime = Fixed64(87242) --[[0.08320002]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = ""
		},
		[3] = {
			type = "Sound",
			time = Fixed64(68786584) --[[65.6]],
			realTime = Fixed64(366862) --[[0.3498667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = ""
		}
	},
	["Rush"] = {
		[1] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Invincible"
		},
		[3] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(62915) --[[0.06]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(377488) --[[0.36]]
		},
		[4] = {
			type = "Forward",
			time = Fixed64(12582912) --[[12]],
			realTime = Fixed64(75498) --[[0.072]],
			filePath = "H_Tohka/curve_Rush"
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		},
		[9] = {
			type = "BehaviorTag",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			content = "ST_Idle"
		},
		[10] = {
			type = "ChangeWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		}
	},
	["RushBack"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/curve_RushBack"
		},
		[2] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Invincible"
		},
		[4] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(62915) --[[0.06]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(377488) --[[0.36]]
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
		},
		[9] = {
			type = "BehaviorTag",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			content = "ST_Idle"
		},
		[10] = {
			type = "ChangeWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(419641) --[[0.4002]],
			toggle = true
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
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "Attack",
			time = Fixed64(6081741) --[[5.8]],
			realTime = Fixed64(111499) --[[0.1063333]],
			filePath = "H_Tohka/Tohka_Skill_1",
			attackGroupTag = ""
		},
		[6] = {
			type = "Effect",
			time = Fixed64(6081741) --[[5.8]],
			realTime = Fixed64(111499) --[[0.1063333]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_1_1"
		},
		[7] = {
			type = "Forward",
			time = Fixed64(11429478) --[[10.9]],
			realTime = Fixed64(209541) --[[0.1998333]],
			filePath = "H_Tohka/curve_Skill_1"
		},
		[8] = {
			type = "Attack",
			time = Fixed64(25899828) --[[24.7]],
			realTime = Fixed64(474830) --[[0.4528334]],
			filePath = "H_Tohka/Tohka_Skill_1_1",
			attackGroupTag = ""
		},
		[9] = {
			type = "Effect",
			time = Fixed64(25899828) --[[24.7]],
			realTime = Fixed64(474830) --[[0.4528334]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_1_2"
		},
		[10] = {
			type = "Effect",
			time = Fixed64(25899828) --[[24.7]],
			realTime = Fixed64(474830) --[[0.4528334]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_1_2_1"
		},
		[11] = {
			type = "BehaviorTag",
			time = Fixed64(38273024) --[[36.5]],
			realTime = Fixed64(701672) --[[0.6691667]],
			content = "ST_Idle"
		},
		[12] = {
			type = "AttackWindow",
			time = Fixed64(40055604) --[[38.2]],
			realTime = Fixed64(734353) --[[0.7003334]],
			toggle = true,
			isClear = true
		},
		[13] = {
			type = "SkillWindow",
			time = Fixed64(40055604) --[[38.2]],
			realTime = Fixed64(734353) --[[0.7003334]],
			toggle = true
		},
		[14] = {
			type = "RunWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(961194) --[[0.9166667]],
			toggle = true
		}
	},
	["Skill3"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_3_SCE_1"
		},
		[2] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_3_2"
		},
		[3] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_SuperArmor"
		},
		[6] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[7] = {
			type = "Attack",
			time = Fixed64(27577548) --[[26.3]],
			realTime = Fixed64(735401) --[[0.7013333]],
			filePath = "H_Tohka/Tohka_Skill_3",
			attackGroupTag = ""
		},
		[8] = {
			type = "Effect",
			time = Fixed64(27577548) --[[26.3]],
			realTime = Fixed64(735401) --[[0.7013333]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_3"
		},
		[9] = {
			type = "Effect",
			time = Fixed64(27577548) --[[26.3]],
			realTime = Fixed64(735401) --[[0.7013333]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_3_1"
		},
		[10] = {
			type = "AttackFlag",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(810899) --[[0.7733334]],
			flagPosition = FixedVector3(0, 0, 6606029) --[[(0, 0, 6.3)]],
			flagTime = Fixed64(96468992) --[[92]],
			flagRealTime = Fixed64(2572507) --[[2.453333]],
			flagRange = "Sector",
			flagAngle = Fixed64(377487360) --[[360]],
			flagRadius = Fixed64(6291456) --[[6]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(0) --[[0]]
		},
		[11] = {
			type = "Forward",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(838861) --[[0.8]],
			filePath = "H_Tohka/curve_Skill_3"
		},
		[12] = {
			type = "BehaviorTag",
			time = Fixed64(31981568) --[[30.5]],
			realTime = Fixed64(852842) --[[0.8133333]],
			content = "ST_Idle"
		},
		[13] = {
			type = "AttackWindow",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(866823) --[[0.8266667]],
			toggle = true,
			isClear = true
		},
		[14] = {
			type = "SkillWindow",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(866823) --[[0.8266667]],
			toggle = true
		},
		[15] = {
			type = "RunWindow",
			time = Fixed64(39321600) --[[37.5]],
			realTime = Fixed64(1048576) --[[1]],
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
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_4_SCE"
		},
		[3] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill_4_SCE_1"
		},
		[5] = {
			type = "SceneDark",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[7] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Invincible"
		},
		[8] = {
			type = "Attack",
			time = Fixed64(11534336) --[[11]],
			realTime = Fixed64(615164) --[[0.5866667]],
			filePath = "H_Tohka/Tohka_Skill_4",
			attackGroupTag = ""
		},
		[9] = {
			type = "Attack",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(838861) --[[0.8]],
			filePath = "H_Tohka/Tohka_Skill_4_1",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(1342178) --[[1.28]],
			filePath = "H_Tohka/Tohka_Skill_4_2",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(29360128) --[[28]],
			realTime = Fixed64(1565874) --[[1.493333]],
			filePath = "H_Tohka/Tohka_Skill_4_3",
			attackGroupTag = ""
		},
		[12] = {
			type = "Attack",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(1677722) --[[1.6]],
			filePath = "H_Tohka/Tohka_Skill_4_4",
			attackGroupTag = ""
		},
		[13] = {
			type = "Attack",
			time = Fixed64(34078720) --[[32.5]],
			realTime = Fixed64(1817532) --[[1.733333]],
			filePath = "H_Tohka/Tohka_Skill_4_5",
			attackGroupTag = ""
		},
		[14] = {
			type = "Attack",
			time = Fixed64(36175872) --[[34.5]],
			realTime = Fixed64(1929380) --[[1.84]],
			filePath = "H_Tohka/Tohka_Skill_4_6",
			attackGroupTag = ""
		},
		[15] = {
			type = "Attack",
			time = Fixed64(37748736) --[[36]],
			realTime = Fixed64(2013266) --[[1.92]],
			filePath = "H_Tohka/Tohka_Skill_4_7",
			attackGroupTag = ""
		},
		[16] = {
			type = "Attack",
			time = Fixed64(39845888) --[[38]],
			realTime = Fixed64(2125114) --[[2.026667]],
			filePath = "H_Tohka/Tohka_Skill_4_8",
			attackGroupTag = ""
		},
		[17] = {
			type = "Attack",
			time = Fixed64(41418752) --[[39.5]],
			realTime = Fixed64(2209000) --[[2.106667]],
			filePath = "H_Tohka/Tohka_Skill_4_9",
			attackGroupTag = ""
		},
		[18] = {
			type = "Attack",
			time = Fixed64(42152756) --[[40.2]],
			realTime = Fixed64(2248147) --[[2.144]],
			filePath = "H_Tohka/Tohka_Skill_4_10",
			attackGroupTag = ""
		},
		[19] = {
			type = "Attack",
			time = Fixed64(44040192) --[[42]],
			realTime = Fixed64(2348811) --[[2.24]],
			filePath = "H_Tohka/Tohka_Skill_4_11",
			attackGroupTag = ""
		},
		[20] = {
			type = "Attack",
			time = Fixed64(55259956) --[[52.7]],
			realTime = Fixed64(2947197) --[[2.810667]],
			filePath = "H_Tohka/Tohka_Skill_4_12",
			attackGroupTag = ""
		},
		[21] = {
			type = "Attack",
			time = Fixed64(58929972) --[[56.2]],
			realTime = Fixed64(3142932) --[[2.997334]],
			filePath = "H_Tohka/Tohka_Skill_4_13",
			attackGroupTag = ""
		},
		[22] = {
			type = "Attack",
			time = Fixed64(62704844) --[[59.8]],
			realTime = Fixed64(3344259) --[[3.189333]],
			filePath = "H_Tohka/Tohka_Skill_4_14",
			attackGroupTag = ""
		},
		[23] = {
			type = "Attack",
			time = Fixed64(66479720) --[[63.4]],
			realTime = Fixed64(3545585) --[[3.381334]],
			filePath = "H_Tohka/Tohka_Skill_4_15",
			attackGroupTag = ""
		},
		[24] = {
			type = "Attack",
			time = Fixed64(70254592) --[[67]],
			realTime = Fixed64(3746912) --[[3.573334]],
			filePath = "H_Tohka/Tohka_Skill_4_16",
			attackGroupTag = ""
		},
		[25] = {
			type = "Attack",
			time = Fixed64(72876032) --[[69.5]],
			realTime = Fixed64(3886722) --[[3.706667]],
			filePath = "H_Tohka/Tohka_Skill_4_17",
			attackGroupTag = ""
		},
		[26] = {
			type = "CameraEffect",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(3970608) --[[3.786667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[27] = {
			type = "Attack",
			time = Fixed64(74658608) --[[71.2]],
			realTime = Fixed64(3981793) --[[3.797333]],
			filePath = "H_Tohka/Tohka_Skill_4_18",
			attackGroupTag = ""
		},
		[28] = {
			type = "Attack",
			time = Fixed64(76755760) --[[73.2]],
			realTime = Fixed64(4093641) --[[3.904]],
			filePath = "H_Tohka/Tohka_Skill_4_19",
			attackGroupTag = ""
		},
		[29] = {
			type = "Attack",
			time = Fixed64(78748056) --[[75.1]],
			realTime = Fixed64(4199897) --[[4.005333]],
			filePath = "H_Tohka/Tohka_Skill_4_20",
			attackGroupTag = ""
		},
		[30] = {
			type = "Attack",
			time = Fixed64(80740352) --[[77]],
			realTime = Fixed64(4306152) --[[4.106667]],
			filePath = "H_Tohka/Tohka_Skill_4_21",
			attackGroupTag = ""
		},
		[31] = {
			type = "Attack",
			time = Fixed64(82837504) --[[79]],
			realTime = Fixed64(4418000) --[[4.213334]],
			filePath = "H_Tohka/Tohka_Skill_4_22",
			attackGroupTag = ""
		},
		[32] = {
			type = "Attack",
			time = Fixed64(84829800) --[[80.9]],
			realTime = Fixed64(4524256) --[[4.314667]],
			filePath = "H_Tohka/Tohka_Skill_4_23",
			attackGroupTag = ""
		},
		[33] = {
			type = "Attack",
			time = Fixed64(86926952) --[[82.9]],
			realTime = Fixed64(4636104) --[[4.421333]],
			filePath = "H_Tohka/Tohka_Skill_4_24",
			attackGroupTag = ""
		},
		[34] = {
			type = "Attack",
			time = Fixed64(88919248) --[[84.8]],
			realTime = Fixed64(4742360) --[[4.522667]],
			filePath = "H_Tohka/Tohka_Skill_4_25",
			attackGroupTag = ""
		},
		[35] = {
			type = "CameraSpecial",
			time = Fixed64(102760448) --[[98]],
			realTime = Fixed64(5480557) --[[5.226667]],
			toggle = false
		},
		[36] = {
			type = "SceneDark",
			time = Fixed64(102760448) --[[98]],
			realTime = Fixed64(5480557) --[[5.226667]],
			toggle = false
		},
		[37] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(5592405) --[[5.333333]],
			toggle = false
		},
		[38] = {
			type = "Super",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(5592405) --[[5.333333]],
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
			filePath = "Effect/H_Tohka_01/Tohka_Start"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Start"
		},
		[4] = {
			type = "CameraSpecial",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(4089447) --[[3.9]],
			toggle = false
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
			type = "SkillWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[5] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[6] = {
			type = "Effect",
			time = Fixed64(11848909) --[[11.3]],
			realTime = Fixed64(177734) --[[0.1695]],
			filePath = "Effect/H_Tohka_01/Tohka_attact_003_chuanci"
		},
		[7] = {
			type = "Forward",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(267387) --[[0.255]],
			filePath = "H_Tohka/curve_Attack_3"
		},
		[8] = {
			type = "AttackFlag",
			time = Fixed64(17825792) --[[17]],
			realTime = Fixed64(267387) --[[0.255]],
			flagPosition = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
			flagTime = Fixed64(31457280) --[[30]],
			flagRealTime = Fixed64(471860) --[[0.45]],
			flagRange = "Sector",
			flagAngle = Fixed64(94371840) --[[90]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagWide = Fixed64(0) --[[0]],
			flagLong = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "Attack",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(298845) --[[0.285]],
			filePath = "H_Tohka/Tohka_Attack_3",
			attackGroupTag = ""
		},
		[10] = {
			type = "CameraEffect",
			time = Fixed64(24117248) --[[23]],
			realTime = Fixed64(361759) --[[0.345]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[11] = {
			type = "CameraEffect",
			time = Fixed64(24117248) --[[23]],
			realTime = Fixed64(361759) --[[0.345]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[12] = {
			type = "BehaviorTag",
			time = Fixed64(24641536) --[[23.5]],
			realTime = Fixed64(369624) --[[0.3525]],
			content = "ST_Idle"
		},
		[13] = {
			type = "AttackWindow",
			time = Fixed64(27996980) --[[26.7]],
			realTime = Fixed64(419955) --[[0.4005]],
			toggle = true,
			isClear = false
		},
		[14] = {
			type = "RunWindow",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		},
		[15] = {
			type = "AttackWindow",
			time = Fixed64(69940016) --[[66.7]],
			realTime = Fixed64(1049101) --[[1.0005]],
			toggle = true,
			isClear = true
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
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Invincible"
		}
	},
	["JumpTwice"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true,
			flowUpPower = Fixed64(12582912) --[[12]]
		}
	},
	["JumpFlash"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(9437184) --[[9]],
			realTime = Fixed64(47186) --[[0.045]],
			filePath = "H_Tohka/JumpFlash"
		}
	},
	["JumpEnd"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = false,
			flowUpPower = Fixed64(0) --[[0]]
		}
	},
	["JumpFirst"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(139810) --[[0.1333333]],
			toggle = true,
			flowUpPower = Fixed64(10485760) --[[10]]
		},
		[2] = {
			type = "JumpTwice",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(349525) --[[0.3333333]],
			toggle = true
		}
	},
	["Run"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/Run"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["JumpRun"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = false,
			flowUpPower = Fixed64(0) --[[0]]
		}
	},
	["HitHeavyL"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitHeavyL"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true
		}
	},
	["HitHeavyR"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitHeavyR"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(838861) --[[0.8]],
			toggle = true
		}
	},
	["HitSoftL"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitSoftL"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
		}
	},
	["HitSoftR"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitSoftR"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true
		}
	},
	["HitVerySoftL"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitVerySoftL"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true
		}
	},
	["HitVerySoftR"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitVerySoftR"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "RunWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true
		},
		[7] = {
			type = "RushWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true
		}
	},
	["HitHaulBack"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitMove"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitHaulBack"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(419431) --[[0.4]],
			content = "ST_Idle"
		},
		[6] = {
			type = "AttackWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true,
			isClear = true
		},
		[7] = {
			type = "RunWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		},
		[8] = {
			type = "SkillWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		},
		[9] = {
			type = "RushWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		}
	},
	["HitDown"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitDown"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitDown_1"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(330302) --[[0.315]],
			content = "ST_Down"
		},
		[6] = {
			type = "RushWindow",
			time = Fixed64(22020096) --[[21]],
			realTime = Fixed64(330302) --[[0.315]],
			toggle = true
		},
		[7] = {
			type = "BehaviorTag",
			time = Fixed64(56623104) --[[54]],
			realTime = Fixed64(849347) --[[0.8100001]],
			content = "ST_StartGetUp"
		},
		[8] = {
			type = "BehaviorTag",
			time = Fixed64(71303168) --[[68]],
			realTime = Fixed64(1069548) --[[1.02]],
			content = "ST_GetUp"
		},
		[9] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1258292) --[[1.2]],
			toggle = true,
			isClear = true
		},
		[10] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1258292) --[[1.2]],
			toggle = true
		},
		[11] = {
			type = "SkillWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1258292) --[[1.2]],
			toggle = true
		}
	},
	["HitFly"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitFly"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitFly"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(44564480) --[[42.5]],
			realTime = Fixed64(846726) --[[0.8075001]],
			content = "ST_Down"
		},
		[6] = {
			type = "RushWindow",
			time = Fixed64(44564480) --[[42.5]],
			realTime = Fixed64(846726) --[[0.8075001]],
			toggle = true
		},
		[7] = {
			type = "BehaviorTag",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(1414530) --[[1.349]],
			content = "ST_StartGetUp"
		},
		[8] = {
			type = "BehaviorTag",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1593836) --[[1.52]],
			content = "ST_GetUp"
		},
		[9] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1593836) --[[1.52]],
			toggle = true,
			isClear = true
		},
		[10] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1593836) --[[1.52]],
			toggle = true
		},
		[11] = {
			type = "SkillWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(1593836) --[[1.52]],
			toggle = true
		}
	},
	["IdleBattle"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["Collect"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["Idle"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["IdleTransition"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["HitAirSoft"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitFly"
		},
		[2] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitAirSoft"
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(541764) --[[0.5166667]],
			content = "ST_Down"
		},
		[6] = {
			type = "RushWindow",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(541764) --[[0.5166667]],
			toggle = true
		},
		[7] = {
			type = "BehaviorTag",
			time = Fixed64(63753420) --[[60.8]],
			realTime = Fixed64(1062557) --[[1.013333]],
			content = "ST_StartGetUp"
		},
		[8] = {
			type = "BehaviorTag",
			time = Fixed64(76860624) --[[73.3]],
			realTime = Fixed64(1281010) --[[1.221667]],
			content = "ST_GetUp"
		},
		[9] = {
			type = "RunWindow",
			time = Fixed64(76860624) --[[73.3]],
			realTime = Fixed64(1281010) --[[1.221667]],
			toggle = true
		},
		[10] = {
			type = "AttackWindow",
			time = Fixed64(76860624) --[[73.3]],
			realTime = Fixed64(1281010) --[[1.221667]],
			toggle = true,
			isClear = true
		},
		[11] = {
			type = "SkillWindow",
			time = Fixed64(76860624) --[[73.3]],
			realTime = Fixed64(1281010) --[[1.221667]],
			toggle = true
		}
	},
	["RunFast"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["RunLoopStop"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["RunStop"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["AttackS"] = {
		[1] = {
			type = "AttackWindow",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(1321206) --[[1.26]],
			toggle = true,
			isClear = true
		}
	},
	["HitBeatback"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_HitMove"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tohka/HitBeatback_1"
		},
		[3] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "ChangeWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(419431) --[[0.4]],
			content = "ST_Idle"
		},
		[6] = {
			type = "AttackWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true,
			isClear = true
		},
		[7] = {
			type = "RunWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		},
		[8] = {
			type = "RushWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		},
		[9] = {
			type = "SkillWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true
		}
	},
	["Skill2"] = {
		[1] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[4] = {
			type = "Effect",
			time = Fixed64(9437184) --[[9]],
			realTime = Fixed64(314573) --[[0.3]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill2"
		},
		[5] = {
			type = "Attack",
			time = Fixed64(11534336) --[[11]],
			realTime = Fixed64(384478) --[[0.3666667]],
			filePath = "H_Tohka/Tohka_Skill_2",
			attackGroupTag = ""
		},
		[6] = {
			type = "UseJoystick",
			time = Fixed64(12478054) --[[11.9]],
			realTime = Fixed64(415935) --[[0.3966667]],
			toggle = true,
			moveSpeed = Fixed64(4194304) --[[4]]
		},
		[7] = {
			type = "Attack",
			time = Fixed64(16567501) --[[15.8]],
			realTime = Fixed64(552250) --[[0.5266667]],
			filePath = "H_Tohka/Tohka_Skill_2_1",
			attackGroupTag = ""
		},
		[8] = {
			type = "Attack",
			time = Fixed64(22649242) --[[21.6]],
			realTime = Fixed64(754975) --[[0.72]],
			filePath = "H_Tohka/Tohka_Skill_2_2",
			attackGroupTag = ""
		},
		[9] = {
			type = "Attack",
			time = Fixed64(28730982) --[[27.4]],
			realTime = Fixed64(957700) --[[0.9133334]],
			filePath = "H_Tohka/Tohka_Skill_2_3",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(34812724) --[[33.2]],
			realTime = Fixed64(1160424) --[[1.106667]],
			filePath = "H_Tohka/Tohka_Skill_2_4",
			attackGroupTag = ""
		},
		[11] = {
			type = "Attack",
			time = Fixed64(40894464) --[[39]],
			realTime = Fixed64(1363149) --[[1.3]],
			filePath = "H_Tohka/Tohka_Skill_2_5",
			attackGroupTag = ""
		},
		[12] = {
			type = "UseJoystick",
			time = Fixed64(42781900) --[[40.8]],
			realTime = Fixed64(1426064) --[[1.36]],
			toggle = false,
			moveSpeed = Fixed64(0) --[[0]]
		},
		[13] = {
			type = "LookTarget",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(1537911) --[[1.466667]],
			lookTargetSpeed = Fixed64(31457280) --[[30]],
			lookTargetTime = Fixed64(50855936) --[[48.5]],
			lookTargetRealTime = Fixed64(1695198) --[[1.616667]]
		},
		[14] = {
			type = "Effect",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1747626) --[[1.666667]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill2_baodian"
		},
		[15] = {
			type = "Effect",
			time = Fixed64(54525952) --[[52]],
			realTime = Fixed64(1817532) --[[1.733333]],
			filePath = "Effect/H_Tohka_01/Tohka_Skill2_baodian_1"
		},
		[16] = {
			type = "Attack",
			time = Fixed64(54525952) --[[52]],
			realTime = Fixed64(1817532) --[[1.733333]],
			filePath = "H_Tohka/Tohka_Skill_2_6",
			attackGroupTag = ""
		},
		[17] = {
			type = "BehaviorTag",
			time = Fixed64(58510540) --[[55.8]],
			realTime = Fixed64(1950352) --[[1.86]],
			content = "ST_Idle"
		},
		[18] = {
			type = "AttackWindow",
			time = Fixed64(60817408) --[[58]],
			realTime = Fixed64(2027247) --[[1.933333]],
			toggle = true,
			isClear = true
		},
		[19] = {
			type = "SkillWindow",
			time = Fixed64(60817408) --[[58]],
			realTime = Fixed64(2027247) --[[1.933333]],
			toggle = true
		},
		[20] = {
			type = "RunWindow",
			time = Fixed64(66584576) --[[63.5]],
			realTime = Fixed64(2219486) --[[2.116667]],
			toggle = true
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