local test = REPENTOGON_TEST

local GridEntityRockTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityRockTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_ROCK):ToRock()
end

function GridEntityRockTest:AfterEach(gridentityrock)
	REPENTOGON_TEST.RemoveGridEntity(gridentityrock)
end

----------

function GridEntityRockTest:TestGetRubbleAnim(gridentityrock)
	gridentityrock:GetRubbleAnim()
end

function GridEntityRockTest:TestGetSprite(gridentityrock)
	gridentityrock:GetSprite()
end

function GridEntityRockTest:TestSetBigRockFrame(gridentityrock)
	local originalVal = gridentityrock:GetBigRockFrame()
	for _, val in pairs(test.TestNonNegativeInts) do
		gridentityrock:SetBigRockFrame(val)
		test.AssertEquals(gridentityrock:GetBigRockFrame(), val)
	end
	gridentityrock:SetBigRockFrame(originalVal)
end

function GridEntityRockTest:TestUpdateAnimFrame(gridentityrock)
	gridentityrock:UpdateAnimFrame()
end

function GridEntityRockTest:TestGetAltRockType(gridentityrock)
	local backdrop = 1
	gridentityrock:GetAltRockType(backdrop)
end

function GridEntityRockTest:TestPlayBreakSound(gridentityrock)
	local gridentitytype = 1
	local backdrop = 1
	gridentityrock:PlayBreakSound(gridentitytype, backdrop)
end

function GridEntityRockTest:TestRegisterRockDestroyed(gridentityrock)
	local gridentitytype = 1
	gridentityrock:RegisterRockDestroyed(gridentitytype)
end

function GridEntityRockTest:TestRenderTop(gridentityrock)
	local offset = Vector(1,1)
	gridentityrock:RenderTop(offset)
end

function GridEntityRockTest:TestSpawnDrops(gridentityrock)
	local position = Vector(1,1)
	local gridentitytype = 1
	local gridvariant = 1
	local seed = 1
	local unknown = true
	local backdrop = 1
	GridEntityRock.SpawnDrops(position, gridentitytype, gridvariant, seed, unknown, backdrop)
end

function GridEntityRockTest:TestTrySpawnLadder(gridentityrock)
	gridentityrock:TrySpawnLadder()
end

function GridEntityRockTest:TestTrySpawnWorms(gridentityrock)
	gridentityrock:TrySpawnWorms()
end

function GridEntityRockTest:TestUpdateCollision(gridentityrock)
	gridentityrock:UpdateCollision()
end

function GridEntityRockTest:TestUpdateNeighbors(gridentityrock)
	gridentityrock:UpdateNeighbors()
end

function GridEntityRockTest:TestVarAnim(gridentityrock)
	local originalVal = gridentityrock.Anim
	for _, val in pairs(test.TestStrings) do
		gridentityrock.Anim = val
		test.AssertEquals(gridentityrock.Anim, val)
	end
	gridentityrock.Anim = originalVal
end

function GridEntityRockTest:TestVarFrameCnt(gridentityrock)
	local originalVal = gridentityrock.FrameCnt
	for _, val in pairs(test.TestInts) do
		gridentityrock.FrameCnt = val
		test.AssertEquals(gridentityrock.FrameCnt, val)
	end
	gridentityrock.FrameCnt = originalVal
end

function GridEntityRockTest:TestVarRubbleAnim(gridentityrock)
	local originalVal = gridentityrock.RubbleAnim
	for _, val in pairs(test.TestStrings) do
		gridentityrock.RubbleAnim = val
		test.AssertEquals(gridentityrock.RubbleAnim, val)
	end
	gridentityrock.RubbleAnim = originalVal
end


return GridEntityRockTest
