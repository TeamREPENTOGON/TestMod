local test = REPENTOGON_TEST

local PathFinderFamiliarTest = include(REPENTOGON_TEST.TestsRoot .. "PathFinder")

function PathFinderFamiliarTest:BeforeEach()
	local pathfinderFamiliar = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, 1)[1] or Isaac.Spawn(EntityType.ENTITY_FAMILIAR, 1, 0, Isaac.GetPlayer().Position, Vector.Zero, nil)
	return pathfinderFamiliar:ToFamiliar():GetPathFinder()
end

return PathFinderFamiliarTest
