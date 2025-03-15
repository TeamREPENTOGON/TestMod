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

function EntityBombTest:TestGetCostumeLayerSprite(entitybomb)
	local layerid = 1
	entitybomb:GetCostumeLayerSprite(layerid)
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

function EntityBombTest:TestSetFallingSpeed(entitybomb)
	local originalVal = entitybomb:GetFallingSpeed()
	for _, val in pairs(test.TestFloats) do
		entitybomb:SetFallingSpeed(val)
		test.AssertEquals(entitybomb:GetFallingSpeed(), val)
	end
	entitybomb:SetFallingSpeed(originalVal)
end

function EntityBombTest:TestSetHeight(entitybomb)
	local originalVal = entitybomb:GetHeight()
	for _, val in pairs(test.TestFloats) do
		entitybomb:SetHeight(val)
		test.AssertEquals(entitybomb:GetHeight(), val)
	end
	entitybomb:SetHeight(originalVal)
end

function EntityBombTest:TestSetLoadCostumes(entitybomb)
	local load = true
	entitybomb:SetLoadCostumes(load)
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
