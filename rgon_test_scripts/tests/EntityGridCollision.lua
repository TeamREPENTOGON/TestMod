local test = REPENTOGON_TEST

local EntityGridCollisionTest = {}

local function TestGridCollisionCallbacks(entityType, entityVariant, updatecallback, precallback, postcallback, entityGridCollisionClass, gridEntityType)
	local testEntity

	-- Get or spawn the entity for the test.
	if entityType == EntityType.ENTITY_PLAYER then
		testEntity = Isaac.GetPlayer()
	else
		testEntity = Isaac.Spawn(entityType, entityVariant, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
		testEntity:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
		testEntity:Update()
	end

	-- Find a valid grid index for the test, with either an appropriate grid entity (or lack thereof) or space to spawn one.
	local testGridEnt
	local testIdx = 0

	while testIdx <= Game():GetRoom():GetGridSize() do
		local existingGridEnt = Game():GetRoom():GetGridEntity(testIdx)
		if not existingGridEnt then
			if not gridEntityType then break end
			Game():GetRoom():SpawnGridEntity(testIdx, gridEntityType, 0, 1234, 0)
			if Game():GetRoom():GetGridEntity(testIdx) then
				testGridEnt = Game():GetRoom():GetGridEntity(testIdx)
				break
			end
		elseif existingGridEnt:GetType() == gridEntityType then
			testGridEnt = existingGridEnt
			break
		end
		testIdx = testIdx + 1
	end

	test.AssertTrue((gridEntityType == nil) == (testGridEnt == nil))

	-- For tests without a grid entity, make the grid index itself solid.
	if not testGridEnt and entityGridCollisionClass ~= EntityGridCollisionClass.GRIDCOLL_PITSONLY then
		Game():GetRoom():SetGridPath(testIdx, 4000)
	end

	testEntity.GridCollisionClass = entityGridCollisionClass
	testEntity.Position = Game():GetRoom():GetGridPosition(testIdx)
	testEntity.Velocity = Vector.Zero

	local param = testEntity:ToNPC() and testEntity.Type or testEntity.Variant

	test:AddOneTimeCallback(precallback, function(_, entity, idx, gridEntity)
		test.AssertEquals(idx, testIdx)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(testEntity))
		if testGridEnt then
			test.AssertEquals(idx, gridEntity:GetGridIndex())
			test.AssertEquals(idx, testGridEnt:GetGridIndex())
			test.AssertEquals(GetPtrHash(gridEntity), GetPtrHash(testGridEnt))
		else
			test.AssertNil(gridEntity)
		end
	end, param)

	test:AddOneTimeCallback(postcallback, function(_, entity, idx, gridEntity)
		test.AssertEquals(idx, testIdx)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(testEntity))
		if testGridEnt then
			test.AssertEquals(idx, gridEntity:GetGridIndex())
			test.AssertEquals(idx, testGridEnt:GetGridIndex())
			test.AssertEquals(GetPtrHash(gridEntity), GetPtrHash(testGridEnt))
		else
			test.AssertNil(gridEntity)
		end
	end, param)

	-- Prevent the entity from updating to avoid unintentional behaviours like its grid collision class changing.
	test:AddOneTimeCallback(updatecallback, function(_, entity)
		return true
	end, param)

	-- Run a room update to trigger grid collisions.
	Game():GetRoom():Update()

	if testGridEnt then
		--test.RemoveGridEntity(testGridEnt)  -- Causes more issues than it solves
	else
		Game():GetRoom():SetGridPath(testIdx, 0)
	end

	if entityType ~= EntityType.ENTITY_PLAYER then
		testEntity:Remove()
	end
end

local ENTITIES = {
	Player = {
		Type = EntityType.ENTITY_PLAYER,
		Update = ModCallbacks.MC_PRE_PLAYER_UPDATE,
		Pre = ModCallbacks.MC_PRE_PLAYER_GRID_COLLISION,
		Post = ModCallbacks.MC_PLAYER_GRID_COLLISION,
	},
	Tear = {
		Type = EntityType.ENTITY_TEAR,
		Update = ModCallbacks.MC_PRE_TEAR_UPDATE,
		Pre = ModCallbacks.MC_PRE_TEAR_GRID_COLLISION,
		Post = ModCallbacks.MC_TEAR_GRID_COLLISION,
	},
	Familiar = {
		Type = EntityType.ENTITY_FAMILIAR,
		Variant = FamiliarVariant.BROTHER_BOBBY,
		Update = ModCallbacks.MC_PRE_FAMILIAR_UPDATE,
		Pre = ModCallbacks.MC_PRE_FAMILIAR_GRID_COLLISION,
		Post = ModCallbacks.MC_FAMILIAR_GRID_COLLISION,
	},
	Bomb = {
		Type = EntityType.ENTITY_BOMB,
		Update = ModCallbacks.MC_PRE_BOMB_UPDATE,
		Pre = ModCallbacks.MC_PRE_BOMB_GRID_COLLISION,
		Post = ModCallbacks.MC_BOMB_GRID_COLLISION,
	},
	Pickup = {
		Type = EntityType.ENTITY_PICKUP,
		Variant = PickupVariant.PICKUP_COIN,
		Update = ModCallbacks.MC_PRE_PICKUP_UPDATE,
		Pre = ModCallbacks.MC_PRE_PICKUP_GRID_COLLISION,
		Post = ModCallbacks.MC_PICKUP_GRID_COLLISION,
	},
	Projectile = {
		Type = EntityType.ENTITY_PROJECTILE,
		Update = ModCallbacks.MC_PRE_PROJECTILE_UPDATE,
		Pre = ModCallbacks.MC_PRE_PROJECTILE_GRID_COLLISION,
		Post = ModCallbacks.MC_PROJECTILE_GRID_COLLISION,
	},
	Npc = {
		Type = EntityType.ENTITY_GAPER,
		Update = ModCallbacks.MC_PRE_NPC_UPDATE,
		Pre = ModCallbacks.MC_PRE_NPC_GRID_COLLISION,
		Post = ModCallbacks.MC_NPC_GRID_COLLISION,
	},
}

local TESTS = {
	Ground = {
		EntityGridCollisionClass = EntityGridCollisionClass.GRIDCOLL_GROUND,
		GridEntityType = GridEntityType.GRID_ROCK,
		TestNoGrid = true, TestPlayer = true,
	},
	Bullet = {
		EntityGridCollisionClass = EntityGridCollisionClass.GRIDCOLL_BULLET,
		GridEntityType = GridEntityType.GRID_ROCK,
		TestNoGrid = false, TestPlayer = false,
	},
	NoPits = {
		EntityGridCollisionClass = EntityGridCollisionClass.GRIDCOLL_NOPITS,
		GridEntityType = GridEntityType.GRID_ROCK,
		TestNoGrid = true, TestPlayer = false,
	},
	PitsOnly = {
		EntityGridCollisionClass = EntityGridCollisionClass.GRIDCOLL_PITSONLY,
		GridEntityType = GridEntityType.GRID_DECORATION,
		TestNoGrid = true, TestPlayer = false,
	},
	Walls = {
		EntityGridCollisionClass = EntityGridCollisionClass.GRIDCOLL_WALLS,
		GridEntityType = GridEntityType.GRID_PILLAR,
		TestNoGrid = false, TestPlayer = true,
	},
}

for entityname, entityinfo in pairs(ENTITIES) do
	local eType = entityinfo.Type
	local eVar = entityinfo.Variant or 0
	for testname, testinfo in pairs(TESTS) do
		local eGridColClass = testinfo.EntityGridCollisionClass
		local gridEntType = testinfo.GridEntityType
		local doNoGridEntityTest = testinfo.TestNoGrid
		local doPlayerTest = testinfo.TestPlayer
		if eType ~= EntityType.ENTITY_PLAYER or doPlayerTest then
			EntityGridCollisionTest["Test"..entityname.."GridCollision"..testname] = function()
				TestGridCollisionCallbacks(eType, eVar, entityinfo.Update, entityinfo.Pre, entityinfo.Post, eGridColClass, gridEntType)
			end
			if doNoGridEntityTest then
				EntityGridCollisionTest["Test"..entityname.."GridCollision"..testname.."NoGridEntity"] = function()
					TestGridCollisionCallbacks(eType, eVar, entityinfo.Update, entityinfo.Pre, entityinfo.Post, eGridColClass)
				end
			end
		end
	end
end

return EntityGridCollisionTest
