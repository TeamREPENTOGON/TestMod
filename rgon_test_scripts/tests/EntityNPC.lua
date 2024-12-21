local test = REPENTOGON_TEST

local EntityNPCTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")
EntityNPCTest.TestCanShutDoors = nil

function EntityNPCTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToNPC()
end

function EntityNPCTest:AfterEach(entitynpc)
	entitynpc:Remove()
end

----------

function EntityNPCTest:TestAnimWalkFrame(entitynpc)
	local horizontalanim = "hello"
	local verticalanim = "hello"
	local speedthreshold = 1
	entitynpc:AnimWalkFrame(horizontalanim, verticalanim, speedthreshold)
end

function EntityNPCTest:TestCalcTargetPosition(entitynpc)
	local distancelimit = 1
	entitynpc:CalcTargetPosition(distancelimit)
end

function EntityNPCTest:TestCanBeDamagedFromVelocity(entitynpc)
	local velocity = Vector(1,1)
	entitynpc:CanBeDamagedFromVelocity(velocity)
end

function EntityNPCTest:TestCanReroll(entitynpc)
	entitynpc:CanReroll()
end

function EntityNPCTest:TestFireBossProjectiles(entitynpc)
	local numprojectiles = 1
	local targetpos = Vector(1,1)
	local trajectorymodifier = 1
	local params = ProjectileParams()
	entitynpc:FireBossProjectiles(numprojectiles, targetpos, trajectorymodifier, params)
end

function EntityNPCTest:TestFireProjectiles(entitynpc)
	local pos = Vector(1,1)
	local velocity = Vector(1,1)
	local mode = 1
	local params = ProjectileParams()
	entitynpc:FireProjectiles(pos, velocity, mode, params)
end

function EntityNPCTest:TestGetAliveEnemyCount(entitynpc)
	entitynpc:GetAliveEnemyCount()
end

function EntityNPCTest:TestGetBossColorIdx(entitynpc)
	entitynpc:GetBossColorIdx()
end

function EntityNPCTest:TestGetChampionColorIdx(entitynpc)
	entitynpc:GetChampionColorIdx()
end

function EntityNPCTest:TestGetPlayerTarget(entitynpc)
	entitynpc:GetPlayerTarget()
end

function EntityNPCTest:TestIsBoss(entitynpc)
	entitynpc:IsBoss()
end

function EntityNPCTest:TestIsChampion(entitynpc)
	entitynpc:IsChampion()
end

function EntityNPCTest:TestKillUnique(entitynpc)
	entitynpc:KillUnique()
end

function EntityNPCTest:TestMakeChampion(entitynpc)
	local seed = 1
	local championcoloridx = 1
	local init = true
	entitynpc:MakeChampion(seed, championcoloridx, init)
end

function EntityNPCTest:TestMakeSplat(entitynpc)
	local size = 1
	entitynpc:MakeSplat(size)
end

function EntityNPCTest:TestMorph(entitynpc)
	entitynpc:Morph(13, 0, 0, -1)
end

function EntityNPCTest:TestPlaySound(entitynpc)
	local id = 1
	local volume = 1
	local framedelay = 1
	local loop = true
	local pitch = 1
	entitynpc:PlaySound(id, volume, framedelay, loop, pitch)
end

function EntityNPCTest:TestQueryNPCsGroup(entitynpc)
	local groupidx = 1
	entitynpc:QueryNPCsGroup(groupidx)
end

function EntityNPCTest:TestQueryNPCsSpawnerType(entitynpc)
	local spawnertype = 1
	local entitytype = 1
	local onlyenemies = true
	entitynpc:QueryNPCsSpawnerType(spawnertype, entitytype, onlyenemies)
end

function EntityNPCTest:TestQueryNPCsType(entitynpc)
	local entitytype = 1
	local variant = 1
	entitynpc:QueryNPCsType(entitytype, variant)
end

function EntityNPCTest:TestResetPathFinderTarget(entitynpc)
	entitynpc:ResetPathFinderTarget()
end

function EntityNPCTest:TestThrowSpider(entitynpc)
	local position = Vector(1,1)
	local spawner = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local targetpos = Vector(1,1)
	local big = true
	local yoffset = 1
	EntityNPC.ThrowSpider(position, spawner, targetpos, big, yoffset)
	spawner:Remove()
end

function EntityNPCTest:TestGetPathfinder(entitynpc)
	entitynpc:GetPathfinder()
end

function EntityNPCTest:TestClearFlyingOverride(entitynpc)
	entitynpc:ClearFlyingOverride()
end

function EntityNPCTest:TestFireBossProjectilesEx(entitynpc)
	local numprojectiles = 1
	local targetpos = Vector(1,1)
	local trajectorymodifier = 1
	local params = ProjectileParams()
	entitynpc:FireBossProjectilesEx(numprojectiles, targetpos, trajectorymodifier, params)
end

function EntityNPCTest:TestFireGridEntity(entitynpc)
	local gridEntity = REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_ROCK)
	entitynpc:FireGridEntity(gridEntity:GetSprite(), gridEntity.Desc, Vector(10,0), BackdropType.BASEMENT)
end

function EntityNPCTest:TestFireProjectilesEx(entitynpc)
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local mode = 1
	local params = ProjectileParams()
	entitynpc:FireProjectilesEx(position, velocity, mode, params)
end

function EntityNPCTest:TestGetControllerId(entitynpc)
	entitynpc:GetControllerId()
end

function EntityNPCTest:TestGetDarkRedChampionRegenTimer(entitynpc)
	entitynpc:GetDarkRedChampionRegenTimer()
end

function EntityNPCTest:TestGetDirtColor(entitynpc)
	entitynpc:GetDirtColor()
end

function EntityNPCTest:TestGetFireplaceLoot(entitynpc)
	entitynpc:GetFireplaceLoot()
end

function EntityNPCTest:TestGetFlyingOverride(entitynpc)
	entitynpc:GetFlyingOverride()
end

function EntityNPCTest:TestGetHitList(entitynpc)
	entitynpc:GetHitList()
end

function EntityNPCTest:TestGetShopkeeperLoot(entitynpc)
	entitynpc:GetShopkeeperLoot()
end

function EntityNPCTest:TestGetSirenPlayerEntity(entitynpc)
	entitynpc:GetSirenPlayerEntity()
end

function EntityNPCTest:TestIsBossColor(entitynpc)
	entitynpc:IsBossColor()
end

function EntityNPCTest:TestReplaceSpritesheet(entitynpc)
	local layerid = 1
	local pngfilename = "hello"
	local loadgraphics = true
	entitynpc:ReplaceSpritesheet(layerid, pngfilename, loadgraphics)
end
--[[
function EntityNPCTest:TestSetControllerId(entitynpc)
	local controllerid = 1
	entitynpc:SetControllerId(controllerid)
end
]]
function EntityNPCTest:TestSetFlyingOverride(entitynpc)
	local canfly = true
	entitynpc:SetFlyingOverride(canfly)
end

function EntityNPCTest:TestSetShieldStrength(entitynpc)
	local originalVal = entitynpc:GetShieldStrength()
	for _, val in pairs(test.TestFloats) do
		entitynpc:SetShieldStrength(val)
		test.AssertEquals(entitynpc:GetShieldStrength(), val)
	end
	entitynpc:SetShieldStrength(originalVal)
end

function EntityNPCTest:TestShootMaggotProjectile(entitynpc)
	local position = Vector(1,1)
	local target = Vector(1,1)
	local fallingspeed = 1
	local yoffset = 1
	EntityNPC.ShootMaggotProjectile(position, target, fallingspeed, yoffset)
end

function EntityNPCTest:TestSpawnBloodCloud(entitynpc)
	local position = Vector(1,1)
	local color = Color(1,1,1,1)
	entitynpc:SpawnBloodCloud(position, color)
end

function EntityNPCTest:TestSpawnBloodSplash(entitynpc)
	entitynpc:SpawnBloodSplash()
end

function EntityNPCTest:TestThrowLeech(entitynpc)
	local position = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local target = Vector(1,1)
	local yposoffset = 1
	local big = true
	EntityNPC.ThrowLeech(position, source, target, yposoffset, big)
	source:Remove()
end

function EntityNPCTest:TestThrowMaggot(entitynpc)
	local origin = Vector(1,1)
	local velocity = Vector(1,1)
	local yoffset = 1
	local fallspeed = 1
	EntityNPC.ThrowMaggot(origin, velocity, yoffset, fallspeed)
end

function EntityNPCTest:TestThrowMaggotAtPos(entitynpc)
	local origin = Vector(1,1)
	local target = Vector(1,1)
	local yoffset = 1
	EntityNPC.ThrowMaggotAtPos(origin, target, yoffset)
end

function EntityNPCTest:TestThrowRockSpider(entitynpc)
	local position = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local velocity = Vector(1,1)
	local variant = 1
	local yposoffset = 1
	EntityNPC.ThrowRockSpider(position, source, velocity, variant, yposoffset)
	source:Remove()
end

function EntityNPCTest:TestThrowStrider(entitynpc)
	local position = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local target = Vector(1,1)
	EntityNPC.ThrowStrider(position, source, target)
	source:Remove()
end

function EntityNPCTest:TestTryForceTarget(entitynpc)
	local target = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local duration = 1
	entitynpc:TryForceTarget(target, duration)
	target:Remove()
end

function EntityNPCTest:TestTrySplit(entitynpc)
	local defaultdamage = 1
	local source = EntityRef(Isaac.GetPlayer())
	local doscreeneffects = true
	entitynpc:TrySplit(defaultdamage, source, doscreeneffects)
end

function EntityNPCTest:TestTryThrow(entitynpc)
	local source = EntityRef(Isaac.GetPlayer())
	local direction = Vector(1,1)
	local force = 1
	entitynpc:TryThrow(source, direction, force)
end

function EntityNPCTest:TestUpdateDirtColor(entitynpc)
	local immediate = true
	entitynpc:UpdateDirtColor(immediate)
end

function EntityNPCTest:TestVarCanShutDoors(entitynpc)
	local originalVal = entitynpc.CanShutDoors
	entitynpc.CanShutDoors = true
	entitynpc.CanShutDoors = originalVal
end

function EntityNPCTest:TestVarChildNPC(entitynpc)
	local childnpc = entitynpc.ChildNPC
end

function EntityNPCTest:TestVarEntityRef(entitynpc)
	local originalVal = entitynpc.EntityRef
	entitynpc.EntityRef = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entitynpc.EntityRef:Remove()
	entitynpc.EntityRef = originalVal
end

function EntityNPCTest:TestVarGroupIdx(entitynpc)
	local originalVal = entitynpc.GroupIdx
	for _, val in pairs(test.TestInts) do
		entitynpc.GroupIdx = val
		test.AssertEquals(entitynpc.GroupIdx, val)
	end
	entitynpc.GroupIdx = originalVal
end

function EntityNPCTest:TestVarParentNPC(entitynpc)
	local parentnpc = entitynpc.ParentNPC
end

function EntityNPCTest:TestVarPathfinder(entitynpc)
	local pathfinder = entitynpc.Pathfinder
end

function EntityNPCTest:TestVarProjectileCooldown(entitynpc)
	local originalVal = entitynpc.ProjectileCooldown
	for _, val in pairs(test.TestInts) do
		entitynpc.ProjectileCooldown = val
		test.AssertEquals(entitynpc.ProjectileCooldown, val)
	end
	entitynpc.ProjectileCooldown = originalVal
end

function EntityNPCTest:TestVarProjectileDelay(entitynpc)
	local originalVal = entitynpc.ProjectileDelay
	for _, val in pairs(test.TestInts) do
		entitynpc.ProjectileDelay = val
		test.AssertEquals(entitynpc.ProjectileDelay, val)
	end
	entitynpc.ProjectileDelay = originalVal
end

function EntityNPCTest:TestVarScale(entitynpc)
	local originalVal = entitynpc.Scale
	for _, val in pairs(test.TestFloats) do
		entitynpc.Scale = val
		test.AssertEquals(entitynpc.Scale, val)
	end
	entitynpc.Scale = originalVal
end

function EntityNPCTest:TestVarState(entitynpc)
	local originalVal = entitynpc.State
	for _, val in pairs(test.TestUnsignedInts) do
		entitynpc.State = val
		test.AssertEquals(entitynpc.State, val)
	end
	entitynpc.State = originalVal
end

function EntityNPCTest:TestVarStateFrame(entitynpc)
	local originalVal = entitynpc.StateFrame
	for _, val in pairs(test.TestInts) do
		entitynpc.StateFrame = val
		test.AssertEquals(entitynpc.StateFrame, val)
	end
	entitynpc.StateFrame = originalVal
end


return EntityNPCTest
