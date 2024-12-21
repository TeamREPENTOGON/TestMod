local test = REPENTOGON_TEST

local GridEntitySpikesTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntitySpikesTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_SPIKES):ToSpikes()
end

function GridEntitySpikesTest:AfterEach(gridentityspikes)
	REPENTOGON_TEST.RemoveGridEntity(gridentityspikes)
end

----------

function GridEntitySpikesTest:TestVarTimeout(gridentityspikes)
	local originalVal = gridentityspikes.Timeout
	for _, val in pairs(test.TestInts) do
		gridentityspikes.Timeout = val
		test.AssertEquals(gridentityspikes.Timeout, val)
	end
	gridentityspikes.Timeout = originalVal
end


return GridEntitySpikesTest
