--SummonSet
--summon/Yuzuru_Skill_2--Yuzuru_Skill_2

return
{
	prefab = "Common_Summon (UnityEngine.GameObject)",
	path = "Model/Summon/Common_Summon",
	luaPath = "summon/Yuzuru_Skill_2",
	controller = "Summon_Controller",
	action = "Yuzuru_Skill_2",
	skillId = 40100522,
	lifeTime = Fixed64(3145728) --[[3]],
	targetFirst = true,
	bornTarget = {
		position = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
		angle = Fixed64(0) --[[0]],
		checkRadius = Fixed64(1572864) --[[1.5]],
	},
	bornOwner = {
		position = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
		angle = Fixed64(0) --[[0]],
		checkRadius = Fixed64(1572864) --[[1.5]],
	},
}