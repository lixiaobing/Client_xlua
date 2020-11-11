--MoveCurve
--H_Yuzuru/RunStop RunStop

return
{
	filePath = "H_Yuzuru/RunStop",
	startTime = Fixed64(0) --[[0]],
	startRealTime = Fixed64(0) --[[0]],
	endTime = Fixed64(104857600) --[[100]],
	endRealTime = Fixed64(1258292) --[[1.2]],
	isZoom = false,
	isCompensate = false,
	curve = {
		[1] = {
			time = 0 --[[0]],
			value = 0 --[[0]],
			inTangent = 524288 --[[0.5]],
			outTangent = 524288 --[[0.5]],
		},
		[2] = {
			time = 1048576 --[[1]],
			value = 524288 --[[0.5]],
			inTangent = 524288 --[[0.5]],
			outTangent = 524288 --[[0.5]],
		},
	},
}