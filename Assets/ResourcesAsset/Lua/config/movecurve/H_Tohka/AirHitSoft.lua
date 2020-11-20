--MoveCurve
--H_Tohka/AirHitSoft AirHitSoft

return
{
	filePath = "H_Tohka/AirHitSoft",
	startTime = Fixed64(0) --[[0]],
	startRealTime = Fixed64(0) --[[0]],
	endTime = Fixed64(12582912) --[[12]],
	endRealTime = Fixed64(125829) --[[0.12]],
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