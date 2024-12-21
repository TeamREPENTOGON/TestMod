local test = REPENTOGON_TEST

local GridEntityTNTTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityTNTTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_TNT):ToTNT()
end

function GridEntityTNTTest:AfterEach(gridentitytnt)
	REPENTOGON_TEST.RemoveGridEntity(gridentitytnt)
end

----------

function GridEntityTNTTest:TestVarFrameCnt(gridentitytnt)
	local framecnt = gridentitytnt.FrameCnt
end


return GridEntityTNTTest
