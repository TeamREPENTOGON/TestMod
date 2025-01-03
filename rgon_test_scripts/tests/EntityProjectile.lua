local test = REPENTOGON_TEST

local EntityProjectileTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityProjectileTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_PROJECTILE, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToProjectile()
end

function EntityProjectileTest:AfterEach(entityprojectile)
	entityprojectile:Remove()
end

----------

function EntityProjectileTest:TestAddChangeFlags(entityprojectile)
	local flags = 1
	entityprojectile:AddChangeFlags(flags)
end

function EntityProjectileTest:TestAddFallingAccel(entityprojectile)
	local value = 1
	entityprojectile:AddFallingAccel(value)
end

function EntityProjectileTest:TestAddFallingSpeed(entityprojectile)
	local value = 1
	entityprojectile:AddFallingSpeed(value)
end

function EntityProjectileTest:TestAddHeight(entityprojectile)
	local value = 1
	entityprojectile:AddHeight(value)
end

function EntityProjectileTest:TestAddProjectileFlags(entityprojectile)
	local flags = 1
	entityprojectile:AddProjectileFlags(flags)
end

function EntityProjectileTest:TestAddScale(entityprojectile)
	local value = 1
	entityprojectile:AddScale(value)
end

function EntityProjectileTest:TestClearProjectileFlags(entityprojectile)
	local flags = 1
	entityprojectile:ClearProjectileFlags(flags)
end

function EntityProjectileTest:TestHasProjectileFlags(entityprojectile)
	local flags = 1
	entityprojectile:HasProjectileFlags(flags)
end

function EntityProjectileTest:TestDeflect(entityprojectile)
	local newvelocity = Vector(1,1)
	entityprojectile:Deflect(newvelocity)
end

function EntityProjectileTest:TestVarAcceleration(entityprojectile)
	local originalVal = entityprojectile.Acceleration
	for _, val in pairs(test.TestFloats) do
		entityprojectile.Acceleration = val
		test.AssertEquals(entityprojectile.Acceleration, val)
	end
	entityprojectile.Acceleration = originalVal
end

function EntityProjectileTest:TestVarChangeFlags(entityprojectile)
	local originalVal = entityprojectile.ChangeFlags
	for _, val in pairs(test.TestInts) do
		entityprojectile.ChangeFlags = val
		test.AssertEquals(entityprojectile.ChangeFlags, val)
	end
	entityprojectile.ChangeFlags = originalVal
end

function EntityProjectileTest:TestVarChangeTimeout(entityprojectile)
	local originalVal = entityprojectile.ChangeTimeout
	for _, val in pairs(test.TestInts) do
		entityprojectile.ChangeTimeout = val
		test.AssertEquals(entityprojectile.ChangeTimeout, val)
	end
	entityprojectile.ChangeTimeout = originalVal
end

function EntityProjectileTest:TestVarChangeVelocity(entityprojectile)
	local originalVal = entityprojectile.ChangeVelocity
	for _, val in pairs(test.TestFloats) do
		entityprojectile.ChangeVelocity = val
		test.AssertEquals(entityprojectile.ChangeVelocity, val)
	end
	entityprojectile.ChangeVelocity = originalVal
end

function EntityProjectileTest:TestVarCurvingStrength(entityprojectile)
	local originalVal = entityprojectile.CurvingStrength
	for _, val in pairs(test.TestFloats) do
		entityprojectile.CurvingStrength = val
		test.AssertEquals(entityprojectile.CurvingStrength, val)
	end
	entityprojectile.CurvingStrength = originalVal
end

function EntityProjectileTest:TestVarDamage(entityprojectile)
	local originalVal = entityprojectile.Damage
	for _, val in pairs(test.TestFloats) do
		entityprojectile.Damage = val
		test.AssertEquals(entityprojectile.Damage, val)
	end
	entityprojectile.Damage = originalVal
end

function EntityProjectileTest:TestVarDepthOffset(entityprojectile)
	local originalVal = entityprojectile.DepthOffset
	for _, val in pairs(test.TestFloats) do
		entityprojectile.DepthOffset = val
		test.AssertEquals(entityprojectile.DepthOffset, val)
	end
	entityprojectile.DepthOffset = originalVal
end

function EntityProjectileTest:TestVarFallingAccel(entityprojectile)
	local originalVal = entityprojectile.FallingAccel
	for _, val in pairs(test.TestFloats) do
		entityprojectile.FallingAccel = val
		test.AssertEquals(entityprojectile.FallingAccel, val)
	end
	entityprojectile.FallingAccel = originalVal
end

function EntityProjectileTest:TestVarFallingSpeed(entityprojectile)
	local originalVal = entityprojectile.FallingSpeed
	for _, val in pairs(test.TestFloats) do
		entityprojectile.FallingSpeed = val
		test.AssertEquals(entityprojectile.FallingSpeed, val)
	end
	entityprojectile.FallingSpeed = originalVal
end

function EntityProjectileTest:TestVarHeight(entityprojectile)
	local originalVal = entityprojectile.Height
	for _, val in pairs(test.TestFloats) do
		entityprojectile.Height = val
		test.AssertEquals(entityprojectile.Height, val)
	end
	entityprojectile.Height = originalVal
end

function EntityProjectileTest:TestVarHomingStrength(entityprojectile)
	local originalVal = entityprojectile.HomingStrength
	for _, val in pairs(test.TestFloats) do
		entityprojectile.HomingStrength = val
		test.AssertEquals(entityprojectile.HomingStrength, val)
	end
	entityprojectile.HomingStrength = originalVal
end

function EntityProjectileTest:TestVarProjectileFlags(entityprojectile)
	local originalVal = entityprojectile.ProjectileFlags
	for _, val in pairs(test.TestInts) do
		entityprojectile.ProjectileFlags = val
		test.AssertEquals(entityprojectile.ProjectileFlags, val)
	end
	entityprojectile.ProjectileFlags = originalVal
end

function EntityProjectileTest:TestVarScale(entityprojectile)
	local originalVal = entityprojectile.Scale
	for _, val in pairs(test.TestFloats) do
		entityprojectile.Scale = val
		test.AssertEquals(entityprojectile.Scale, val)
	end
	entityprojectile.Scale = originalVal
end

function EntityProjectileTest:TestVarWiggleFrameOffset(entityprojectile)
	local originalVal = entityprojectile.WiggleFrameOffset
	for _, val in pairs(test.TestInts) do
		entityprojectile.WiggleFrameOffset = val
		test.AssertEquals(entityprojectile.WiggleFrameOffset, val)
	end
	entityprojectile.WiggleFrameOffset = originalVal
end

function EntityProjectileTest:TestProjDeathCallback(testproj)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_PROJECTILE_DEATH, function(_, proj)
		test.AssertEquals(GetPtrHash(proj), GetPtrHash(testproj))
	end)
	testproj:Kill()
	testproj:Update()
end


return EntityProjectileTest
