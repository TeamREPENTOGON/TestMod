local test = REPENTOGON_TEST

local GridEntityPitTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityPitTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_PIT):ToPit()
end

function GridEntityPitTest:AfterEach(gridentitypit)
	REPENTOGON_TEST.RemoveGridEntity(gridentitypit)
end

----------

function GridEntityPitTest:TestMakeBridge(gridentitypit)
	local parententity = REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_ROCK)
	gridentitypit:MakeBridge(parententity)
end

function GridEntityPitTest:TestSetLadder(gridentitypit)
	local value = true
	gridentitypit:SetLadder(value)
end

function GridEntityPitTest:TestUpdateCollision(gridentitypit)
	gridentitypit:UpdateCollision()
end

function GridEntityPitTest:TestVarHasLadder(gridentitypit)
	local originalVal = gridentitypit.HasLadder
	gridentitypit.HasLadder = true
	gridentitypit.HasLadder = originalVal
end


return GridEntityPitTest
