local test = REPENTOGON_TEST

local GridEntityPressurePlateTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityPressurePlateTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_PRESSURE_PLATE):ToPressurePlate()
end

function GridEntityPressurePlateTest:AfterEach(gridentitypressureplate)
	REPENTOGON_TEST.RemoveGridEntity(gridentitypressureplate)
end

----------

function GridEntityPressurePlateTest:TestReward(gridentitypressureplate)
	gridentitypressureplate:Reward()
end

function GridEntityPressurePlateTest:TestVarGreedModeRNG(gridentitypressureplate)
	local originalVal = gridentitypressureplate.GreedModeRNG
	gridentitypressureplate.GreedModeRNG = RNG()
	gridentitypressureplate.GreedModeRNG = originalVal
end

function GridEntityPressurePlateTest:TestVarNextGreedAnimation(gridentitypressureplate)
	local originalVal = gridentitypressureplate.NextGreedAnimation
	for _, val in pairs(test.TestStrings) do
		gridentitypressureplate.NextGreedAnimation = val
		test.AssertEquals(gridentitypressureplate.NextGreedAnimation, val)
	end
	gridentitypressureplate.NextGreedAnimation = originalVal
end

function GridEntityPressurePlateTest:TestVarTimerPlate(gridentitypressureplate)
	local originalVal = gridentitypressureplate.TimerPlate
	gridentitypressureplate.TimerPlate = test.GetTestSprite()
	gridentitypressureplate.TimerPlate = originalVal
end


return GridEntityPressurePlateTest
