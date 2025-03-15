local test = REPENTOGON_TEST

local EntityEffectTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityEffectTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToEffect()
end

function EntityEffectTest:AfterEach(entityeffect)
	entityeffect:Remove()
end

----------

function EntityEffectTest:TestFollowParent(entityeffect)
	local parent = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityeffect:FollowParent(parent)
	parent:Remove()
end

function EntityEffectTest:TestIsPlayerCreep(entityeffect)
	local variant = 1
	EntityEffect.IsPlayerCreep(variant)
end

function EntityEffectTest:TestSetDamageSource(entityeffect)
	local damagesource = 1
	entityeffect:SetDamageSource(damagesource)
end

function EntityEffectTest:TestSetRadii(entityeffect)
	local min = 1
	local max = 1
	entityeffect:SetRadii(min, max)
end

function EntityEffectTest:TestSetTimeout(entityeffect)
	local timeout = 1
	entityeffect:SetTimeout(timeout)
end

function EntityEffectTest:TestCreateLight(entityeffect)
	local position = Vector(1,1)
	local scale = 1
	local lifespan = 1
	local state = 1
	local color = Color(1,1,1,1)
	EntityEffect.CreateLight(position, scale, lifespan, state, color)
end

-- Crashes, but not yet on the main docs nor changelog
--[[
function EntityEffectTest:TestCreateLootPreview()
	local position = Vector(1,1)
	local owner = Isaac.Spawn(EntityType.ENTITY_PICKUP, 20, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToPickup()
	local effect = Isaac.Spawn(1000, 15, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToEffect()
	EntityEffect.CreateLootPreview(owner:GetLootList(), position, owner, effect)
	owner:Remove()
	effect:Remove()
end
]]

function EntityEffectTest:TestVarDamageSource(entityeffect)
	local originalVal = entityeffect.DamageSource
	for _, val in pairs(test.TestInts) do
		entityeffect.DamageSource = val
		test.AssertEquals(entityeffect.DamageSource, val)
	end
	entityeffect.DamageSource = originalVal
end

function EntityEffectTest:TestVarFallingAcceleration(entityeffect)
	local originalVal = entityeffect.FallingAcceleration
	for _, val in pairs(test.TestFloats) do
		entityeffect.FallingAcceleration = val
		test.AssertEquals(entityeffect.FallingAcceleration, val)
	end
	entityeffect.FallingAcceleration = originalVal
end

function EntityEffectTest:TestVarFallingSpeed(entityeffect)
	local originalVal = entityeffect.FallingSpeed
	for _, val in pairs(test.TestFloats) do
		entityeffect.FallingSpeed = val
		test.AssertEquals(entityeffect.FallingSpeed, val)
	end
	entityeffect.FallingSpeed = originalVal
end

function EntityEffectTest:TestVarIsFollowing(entityeffect)
	local originalVal = entityeffect.IsFollowing
	entityeffect.IsFollowing = true
	entityeffect.IsFollowing = originalVal
end

function EntityEffectTest:TestVarLifeSpan(entityeffect)
	local originalVal = entityeffect.LifeSpan
	for _, val in pairs(test.TestInts) do
		entityeffect.LifeSpan = val
		test.AssertEquals(entityeffect.LifeSpan, val)
	end
	entityeffect.LifeSpan = originalVal
end

function EntityEffectTest:TestVarMaxRadius(entityeffect)
	local originalVal = entityeffect.MaxRadius
	for _, val in pairs(test.TestFloats) do
		entityeffect.MaxRadius = val
		test.AssertEquals(entityeffect.MaxRadius, val)
	end
	entityeffect.MaxRadius = originalVal
end

function EntityEffectTest:TestVarMinRadius(entityeffect)
	local originalVal = entityeffect.MinRadius
	for _, val in pairs(test.TestFloats) do
		entityeffect.MinRadius = val
		test.AssertEquals(entityeffect.MinRadius, val)
	end
	entityeffect.MinRadius = originalVal
end

function EntityEffectTest:TestVarParentOffset(entityeffect)
	local originalVal = entityeffect.ParentOffset
	for _, val in pairs(test.TestVectors) do
		entityeffect.ParentOffset = val
		test.AssertEquals(entityeffect.ParentOffset, val)
	end
	entityeffect.ParentOffset = originalVal
end

function EntityEffectTest:TestVarRotation(entityeffect)
	local originalVal = entityeffect.Rotation
	for _, val in pairs(test.TestFloats) do
		entityeffect.Rotation = val
		test.AssertEquals(entityeffect.Rotation, val)
	end
	entityeffect.Rotation = originalVal
end

function EntityEffectTest:TestVarScale(entityeffect)
	local originalVal = entityeffect.Scale
	for _, val in pairs(test.TestFloats) do
		entityeffect.Scale = val
		test.AssertEquals(entityeffect.Scale, val)
	end
	entityeffect.Scale = originalVal
end

function EntityEffectTest:TestVarState(entityeffect)
	local originalVal = entityeffect.State
	for _, val in pairs(test.TestInts) do
		entityeffect.State = val
		test.AssertEquals(entityeffect.State, val)
	end
	entityeffect.State = originalVal
end

function EntityEffectTest:TestVarTimeout(entityeffect)
	local originalVal = entityeffect.Timeout
	for _, val in pairs(test.TestInts) do
		entityeffect.Timeout = val
		test.AssertEquals(entityeffect.Timeout, val)
	end
	entityeffect.Timeout = originalVal
end

function EntityEffectTest:TestUpdate(entityeffect)
	-- Case #1: Test callback

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_EFFECT_UPDATE, function(_, cEffect)
		test.AssertEquals(GetPtrHash(entityeffect), GetPtrHash(cEffect))
	end)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, function(_, cEffect)
		test.AssertEquals(GetPtrHash(entityeffect), GetPtrHash(cEffect))
	end)

	entityeffect:Update()

	-- Case #2: Test update cancelling

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_EFFECT_UPDATE, function(_, cEffect)
		test.AssertEquals(GetPtrHash(entityeffect), GetPtrHash(cEffect))
		return true
	end)

	test:AddUnexpectedCallback(ModCallbacks.MC_POST_EFFECT_UPDATE)

	entityeffect:Update()
end


return EntityEffectTest
