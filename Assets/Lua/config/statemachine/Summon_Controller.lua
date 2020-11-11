--StateMachine Summon_Controller

return
{
	defaultState = "Empty",
	parameters = {
	},
	anyStates = {
	},
	stateMap = {
		["Empty"] = {
			length = Fixed64(4194304) --[[4]],
			loop = true,
			transitions = {
			}
		},
		["Yuzuru_Skill_2"] = {
			length = Fixed64(4194304) --[[4]],
			loop = true,
			transitions = {
			}
		},
	}
}