--StateMachine O_box_40102Controller

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
		["Close_Idle"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Opening",
					hasExitTime = true,
					exitTime = Fixed64(884736) --[[0.84375]],
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
			length = Fixed64(2621440) --[[2.5]],
			loop = false,
			transitions = {
				[1] = {
					name = "Open_Idle",
					hasExitTime = true,
					exitTime = Fixed64(786432) --[[0.75]],
					duration = Fixed64(262144) --[[0.25]],
					conditions = {
					}
				},
			}
		},
		["Open_Idle"] = {
			length = Fixed64(349525) --[[0.3333333]],
			loop = true,
			transitions = {
				[1] = {
					name = "Close_Idle",
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