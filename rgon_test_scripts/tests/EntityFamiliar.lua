local test = REPENTOGON_TEST

local EntityFamiliarTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityFamiliarTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BROTHER_BOBBY, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToFamiliar()
end

function EntityFamiliarTest:AfterEach(entityfamiliar)
	entityfamiliar:Remove()
end

----------

function EntityFamiliarTest:TestAddCoins(entityfamiliar)
	local value = 1
	entityfamiliar:AddCoins(value)
end

function EntityFamiliarTest:TestAddHearts(entityfamiliar)
	local hearts = 1
	entityfamiliar:AddHearts(hearts)
end

function EntityFamiliarTest:TestAddKeys(entityfamiliar)
	local keys = 1
	entityfamiliar:AddKeys(keys)
end

function EntityFamiliarTest:TestAddToDelayed(entityfamiliar)
	entityfamiliar:AddToDelayed()
end

function EntityFamiliarTest:TestAddToFollowers(entityfamiliar)
	entityfamiliar:AddToFollowers()
end

function EntityFamiliarTest:TestAddToOrbit(entityfamiliar)
	local layer = 1
	entityfamiliar:AddToOrbit(layer)
end

function EntityFamiliarTest:TestFireProjectile(entityfamiliar)
	local dir = Vector(1,1)
	entityfamiliar:FireProjectile(dir)
end

function EntityFamiliarTest:TestFollowParent(entityfamiliar)
	entityfamiliar:FollowParent()
end

function EntityFamiliarTest:TestFollowPosition(entityfamiliar)
	local pos = Vector(1,1)
	entityfamiliar:FollowPosition(pos)
end

function EntityFamiliarTest:TestGetOrbitDistance(entityfamiliar)
	local layer = 1
	EntityFamiliar.GetOrbitDistance(layer)
end

function EntityFamiliarTest:TestGetOrbitPosition(entityfamiliar)
	local pos = Vector(1,1)
	entityfamiliar:GetOrbitPosition(pos)
end

function EntityFamiliarTest:TestMoveDelayed(entityfamiliar)
	local numframes = 1
	entityfamiliar:MoveDelayed(numframes)
end

function EntityFamiliarTest:TestMoveDiagonally(entityfamiliar)
	local speed = 1
	entityfamiliar:MoveDiagonally(speed)
end

function EntityFamiliarTest:TestPickEnemyTarget(entityfamiliar)
	local maxdistance = 1
	local frameinterval = 1
	local flags = 1
	local conedir = Vector(1,1)
	local coneangle = 1
	entityfamiliar:PickEnemyTarget(maxdistance, frameinterval, flags, conedir, coneangle)
end

function EntityFamiliarTest:TestPlayChargeAnim(entityfamiliar)
	local dir = 1
	entityfamiliar:PlayChargeAnim(dir)
end

function EntityFamiliarTest:TestPlayFloatAnim(entityfamiliar)
	local dir = 1
	entityfamiliar:PlayFloatAnim(dir)
end

function EntityFamiliarTest:TestPlayShootAnim(entityfamiliar)
	local dir = 1
	entityfamiliar:PlayShootAnim(dir)
end

function EntityFamiliarTest:TestRecalculateOrbitOffset(entityfamiliar)
	local layer = 1
	local add = true
	entityfamiliar:RecalculateOrbitOffset(layer, add)
end

function EntityFamiliarTest:TestRemoveFromDelayed(entityfamiliar)
	entityfamiliar:RemoveFromDelayed()
end

function EntityFamiliarTest:TestRemoveFromFollowers(entityfamiliar)
	entityfamiliar:RemoveFromFollowers()
end

function EntityFamiliarTest:TestRemoveFromOrbit(entityfamiliar)
	entityfamiliar:RemoveFromOrbit()
end

function EntityFamiliarTest:TestShoot(entityfamiliar)
	entityfamiliar:Shoot()
end

function EntityFamiliarTest:TestCanBeDamagedByEnemies(entityfamiliar)
	entityfamiliar:CanBeDamagedByEnemies()
end

function EntityFamiliarTest:TestCanBeDamagedByLasers(entityfamiliar)
	entityfamiliar:CanBeDamagedByLasers()
end

function EntityFamiliarTest:TestCanBeDamagedByProjectiles(entityfamiliar)
	entityfamiliar:CanBeDamagedByProjectiles()
end

function EntityFamiliarTest:TestCanBlockProjectiles(entityfamiliar)
	entityfamiliar:CanBlockProjectiles()
end

function EntityFamiliarTest:TestCanCharm(entityfamiliar)
	entityfamiliar:CanCharm()
end

function EntityFamiliarTest:TestGetDirtColor(entityfamiliar)
	entityfamiliar:GetDirtColor()
end

function EntityFamiliarTest:TestGetFollowerPriority(entityfamiliar)
	entityfamiliar:GetFollowerPriority()
end

function EntityFamiliarTest:TestGetItemConfig(entityfamiliar)
	entityfamiliar:GetItemConfig()
end

function EntityFamiliarTest:TestGetPathfinder(entityfamiliar)
	entityfamiliar:GetPathfinder()
end

function EntityFamiliarTest:TestGetWeapon(entityfamiliar)
	entityfamiliar:GetWeapon()
end

function EntityFamiliarTest:TestInvalidateCachedMultiplier(entityfamiliar)
	entityfamiliar:InvalidateCachedMultiplier()
end

function EntityFamiliarTest:TestIsCharmed(entityfamiliar)
	entityfamiliar:IsCharmed()
end

function EntityFamiliarTest:TestIsLilDelirium(entityfamiliar)
	entityfamiliar:IsLilDelirium()
end

function EntityFamiliarTest:TestRemoveFromPlayer(entityfamiliar)
	entityfamiliar:RemoveFromPlayer()
end

function EntityFamiliarTest:TestSetLilDelirium(entityfamiliar)
	local islildelirium = true
	entityfamiliar:SetLilDelirium(islildelirium)
end

function EntityFamiliarTest:TestSetMoveDelayNum(entityfamiliar)
	local originalVal = entityfamiliar:GetMoveDelayNum()
	for _, val in pairs(test.TestInts) do
		entityfamiliar:SetMoveDelayNum(val)
		test.AssertEquals(entityfamiliar:GetMoveDelayNum(), val)
	end
	entityfamiliar:SetMoveDelayNum(originalVal)
end

function EntityFamiliarTest:TestTriggerRoomClear(entityfamiliar)
	entityfamiliar:TriggerRoomClear()
end

function EntityFamiliarTest:TestTryAimAtMarkedTarget(entityfamiliar)
	local aimdirection = Vector(1,1)
	local direction = 1
	entityfamiliar:TryAimAtMarkedTarget(aimdirection, direction)
end

function EntityFamiliarTest:TestUpdateDirtColor(entityfamiliar)
	entityfamiliar:UpdateDirtColor()
end

function EntityFamiliarTest:TestVarCoins(entityfamiliar)
	local originalVal = entityfamiliar.Coins
	for _, val in pairs(test.TestInts) do
		entityfamiliar.Coins = val
		test.AssertEquals(entityfamiliar.Coins, val)
	end
	entityfamiliar.Coins = originalVal
end

function EntityFamiliarTest:TestVarFireCooldown(entityfamiliar)
	local originalVal = entityfamiliar.FireCooldown
	for _, val in pairs(test.TestInts) do
		entityfamiliar.FireCooldown = val
		test.AssertEquals(entityfamiliar.FireCooldown, val)
	end
	entityfamiliar.FireCooldown = originalVal
end

function EntityFamiliarTest:TestVarHeadFrameDelay(entityfamiliar)
	local originalVal = entityfamiliar.HeadFrameDelay
	for _, val in pairs(test.TestInts) do
		entityfamiliar.HeadFrameDelay = val
		test.AssertEquals(entityfamiliar.HeadFrameDelay, val)
	end
	entityfamiliar.HeadFrameDelay = originalVal
end

function EntityFamiliarTest:TestVarHearts(entityfamiliar)
	local originalVal = entityfamiliar.Hearts
	for _, val in pairs(test.TestInts) do
		entityfamiliar.Hearts = val
		test.AssertEquals(entityfamiliar.Hearts, val)
	end
	entityfamiliar.Hearts = originalVal
end

function EntityFamiliarTest:TestVarIsDelayed(entityfamiliar)
	local originalVal = entityfamiliar.IsDelayed
	entityfamiliar.IsDelayed = true
	entityfamiliar.IsDelayed = originalVal
end

function EntityFamiliarTest:TestVarIsFollower(entityfamiliar)
	local originalVal = entityfamiliar.IsFollower
	entityfamiliar.IsFollower = true
	entityfamiliar.IsFollower = originalVal
end

function EntityFamiliarTest:TestVarKeys(entityfamiliar)
	local originalVal = entityfamiliar.Keys
	for _, val in pairs(test.TestInts) do
		entityfamiliar.Keys = val
		test.AssertEquals(entityfamiliar.Keys, val)
	end
	entityfamiliar.Keys = originalVal
end

function EntityFamiliarTest:TestVarLastDirection(entityfamiliar)
	local originalVal = entityfamiliar.LastDirection
	for _, val in pairs(test.TestInts) do
		entityfamiliar.LastDirection = val
		test.AssertEquals(entityfamiliar.LastDirection, val)
	end
	entityfamiliar.LastDirection = originalVal
end

function EntityFamiliarTest:TestVarMoveDirection(entityfamiliar)
	local originalVal = entityfamiliar.MoveDirection
	for _, val in pairs(test.TestInts) do
		entityfamiliar.MoveDirection = val
		test.AssertEquals(entityfamiliar.MoveDirection, val)
	end
	entityfamiliar.MoveDirection = originalVal
end

function EntityFamiliarTest:TestVarOrbitAngleOffset(entityfamiliar)
	local originalVal = entityfamiliar.OrbitAngleOffset
	for _, val in pairs(test.TestFloats) do
		entityfamiliar.OrbitAngleOffset = val
		test.AssertEquals(entityfamiliar.OrbitAngleOffset, val)
	end
	entityfamiliar.OrbitAngleOffset = originalVal
end

function EntityFamiliarTest:TestVarOrbitDistance(entityfamiliar)
	local originalVal = entityfamiliar.OrbitDistance
	for _, val in pairs(test.TestVectors) do
		entityfamiliar.OrbitDistance = val
		test.AssertEquals(entityfamiliar.OrbitDistance, val)
	end
	entityfamiliar.OrbitDistance = originalVal
end

function EntityFamiliarTest:TestVarOrbitLayer(entityfamiliar)
	local originalVal = entityfamiliar.OrbitLayer
	for _, val in pairs(test.TestInts) do
		entityfamiliar.OrbitLayer = val
		test.AssertEquals(entityfamiliar.OrbitLayer, val)
	end
	entityfamiliar.OrbitLayer = originalVal
end

function EntityFamiliarTest:TestVarOrbitSpeed(entityfamiliar)
	local originalVal = entityfamiliar.OrbitSpeed
	for _, val in pairs(test.TestFloats) do
		entityfamiliar.OrbitSpeed = val
		test.AssertEquals(entityfamiliar.OrbitSpeed, val)
	end
	entityfamiliar.OrbitSpeed = originalVal
end

function EntityFamiliarTest:TestVarPlayer(entityfamiliar)
	local originalVal = entityfamiliar.Player
	entityfamiliar.Player = Isaac.GetPlayer()
	entityfamiliar.Player = originalVal
end

function EntityFamiliarTest:TestVarRoomClearCount(entityfamiliar)
	local originalVal = entityfamiliar.RoomClearCount
	for _, val in pairs(test.TestInts) do
		entityfamiliar.RoomClearCount = val
		test.AssertEquals(entityfamiliar.RoomClearCount, val)
	end
	entityfamiliar.RoomClearCount = originalVal
end

function EntityFamiliarTest:TestVarShootDirection(entityfamiliar)
	local originalVal = entityfamiliar.ShootDirection
	for _, val in pairs(test.TestInts) do
		entityfamiliar.ShootDirection = val
		test.AssertEquals(entityfamiliar.ShootDirection, val)
	end
	entityfamiliar.ShootDirection = originalVal
end

function EntityFamiliarTest:TestVarState(entityfamiliar)
	local originalVal = entityfamiliar.State
	for _, val in pairs(test.TestInts) do
		entityfamiliar.State = val
		test.AssertEquals(entityfamiliar.State, val)
	end
	entityfamiliar.State = originalVal
end

function EntityFamiliarTest:TestTakeDamage()
	local fam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, test.TEST_FAMILIAR, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Vector.Zero, Vector.Zero, nil)

	local testdamage = 0.5
	local testflags = DamageFlag.DAMAGE_LASER | DamageFlag.DAMAGE_COUNTDOWN
	local testsource = EntityRef(enemy)
	local testdamagecountdown = 7

	local testfunc = function(_, entity, damage, flags, source, countdown)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(fam))
		test.AssertEquals(damage, testdamage)
		test.AssertEquals(flags, testflags)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(testsource.Entity))
		test.AssertEquals(countdown, testdamagecountdown)
	end

	test:AddOneTimeCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, testfunc)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ENTITY_TAKE_DMG, testfunc)

	fam:TakeDamage(testdamage, testflags, testsource, testdamagecountdown)

	fam:Remove()
	enemy:Remove()
end


local FAMILIAR_MULT_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST FAMILIAR MULT ITEM")

function EntityFamiliarTest:TestGetMultiplier(testfam)
	test.AssertEquals(testfam:GetMultiplier(), 1.0)

	local callbackran = false

	-- Verify callback runs using BFFs
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_FAMILIAR_MULTIPLIER, function(_, fam, mult, player)
		test.AssertEquals(GetPtrHash(fam), GetPtrHash(testfam))
		test.AssertEquals(GetPtrHash(player), GetPtrHash(testfam.Player))
		test.AssertEquals(mult, 2.0)
		callbackran = true
	end)
	testfam.Player:AddCollectible(CollectibleType.COLLECTIBLE_BFFS)
	test.AssertEquals(testfam:GetMultiplier(), 2.0)
	test.AssertTrue(callbackran)

	-- Manually trigger a re-evaluation and change the result
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_FAMILIAR_MULTIPLIER, function(_, fam, mult, player)
		return 3.5
	end)
	test.AssertEquals(testfam:GetMultiplier(), 2.0)
	testfam.Player:AddCustomCacheTag("familiarmultiplier", true)
	test.AssertEquals(testfam:GetMultiplier(), 3.5)

	-- Collectibles
	testfam.Player:AddCollectible(FAMILIAR_MULT_ITEM)
	test.AssertEquals(testfam:GetMultiplier(), 3.0)
	testfam.Player:AddCollectible(FAMILIAR_MULT_ITEM)
	test.AssertEquals(testfam:GetMultiplier(), 4.0)
	testfam.Player:RemoveCollectible(FAMILIAR_MULT_ITEM)
	test.AssertEquals(testfam:GetMultiplier(), 3.0)

	-- Effects
	testfam.Player:GetEffects():AddCollectibleEffect(FAMILIAR_MULT_ITEM)
	test.AssertEquals(testfam:GetMultiplier(), 3.0)
	testfam.Player:Update()
	test.AssertEquals(testfam:GetMultiplier(), 4.0)

	testfam.Player:GetEffects():AddCollectibleEffect(FAMILIAR_MULT_ITEM, true, 2)
	test.AssertEquals(testfam:GetMultiplier(), 4.0)
	testfam.Player:Update()
	test.AssertEquals(testfam:GetMultiplier(), 6.0)

	testfam.Player:GetEffects():RemoveCollectibleEffect(FAMILIAR_MULT_ITEM, 2)
	test.AssertEquals(testfam:GetMultiplier(), 6.0)
	testfam.Player:Update()
	test.AssertEquals(testfam:GetMultiplier(), 4.0)

	-- Restore to 1.0
	testfam.Player:RemoveCollectible(FAMILIAR_MULT_ITEM)
	testfam.Player:GetEffects():RemoveCollectibleEffect(FAMILIAR_MULT_ITEM)
	testfam.Player:RemoveCollectible(CollectibleType.COLLECTIBLE_BFFS)
	test.AssertEquals(testfam:GetMultiplier(), 1.0)
end


return EntityFamiliarTest
