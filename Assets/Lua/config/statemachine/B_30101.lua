--StateMachine B_30101

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
			length = Fixed64(2236962) --[[2.133333]],
			loop = true,
			transitions = {
			}
		},
		["Walk"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = true,
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
			length = Fixed64(2236962) --[[2.133333]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(109403) --[[0.1043348]],
					duration = Fixed64(529829) --[[0.5052843]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Walk"] = {
			length = Fixed64(1118481) --[[1.066667]],
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
			length = Fixed64(1118481) --[[1.066667]],
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
			length = Fixed64(1118481) --[[1.066667]],
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
			length = Fixed64(1118481) --[[1.066667]],
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
		["HitSoft"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(655360) --[[0.625]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitBeatBack"] = {
			length = Fixed64(838861) --[[0.8000001]],
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
					}
				},
			}
		},
		["HitHeavy"] = {
			length = Fixed64(838861) --[[0.8000001]],
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
					}
				},
			}
		},
		["HitFlowUp"] = {
			length = Fixed64(524288) --[[0.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "HitFlowDown",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(836266) --[[0.7975251]],
					duration = Fixed64(120948) --[[0.1153455]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isGrounded",
							type = "Bool",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["HitFlowDown"] = {
			length = Fixed64(1747626) --[[1.666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(891290) --[[0.85]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitFly"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "HitFlowDown",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(830795) --[[0.7923077]],
					duration = Fixed64(97867) --[[0.0933333]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitAirSoft"] = {
			length = Fixed64(559241) --[[0.5333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "HitFlowDown",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(557056) --[[0.53125]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_2_1"] = {
			length = Fixed64(873813) --[[0.8333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_2_2",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(234395) --[[0.223536]],
					duration = Fixed64(132218) --[[0.1260929]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_2_2"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Skill_2_3",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(9937460) --[[9.4771]],
					duration = Fixed64(62366) --[[0.05947697]],
					offset = Fixed64(2594) --[[0.002473688]],
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
		["Skill_2_3"] = {
			length = Fixed64(1922389) --[[1.833333]],
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
		["Skill_1_1"] = {
			length = Fixed64(1468007) --[[1.4]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_2",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(490298) --[[0.4675845]],
					duration = Fixed64(67168) --[[0.06405622]],
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
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(746102) --[[0.7115385]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_4"] = {
			length = Fixed64(3215633) --[[3.066667]],
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
		["Skill_1_2"] = {
			length = Fixed64(1537911) --[[1.466667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_4",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(503472) --[[0.4801481]],
					duration = Fixed64(48849) --[[0.04658633]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_3"] = {
			length = Fixed64(2236962) --[[2.133333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(965794) --[[0.9210526]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_4"] = {
			length = Fixed64(2481630) --[[2.366667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(937811) --[[0.8943662]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushB"] = {
			length = Fixed64(1048576) --[[1]],
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
		["RushF2"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_1",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(655360) --[[0.625]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushL"] = {
			length = Fixed64(1572864) --[[1.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(873813) --[[0.8333334]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushR"] = {
			length = Fixed64(1572864) --[[1.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(873813) --[[0.8333334]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill05Start"] = {
			length = Fixed64(873813) --[[0.8333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill05Loop",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1012470) --[[0.9655669]],
					duration = Fixed64(262144) --[[0.2500001]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill05Loop"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Skill05End",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(973346) --[[0.9282554]],
					duration = Fixed64(11116) --[[0.01060161]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill05End"] = {
			length = Fixed64(1782580) --[[1.7]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(905588) --[[0.8636364]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushF"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(655360) --[[0.625]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushB2"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(611669) --[[0.5833334]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushL2"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(611669) --[[0.5833334]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushR2"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(611669) --[[0.5833334]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushF3"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_1b",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(655360) --[[0.625]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_1b"] = {
			length = Fixed64(1468007) --[[1.4]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_2b",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(385922) --[[0.3680436]],
					duration = Fixed64(60641) --[[0.05783147]],
					offset = Fixed64(12490) --[[0.01191126]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_2b"] = {
			length = Fixed64(1537911) --[[1.466667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_3",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(473420) --[[0.4514881]],
					duration = Fixed64(155041) --[[0.1478581]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_1c"] = {
			length = Fixed64(1468007) --[[1.4]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_2c",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(368475) --[[0.3514056]],
					duration = Fixed64(109490) --[[0.1044177]],
					offset = Fixed64(0) --[[3.047965E-07]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_2c"] = {
			length = Fixed64(1537911) --[[1.466667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_3c",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(357516) --[[0.3409539]],
					duration = Fixed64(125523) --[[0.1197089]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_3c"] = {
			length = Fixed64(2236962) --[[2.133333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(925696) --[[0.8828125]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_4d"] = {
			length = Fixed64(2481630) --[[2.366667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(937811) --[[0.8943662]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_1d"] = {
			length = Fixed64(1468007) --[[1.4]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_2d",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(372837) --[[0.3555651]],
					duration = Fixed64(97278) --[[0.0927712]],
					offset = Fixed64(4163) --[[0.003970604]],
					conditions = {
					}
				},
			}
		},
		["Skill_1_2d"] = {
			length = Fixed64(1537911) --[[1.466667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Skill_1_4d",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(349658) --[[0.3334599]],
					duration = Fixed64(140075) --[[0.1335851]],
					offset = Fixed64(1002) --[[0.0009552189]],
					conditions = {
					}
				},
			}
		},
		["Skill_5"] = {
			length = Fixed64(3145728) --[[3]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(956970) --[[0.9126379]],
					duration = Fixed64(262143) --[[0.2499998]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
	}
}