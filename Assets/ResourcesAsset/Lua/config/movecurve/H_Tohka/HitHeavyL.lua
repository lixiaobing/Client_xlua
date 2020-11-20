--MoveCurve
--H_Tohka/HitHeavyL HitHeavyL

return
{
	filePath = "H_Tohka/HitHeavyL",
	startTime = Fixed64(0) --[[0]],
	startRealTime = Fixed64(0) --[[0]],
	endTime = Fixed64(15728640) --[[15]],
	endRealTime = Fixed64(209716) --[[0.2]],
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