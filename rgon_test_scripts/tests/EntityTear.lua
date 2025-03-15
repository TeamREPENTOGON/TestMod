local test = REPENTOGON_TEST

local EntityTearTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityTearTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear()
end

function EntityTearTest:AfterEach(entitytear)
	entitytear:Remove()
end

----------

function EntityTearTest:TestAddTearFlags(entitytear)
	local flags = BitSet128()
	entitytear:AddTearFlags(flags)
end

function EntityTearTest:TestChangeVariant(entitytear)
	local newvariant = 1
	entitytear:ChangeVariant(newvariant)
end

function EntityTearTest:TestClearTearFlags(entitytear)
	local flags = BitSet128()
	entitytear:ClearTearFlags(flags)
end

function EntityTearTest:TestHasTearFlags(entitytear)
	local flags = BitSet128()
	entitytear:HasTearFlags(flags)
end

function EntityTearTest:TestResetSpriteScale(entitytear)
	local force = true
	entitytear:ResetSpriteScale(force)
end

function EntityTearTest:TestSetDeadEyeIntensity(entitytear)
	local originalVal = entitytear:GetDeadEyeIntensity()
	for _, val in pairs(test.TestFloats) do
		entitytear:SetDeadEyeIntensity(val)
		test.AssertEquals(entitytear:GetDeadEyeIntensity(), val)
	end
	entitytear:SetDeadEyeIntensity(originalVal)
end

function EntityTearTest:TestSetKnockbackMultiplier(entitytear)
	local multiplier = 1
	entitytear:SetKnockbackMultiplier(multiplier)
end

function EntityTearTest:TestSetParentOffset(entitytear)
	local offset = Vector(1,1)
	entitytear:SetParentOffset(offset)
end

function EntityTearTest:TestSetWaitFrames(entitytear)
	local value = 1
	entitytear:SetWaitFrames(value)
end

function EntityTearTest:TestGetDeadEyeSprite(entitytear)
	entitytear:GetDeadEyeSprite()
end

function EntityTearTest:TestGetTearEffectSprite(entitytear)
	entitytear:GetTearEffectSprite()
end

function EntityTearTest:TestGetTearHaloSprite(entitytear)
	entitytear:GetTearHaloSprite()
end

function EntityTearTest:TestIsMultidimensionalTouched(entitytear)
	entitytear:IsMultidimensionalTouched()
end

function EntityTearTest:TestIsPrismTouched(entitytear)
	entitytear:IsPrismTouched()
end

function EntityTearTest:TestMakeMultidimensionalCopy(entitytear)
	entitytear:MakeMultidimensionalCopy()
end

function EntityTearTest:TestSetMultidimensionalTouched(entitytear)
	local istouched = true
	entitytear:SetMultidimensionalTouched(istouched)
end

function EntityTearTest:TestSetPrismTouched(entitytear)
	local istouched = true
	entitytear:SetPrismTouched(istouched)
end

function EntityTearTest:TestVarBaseDamage(entitytear)
	local basedamage = entitytear.BaseDamage
end

function EntityTearTest:TestVarBaseScale(entitytear)
	local basescale = entitytear.BaseScale
end

function EntityTearTest:TestVarCanTriggerStreakEnd(entitytear)
	local originalVal = entitytear.CanTriggerStreakEnd
	entitytear.CanTriggerStreakEnd = true
	entitytear.CanTriggerStreakEnd = originalVal
end

function EntityTearTest:TestVarContinueVelocity(entitytear)
	local originalVal = entitytear.ContinueVelocity
	for _, val in pairs(test.TestVectors) do
		entitytear.ContinueVelocity = val
		test.AssertEquals(entitytear.ContinueVelocity, val)
	end
	entitytear.ContinueVelocity = originalVal
end

function EntityTearTest:TestVarFallingAcceleration(entitytear)
	local originalVal = entitytear.FallingAcceleration
	for _, val in pairs(test.TestFloats) do
		entitytear.FallingAcceleration = val
		test.AssertEquals(entitytear.FallingAcceleration, val)
	end
	entitytear.FallingAcceleration = originalVal
end

function EntityTearTest:TestVarFallingSpeed(entitytear)
	local originalVal = entitytear.FallingSpeed
	for _, val in pairs(test.TestFloats) do
		entitytear.FallingSpeed = val
		test.AssertEquals(entitytear.FallingSpeed, val)
	end
	entitytear.FallingSpeed = originalVal
end

function EntityTearTest:TestVarHeight(entitytear)
	local originalVal = entitytear.Height
	for _, val in pairs(test.TestFloats) do
		entitytear.Height = val
		test.AssertEquals(entitytear.Height, val)
	end
	entitytear.Height = originalVal
end

function EntityTearTest:TestVarHomingFriction(entitytear)
	local originalVal = entitytear.HomingFriction
	for _, val in pairs(test.TestFloats) do
		entitytear.HomingFriction = val
		test.AssertEquals(entitytear.HomingFriction, val)
	end
	entitytear.HomingFriction = originalVal
end

function EntityTearTest:TestVarKnockbackMultiplier(entitytear)
	local originalVal = entitytear.KnockbackMultiplier
	for _, val in pairs(test.TestFloats) do
		entitytear.KnockbackMultiplier = val
		test.AssertEquals(entitytear.KnockbackMultiplier, val)
	end
	entitytear.KnockbackMultiplier = originalVal
end

function EntityTearTest:TestVarParentOffset(entitytear)
	local originalVal = entitytear.ParentOffset
	for _, val in pairs(test.TestVectors) do
		entitytear.ParentOffset = val
		test.AssertEquals(entitytear.ParentOffset, val)
	end
	entitytear.ParentOffset = originalVal
end

function EntityTearTest:TestVarPosDisplacement(entitytear)
	local posdisplacement = entitytear.PosDisplacement
end

function EntityTearTest:TestVarRotation(entitytear)
	local originalVal = entitytear.Rotation
	for _, val in pairs(test.TestFloats) do
		entitytear.Rotation = val
		test.AssertEquals(entitytear.Rotation, val)
	end
	entitytear.Rotation = originalVal
end

function EntityTearTest:TestVarScale(entitytear)
	local originalVal = entitytear.Scale
	for _, val in pairs(test.TestPositiveFloats) do
		entitytear.Scale = val
		test.AssertEquals(entitytear.Scale, val)
	end
	entitytear.Scale = originalVal
end

function EntityTearTest:TestVarStickDiff(entitytear)
	local originalVal = entitytear.StickDiff
	for _, val in pairs(test.TestVectors) do
		entitytear.StickDiff = val
		test.AssertEquals(entitytear.StickDiff, val)
	end
	entitytear.StickDiff = originalVal
end

function EntityTearTest:TestVarStickTarget(entitytear)
	local originalVal = entitytear.StickTarget
	entitytear.StickTarget = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entitytear.StickTarget:Remove()
	entitytear.StickTarget = originalVal
end

function EntityTearTest:TestVarStickTimer(entitytear)
	local originalVal = entitytear.StickTimer
	for _, val in pairs(test.TestInts) do
		entitytear.StickTimer = val
		test.AssertEquals(entitytear.StickTimer, val)
	end
	entitytear.StickTimer = originalVal
end

function EntityTearTest:TestVarTearFlags(entitytear)
	local originalVal = entitytear.TearFlags
	entitytear.TearFlags = BitSet128()
	entitytear.TearFlags = originalVal
end

function EntityTearTest:TestVarTearIndex(entitytear)
	local tearindex = entitytear.TearIndex
end

function EntityTearTest:TestVarWaitFrames(entitytear)
	local originalVal = entitytear.WaitFrames
	for _, val in pairs(test.TestInts) do
		entitytear.WaitFrames = val
		test.AssertEquals(entitytear.WaitFrames, val)
	end
	entitytear.WaitFrames = originalVal
end

function EntityTearTest:TestTearDeathCallback(testtear)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_TEAR_DEATH, function(_, tear)
		test.AssertEquals(GetPtrHash(tear), GetPtrHash(testtear))
	end)
	testtear:Kill()
	testtear:Update()
end

function EntityTearTest:TestUpdate(entitytear)
	-- Case #1: Test callback

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_TEAR_UPDATE, function(_, cTear)
		test.AssertEquals(GetPtrHash(entitytear), GetPtrHash(cTear))
	end)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_TEAR_UPDATE, function(_, cTear)
		test.AssertEquals(GetPtrHash(entitytear), GetPtrHash(cTear))
	end)

	entitytear:Update()

	-- Case #2: Test update cancelling

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_TEAR_UPDATE, function(_, cTear)
		test.AssertEquals(GetPtrHash(entitytear), GetPtrHash(cTear))
		return true
	end)

	test:AddUnexpectedCallback(ModCallbacks.MC_POST_TEAR_UPDATE)

	entitytear:Update()
end


return EntityTearTest
