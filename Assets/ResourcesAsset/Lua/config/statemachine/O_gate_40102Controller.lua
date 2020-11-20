--StateMachine O_gate_40102Controller

return
{
	defaultState = "Close_Idle",
	parameters = {
		["opened"] = {
			type = "Bool",
			defaultBool = false,
			defaultInt = Fixed64(0) --[[0]],
			defaultFloat = Fixed64(0) --[[0]]
		},
	},
	anyStates = {
	},
	stateMap = {
		["Close_idle"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Opening",
					hasExitTime = true,
					exitTime = Fixed64(262144) --[[0.25]],
					duration = Fixed64(262144) --[[0.25]],
					conditions = {
						[1] = {
							parameter = "opened",
							type = "Bool",
							mode = "If",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
		["Opening"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Opening_idle",
					hasExitTime = true,
					exitTime = Fixed64(734004) --[[0.7]],
					duration = Fixed64(262144) --[[0.25]],
					conditions = {
					}
				},
			}
		},
		["Closing"] = {
			length = Fixed64(699050) --[[0.6666667]],
			loop = false,
			transitions = {
				[1] = {
					name = "Close_Idle",
					hasExitTime = true,
					exitTime = Fixed64(734004) --[[0.7]],
					duration = Fixed64(262144) --[[0.25]],
					conditions = {
					}
				},
			}
		},
		["Opening_idle"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Closing",
					hasExitTime = true,
					exitTime = Fixed64(262144) --[[0.25]],
					duration = Fixed64(262144) --[[0.25]],
					conditions = {
						[1] = {
							parameter = "opened",
							type = "Bool",
							mode = "IfNot",
							threshold = Fixed64(0) --[[0]],
						},
					}
				},
			}
		},
	}
}