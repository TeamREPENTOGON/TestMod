local test = REPENTOGON_TEST

local GridEntityPoopTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityPoopTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_POOP):ToPoop()
end

function GridEntityPoopTest:AfterEach(gridentitypoop)
	REPENTOGON_TEST.RemoveGridEntity(gridentitypoop)
end

----------

function GridEntityPoopTest:TestReduceSpawnRate(gridentitypoop)
	gridentitypoop:ReduceSpawnRate()
end

function GridEntityPoopTest:TestRespawnRedPoop(gridentitypoop)
	gridentitypoop:RespawnRedPoop()
end

function GridEntityPoopTest:TestVarReviveTimer(gridentitypoop)
	local originalVal = gridentitypoop.ReviveTimer
	for _, val in pairs(test.TestInts) do
		gridentitypoop.ReviveTimer = val
		test.AssertEquals(gridentitypoop.ReviveTimer, val)
	end
	gridentitypoop.ReviveTimer = originalVal
end

function GridEntityPoopTest:TestVarStateAnimation(gridentitypoop)
	local originalVal = gridentitypoop.StateAnimation
	for _, val in pairs(test.TestStrings) do
		gridentitypoop.StateAnimation = val
		test.AssertEquals(gridentitypoop.StateAnimation, val)
	end
	gridentitypoop.StateAnimation = originalVal
end

function GridEntityPoopTest:TestVarUnderPlayer(gridentitypoop)
	local originalVal = gridentitypoop.UnderPlayer
	gridentitypoop.UnderPlayer = true
	gridentitypoop.UnderPlayer = originalVal
end


return GridEntityPoopTest
