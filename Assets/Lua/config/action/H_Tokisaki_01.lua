--action event pack
--H_Tokisaki_01

return
{
	
	["Attack1"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tokisaki/curve_Attack_1"
		},
		[2] = {
			type = "RushWindow",
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
			akEventName = "PTokisakiAttack1Action_Battle"
		},
		[4] = {
			type = "CameraEffect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			cameraEffectId = Fixed64(1052770304) --[[1004]]
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
			type = "Effect",
			time = Fixed64(24117248) --[[23]],
			realTime = Fixed64(160782) --[[0.1533333]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_attack_1_c"
		},
		[8] = {
			type = "Attack",
			time = Fixed64(29884416) --[[28.5]],
			realTime = Fixed64(199230) --[[0.19]],
			filePath = "H_Tokisaki/attack_Attack_1",
			attackGroupTag = ""
		},
		[9] = {
			type = "Sound",
			time = Fixed64(29884416) --[[28.5]],
			realTime = Fixed64(199230) --[[0.19]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack1Blast_Battle"
		},
		[10] = {
			type = "AttackWindow",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(244668) --[[0.2333333]],
			toggle = true,
			isClear = false
		},
		[11] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(559241) --[[0.5333334]],
			toggle = true
		},
		[12] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(559241) --[[0.5333334]],
			toggle = true,
			isClear = true
		}
	},
	["Attack2"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tokisaki/curve_Attack_2"
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SkillWindow",
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
			type = "Effect",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(223696) --[[0.2133333]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_attack_2_c"
		},
		[6] = {
			type = "Sound",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(244668) --[[0.2333333]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack2Action_Battle"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(39845888) --[[38]],
			realTime = Fixed64(265639) --[[0.2533333]],
			filePath = "H_Tokisaki/attack_Attack_2",
			attackGroupTag = ""
		},
		[8] = {
			type = "Sound",
			time = Fixed64(39845888) --[[38]],
			realTime = Fixed64(265639) --[[0.2533333]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack2Blast_Battle"
		},
		[9] = {
			type = "AttackWindow",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(314573) --[[0.3]],
			toggle = true,
			isClear = false
		},
		[10] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(559241) --[[0.5333334]],
			toggle = true
		},
		[11] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(559241) --[[0.5333334]],
			toggle = true,
			isClear = true
		}
	},
	["Attack3"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tokisaki/curve_Attack_3"
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SkillWindow",
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
			type = "Effect",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(314573) --[[0.3]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_attack_3_c"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(367001) --[[0.35]],
			filePath = "H_Tokisaki/attack_Attack_3",
			attackGroupTag = ""
		},
		[7] = {
			type = "Sound",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(367001) --[[0.35]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack3Blast_Battle"
		},
		[8] = {
			type = "AttackWindow",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(576717) --[[0.55]],
			toggle = true,
			isClear = false
		},
		[9] = {
			type = "RunWindow",
			time = Fixed64(73924608) --[[70.5]],
			realTime = Fixed64(739246) --[[0.705]],
			toggle = true
		},
		[10] = {
			type = "AttackWindow",
			time = Fixed64(73924608) --[[70.5]],
			realTime = Fixed64(739246) --[[0.705]],
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
			type = "Forward",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(122334) --[[0.1166667]],
			filePath = "H_Tokisaki/curve_Attack_4"
		},
		[5] = {
			type = "Effect",
			time = Fixed64(11534336) --[[11]],
			realTime = Fixed64(134567) --[[0.1283333]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_attack_4_c"
		},
		[6] = {
			type = "Sound",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(183501) --[[0.175]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack4Action_Battle"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(16462643) --[[15.7]],
			realTime = Fixed64(192064) --[[0.1831667]],
			filePath = "H_Tokisaki/attack_Attack_4",
			attackGroupTag = ""
		},
		[8] = {
			type = "Sound",
			time = Fixed64(16462643) --[[15.7]],
			realTime = Fixed64(192064) --[[0.1831667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack4Blast_Battle"
		},
		[9] = {
			type = "Sound",
			time = Fixed64(16462643) --[[15.7]],
			realTime = Fixed64(192064) --[[0.1831667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack4bullet_Battle"
		},
		[10] = {
			type = "Attack",
			time = Fixed64(34498152) --[[32.9]],
			realTime = Fixed64(402479) --[[0.3838334]],
			filePath = "H_Tokisaki/attack_Attack_4",
			attackGroupTag = ""
		},
		[11] = {
			type = "Sound",
			time = Fixed64(34498152) --[[32.9]],
			realTime = Fixed64(402479) --[[0.3838334]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack4Blast_Battle"
		},
		[12] = {
			type = "Attack",
			time = Fixed64(40475032) --[[38.6]],
			realTime = Fixed64(472209) --[[0.4503334]],
			filePath = "H_Tokisaki/attack_Attack_4",
			attackGroupTag = ""
		},
		[13] = {
			type = "Sound",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(538269) --[[0.5133334]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack4Blast_Battle"
		},
		[14] = {
			type = "Attack",
			time = Fixed64(46451916) --[[44.3]],
			realTime = Fixed64(541939) --[[0.5168334]],
			filePath = "H_Tokisaki/attack_Attack_4",
			attackGroupTag = ""
		},
		[15] = {
			type = "Attack",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(611669) --[[0.5833334]],
			filePath = "H_Tokisaki/attack_Attack_4",
			attackGroupTag = ""
		},
		[16] = {
			type = "Effect",
			time = Fixed64(72351744) --[[69]],
			realTime = Fixed64(844104) --[[0.8050001]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_attack_4_c_yan"
		},
		[17] = {
			type = "Attack",
			time = Fixed64(72351744) --[[69]],
			realTime = Fixed64(844104) --[[0.8050001]],
			filePath = "H_Tokisaki/attack_Attack_4_1",
			attackGroupTag = ""
		},
		[18] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(978671) --[[0.9333334]],
			toggle = true,
			isClear = false
		},
		[19] = {
			type = "RunWindow",
			time = Fixed64(92274688) --[[88]],
			realTime = Fixed64(1076538) --[[1.026667]],
			toggle = true
		},
		[20] = {
			type = "AttackWindow",
			time = Fixed64(92274688) --[[88]],
			realTime = Fixed64(1076538) --[[1.026667]],
			toggle = true,
			isClear = true
		}
	},
	["Attack5"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tokisaki/curve_Attack_5"
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "SkillWindow",
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
			type = "Effect",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(188744) --[[0.18]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_attack_5_c"
		},
		[6] = {
			type = "Sound",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(188744) --[[0.18]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack5Action_Battle"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(36385588) --[[34.7]],
			realTime = Fixed64(436628) --[[0.4164]],
			filePath = "H_Tokisaki/attack_Attack_5",
			attackGroupTag = ""
		},
		[8] = {
			type = "Sound",
			time = Fixed64(36385588) --[[34.7]],
			realTime = Fixed64(436628) --[[0.4164]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiAttack5Blast_Battle"
		},
		[9] = {
			type = "RunWindow",
			time = Fixed64(69206016) --[[66]],
			realTime = Fixed64(830473) --[[0.7920001]],
			toggle = true
		},
		[10] = {
			type = "AttackWindow",
			time = Fixed64(69206016) --[[66]],
			realTime = Fixed64(830473) --[[0.7920001]],
			toggle = true,
			isClear = true
		}
	},
	["Rush"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_Rush"
		},
		[2] = {
			type = "Super",
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
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiFlash_Battle"
		},
		[5] = {
			type = "SpaceCheck",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(59419) --[[0.05666667]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(356516) --[[0.34]]
		},
		[6] = {
			type = "Forward",
			time = Fixed64(23068672) --[[22]],
			realTime = Fixed64(130722) --[[0.1246667]],
			filePath = "H_Tokisaki/curve_Rush"
		},
		[7] = {
			type = "RunWindow",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(421877) --[[0.4023334]],
			toggle = true
		},
		[8] = {
			type = "RushWindow",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(421877) --[[0.4023334]],
			toggle = true
		},
		[9] = {
			type = "AttackWindow",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(421877) --[[0.4023334]],
			toggle = true,
			isClear = true
		},
		[10] = {
			type = "SkillWindow",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(421877) --[[0.4023334]],
			toggle = true
		},
		[11] = {
			type = "Super",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(594193) --[[0.5666667]],
			toggle = false
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
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4"
		},
		[4] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4_4"
		},
		[5] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4_5"
		},
		[6] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4_6"
		},
		[7] = {
			type = "SceneDark",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[8] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[9] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill4_Player"
		},
		[10] = {
			type = "CameraSpecial",
			time = Fixed64(31352422) --[[29.9]],
			realTime = Fixed64(1797539) --[[1.714267]],
			toggle = false
		},
		[11] = {
			type = "UseJoystick",
			time = Fixed64(32296140) --[[30.8]],
			realTime = Fixed64(1851645) --[[1.765867]],
			toggle = true,
			moveSpeed = Fixed64(3145728) --[[3]]
		},
		[12] = {
			type = "CameraEffect",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(2224379) --[[2.121333]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[13] = {
			type = "Attack",
			time = Fixed64(39216744) --[[37.4]],
			realTime = Fixed64(2248426) --[[2.144267]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[14] = {
			type = "Attack",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(2404734) --[[2.293334]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[15] = {
			type = "Attack",
			time = Fixed64(45508200) --[[43.4]],
			realTime = Fixed64(2609137) --[[2.488267]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[16] = {
			type = "Attack",
			time = Fixed64(49702504) --[[47.4]],
			realTime = Fixed64(2849611) --[[2.7176]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[17] = {
			type = "Attack",
			time = Fixed64(56623104) --[[54]],
			realTime = Fixed64(3246392) --[[3.096]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[18] = {
			type = "Attack",
			time = Fixed64(59559116) --[[56.8]],
			realTime = Fixed64(3414723) --[[3.256533]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[19] = {
			type = "Attack",
			time = Fixed64(62495128) --[[59.6]],
			realTime = Fixed64(3583054) --[[3.417067]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[20] = {
			type = "Attack",
			time = Fixed64(64277708) --[[61.3]],
			realTime = Fixed64(3685255) --[[3.514534]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[21] = {
			type = "Attack",
			time = Fixed64(67004008) --[[63.9]],
			realTime = Fixed64(3841564) --[[3.6636]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[22] = {
			type = "Attack",
			time = Fixed64(72351744) --[[69]],
			realTime = Fixed64(4148167) --[[3.956]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[23] = {
			type = "Attack",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(4208285) --[[4.013333]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[24] = {
			type = "Attack",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(4268403) --[[4.070667]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[25] = {
			type = "Effect",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(4268403) --[[4.070667]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4_2"
		},
		[26] = {
			type = "CameraEffect",
			time = Fixed64(74448896) --[[71]],
			realTime = Fixed64(4268403) --[[4.070667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[27] = {
			type = "Attack",
			time = Fixed64(76231472) --[[72.7]],
			realTime = Fixed64(4370605) --[[4.168133]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[28] = {
			type = "Attack",
			time = Fixed64(77070336) --[[73.5]],
			realTime = Fixed64(4418700) --[[4.214]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[29] = {
			type = "Attack",
			time = Fixed64(78118912) --[[74.5]],
			realTime = Fixed64(4478818) --[[4.271334]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[30] = {
			type = "Attack",
			time = Fixed64(79167488) --[[75.5]],
			realTime = Fixed64(4538936) --[[4.328667]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[31] = {
			type = "Attack",
			time = Fixed64(80216064) --[[76.5]],
			realTime = Fixed64(4599055) --[[4.386]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[32] = {
			type = "Attack",
			time = Fixed64(80740352) --[[77]],
			realTime = Fixed64(4629113) --[[4.414667]],
			filePath = "H_Tokisaki/attack_Skill_4",
			attackGroupTag = ""
		},
		[33] = {
			type = "UseJoystick",
			time = Fixed64(88080384) --[[84]],
			realTime = Fixed64(5049942) --[[4.816]],
			toggle = false,
			moveSpeed = Fixed64(0) --[[0]]
		},
		[34] = {
			type = "Effect",
			time = Fixed64(88080384) --[[84]],
			realTime = Fixed64(5049942) --[[4.816]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4_1"
		},
		[35] = {
			type = "Effect",
			time = Fixed64(88080384) --[[84]],
			realTime = Fixed64(5049942) --[[4.816]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_4_3"
		},
		[36] = {
			type = "Attack",
			time = Fixed64(89758104) --[[85.6]],
			realTime = Fixed64(5146132) --[[4.907733]],
			filePath = "H_Tokisaki/attack_Skill_4_1",
			attackGroupTag = ""
		},
		[37] = {
			type = "CameraEffect",
			time = Fixed64(90177536) --[[86]],
			realTime = Fixed64(5170179) --[[4.930667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[38] = {
			type = "CameraEffect",
			time = Fixed64(90177536) --[[86]],
			realTime = Fixed64(5170179) --[[4.930667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[39] = {
			type = "SceneDark",
			time = Fixed64(100663296) --[[96]],
			realTime = Fixed64(5771363) --[[5.504]],
			toggle = false
		},
		[40] = {
			type = "Armor",
			time = Fixed64(103809024) --[[99]],
			realTime = Fixed64(5951718) --[[5.676]],
			toggle = false
		},
		[41] = {
			type = "Super",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(6011836) --[[5.733334]],
			toggle = false
		}
	},
	["Skill3"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tokisaki/curve_Skill3"
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
			type = "SuperWindow",
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
			akEventName = "PTokisakiSkill3Action_Battle"
		},
		[6] = {
			type = "Effect",
			time = Fixed64(3145728) --[[3]],
			realTime = Fixed64(89129) --[[0.08500001]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_3"
		},
		[7] = {
			type = "CameraEffect",
			time = Fixed64(5242880) --[[5]],
			realTime = Fixed64(148548) --[[0.1416667]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(7130317) --[[6.8]],
			realTime = Fixed64(202025) --[[0.1926667]],
			filePath = "H_Tokisaki/attack_Skill_3",
			attackGroupTag = ""
		},
		[9] = {
			type = "IgnoreCollision",
			time = Fixed64(13421773) --[[12.8]],
			realTime = Fixed64(380283) --[[0.3626667]],
			toggle = true
		},
		[10] = {
			type = "UseJoystick",
			time = Fixed64(17511220) --[[16.7]],
			realTime = Fixed64(496151) --[[0.4731667]],
			toggle = true,
			moveSpeed = Fixed64(4194304) --[[4]]
		},
		[11] = {
			type = "Attack",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(534774) --[[0.5100001]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[12] = {
			type = "Attack",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(534774) --[[0.5100001]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[13] = {
			type = "CameraEffect",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(534774) --[[0.5100001]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[14] = {
			type = "CameraEffect",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(534774) --[[0.5100001]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[15] = {
			type = "Attack",
			time = Fixed64(22544384) --[[21.5]],
			realTime = Fixed64(638757) --[[0.6091667]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[16] = {
			type = "Sound",
			time = Fixed64(22544384) --[[21.5]],
			realTime = Fixed64(638757) --[[0.6091667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill3Blast_Battle"
		},
		[17] = {
			type = "Attack",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(742741) --[[0.7083334]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[18] = {
			type = "Attack",
			time = Fixed64(29884416) --[[28.5]],
			realTime = Fixed64(846726) --[[0.8075001]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[19] = {
			type = "Attack",
			time = Fixed64(33554432) --[[32]],
			realTime = Fixed64(950709) --[[0.9066667]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[20] = {
			type = "Sound",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(1039838) --[[0.9916667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill3DropAction_Battle"
		},
		[21] = {
			type = "Attack",
			time = Fixed64(37224448) --[[35.5]],
			realTime = Fixed64(1054693) --[[1.005833]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[22] = {
			type = "Attack",
			time = Fixed64(40894464) --[[39]],
			realTime = Fixed64(1158677) --[[1.105]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[23] = {
			type = "Attack",
			time = Fixed64(44564480) --[[42.5]],
			realTime = Fixed64(1262660) --[[1.204167]],
			filePath = "H_Tokisaki/attack_Skill_3_1",
			attackGroupTag = ""
		},
		[24] = {
			type = "Attack",
			time = Fixed64(48234496) --[[46]],
			realTime = Fixed64(1366644) --[[1.303333]],
			filePath = "H_Tokisaki/attack_Skill_3_3",
			attackGroupTag = ""
		},
		[25] = {
			type = "Sound",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(1485482) --[[1.416667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill3DropEffects_Battle"
		},
		[26] = {
			type = "UseJoystick",
			time = Fixed64(66374860) --[[63.3]],
			realTime = Fixed64(1880622) --[[1.7935]],
			toggle = false,
			moveSpeed = Fixed64(0) --[[0]]
		},
		[27] = {
			type = "Effect",
			time = Fixed64(66689432) --[[63.6]],
			realTime = Fixed64(1889534) --[[1.802]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_3_yan"
		},
		[28] = {
			type = "Attack",
			time = Fixed64(66689432) --[[63.6]],
			realTime = Fixed64(1889534) --[[1.802]],
			filePath = "H_Tokisaki/attack_Skill_3_2",
			attackGroupTag = ""
		},
		[29] = {
			type = "IgnoreCollision",
			time = Fixed64(66899148) --[[63.8]],
			realTime = Fixed64(1895476) --[[1.807667]],
			toggle = false
		},
		[30] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2079676) --[[1.983333]],
			toggle = true
		},
		[31] = {
			type = "CameraEffect",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2079676) --[[1.983333]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[32] = {
			type = "SkillWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2079676) --[[1.983333]],
			toggle = true
		},
		[33] = {
			type = "AttackWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2079676) --[[1.983333]],
			toggle = true,
			isClear = true
		},
		[34] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2970965) --[[2.833333]],
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
			filePath = "Effect/H_Tokisaki_01/Tokisaki_StartAcion"
		},
		[3] = {
			type = "Effect",
			time = Fixed64(47185920) --[[45]],
			realTime = Fixed64(2044724) --[[1.95]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_StartAcion_02"
		},
		[4] = {
			type = "CameraSpecial",
			time = Fixed64(88080384) --[[84]],
			realTime = Fixed64(3816817) --[[3.64]],
			toggle = false
		}
	},
	["Skill1"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Tokisaki/curve_Skill1"
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
			type = "SuperWindow",
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
			akEventName = "PTokisakiSkill1Action_Battle"
		},
		[6] = {
			type = "Effect",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(209716) --[[0.2]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill1_jiao"
		},
		[7] = {
			type = "CameraEffect",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(209716) --[[0.2]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[8] = {
			type = "Attack",
			time = Fixed64(11534336) --[[11]],
			realTime = Fixed64(230686) --[[0.22]],
			filePath = "H_Tokisaki/attack_Skill_1",
			attackGroupTag = ""
		},
		[9] = {
			type = "Attack",
			time = Fixed64(15728640) --[[15]],
			realTime = Fixed64(314573) --[[0.3]],
			filePath = "H_Tokisaki/attack_Skill_1",
			attackGroupTag = ""
		},
		[10] = {
			type = "Attack",
			time = Fixed64(18874368) --[[18]],
			realTime = Fixed64(377488) --[[0.36]],
			filePath = "H_Tokisaki/attack_Skill_1",
			attackGroupTag = ""
		},
		[11] = {
			type = "Backward",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(545259) --[[0.52]],
			filePath = "H_Tokisaki/curve_Skill1_1"
		},
		[12] = {
			type = "Effect",
			time = Fixed64(28101836) --[[26.8]],
			realTime = Fixed64(562037) --[[0.536]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill1_feiwei"
		},
		[13] = {
			type = "Sound",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(838861) --[[0.8]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill1Blast_Battle"
		},
		[14] = {
			type = "Backward",
			time = Fixed64(42991616) --[[41]],
			realTime = Fixed64(859832) --[[0.82]],
			filePath = "H_Tokisaki/curve_Skill1_2"
		},
		[15] = {
			type = "Effect",
			time = Fixed64(44249908) --[[42.2]],
			realTime = Fixed64(884999) --[[0.844]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill1_qiangkou"
		},
		[16] = {
			type = "Attack",
			time = Fixed64(44564480) --[[42.5]],
			realTime = Fixed64(891290) --[[0.85]],
			filePath = "H_Tokisaki/attack_Skill_1_1",
			attackGroupTag = ""
		},
		[17] = {
			type = "CameraEffect",
			time = Fixed64(44564480) --[[42.5]],
			realTime = Fixed64(891290) --[[0.85]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[18] = {
			type = "CameraEffect",
			time = Fixed64(44564480) --[[42.5]],
			realTime = Fixed64(891290) --[[0.85]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[19] = {
			type = "Effect",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(1258292) --[[1.2]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill1_luodi"
		},
		[20] = {
			type = "AttackWindow",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(1342177) --[[1.28]],
			toggle = true,
			isClear = true
		},
		[21] = {
			type = "RunWindow",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(1342177) --[[1.28]],
			toggle = true
		},
		[22] = {
			type = "SkillWindow",
			time = Fixed64(67108864) --[[64]],
			realTime = Fixed64(1342177) --[[1.28]],
			toggle = true
		},
		[23] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2097152) --[[2]],
			toggle = false
		},
		[24] = {
			type = "Sound",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(2097152) --[[2]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill1Effects_Battle"
		}
	},
	["Win"] = {
		[1] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_WinAcion"
		},
		[2] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_WinAcion_handL"
		},
		[3] = {
			type = "CameraSpecial",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[4] = {
			type = "Sound",
			time = Fixed64(13631488) --[[13]],
			realTime = Fixed64(390769) --[[0.3726667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiStop_Battle"
		}
	},
	["Skill2"] = {
		[1] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Effect",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "Effect/H_Tokisaki_01/Tokisaki_skill_2"
		},
		[4] = {
			type = "SuperWindow",
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
			akEventName = "PTokisakiSkill2Action_Battle"
		},
		[6] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill2Effects_Battle"
		},
		[7] = {
			type = "Sound",
			time = Fixed64(45088768) --[[43]],
			realTime = Fixed64(1502959) --[[1.433333]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiSkill2Blast_Battle"
		},
		[8] = {
			type = "CameraEffect",
			time = Fixed64(48234496) --[[46]],
			realTime = Fixed64(1607817) --[[1.533333]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[9] = {
			type = "Backward",
			time = Fixed64(49807360) --[[47.5]],
			realTime = Fixed64(1660245) --[[1.583333]],
			filePath = "H_Tokisaki/curve_Skill2"
		},
		[10] = {
			type = "Attack",
			time = Fixed64(50331648) --[[48]],
			realTime = Fixed64(1677722) --[[1.6]],
			filePath = "H_Tokisaki/attack_Skill_2",
			attackGroupTag = ""
		},
		[11] = {
			type = "CameraEffect",
			time = Fixed64(50331648) --[[48]],
			realTime = Fixed64(1677722) --[[1.6]],
			cameraEffectId = Fixed64(0) --[[0]]
		},
		[12] = {
			type = "AttackWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2446677) --[[2.333333]],
			toggle = true,
			isClear = true
		},
		[13] = {
			type = "SkillWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2446677) --[[2.333333]],
			toggle = true
		},
		[14] = {
			type = "RunWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(2446677) --[[2.333333]],
			toggle = true
		},
		[15] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(3495253) --[[3.333333]],
			toggle = false
		}
	},
	["RushBack"] = {
		[1] = {
			type = "SpaceCheck",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true,
			spaceTime = Fixed64(62914560) --[[60]],
			spaceRealTime = Fixed64(419431) --[[0.4]]
		},
		[2] = {
			type = "SuperWindow",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[3] = {
			type = "Backward",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(132819) --[[0.1266667]],
			filePath = "H_Tokisaki/curve_RushBack"
		},
		[4] = {
			type = "AttackWindow",
			time = Fixed64(75497472) --[[72]],
			realTime = Fixed64(503317) --[[0.48]],
			toggle = true,
			isClear = true
		},
		[5] = {
			type = "RunWindow",
			time = Fixed64(75497472) --[[72]],
			realTime = Fixed64(503317) --[[0.48]],
			toggle = true
		},
		[6] = {
			type = "RushWindow",
			time = Fixed64(75497472) --[[72]],
			realTime = Fixed64(503317) --[[0.48]],
			toggle = true
		},
		[7] = {
			type = "SkillWindow",
			time = Fixed64(75497472) --[[72]],
			realTime = Fixed64(503317) --[[0.48]],
			toggle = true
		}
	},
	["JumpFirst"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(139810) --[[0.1333333]],
			toggle = true,
			flowUpPower = Fixed64(8388608) --[[8]]
		},
		[2] = {
			type = "JumpTwice",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(349525) --[[0.3333333]],
			toggle = true
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
	["JumpRun"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = false,
			flowUpPower = Fixed64(0) --[[0]]
		}
	},
	["JumpTwice"] = {
		[1] = {
			type = "FlowUp",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true,
			flowUpPower = Fixed64(10485760) --[[10]]
		}
	},
	["IdleTransition"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "PTokisakiIdleTransitionAction_Battle"
		}
	},
	["Run"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "HighheelsFootstep_Battle"
		}
	},
	["RunLoop"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "HighheelsFootstep_Battle"
		},
		[2] = {
			type = "Sound",
			time = Fixed64(56518248) --[[53.9]],
			realTime = Fixed64(301430) --[[0.2874667]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "HighheelsFootstep_Battle"
		}
	},
	["RunStop"] = {
		[1] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = "FlatshoesFootStop_Battle"
		}
	}
}