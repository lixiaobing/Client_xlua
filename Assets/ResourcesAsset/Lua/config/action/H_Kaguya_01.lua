--action event pack
--H_Kaguya_01

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
			type = "Forward",
			time = Fixed64(7340032) --[[7]],
			realTime = Fixed64(73401) --[[0.07]],
			filePath = "H_Kaguya/curve_Attack1"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(25165824) --[[24]],
			realTime = Fixed64(251658) --[[0.24]],
			filePath = "H_Kaguya/attack_Attack_1"
		},
		[4] = {
			type = "AttackWindow",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(367001) --[[0.35]],
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
			type = "Forward",
			time = Fixed64(6920601) --[[6.6]],
			realTime = Fixed64(94582) --[[0.09020001]],
			filePath = "H_Kaguya/curve_Attack2"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(19293798) --[[18.4]],
			realTime = Fixed64(263682) --[[0.2514667]],
			filePath = "H_Kaguya/attack_Attack_2"
		},
		[4] = {
			type = "AttackWindow",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(429917) --[[0.41]],
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
			type = "Forward",
			time = Fixed64(7549747) --[[7.2]],
			realTime = Fixed64(118280) --[[0.1128]],
			filePath = "H_Kaguya/curve_Attack3"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(11429478) --[[10.9]],
			realTime = Fixed64(179062) --[[0.1707667]],
			filePath = "H_Kaguya/attack_Attack_3"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(27262976) --[[26]],
			realTime = Fixed64(427120) --[[0.4073333]],
			filePath = "H_Kaguya/attack_Attack_3"
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(36700160) --[[35]],
			realTime = Fixed64(574969) --[[0.5483333]],
			toggle = true,
			isClear = false
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
			time = Fixed64(3879732) --[[3.7]],
			realTime = Fixed64(54317) --[[0.05180001]],
			filePath = "H_Kaguya/curve_Attack4"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(20656948) --[[19.7]],
			realTime = Fixed64(289198) --[[0.2758]],
			filePath = "H_Kaguya/attack_Attack_4"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(30408704) --[[29]],
			realTime = Fixed64(425722) --[[0.406]],
			filePath = "H_Kaguya/attack_Attack_4"
		},
		[5] = {
			type = "Attack",
			time = Fixed64(37748736) --[[36]],
			realTime = Fixed64(528483) --[[0.504]],
			filePath = "H_Kaguya/attack_Attack_4"
		},
		[6] = {
			type = "AttackWindow",
			time = Fixed64(41943040) --[[40]],
			realTime = Fixed64(587203) --[[0.5600001]],
			toggle = true,
			isClear = false
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
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Kaguya/curve_Attack5"
		},
		[3] = {
			type = "Attack",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(520094) --[[0.4960001]],
			filePath = "H_Kaguya/attack_Attack_5"
		},
		[4] = {
			type = "Attack",
			time = Fixed64(34603008) --[[33]],
			realTime = Fixed64(553649) --[[0.5280001]],
			filePath = "H_Kaguya/attack_Attack_5"
		},
		[5] = {
			type = "Attack",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(620757) --[[0.5920001]],
			filePath = "H_Kaguya/attack_Attack_5_1"
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
			type = "Forward",
			time = Fixed64(13002342) --[[12.4]],
			realTime = Fixed64(86682) --[[0.08266667]],
			filePath = "H_Kaguya/curve_Rush"
		},
		[3] = {
			type = "SpaceCheck",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(139810) --[[0.1333333]],
			toggle = true,
			spaceTime = Fixed64(68157440) --[[65]],
			spaceRealTime = Fixed64(454383) --[[0.4333333]]
		},
		[4] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(559241) --[[0.5333334]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(559241) --[[0.5333334]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "Super",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = false
		}
	},
	["RushBack"] = {
		[1] = {
			type = "Super",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "Backward",
			time = Fixed64(12163482) --[[11.6]],
			realTime = Fixed64(89199) --[[0.08506667]],
			filePath = "H_Kaguya/curve_RushBack"
		},
		[3] = {
			type = "SpaceCheck",
			time = Fixed64(20971520) --[[20]],
			realTime = Fixed64(153791) --[[0.1466667]],
			toggle = true,
			spaceTime = Fixed64(68157440) --[[65]],
			spaceRealTime = Fixed64(499821) --[[0.4766667]]
		},
		[4] = {
			type = "RunWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(615164) --[[0.5866667]],
			toggle = true
		},
		[5] = {
			type = "AttackWindow",
			time = Fixed64(83886080) --[[80]],
			realTime = Fixed64(615164) --[[0.5866667]],
			toggle = true,
			isClear = true
		},
		[6] = {
			type = "Super",
			time = Fixed64(94371840) --[[90]],
			realTime = Fixed64(692061) --[[0.66]],
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
			type = "CameraSpecial",
			time = Fixed64(84934656) --[[81]],
			realTime = Fixed64(3822059) --[[3.645]],
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
			type = "CameraSpecial",
			time = Fixed64(102760448) --[[98]],
			realTime = Fixed64(3767883) --[[3.593333]],
			toggle = false
		},
		[4] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(3844778) --[[3.666667]],
			toggle = false
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
			time = Fixed64(102760448) --[[98]],
			realTime = Fixed64(2740279) --[[2.613333]],
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
			type = "Attack",
			time = Fixed64(13631488) --[[13]],
			realTime = Fixed64(218104) --[[0.208]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[5] = {
			type = "Attack",
			time = Fixed64(19922944) --[[19]],
			realTime = Fixed64(318768) --[[0.304]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[6] = {
			type = "Attack",
			time = Fixed64(26214400) --[[25]],
			realTime = Fixed64(419431) --[[0.4]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[7] = {
			type = "Attack",
			time = Fixed64(32505856) --[[31]],
			realTime = Fixed64(520094) --[[0.4960001]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[8] = {
			type = "Attack",
			time = Fixed64(38797312) --[[37]],
			realTime = Fixed64(620757) --[[0.5920001]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[9] = {
			type = "Attack",
			time = Fixed64(46137344) --[[44]],
			realTime = Fixed64(738198) --[[0.7040001]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[10] = {
			type = "Attack",
			time = Fixed64(53477376) --[[51]],
			realTime = Fixed64(855639) --[[0.816]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[11] = {
			type = "Attack",
			time = Fixed64(58720256) --[[56]],
			realTime = Fixed64(939525) --[[0.8960001]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[12] = {
			type = "Attack",
			time = Fixed64(66060288) --[[63]],
			realTime = Fixed64(1056965) --[[1.008]],
			filePath = "H_Kaguya/attack_Skill_1"
		},
		[13] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1677722) --[[1.6]],
			toggle = false
		}
	},
	["Skill3"] = {
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
			filePath = ""
		},
		[3] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1468007) --[[1.4]],
			toggle = false
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
			type = "Forward",
			time = Fixed64(9227469) --[[8.8]],
			realTime = Fixed64(123033) --[[0.1173333]],
			filePath = "H_Kaguya/curve_Skill2"
		},
		[3] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1398101) --[[1.333333]],
			toggle = false
		}
	},
	["Change"] = {
		[1] = {
			type = "Armor",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			toggle = true
		},
		[2] = {
			type = "RushWindow",
			time = Fixed64(15309210) --[[14.6]],
			realTime = Fixed64(153092) --[[0.146]],
			toggle = true
		},
		[3] = {
			type = "AttackWindow",
			time = Fixed64(62914560) --[[60]],
			realTime = Fixed64(629146) --[[0.6]],
			toggle = true,
			isClear = true
		},
		[4] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1048576) --[[1]],
			toggle = false
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
			filePath = "H_Kaguya/curve_HitFly"
		},
		[3] = {
			type = "Armor",
			time = Fixed64(104857600) --[[100]],
			realTime = Fixed64(1922389) --[[1.833333]],
			toggle = false
		}
	}
}