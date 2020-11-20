--StateMachine H_Yuzuru_01

return
{
	defaultState = "Idle",
	parameters = {
		["isRunning"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["isStopping"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["isRunFast"] = {
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
		["isAvatar"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["attackChain"] = {
			type = "Int",
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
		["idleTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["relaxTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["attackTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["thumpTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["jumpAttackTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["jumpThumpTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["avatarTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["avatarAttackTrigger"] = {
			type = "Trigger",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["Blend"] = {
			type = "Float",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
		["_isCollect"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
	},
	anyStates = {
		[1] = {
			name = "Attack1",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(964141) --[[0.919477]],
			duration = Fixed64(166965) --[[0.1592302]],
			offset = Fixed64(0) --[[0]],
			conditions = {
				[1] = {
					parameter = "attackTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
		[2] = {
			name = "Run",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(70438) --[[0.06717455]],
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
		["Idle"] = {
			length = Fixed64(4194304) --[[4]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleRelax",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(746102) --[[0.7115384]],
					duration = Fixed64(248350) --[[0.2368451]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "relaxTrigger",
							type = "Trigger",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["RunLoop"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = true,
			transitions = {
				[1] = {
					name = "RunFast",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(842192) --[[0.8031764]],
					duration = Fixed64(132533) --[[0.1263934]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunFast",
							type = "Bool",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
				[2] = {
					name = "RunLoopStop",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(958256) --[[0.9138642]],
					duration = Fixed64(44977) --[[0.04289341]],
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
		["IdleRelax"] = {
			length = Fixed64(6291456) --[[6]],
			loop = false,
			transitions = {
				[1] = {
					name = "Idle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(790363) --[[0.7537488]],
					duration = Fixed64(250220) --[[0.2386286]],
					offset = Fixed64(13758) --[[0.01312056]],
					conditions = {
					}
				},
			}
		},
		["Win"] = {
			length = Fixed64(3670016) --[[3.5]],
			loop = false,
			transitions = {
			}
		},
		["Start"] = {
			length = Fixed64(3844778) --[[3.666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Idle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(0) --[[0]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Run"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "RunFast",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(834563) --[[0.7959017]],
					duration = Fixed64(66180) --[[0.06311473]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "isRunFast",
							type = "Bool",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
				[2] = {
					name = "RunStop",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(960219) --[[0.9157367]],
					duration = Fixed64(29452) --[[0.02808782]],
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
				[3] = {
					name = "RunLoop",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1014533) --[[0.9675348]],
					duration = Fixed64(11533) --[[0.01099831]],
					offset = Fixed64(4325) --[[0.004124397]],
					conditions = {
						[1] = {
							parameter = "isRunning",
							type = "Bool",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["IdleBattle"] = {
			length = Fixed64(1398101) --[[1.333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleTransition",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(945317) --[[0.9015244]],
					duration = Fixed64(137679) --[[0.1313008]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "idleTrigger",
							type = "Trigger",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["RunStop"] = {
			length = Fixed64(1258292) --[[1.2]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(940959) --[[0.8973683]],
					duration = Fixed64(71745) --[[0.06842113]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RunLoopStop"] = {
			length = Fixed64(1258292) --[[1.2]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(967937) --[[0.9230962]],
					duration = Fixed64(53760) --[[0.05126917]],
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
		["IdleTransition"] = {
			length = Fixed64(2411725) --[[2.3]],
			loop = false,
			transitions = {
				[1] = {
					name = "Idle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(942680) --[[0.899009]],
					duration = Fixed64(95480) --[[0.09105694]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RunFast"] = {
			length = Fixed64(419431) --[[0.4]],
			loop = false,
			transitions = {
				[1] = {
					name = "RunLoopStop",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(917687) --[[0.8751749]],
					duration = Fixed64(35613) --[[0.03396308]],
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
		["Change"] = {
			length = Fixed64(6291456) --[[6]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(904719) --[[0.8628075]],
					duration = Fixed64(489387) --[[0.4667156]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["ChangeTarget"] = {
			length = Fixed64(629146) --[[0.6]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(802816) --[[0.765625]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Attack1"] = {
			length = Fixed64(1153434) --[[1.1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(943387) --[[0.8996832]],
					duration = Fixed64(87658) --[[0.0835973]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Attack2"] = {
			length = Fixed64(1258292) --[[1.2]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(949118) --[[0.9051497]],
					duration = Fixed64(96142) --[[0.09168863]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Attack3"] = {
			length = Fixed64(1048576) --[[1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(945885) --[[0.9020668]],
					duration = Fixed64(77513) --[[0.07392275]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Attack4"] = {
			length = Fixed64(1747626) --[[1.666667]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(943718) --[[0.8999999]],
					duration = Fixed64(93468) --[[0.08913821]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Attack5"] = {
			length = Fixed64(1712674) --[[1.633333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(945299) --[[0.9015076]],
					duration = Fixed64(111636) --[[0.1064646]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill1"] = {
			length = Fixed64(1328196) --[[1.266667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(940002) --[[0.8964556]],
					duration = Fixed64(72194) --[[0.06884992]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill4"] = {
			length = Fixed64(6640981) --[[6.333333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(994339) --[[0.9482759]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill3"] = {
			length = Fixed64(2936013) --[[2.8]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(908142) --[[0.8660715]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Skill2"] = {
			length = Fixed64(908766) --[[0.8666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(952670) --[[0.9085366]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitSoft"] = {
			length = Fixed64(734004) --[[0.7]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(53282) --[[0.05081308]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitFly"] = {
			length = Fixed64(1922389) --[[1.833333]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1048576) --[[1]],
					duration = Fixed64(487262) --[[0.4646893]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitHeavy"] = {
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
		["Rush"] = {
			length = Fixed64(1223338) --[[1.166667]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(945390) --[[0.901594]],
					duration = Fixed64(71107) --[[0.0678128]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["RushBack"] = {
			length = Fixed64(1153434) --[[1.1]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(947737) --[[0.9038321]],
					duration = Fixed64(62839) --[[0.05992752]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Collect"] = {
			length = Fixed64(1258292) --[[1.2]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(830122) --[[0.7916667]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "_isCollect",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["Talk4_Loop"] = {
			length = Fixed64(4194304) --[[4]],
			loop = true,
			transitions = {
				[1] = {
					name = "Idle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(917504) --[[0.875]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Talk3_Loop"] = {
			length = Fixed64(4194304) --[[4]],
			loop = true,
			transitions = {
				[1] = {
					name = "Idle",
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
	}
}