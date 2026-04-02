local test = REPENTOGON_TEST

local GridEntityPoopTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityPoopTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_POOP):ToPoop()
end

function GridEntityPoopTest:AfterEach(gridentitypoop)
	REPENTOGON_TEST.RemoveGridEntity(gridentitypoop)
end

----------

function GridEntityPoopTest:TestHurt(gridpoop)
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 1)
		test.AssertEquals(source.Type, 0)
		return 2
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 2)
		test.AssertEquals(source.Type, 0)
	end)

	test.AssertTrue(gridpoop:Hurt(1))
end

function GridEntityPoopTest:TestHurtWithSource(gridpoop)
	local player = Isaac.GetPlayer()
	local ref = EntityRef(player)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 1)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
		return 2
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 2)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
	end)

	gridpoop:HurtWithSource(1, ref)
end

function GridEntityPoopTest:TestHurtCancel(gridpoop)
	local player = Isaac.GetPlayer()
	local ref = EntityRef(player)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 4)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
		return false
	end)
	test:AddUnexpectedCallback(ModCallbacks.MC_POST_GRID_HURT)

	gridpoop:HurtWithSource(4, ref)
end

function GridEntityPoopTest:TestDestroy(gridpoop)
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 4)
		test.AssertEquals(source.Type, 0)
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 4)
		test.AssertEquals(source.Type, 0)
	end)

	test.AssertTrue(gridpoop:Destroy(false))
end

function GridEntityPoopTest:TestDestroyWithSource(gridpoop)
	local player = Isaac.GetPlayer()
	local ref = EntityRef(player)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 4)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridpoop))
		test.AssertEquals(damage, 4)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
	end)

	test.AssertTrue(gridpoop:DestroyWithSource(false, ref))
end

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
