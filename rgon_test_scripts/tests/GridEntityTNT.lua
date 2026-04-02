local test = REPENTOGON_TEST

local GridEntityTNTTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityTNTTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_TNT):ToTNT()
end

function GridEntityTNTTest:AfterEach(gridentitytnt)
	REPENTOGON_TEST.RemoveGridEntity(gridentitytnt)
end

----------

function GridEntityTNTTest:TestHurt(gridtnt)
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 1)
		test.AssertEquals(source.Type, 0)
		return 2
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 2)
		test.AssertEquals(source.Type, 0)
	end)

	test.AssertTrue(gridtnt:Hurt(1))
end

function GridEntityTNTTest:TestHurtWithSource(gridtnt)
	local player = Isaac.GetPlayer()
	local ref = EntityRef(player)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 1)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
		return 2
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 2)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
	end)

	gridtnt:HurtWithSource(1, ref)
end

function GridEntityTNTTest:TestHurtCancel(gridtnt)
	local player = Isaac.GetPlayer()
	local ref = EntityRef(player)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 4)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
		return false
	end)
	test:AddUnexpectedCallback(ModCallbacks.MC_POST_GRID_HURT)

	gridtnt:HurtWithSource(4, ref)
end

function GridEntityTNTTest:TestDestroy(gridtnt)
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 4)
		test.AssertEquals(source.Type, 0)
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 4)
		test.AssertEquals(source.Type, 0)
	end)

	test.AssertTrue(gridtnt:Destroy(false))
end

function GridEntityTNTTest:TestDestroyWithSource(gridtnt)
	local player = Isaac.GetPlayer()
	local ref = EntityRef(player)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 4)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_GRID_HURT, function(_, grid, damage, source)
		test.AssertEquals(GetPtrHash(grid), GetPtrHash(gridtnt))
		test.AssertEquals(damage, 4)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(player))
	end)

	test.AssertTrue(gridtnt:DestroyWithSource(false, ref))
end

function GridEntityTNTTest:TestVarFrameCnt(gridentitytnt)
	local framecnt = gridentitytnt.FrameCnt
end


return GridEntityTNTTest
