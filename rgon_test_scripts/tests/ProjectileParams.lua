local test = REPENTOGON_TEST

local ProjectileParamsTest = {}

function ProjectileParamsTest:BeforeEach()
	return ProjectileParams()
end

function ProjectileParamsTest:AfterEach(projectileparams)
	
end

----------

function ProjectileParamsTest:TestVarAcceleration(projectileparams)
	local originalVal = projectileparams.Acceleration
	for _, val in pairs(test.TestFloats) do
		projectileparams.Acceleration = val
		test.AssertEquals(projectileparams.Acceleration, val)
	end
	projectileparams.Acceleration = originalVal
end

function ProjectileParamsTest:TestVarBulletFlags(projectileparams)
	local originalVal = projectileparams.BulletFlags
	for _, val in pairs(test.TestInts) do
		projectileparams.BulletFlags = val
		test.AssertEquals(projectileparams.BulletFlags, val)
	end
	projectileparams.BulletFlags = originalVal
end

function ProjectileParamsTest:TestVarChangeFlags(projectileparams)
	local originalVal = projectileparams.ChangeFlags
	for _, val in pairs(test.TestInts) do
		projectileparams.ChangeFlags = val
		test.AssertEquals(projectileparams.ChangeFlags, val)
	end
	projectileparams.ChangeFlags = originalVal
end

function ProjectileParamsTest:TestVarChangeTimeout(projectileparams)
	local originalVal = projectileparams.ChangeTimeout
	for _, val in pairs(test.TestInts) do
		projectileparams.ChangeTimeout = val
		test.AssertEquals(projectileparams.ChangeTimeout, val)
	end
	projectileparams.ChangeTimeout = originalVal
end

function ProjectileParamsTest:TestVarChangeVelocity(projectileparams)
	local originalVal = projectileparams.ChangeVelocity
	for _, val in pairs(test.TestFloats) do
		projectileparams.ChangeVelocity = val
		test.AssertEquals(projectileparams.ChangeVelocity, val)
	end
	projectileparams.ChangeVelocity = originalVal
end

function ProjectileParamsTest:TestVarCircleAngle(projectileparams)
	local originalVal = projectileparams.CircleAngle
	for _, val in pairs(test.TestFloats) do
		projectileparams.CircleAngle = val
		test.AssertEquals(projectileparams.CircleAngle, val)
	end
	projectileparams.CircleAngle = originalVal
end

function ProjectileParamsTest:TestVarColor(projectileparams)
	local originalVal = projectileparams.Color
	for _, val in pairs(test.TestColors) do
		projectileparams.Color = val
		test.AssertEquals(projectileparams.Color, val)
	end
	projectileparams.Color = originalVal
end

function ProjectileParamsTest:TestVarCurvingStrength(projectileparams)
	local originalVal = projectileparams.CurvingStrength
	for _, val in pairs(test.TestFloats) do
		projectileparams.CurvingStrength = val
		test.AssertEquals(projectileparams.CurvingStrength, val)
	end
	projectileparams.CurvingStrength = originalVal
end

function ProjectileParamsTest:TestVarDepthOffset(projectileparams)
	local originalVal = projectileparams.DepthOffset
	for _, val in pairs(test.TestFloats) do
		projectileparams.DepthOffset = val
		test.AssertEquals(projectileparams.DepthOffset, val)
	end
	projectileparams.DepthOffset = originalVal
end

function ProjectileParamsTest:TestVarDotProductLimit(projectileparams)
	local originalVal = projectileparams.DotProductLimit
	for _, val in pairs(test.TestFloats) do
		projectileparams.DotProductLimit = val
		test.AssertEquals(projectileparams.DotProductLimit, val)
	end
	projectileparams.DotProductLimit = originalVal
end

function ProjectileParamsTest:TestVarFallingAccelModifier(projectileparams)
	local originalVal = projectileparams.FallingAccelModifier
	for _, val in pairs(test.TestFloats) do
		projectileparams.FallingAccelModifier = val
		test.AssertEquals(projectileparams.FallingAccelModifier, val)
	end
	projectileparams.FallingAccelModifier = originalVal
end

function ProjectileParamsTest:TestVarFallingSpeedModifier(projectileparams)
	local originalVal = projectileparams.FallingSpeedModifier
	for _, val in pairs(test.TestFloats) do
		projectileparams.FallingSpeedModifier = val
		test.AssertEquals(projectileparams.FallingSpeedModifier, val)
	end
	projectileparams.FallingSpeedModifier = originalVal
end

function ProjectileParamsTest:TestVarFireDirectionLimit(projectileparams)
	local originalVal = projectileparams.FireDirectionLimit
	for _, val in pairs(test.TestVectors) do
		projectileparams.FireDirectionLimit = val
		test.AssertEquals(projectileparams.FireDirectionLimit, val)
	end
	projectileparams.FireDirectionLimit = originalVal
end

function ProjectileParamsTest:TestVarGridCollision(projectileparams)
	local originalVal = projectileparams.GridCollision
	projectileparams.GridCollision = true
	projectileparams.GridCollision = originalVal
end

function ProjectileParamsTest:TestVarHeightModifier(projectileparams)
	local originalVal = projectileparams.HeightModifier
	for _, val in pairs(test.TestFloats) do
		projectileparams.HeightModifier = val
		test.AssertEquals(projectileparams.HeightModifier, val)
	end
	projectileparams.HeightModifier = originalVal
end

function ProjectileParamsTest:TestVarHomingStrength(projectileparams)
	local originalVal = projectileparams.HomingStrength
	for _, val in pairs(test.TestFloats) do
		projectileparams.HomingStrength = val
		test.AssertEquals(projectileparams.HomingStrength, val)
	end
	projectileparams.HomingStrength = originalVal
end

function ProjectileParamsTest:TestVarPositionOffset(projectileparams)
	local originalVal = projectileparams.PositionOffset
	for _, val in pairs(test.TestVectors) do
		projectileparams.PositionOffset = val
		test.AssertEquals(projectileparams.PositionOffset, val)
	end
	projectileparams.PositionOffset = originalVal
end

function ProjectileParamsTest:TestVarScale(projectileparams)
	local originalVal = projectileparams.Scale
	for _, val in pairs(test.TestFloats) do
		projectileparams.Scale = val
		test.AssertEquals(projectileparams.Scale, val)
	end
	projectileparams.Scale = originalVal
end

function ProjectileParamsTest:TestVarSpread(projectileparams)
	local originalVal = projectileparams.Spread
	for _, val in pairs(test.TestFloats) do
		projectileparams.Spread = val
		test.AssertEquals(projectileparams.Spread, val)
	end
	projectileparams.Spread = originalVal
end

function ProjectileParamsTest:TestVarTargetPosition(projectileparams)
	local originalVal = projectileparams.TargetPosition
	for _, val in pairs(test.TestVectors) do
		projectileparams.TargetPosition = val
		test.AssertEquals(projectileparams.TargetPosition, val)
	end
	projectileparams.TargetPosition = originalVal
end

function ProjectileParamsTest:TestVarVariant(projectileparams)
	local originalVal = projectileparams.Variant
	for _, val in pairs(test.TestInts) do
		projectileparams.Variant = val
		test.AssertEquals(projectileparams.Variant, val)
	end
	projectileparams.Variant = originalVal
end

function ProjectileParamsTest:TestVarVelocityMulti(projectileparams)
	local originalVal = projectileparams.VelocityMulti
	for _, val in pairs(test.TestFloats) do
		projectileparams.VelocityMulti = val
		test.AssertEquals(projectileparams.VelocityMulti, val)
	end
	projectileparams.VelocityMulti = originalVal
end

function ProjectileParamsTest:TestVarWiggleFrameOffset(projectileparams)
	local originalVal = projectileparams.WiggleFrameOffset
	for _, val in pairs(test.TestInts) do
		projectileparams.WiggleFrameOffset = val
		test.AssertEquals(projectileparams.WiggleFrameOffset, val)
	end
	projectileparams.WiggleFrameOffset = originalVal
end

function ProjectileParamsTest:TestVarDamage(projectileparams)
	local originalVal = projectileparams.Damage  -- This will be -1 by default
	for _, val in pairs(test.TestNonNegativeFloats) do
		projectileparams.Damage = val
		test.AssertEquals(projectileparams.Damage, val)
	end
	-- The value actually defaults to -1 but we throw an error if you try to set the damage to a negative value. Odd!
	--projectileparams.Damage = originalVal
end


return ProjectileParamsTest
