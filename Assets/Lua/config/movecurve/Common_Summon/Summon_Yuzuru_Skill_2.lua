--MoveCurve
--Common_Summon/Summon_Yuzuru_Skill_2 Summon_Yuzuru_Skill_2

return
{
	filePath = "Common_Summon/Summon_Yuzuru_Skill_2",
	startTime = Fixed64(1048576) --[[1]],
	startRealTime = Fixed64(41943) --[[0.04]],
	endTime = Fixed64(78643200) --[[75]],
	endRealTime = Fixed64(3145728) --[[3]],
	isZoom = false,
	isCompensate = false,
	curve = {
		[1] = {
			time = 0 --[[0]],
			value = 0 --[[0]],
			inTangent = 16777216 --[[16]],
			outTangent = 16777216 --[[16]],
		},
		[2] = {
			time = 786432 --[[0.75]],
			value = 12582912 --[[12]],
			inTangent = 16777216 --[[16]],
			outTangent = 16777216 --[[16]],
		},
	},
}