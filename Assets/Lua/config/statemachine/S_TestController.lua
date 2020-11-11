--StateMachine S_TestController

return
{
	defaultState = "Idle",
	parameters = {
	},
	anyStates = {
	},
	stateMap = {
		["Idle"] = {
			length = Fixed64(4194304) --[[4]],
			loop = true,
			transitions = {
			}
		},
		["Skill2"] = {
			length = Fixed64(1083529) --[[1.033333]],
			loop = false,
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