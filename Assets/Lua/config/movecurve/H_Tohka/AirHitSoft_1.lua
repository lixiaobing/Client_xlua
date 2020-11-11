--MoveCurve
--H_Tohka/AirHitSoft_1 AirHitSoft_1

return
{
	filePath = "H_Tohka/AirHitSoft_1",
	startTime = Fixed64(0) --[[0]],
	startRealTime = Fixed64(0) --[[0]],
	endTime = Fixed64(31457280) --[[30]],
	endRealTime = Fixed64(524288) --[[0.5]],
	isZoom = true,
	isCompensate = false,
	curve = {
		[1] = {
			time = 0 --[[0]],
			value = 0 --[[0]],
			inTangent = 1048576 --[[1]],
			outTangent = 1048576 --[[1]],
		},
		[2] = {
			time = 1048576 --[[1]],
			value = 1048576 --[[1]],
			inTangent = 1048576 --[[1]],
			outTangent = 1048576 --[[1]],
		},
	},
}