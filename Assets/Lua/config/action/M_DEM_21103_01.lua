--action event pack
--M_DEM_21103_01

return
{
	
	["Start"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Start"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(47290776) --[[45.1]],
			realTime = Fixed64(945815) --[[0.902]],
			content = "ST_Idle"
		}
	},
	["IdleBattle"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		},
		[2] = {
			type = "AttackFlag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			flagPosition = FixedVector3(0, 0, 3145728) --[[(0, 0, 3)]],
			flagDirection = Fixed64(0) --[[0]],
			flagTime = Fixed64(83886080) --[[80]],
			flagRealTime = Fixed64(1118481) --[[1.066667]],
			flagRange = "Rect",
			flagAngle = Fixed64(0) --[[0]],
			flagRadius = Fixed64(3145728) --[[3]],
			flagSize = FixedVector3(3145728, 0, 4194304) --[[(3, 0, 4)]]
		}
	},
	["Walk"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["WalkBack"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
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
			filePath = "M_DEM_21103_01/HitFly"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(35966156) --[[34.3]],
			realTime = Fixed64(839210) --[[0.8003334]],
			content = "ST_Down"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(64487424) --[[61.5]],
			realTime = Fixed64(1504707) --[[1.435]],
			content = "ST_StartGetUp"
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(73819752) --[[70.4]],
			realTime = Fixed64(1722461) --[[1.642667]],
			content = "ST_GetUp"
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
			filePath = "M_DEM_21103_01/HitHeavyL"
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
			filePath = "M_DEM_21103_01/HitHeavyR"
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
			filePath = "M_DEM_21103_01/HitSoftL"
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
			filePath = "M_DEM_21103_01/HitSoftR"
		}
	},
	["WalkTurnLeft"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["WalkTurnRight"] = {
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
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103_01/HitAirSoft"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(31457280) --[[30]],
			realTime = Fixed64(534773) --[[0.51]],
			content = "ST_Down"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(52533656) --[[50.1]],
			realTime = Fixed64(893073) --[[0.8517]],
			content = "ST_StartGetUp"
		},
		[5] = {
			type = "BehaviorTag",
			time = Fixed64(75812048) --[[72.3]],
			realTime = Fixed64(1288805) --[[1.2291]],
			content = "ST_GetUp"
		}
	},
	["Run"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Idle"
		}
	},
	["Skill01"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(1057314) --[[1.008333]],
			content = "ST_Idle"
		}
	},
	["Skill04"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Atk"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(71303168) --[[68]],
			realTime = Fixed64(2139096) --[[2.04]],
			content = "ST_Idle"
		}
	},
	["HitDownSoft"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Down"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103_01/HitDownSoft"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(53477376) --[[51]],
			realTime = Fixed64(1069547) --[[1.02]],
			content = "ST_StartGetUp"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(63963136) --[[61]],
			realTime = Fixed64(1279263) --[[1.22]],
			content = "ST_GetUp"
		}
	},
	["HitDownHeavy"] = {
		[1] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Down"
		},
		[2] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103_01/HitDownHeavy"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(60293120) --[[57.5]],
			realTime = Fixed64(1406839) --[[1.341667]],
			content = "ST_StartGetUp"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(69206016) --[[66]],
			realTime = Fixed64(1614808) --[[1.54]],
			content = "ST_GetUp"
		}
	},
	["HitDown"] = {
		[1] = {
			type = "Backward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "M_DEM_21103_01/HitDown"
		},
		[2] = {
			type = "BehaviorTag",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			content = "ST_Down"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(60293120) --[[57.5]],
			realTime = Fixed64(1406839) --[[1.341667]],
			content = "ST_StartGetUp"
		},
		[4] = {
			type = "BehaviorTag",
			time = Fixed64(69206016) --[[66]],
			realTime = Fixed64(1614808) --[[1.54]],
			content = "ST_GetUp"
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
			filePath = "M_DEM_21103_01/HitHaulBack"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(23592960) --[[22.5]],
			realTime = Fixed64(314573) --[[0.3]],
			content = "ST_Idle"
		}
	},
	["HitBeatBack"] = {
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
			filePath = "M_DEM_21103_01/HitBeatback_1"
		},
		[3] = {
			type = "BehaviorTag",
			time = Fixed64(23592960) --[[22.5]],
			realTime = Fixed64(314573) --[[0.3]],
			content = "ST_Idle"
		}
	}
}