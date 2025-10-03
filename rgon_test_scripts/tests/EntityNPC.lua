local test = REPENTOGON_TEST

local EntityNPCTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")
EntityNPCTest.TestCanShutDoors = nil

function EntityNPCTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToNPC()
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

function EntityNPCTest:TestGetDarkRedChampionRegenTimer(npc)
	if npc:ToDelirium() then return end

	npc:MakeChampion(1234, ChampionColor.DARK_RED, true)
	npc:Kill()

	test:AddOneTimeCallback(ModCallbacks.MC_POST_NPC_DARK_RED_CHAMPION_REGEN, function(_, e)
		test.AssertEquals(GetPtrHash(e), GetPtrHash(npc))
	end)

	for i=0,89 do
		test.AssertEquals(npc:GetDarkRedChampionRegenTimer(), i)
		npc:Update()
	end
	test.AssertEquals(npc:GetDarkRedChampionRegenTimer(), 0)
end

function EntityNPCTest:TestGetDirtColor(entitynpc)
	entitynpc:GetDirtColor()
end

function EntityNPCTest:TestGetFireplaceLoot(entitynpc)
	entitynpc:GetFireplaceLoot()
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
function EntityNPCTest:TestFlyingOverrideTrue(entitynpc)
	test.AssertFalse(entitynpc:IsFlying())
	test.AssertNil(entitynpc:GetFlyingOverride())

	entitynpc:SetFlyingOverride(true)

	test.AssertTrue(entitynpc:IsFlying())
	test.AssertTrue(entitynpc:GetFlyingOverride())

	entitynpc:ClearFlyingOverride()

	test.AssertFalse(entitynpc:IsFlying())
	test.AssertNil(entitynpc:GetFlyingOverride())
end

function EntityNPCTest:TestFlyingOverrideFalse(entitynpc)
	entitynpc.GridCollisionClass = EntityGridCollisionClass.GRIDCOLL_NONE  -- Make the entity flying by default

	test.AssertTrue(entitynpc:IsFlying())
	test.AssertNil(entitynpc:GetFlyingOverride())

	entitynpc:SetFlyingOverride(false)

	test.AssertFalse(entitynpc:IsFlying())
	test.AssertFalse(entitynpc:GetFlyingOverride())

	entitynpc:ClearFlyingOverride()

	test.AssertTrue(entitynpc:IsFlying())
	test.AssertNil(entitynpc:GetFlyingOverride())
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

function EntityNPCTest:TestTakeDamage(npc)
	local testDamage = 3.5
	local modifiedDamage = 2.4

	local testflags = DamageFlag.DAMAGE_SPIKES | DamageFlag.DAMAGE_POOP
	local modifiedflags = DamageFlag.DAMAGE_FIRE

	local testsource = EntityRef(Isaac.GetPlayer())

	local testcountdown = 7
	local modifiedcountdown = 4

	test:AddOneTimeCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, function(_, entity, damage, flags, source, countdown)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(damage, testDamage)
		test.AssertEquals(flags, testflags)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(testsource.Entity))
		test.AssertEquals(countdown, testcountdown)
		
		return {Damage = modifiedDamage, DamageFlags = modifiedflags, DamageCountdown = modifiedcountdown}
	end)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_ENTITY_TAKE_DMG, function(_, entity, damage, flags, source, countdown)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(damage, modifiedDamage)
		test.AssertEquals(flags, modifiedflags)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(testsource.Entity))
		test.AssertEquals(countdown, modifiedcountdown)
	end)

	npc:TakeDamage(testDamage, testflags, testsource, testcountdown)
end

function EntityNPCTest:TestPreventDamage(npc)
	local testDamage = 3.5
	local testflags = DamageFlag.DAMAGE_SPIKES | DamageFlag.DAMAGE_POOP
	local testsource = EntityRef(Isaac.GetPlayer())
	local testcountdown = 7

	test:AddOneTimeCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, function(_, entity, damage, flags, source, countdown)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(damage, testDamage)
		test.AssertEquals(flags, testflags)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(testsource.Entity))
		test.AssertEquals(countdown, testcountdown)
		return false
	end)
	test:AddUnexpectedCallback(ModCallbacks.MC_POST_ENTITY_TAKE_DMG)

	npc:TakeDamage(testDamage, testflags, testsource, testcountdown)
end

function EntityNPCTest:TestApplyTearflagEffectsBasic(npc)
	local testpos = Vector(2.1, 3.2)
	local testflags = TearFlags.TEAR_POISON | TearFlags.TEAR_PIERCING
	local testsource = Isaac.GetPlayer()
	local testdamage = 1.23

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, testpos)
		test.AssertEquals(flags, testflags)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(testsource))
		test.AssertEquals(damage, testdamage)
	end, testsource.Type)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, testpos)
		test.AssertEquals(flags, testflags)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(testsource))
		test.AssertEquals(damage, testdamage)
	end, testsource.Type)

	npc:ApplyTearflagEffects(testpos, testflags, testsource, testdamage)
end

function EntityNPCTest:TestApplyTearflagEffectsNilParams(npc)
	local testpos = Vector(2.1, 3.2)
	local testflags = TearFlags.TEAR_POISON | TearFlags.TEAR_PIERCING

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, testpos)
		test.AssertEquals(flags, testflags)
		test.AssertNil(source)
		test.AssertEquals(damage, 3.5)
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, testpos)
		test.AssertEquals(flags, testflags)
		test.AssertNil(source)
		test.AssertEquals(damage, 3.5)
	end)

	npc:ApplyTearflagEffects(testpos, testflags)
end

function EntityNPCTest:TestApplyTearflagEffectsReturnFalse(npc)
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		return false
	end)
	test:AddUnexpectedCallback(ModCallbacks.MC_POST_APPLY_TEARFLAG_EFFECTS)

	npc:ApplyTearflagEffects(Vector.Zero, TearFlags.TEAR_POISON)
end

function EntityNPCTest:TestApplyTearflagEffectsReturnTable(npc)
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Vector.Zero, Vector.Zero, player):ToTear()

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, Vector(1,1))
		test.AssertEquals(flags, TearFlags.TEAR_SPECTRAL)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(tear))
		test.AssertEquals(damage, 1)
		return {
			Position = Vector(2,2),
			TearFlags = TearFlags.TEAR_PIERCING,
			Damage = 2,
		}
	end, EntityType.ENTITY_TEAR)
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, Vector(2,2))
		test.AssertEquals(flags, TearFlags.TEAR_PIERCING)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(tear))
		test.AssertEquals(damage, 2)
		return {
			Position = Vector(3,3),
			TearFlags = TearFlags.TEAR_HOMING,
			Damage = 3,
		}
	end, EntityType.ENTITY_TEAR)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, Vector(3,3))
		test.AssertEquals(flags, TearFlags.TEAR_HOMING)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(tear))
		test.AssertEquals(damage, 3)
	end, EntityType.ENTITY_TEAR)

	npc:ApplyTearflagEffects(Vector(1,1), TearFlags.TEAR_SPECTRAL, tear, 1)
end

function EntityNPCTest:TestApplyTearflagEffectsForceCollide(npc)
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Vector.Zero, Vector.Zero, Isaac.GetPlayer()):ToTear()
	tear.TearFlags = TearFlags.TEAR_SLOW | TearFlags.TEAR_PIERCING

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, tear.Position)
		test.AssertEquals(flags, tear.TearFlags)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(tear))
		test.AssertEquals(damage, tear.CollisionDamage)
		return {
			TearFlags = flags | TearFlags.TEAR_POISON,
			Damage = 1.23,
		}
	end, EntityType.ENTITY_TEAR)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(npc))
		test.AssertEquals(pos, tear.Position)
		test.AssertEquals(flags, tear.TearFlags | TearFlags.TEAR_POISON)
		test.AssertEquals(GetPtrHash(source), GetPtrHash(tear))
		test.AssertEquals(damage, 1.23)
	end, EntityType.ENTITY_TEAR)

	tear:ForceCollide(npc)
end

return EntityNPCTest
