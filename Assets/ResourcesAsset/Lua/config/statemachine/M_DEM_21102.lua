--StateMachine M_DEM_21102

return
{
	defaultState = "IdleBattle",
	parameters = {
		["isRunning"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["isGrounded"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["LoopAttackTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["turnLeftTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["turnRightTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["walkTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["walkBackTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["runTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
	},
	anyStates = {
		[1] = {
			name = "WalkTurnLeft",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(262144) --[[0.25]],
			offset = Fixed64(0) --[[0]],
			conditions = {
				[1] = {
					parameter = "turnLeftTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
		[2] = {
			name = "Walk",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(262144) --[[0.25]],
			offset = Fixed64(0) --[[0]],
			conditions = {
				[1] = {
					parameter = "walkTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
		[3] = {
			name = "WalkBack",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(945578) --[[0.9017732]],
			duration = Fixed64(301112) --[[0.2871629]],
			offset = Fixed64(104114) --[[0.09929077]],
			conditions = {
				[1] = {
					parameter = "walkBackTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
		[4] = {
			name = "WalkTurnRight",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(262144) --[[0.25]],
			offset = Fixed64(0) --[[0]],
			conditions = {
				[1] = {
					parameter = "turnRightTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
		[5] = {
			name = "Run",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(262144) --[[0.25]],
			offset = Fixed64(0) --[[0]],
			conditions = {
				[1] = {
					parameter = "runTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
	},
	stateMap = {
		["IdleBattle"] = {
			length = Fixed64(1398101) --[[1.333333]],
			loop = true,
			transitions = {
			}
		},
		["Run"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(720896) --[[0.6875]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunning",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["Start"] = {
			length = Fixed64(1048576) --[[1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(938736) --[[0.8952482]],
					duration = Fixed64(529829) --[[0.5052843]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Walk"] = {
			length = Fixed64(559241) --[[0.5333334]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(851968) --[[0.8125]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunning",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["WalkBack"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(851968) --[[0.8125]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunning",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["WalkTurnLeft"] = {
			length = Fixed64(1048576) --[[1]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(851968) --[[0.8125]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunning",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["WalkTurnRight"] = {
			length = Fixed64(1048576) --[[1]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(851968) --[[0.8125]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunning",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["HitSoftL"] = {
			length = Fixed64(1048576) --[[1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitBeatBack"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitHaulBack"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitHeavyL"] = {
			length = Fixed64(1398101) --[[1.333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitSoftR"] = {
			length = Fixed64(1048576) --[[1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitHeavyR"] = {
			length = Fixed64(1398101) --[[1.333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitDown"] = {
			length = Fixed64(1782580) --[[1.7]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitFly"] = {
			length = Fixed64(1153434) --[[1.1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitAirSoft"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitDownSoft"] = {
			length = Fixed64(559241) --[[0.5333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(786432) --[[0.75]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitDownHeavy"] = {
			length = Fixed64(559241) --[[0.5333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(786432) --[[0.75]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill02Start"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill02Loop",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(945957) --[[0.9021341]],
					duration = Fixed64(34207) --[[0.03262201]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill02Loop"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Skill02End",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(942368) --[[0.8987127]],
					duration = Fixed64(110612) --[[0.1054878]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "LoopAttackTrigger",
							type = "Trigger",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["Skill02End"] = {
			length = Fixed64(1328196) --[[1.266667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(941024) --[[0.8974303]],
					duration = Fixed64(149933) --[[0.1429878]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill01"] = {
			length = Fixed64(3145728) --[[3]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(944697) --[[0.9009337]],
					duration = Fixed64(319421) --[[0.3046236]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill03Start"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill03Loop",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(932924) --[[0.8897059]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill04"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1002853) --[[0.9563953]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill03Loop"] = {
			length = Fixed64(768956) --[[0.7333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Skill03End",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(942368) --[[0.8987127]],
					duration = Fixed64(110612) --[[0.1054878]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "LoopAttackTrigger",
							type = "Trigger",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["Skill03End"] = {
			length = Fixed64(2271915) --[[2.166667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(836027) --[[0.7972973]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
	}
}