--StateMachine B_30102

return
{
	defaultState = "MIdle",
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
			name = "MTurnLeft",
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
			name = "MWalk",
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
			name = "MWalkBack",
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
			name = "MTurnRight",
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
		[6] = {
			name = "MRush",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(262144) --[[0.25]],
			offset = Fixed64(0) --[[0]],
			conditions = {
			}
		},
	},
	stateMap = {
		["MIdle"] = {
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
					name = "MIdle",
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
					name = "MIdle",
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
		["MWalk"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = true,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MWalkBack"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = true,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MTurnLeft"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = true,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MTurnRight"] = {
			length = Fixed64(1118481) --[[1.066667]],
			loop = true,
			transitions = {
				[1] = {
					name = "MIdle",
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
					name = "MIdle",
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
		["MSkill_1_1"] = {
			length = Fixed64(1572864) --[[1.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "MSkill_1_2",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(446409) --[[0.4257282]],
					duration = Fixed64(67168) --[[0.06405622]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["MSkill_3"] = {
			length = Fixed64(2901060) --[[2.766667]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MSkill_4"] = {
			length = Fixed64(3145728) --[[3]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MSkill_1_2"] = {
			length = Fixed64(1537911) --[[1.466667]],
			loop = false,
			transitions = {
				[1] = {
					name = "MSkill_1_3",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(725562) --[[0.6919497]],
					duration = Fixed64(180868) --[[0.1724899]],
					offset = Fixed64(3257) --[[0.003106225]],
					conditions = {
					}
				},
			}
		},
		["MSkill_1_3"] = {
			length = Fixed64(2236962) --[[2.133333]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MSkill_2_1"] = {
			length = Fixed64(873813) --[[0.8333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "MSkill_2_2",
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
		["MSkill_2_2"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "MSkill_2_3",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(973346) --[[0.9282554]],
					duration = Fixed64(11116) --[[0.01060161]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["MSkill_2_3"] = {
			length = Fixed64(1782580) --[[1.7]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MSkill_5"] = {
			length = Fixed64(3145728) --[[3]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MSkill_1_2b"] = {
			length = Fixed64(1537911) --[[1.466667]],
			loop = false,
			transitions = {
				[1] = {
					name = "MSkill_1_4b",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(557451) --[[0.5316268]],
					duration = Fixed64(187396) --[[0.1787148]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["MSkill_1_1b"] = {
			length = Fixed64(1572864) --[[1.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "MSkill_1_2b",
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
		["MSkill_1_4b"] = {
			length = Fixed64(2481630) --[[2.366667]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
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
		["MRush"] = {
			length = Fixed64(1607817) --[[1.533333]],
			loop = false,
			transitions = {
				[1] = {
					name = "MIdle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(877612) --[[0.8369565]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
	}
}