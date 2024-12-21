local test = REPENTOGON_TEST

local PathFinderTest = {}

function PathFinderTest:BeforeEach()
	local pathfinderFly = Isaac.FindByType(13)[1] or Isaac.Spawn(13, 0, 0, Isaac.GetPlayer().Position, Vector.Zero, nil)
	return pathfinderFly:ToNPC().Pathfinder
end

function PathFinderTest:AfterEach(pathfinder)
	
end

----------

function PathFinderTest:TestEvadeTarget(pathfinder)
	local targetpos = Vector(1,1)
	pathfinder:EvadeTarget(targetpos)
end

function PathFinderTest:TestFindGridPath(pathfinder)
	local pos = Vector(1,1)
	local speed = 1
	local pathmarker = 1
	local usedirectpath = true
	pathfinder:FindGridPath(pos, speed, pathmarker, usedirectpath)
end

function PathFinderTest:TestGetEvadeMovementCountdown(pathfinder)
	pathfinder:GetEvadeMovementCountdown()
end

function PathFinderTest:TestGetGridIndex(pathfinder)
	pathfinder:GetGridIndex()
end

function PathFinderTest:TestHasDirectPath(pathfinder)
	pathfinder:HasDirectPath()
end

function PathFinderTest:TestHasPathToPos(pathfinder)
	local pos = Vector(1,1)
	local ignorepoop = true
	pathfinder:HasPathToPos(pos, ignorepoop)
end

function PathFinderTest:TestMoveRandomly(pathfinder)
	local ignorestatuseffects = true
	pathfinder:MoveRandomly(ignorestatuseffects)
end

function PathFinderTest:TestMoveRandomlyAxisAligned(pathfinder)
	local speed = 1
	local ignorestatuseffects = true
	pathfinder:MoveRandomlyAxisAligned(speed, ignorestatuseffects)
end

function PathFinderTest:TestMoveRandomlyBoss(pathfinder)
	local ignorestatuseffects = true
	pathfinder:MoveRandomlyBoss(ignorestatuseffects)
end

function PathFinderTest:TestReset(pathfinder)
	pathfinder:Reset()
end

function PathFinderTest:TestResetMovementTarget(pathfinder)
	pathfinder:ResetMovementTarget()
end

function PathFinderTest:TestSetCanCrushRocks(pathfinder)
	local value = true
	pathfinder:SetCanCrushRocks(value)
end

function PathFinderTest:TestUpdateGridIndex(pathfinder)
	pathfinder:UpdateGridIndex()
end


return PathFinderTest
