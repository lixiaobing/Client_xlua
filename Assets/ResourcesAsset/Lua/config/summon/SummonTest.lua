--SummonSet
--summon/SummonTest--SummonTest

return
{
	prefab = "S_Test (UnityEngine.GameObject)",
	path = "Model/Summon/S_Test",
	luaPath = "summon/SummonTest",
	controller = "S_TestController",
	action = "Skill2",
	skillId = 40100322,
	lifeTime = Fixed64(1048576) --[[1]],
	targetFirst = true,
	bornTarget = {
		position = FixedVector3(0, 0, 0) --[[(0, 0, 0)]],
		angle = Fixed64(0) --[[0]],
		checkRadius = Fixed64(0) --[[0]],
	},
	bornOwner = {
		position = FixedVector3(0, 0, 3145728) --[[(0, 0, 3)]],
		angle = Fixed64(188743680) --[[180]],
		checkRadius = Fixed64(5242880) --[[5]],
	},
}