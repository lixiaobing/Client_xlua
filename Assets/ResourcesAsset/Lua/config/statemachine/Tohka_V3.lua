--StateMachine Tohka_V3

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
		["jumpTrigger"] = {
			type = "Trigger",
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
		[3] = {
			name = "JumpFirst",
			hasExitTime = false,
			hasFixedDuration = true,
			exitTime = Fixed64(786432) --[[0.75]],
			duration = Fixed64(262144) --[[0.25]],
			offset = Fixed64(0) --[[0]],
			conditions = {
				[1] = {
					parameter = "jumpTrigger",
					type = "Trigger",
					mode = "If",
					threshold = Fixed64(0) --[[0]],
				},
			}
		},
	},
	stateMap = {
		["Idle"] = {
			length = Fixed64(2097152) --[[2]],
			loop = true,
			transitions = {
				[1] = {
					name = "IdleRelax",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(943843) --[[0.9001185]],
					duration = Fixed64(202718) --[[0.1933266]],
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
			length = Fixed64(559241) --[[0.5333334]],
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
			length = Fixed64(3180681) --[[3.033334]],
			loop = false,
			transitions = {
				[1] = {
					name = "Idle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(1037765) --[[0.9896894]],
					duration = Fixed64(32795) --[[0.03127551]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Win"] = {
			length = Fixed64(3635063) --[[3.466667]],
			loop = false,
			transitions = {
			}
		},
		["Start"] = {
			length = Fixed64(4089447) --[[3.9]],
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
			length = Fixed64(699050) --[[0.6666667]],
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
			length = Fixed64(1118481) --[[1.066667]],
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
			length = Fixed64(873813) --[[0.8333334]],
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
			length = Fixed64(314573) --[[0.3]],
			loop = true,
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
		["ChangeTarget"] = {
			length = Fixed64(1118481) --[[1.066667]],
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
		["Attack1"] = {
			length = Fixed64(1747626) --[[1.666667]],
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
				[2] = {
					name = "Attack2",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(945683) --[[0.9018738]],
					duration = Fixed64(105710) --[[0.100813]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "attackChain",
							type = "Int",
							mode = "Equals",
							threshold = Fixed64(2097152) --[[2]],
						},
					}
				},
			}
		},
		["Attack2"] = {
			length = Fixed64(1747626) --[[1.666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Attack3",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(947577) --[[0.9036798]],
					duration = Fixed64(109607) --[[0.1045296]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "attackChain",
							type = "Int",
							mode = "Equals",
							threshold = Fixed64(3145728) --[[3]],
						},
					}
				},
				[2] = {
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
			length = Fixed64(1572864) --[[1.5]],
			loop = true,
			transitions = {
				[1] = {
					name = "Attack4",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(942100) --[[0.8984569]],
					duration = Fixed64(91096) --[[0.08687574]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "attackChain",
							type = "Int",
							mode = "Equals",
							threshold = Fixed64(4194304) --[[4]],
						},
					}
				},
				[2] = {
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
			loop = false,
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
				[2] = {
					name = "Attack5",
					hasExitTime = false,
					hasFixedDuration = true,
					exitTime = Fixed64(946904) --[[0.9030389]],
					duration = Fixed64(95480) --[[0.09105659]],
					offset = Fixed64(0) --[[0]],
					conditions = {
						[1] = {
							parameter = "attackChain",
							type = "Int",
							mode = "Equals",
							threshold = Fixed64(5242880) --[[5]],
						},
					}
				},
			}
		},
		["Attack5"] = {
			length = Fixed64(1922389) --[[1.833333]],
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
			length = Fixed64(1922389) --[[1.833333]],
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
			length = Fixed64(5592405) --[[5.333333]],
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
			length = Fixed64(2796202) --[[2.666667]],
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
		["HitSoft"] = {
			length = Fixed64(873813) --[[0.8333334]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(949472) --[[0.9054877]],
					duration = Fixed64(53282) --[[0.05081308]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["HitFly"] = {
			length = Fixed64(1992295) --[[1.9]],
			loop = false,
			transitions = {
				[1] = {
					name = "IdleBattle",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(768941) --[[0.73332]],
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
					exitTime = Fixed64(786432) --[[0.75]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
			}
		},
		["Rush"] = {
			length = Fixed64(629146) --[[0.6]],
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
			length = Fixed64(629146) --[[0.6]],
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
		["JumpFirst"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "JumpLoop",
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
		["JumpLoop"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "JumpTwice",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(262144) --[[0.25]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
				[2] = {
					name = "JumpFlash",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(262144) --[[0.25]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
				[3] = {
					name = "JumpEnd",
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
		["JumpEnd"] = {
			length = Fixed64(768956) --[[0.7333333]],
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
		["JumpTwice"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "JumpEnd",
					hasExitTime = true,
					hasFixedDuration = true,
					exitTime = Fixed64(655360) --[[0.625]],
					duration = Fixed64(262144) --[[0.25]],
					offset = Fixed64(0) --[[0]],
					conditions = {
					}
				},
				[2] = {
					name = "JumpFlash",
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
		["JumpFlash"] = {
			length = Fixed64(524288) --[[0.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "JumpEnd",
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
	}
}