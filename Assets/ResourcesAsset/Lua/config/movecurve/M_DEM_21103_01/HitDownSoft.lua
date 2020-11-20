--MoveCurve
--M_DEM_21103_01/HitDownSoft HitDownSoft

return
{
	filePath = "M_DEM_21103_01/HitDownSoft",
	startTime = Fixed64(0) --[[0]],
	startRealTime = Fixed64(0) --[[0]],
	endTime = Fixed64(5242880) --[[5]],
	endRealTime = Fixed64(104858) --[[0.1]],
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