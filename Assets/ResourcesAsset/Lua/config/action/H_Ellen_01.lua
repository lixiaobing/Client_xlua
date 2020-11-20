--action event pack
--H_Ellen_01

return
{
	
	["Attack1"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Ellen/curve_Attack1"
		},
		[2] = {
			type = "Sound",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			volume = Fixed64(629146) --[[0.6]],
			mute = false,
			akEventName = ""
		},
		[3] = {
			type = "AttackWindow",
			time = Fixed64(52428800) --[[50]],
			realTime = Fixed64(524288) --[[0.5]],
			toggle = true,
			isClear = false
		}
	},
	["Attack2"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Ellen/curve_Attack2"
		},
		[2] = {
			type = "AttackWindow",
			time = Fixed64(57671680) --[[55]],
			realTime = Fixed64(576717) --[[0.55]],
			toggle = true,
			isClear = false
		}
	},
	["Attack3"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(10485760) --[[10]],
			realTime = Fixed64(115343) --[[0.11]],
			filePath = "H_Ellen/curve_Attack3"
		},
		[2] = {
			type = "AttackWindow",
			time = Fixed64(60607692) --[[57.8]],
			realTime = Fixed64(666685) --[[0.6358]],
			toggle = true,
			isClear = false
		}
	},
	["Attack4"] = {
		[1] = {
			type = "AttackWindow",
			time = Fixed64(73400320) --[[70]],
			realTime = Fixed64(1223338) --[[1.166667]],
			toggle = true,
			isClear = false
		}
	},
	["Attack5"] = {
		[1] = {
			type = "Forward",
			time = Fixed64(0) --[[0]],
			realTime = Fixed64(0) --[[0]],
			filePath = "H_Ellen/curve_Attack5"
		}
	}
}