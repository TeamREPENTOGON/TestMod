local test = REPENTOGON_TEST

local EntityKnifeTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityKnifeTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_KNIFE, 0, KnifeSubType.PROJECTILE, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToKnife()
end

function EntityKnifeTest:AfterEach(entityknife)
	entityknife:Remove()
end

----------

function EntityKnifeTest:TestAddTearFlags(entityknife)
	local flags = BitSet128()
	entityknife:AddTearFlags(flags)
end

function EntityKnifeTest:TestClearTearFlags(entityknife)
	local flags = BitSet128()
	entityknife:ClearTearFlags(flags)
end

function EntityKnifeTest:TestGetKnifeDistance(entityknife)
	entityknife:GetKnifeDistance()
end

function EntityKnifeTest:TestGetKnifeVelocity(entityknife)
	entityknife:GetKnifeVelocity()
end

function EntityKnifeTest:TestGetRenderZ(entityknife)
	entityknife:GetRenderZ()
end

function EntityKnifeTest:TestHasTearFlags(entityknife)
	local flags = BitSet128()
	entityknife:HasTearFlags(flags)
end

function EntityKnifeTest:TestIsFlying(entityknife)
	entityknife:IsFlying()
end

function EntityKnifeTest:TestReset(entityknife)
	entityknife:Reset()
end

function EntityKnifeTest:TestSetPathFollowSpeed(entityknife)
	local speed = 1
	entityknife:SetPathFollowSpeed(speed)
end

function EntityKnifeTest:TestShoot(entityknife)
	local charge = 1
	local range = 1
	entityknife:Shoot(charge, range)
end

function EntityKnifeTest:TestGetHitList(entityknife)
	entityknife:GetHitList()
end

function EntityKnifeTest:TestGetIsSpinAttack(entityknife)
	entityknife:GetIsSpinAttack()
end

function EntityKnifeTest:TestGetIsSwinging(entityknife)
	entityknife:GetIsSwinging()
end

function EntityKnifeTest:TestIsMultidimensionalTouched(entityknife)
	entityknife:IsMultidimensionalTouched()
end

function EntityKnifeTest:TestIsPrismTouched(entityknife)
	entityknife:IsPrismTouched()
end

function EntityKnifeTest:TestSetIsSpinAttack(entityknife)
	local isspinattack = true
	entityknife:SetIsSpinAttack(isspinattack)
end

function EntityKnifeTest:TestSetIsSwinging(entityknife)
	local isswinging = true
	entityknife:SetIsSwinging(isswinging)
end

function EntityKnifeTest:TestSetMultidimensionalTouched(entityknife)
	local istouched = true
	entityknife:SetMultidimensionalTouched(istouched)
end

function EntityKnifeTest:TestSetPrismTouched(entityknife)
	local istouched = true
	entityknife:SetPrismTouched(istouched)
end

function EntityKnifeTest:TestVarCharge(entityknife)
	local originalVal = entityknife.Charge
	for _, val in pairs(test.TestFloats) do
		entityknife.Charge = val
		test.AssertEquals(entityknife.Charge, val)
	end
	entityknife.Charge = originalVal
end

function EntityKnifeTest:TestVarMaxDistance(entityknife)
	local originalVal = entityknife.MaxDistance
	for _, val in pairs(test.TestFloats) do
		entityknife.MaxDistance = val
		test.AssertEquals(entityknife.MaxDistance, val)
	end
	entityknife.MaxDistance = originalVal
end

function EntityKnifeTest:TestVarPathFollowSpeed(entityknife)
	local originalVal = entityknife.PathFollowSpeed
	for _, val in pairs(test.TestFloats) do
		entityknife.PathFollowSpeed = val
		test.AssertEquals(entityknife.PathFollowSpeed, val)
	end
	entityknife.PathFollowSpeed = originalVal
end

function EntityKnifeTest:TestVarPathOffset(entityknife)
	local originalVal = entityknife.PathOffset
	for _, val in pairs(test.TestFloats) do
		entityknife.PathOffset = val
		test.AssertEquals(entityknife.PathOffset, val)
	end
	entityknife.PathOffset = originalVal
end

function EntityKnifeTest:TestVarRotation(entityknife)
	local originalVal = entityknife.Rotation
	for _, val in pairs(test.TestFloats) do
		entityknife.Rotation = val
		test.AssertEquals(entityknife.Rotation, val)
	end
	entityknife.Rotation = originalVal
end

function EntityKnifeTest:TestVarRotationOffset(entityknife)
	local originalVal = entityknife.RotationOffset
	for _, val in pairs(test.TestFloats) do
		entityknife.RotationOffset = val
		test.AssertEquals(entityknife.RotationOffset, val)
	end
	entityknife.RotationOffset = originalVal
end

function EntityKnifeTest:TestVarScale(entityknife)
	local originalVal = entityknife.Scale
	for _, val in pairs(test.TestFloats) do
		entityknife.Scale = val
		test.AssertEquals(entityknife.Scale, val)
	end
	entityknife.Scale = originalVal
end

function EntityKnifeTest:TestVarTearFlags(entityknife)
	local originalVal = entityknife.TearFlags
	entityknife.TearFlags = BitSet128()
	entityknife.TearFlags = originalVal
end

function EntityKnifeTest:TestUpdate(entityknife)
	-- Case #1: Test callback

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_KNIFE_UPDATE, function(_, cKnife)
		test.AssertEquals(GetPtrHash(entityknife), GetPtrHash(cKnife))
	end)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_KNIFE_UPDATE, function(_, cKnife)
		test.AssertEquals(GetPtrHash(entityknife), GetPtrHash(cKnife))
	end)

	entityknife:Update()

	-- Case #2: Test update cancelling

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_KNIFE_UPDATE, function(_, cKnife)
		test.AssertEquals(GetPtrHash(entityknife), GetPtrHash(cKnife))
		return true
	end)

	test:AddUnexpectedCallback(ModCallbacks.MC_POST_KNIFE_UPDATE)

	entityknife:Update()
end

return EntityKnifeTest
