local test = REPENTOGON_TEST

local EntityBombTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityBombTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_BOMB, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToBomb()
end

function EntityBombTest:AfterEach(entitybomb)
	entitybomb:Remove()
end

----------

function EntityBombTest:TestAddTearFlags(entitybomb)
	local flags = BitSet128()
	entitybomb:AddTearFlags(flags)
end

function EntityBombTest:TestClearTearFlags(entitybomb)
	local flags = BitSet128()
	entitybomb:ClearTearFlags(flags)
end

function EntityBombTest:TestHasTearFlags(entitybomb)
	local flags = BitSet128()
	entitybomb:HasTearFlags(flags)
end

function EntityBombTest:TestSetExplosionCountdown(entitybomb)
	local originalVal = entitybomb:GetExplosionCountdown()
	for _, val in pairs(test.TestInts) do
		entitybomb:SetExplosionCountdown(val)
		test.AssertEquals(entitybomb:GetExplosionCountdown(), val)
	end
	entitybomb:SetExplosionCountdown(originalVal)
end

function EntityBombTest:TestGetCostumeLayerSprite(bomb)
	for i=0, 4 do
		bomb:GetCostumeLayerSprite(i):GetFilename()
	end
	bomb.Flags = TearFlags.TEAR_BURN
	bomb:Update()
	test.AssertEquals(bomb:GetCostumeLayerSprite(0):GetFilename(), "gfx/items/pick ups/bombs/flame2.anm2")
end

function EntityBombTest:TestGetHitList(entitybomb)
	entitybomb:GetHitList()
end

function EntityBombTest:TestIsLoadingCostumes(entitybomb)
	entitybomb:IsLoadingCostumes()
end

function EntityBombTest:TestIsPrismTouched(entitybomb)
	entitybomb:IsPrismTouched()
end

function EntityBombTest:TestSetFallSpeedAcceleration(bomb)
	bomb.PositionOffset.Y = -5
	bomb:SetFallSpeed(-3)
	bomb:SetFallAcceleration(2)

	test.AssertEquals(bomb:GetFallSpeed(), -3)
	test.AssertEquals(bomb:GetFallAcceleration(), 2)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -8)
	test.AssertEquals(bomb:GetFallSpeed(), -1)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -9)
	test.AssertEquals(bomb:GetFallSpeed(), 1)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -8)
	test.AssertEquals(bomb:GetFallSpeed(), 3)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -5)
	test.AssertEquals(bomb:GetFallSpeed(), 5)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, 0)
	test.AssertEquals(bomb:GetFallSpeed(), 0)

	test.AssertEquals(bomb:GetFallAcceleration(), 2)
end

-- Deprecated old function names that were incorrect
-- Height -> FallSpeed
-- FallingSpeed -> FallAcceleration
function EntityBombTest:TestDeprecatedFallSpeedAcceleration(bomb)
	bomb:SetFallSpeed(-6)
	bomb:SetFallAcceleration(3)

	test.AssertEquals(bomb:GetHeight(), -6)
	test.AssertEquals(bomb:GetFallSpeed(), -6)
	test.AssertEquals(bomb:GetFallingSpeed(), 3)
	test.AssertEquals(bomb:GetFallAcceleration(), 3)

	bomb.PositionOffset.Y = -5
	bomb:SetHeight(-3)
	bomb:SetFallingSpeed(2)

	test.AssertEquals(bomb:GetHeight(), -3)
	test.AssertEquals(bomb:GetFallSpeed(), -3)
	test.AssertEquals(bomb:GetFallingSpeed(), 2)
	test.AssertEquals(bomb:GetFallAcceleration(), 2)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -8)
	test.AssertEquals(bomb:GetHeight(), -1)
	test.AssertEquals(bomb:GetFallingSpeed(), 2)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -9)
	test.AssertEquals(bomb:GetHeight(), 1)
	test.AssertEquals(bomb:GetFallingSpeed(), 2)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -8)
	test.AssertEquals(bomb:GetHeight(), 3)
	test.AssertEquals(bomb:GetFallingSpeed(), 2)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, -5)
	test.AssertEquals(bomb:GetHeight(), 5)
	test.AssertEquals(bomb:GetFallingSpeed(), 2)

	bomb:Update()
	test.AssertEquals(bomb.PositionOffset.Y, 0)
	test.AssertEquals(bomb:GetHeight(), 0)
	test.AssertEquals(bomb:GetFallingSpeed(), 2)

	test.AssertEquals(bomb:GetFallingSpeed(), 2)
	test.AssertEquals(bomb:GetFallAcceleration(), 2)
end

function EntityBombTest:TestSetLoadCostumes(bomb)
	bomb:SetScale(0.75)
	bomb:SetLoadCostumes(true)
	bomb:Update()
	test.AssertEquals(bomb:GetSprite():GetFilename(), "gfx/items/pick ups/bombs/bomb1.anm2")

	bomb:SetScale(1)
	bomb:SetLoadCostumes(true)
	bomb:Update()
	test.AssertEquals(bomb:GetSprite():GetFilename(), "gfx/items/pick ups/bombs/bomb2.anm2")
end

function EntityBombTest:TestSetPrismTouched(entitybomb)
	local istouched = true
	entitybomb:SetPrismTouched(istouched)
end

function EntityBombTest:TestSetRocketAngle(entitybomb)
	local originalVal = entitybomb:GetRocketAngle()
	for _, val in pairs(test.TestFloats) do
		entitybomb:SetRocketAngle(val)
		test.AssertEquals(entitybomb:GetRocketAngle(), val)
	end
	entitybomb:SetRocketAngle(originalVal)
end

function EntityBombTest:TestSetRocketSpeed(entitybomb)
	local originalVal = entitybomb:GetRocketSpeed()
	for _, val in pairs(test.TestFloats) do
		entitybomb:SetRocketSpeed(val)
		test.AssertEquals(entitybomb:GetRocketSpeed(), val)
	end
	entitybomb:SetRocketSpeed(originalVal)
end

function EntityBombTest:TestSetScale(entitybomb)
	local originalVal = entitybomb:GetScale()
	for _, val in pairs(test.TestFloats) do
		entitybomb:SetScale(val)
		test.AssertEquals(entitybomb:GetScale(), val)
	end
	entitybomb:SetScale(originalVal)
end

function EntityBombTest:TestUpdateDirtColor(entitybomb)
	entitybomb:UpdateDirtColor()
end

function EntityBombTest:TestVarExplosionDamage(entitybomb)
	local originalVal = entitybomb.ExplosionDamage
	for _, val in pairs(test.TestFloats) do
		entitybomb.ExplosionDamage = val
		test.AssertEquals(entitybomb.ExplosionDamage, val)
	end
	entitybomb.ExplosionDamage = originalVal
end

function EntityBombTest:TestVarFlags(entitybomb)
	local originalVal = entitybomb.Flags
	entitybomb.Flags = BitSet128()
	entitybomb.Flags = originalVal
end

function EntityBombTest:TestVarIsFetus(entitybomb)
	local originalVal = entitybomb.IsFetus
	entitybomb.IsFetus = true
	entitybomb.IsFetus = originalVal
end

function EntityBombTest:TestVarRadiusMultiplier(entitybomb)
	local originalVal = entitybomb.RadiusMultiplier
	for _, val in pairs(test.TestFloats) do
		entitybomb.RadiusMultiplier = val
		test.AssertEquals(entitybomb.RadiusMultiplier, val)
	end
	entitybomb.RadiusMultiplier = originalVal
end

function EntityBombTest:TestUpdate(entitybomb)
	-- Case #1: Test callback

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_BOMB_UPDATE, function(_, cBomb)
		test.AssertEquals(GetPtrHash(entitybomb), GetPtrHash(cBomb))
	end)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_BOMB_UPDATE, function(_, cBomb)
		test.AssertEquals(GetPtrHash(entitybomb), GetPtrHash(cBomb))
	end)

	entitybomb:Update()

	-- Case #2: Test update cancelling

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_BOMB_UPDATE, function(_, cBomb)
		test.AssertEquals(GetPtrHash(entitybomb), GetPtrHash(cBomb))
		return true
	end)

	test:AddUnexpectedCallback(ModCallbacks.MC_POST_BOMB_UPDATE)

	entitybomb:Update()
end

return EntityBombTest
