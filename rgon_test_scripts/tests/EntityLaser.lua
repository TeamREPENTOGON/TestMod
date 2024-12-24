local test = REPENTOGON_TEST

local EntityLaserTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityLaserTest:BeforeEach()
	local laser = Isaac.Spawn(EntityType.ENTITY_LASER, LaserVariant.THIN_RED, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToLaser()
	laser:Update()
	return laser
end

function EntityLaserTest:AfterEach(entitylaser)
	entitylaser:Remove()
end

----------

function EntityLaserTest:TestAddTearFlags(entitylaser)
	local flags = BitSet128()
	entitylaser:AddTearFlags(flags)
end

function EntityLaserTest:TestCalculateEndPoint(entitylaser)
	local start = Vector(1,1)
	local dir = Vector(1,1)
	local positionoffset = Vector(1,1)
	local parent = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local margin = 1
	EntityLaser.CalculateEndPoint(start, dir, positionoffset, parent, margin)
	parent:Remove()
end

function EntityLaserTest:TestClearTearFlags(entitylaser)
	local flags = BitSet128()
	entitylaser:ClearTearFlags(flags)
end

function EntityLaserTest:TestGetEndPoint(entitylaser)
	entitylaser:GetEndPoint()
end

function EntityLaserTest:TestGetNonOptimizedSamples(entitylaser)
	entitylaser:GetNonOptimizedSamples()
end

function EntityLaserTest:TestGetRenderZ(entitylaser)
	entitylaser:GetRenderZ()
end

function EntityLaserTest:TestGetSamples(entitylaser)
	entitylaser:GetSamples()
end

function EntityLaserTest:TestHasTearFlags(entitylaser)
	local flags = BitSet128()
	entitylaser:HasTearFlags(flags)
end

function EntityLaserTest:TestIsCircleLaser(entitylaser)
	entitylaser:IsCircleLaser()
end

function EntityLaserTest:TestIsSampleLaser(entitylaser)
	entitylaser:IsSampleLaser()
end

function EntityLaserTest:TestSetActiveRotation(entitylaser)
	local delay = 1
	local angledegrees = 1
	local rotationspd = 1
	local timeoutcomplete = true
	entitylaser:SetActiveRotation(delay, angledegrees, rotationspd, timeoutcomplete)
end

function EntityLaserTest:TestSetBlackHpDropChance(entitylaser)
	local chance = 1
	entitylaser:SetBlackHpDropChance(chance)
end

function EntityLaserTest:TestSetHomingType(entitylaser)
	local laserhomingtype = 1
	entitylaser:SetHomingType(laserhomingtype)
end

function EntityLaserTest:TestSetMaxDistance(entitylaser)
	local distance = 1
	entitylaser:SetMaxDistance(distance)
end

function EntityLaserTest:TestSetMultidimensionalTouched(entitylaser)
	local value = true
	entitylaser:SetMultidimensionalTouched(value)
end

function EntityLaserTest:TestSetOneHit(entitylaser)
	local value = true
	entitylaser:SetOneHit(value)
end

function EntityLaserTest:TestSetTimeout(entitylaser)
	local originalVal = entitylaser:GetTimeout()
	for _, val in pairs(test.TestInts) do
		entitylaser:SetTimeout(val)
		test.AssertEquals(entitylaser:GetTimeout(), val)
	end
	entitylaser:SetTimeout(originalVal)
end

function EntityLaserTest:TestShootAngle(entitylaser)
	local variant = 1
	local sourcepos = Vector(1,1)
	local angledegrees = 1
	local timeout = 1
	local posoffset = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	EntityLaser.ShootAngle(variant, sourcepos, angledegrees, timeout, posoffset, source)
	source:Remove()
end

function EntityLaserTest:TestGetDisableFollowParent(entitylaser)
	entitylaser:GetDisableFollowParent()
end

function EntityLaserTest:TestGetHitList(entitylaser)
	entitylaser:GetHitList()
end

function EntityLaserTest:TestGetOneHit(entitylaser)
	entitylaser:GetOneHit()
end

function EntityLaserTest:TestGetShrink(entitylaser)
	entitylaser:GetShrink()
end

function EntityLaserTest:TestIsMultidimensionalTouched(entitylaser)
	entitylaser:IsMultidimensionalTouched()
end

function EntityLaserTest:TestIsPrismTouched(entitylaser)
	entitylaser:IsPrismTouched()
end

function EntityLaserTest:TestRecalculateSamplesNextUpdate(entitylaser)
	test.AssertEquals(entitylaser.LaserLength, 280)
	entitylaser:SetMaxDistance(100)
	test.AssertEquals(entitylaser.LaserLength, 280)
	entitylaser:RecalculateSamplesNextUpdate()
	test.AssertEquals(entitylaser.LaserLength, 280)
	entitylaser:Update()
	test.AssertEquals(entitylaser.LaserLength, 100)
end

function EntityLaserTest:TestResetSpriteScale(entitylaser)
	entitylaser:ResetSpriteScale()
end

function EntityLaserTest:TestRotateToAngle(entitylaser)
	local angle = 1
	local speed = 1
	entitylaser:RotateToAngle(angle, speed)
end

function EntityLaserTest:TestSetDamageMultiplier(entitylaser)
	local originalVal = entitylaser:GetDamageMultiplier()
	for _, val in pairs(test.TestFloats) do
		entitylaser:SetDamageMultiplier(val)
		test.AssertEquals(entitylaser:GetDamageMultiplier(), val)
	end
	entitylaser:SetDamageMultiplier(originalVal)
end

function EntityLaserTest:TestSetDisableFollowParent(entitylaser)
	local value = true
	entitylaser:SetDisableFollowParent(value)
end

function EntityLaserTest:TestSetPrismTouched(entitylaser)
	local istouched = true
	entitylaser:SetPrismTouched(istouched)
end

function EntityLaserTest:TestSetScale(entitylaser)
	local originalVal = entitylaser:GetScale()
	for _, val in pairs(test.TestFloats) do
		entitylaser:SetScale(val)
		test.AssertEquals(entitylaser:GetScale(), val)
	end
	entitylaser:SetScale(originalVal)
end

function EntityLaserTest:TestSetShrink(entitylaser)
	local value = true
	entitylaser:SetShrink(value)
end

function EntityLaserTest:TestVarAngle(entitylaser)
	local originalVal = entitylaser.Angle
	for _, val in pairs(test.TestFloats) do
		entitylaser.Angle = val
		test.AssertEquals(entitylaser.Angle, val)
	end
	entitylaser.Angle = originalVal
end

function EntityLaserTest:TestVarAngleDegrees(entitylaser)
	local originalVal = entitylaser.AngleDegrees
	for _, val in pairs(test.TestFloats) do
		entitylaser.AngleDegrees = val
		test.AssertEquals(entitylaser.AngleDegrees, val)
	end
	entitylaser.AngleDegrees = originalVal
end

function EntityLaserTest:TestVarBlackHpDropChance(entitylaser)
	local originalVal = entitylaser.BlackHpDropChance
	for _, val in pairs(test.TestFloats) do
		entitylaser.BlackHpDropChance = val
		test.AssertEquals(entitylaser.BlackHpDropChance, val)
	end
	entitylaser.BlackHpDropChance = originalVal
end

function EntityLaserTest:TestVarBounceLaser(entitylaser)
	local originalVal = entitylaser.BounceLaser
	entitylaser.BounceLaser = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entitylaser.BounceLaser:Remove()
	entitylaser.BounceLaser = originalVal
end

function EntityLaserTest:TestVarCurveStrength(entitylaser)
	local originalVal = entitylaser.CurveStrength
	for _, val in pairs(test.TestFloats) do
		entitylaser.CurveStrength = val
		test.AssertEquals(entitylaser.CurveStrength, val)
	end
	entitylaser.CurveStrength = originalVal
end

function EntityLaserTest:TestVarDisableFollowParent(entitylaser)
	local originalVal = entitylaser.DisableFollowParent
	entitylaser.DisableFollowParent = true
	entitylaser.DisableFollowParent = originalVal
end

function EntityLaserTest:TestVarEndPoint(entitylaser)
	local originalVal = entitylaser.EndPoint
	for _, val in pairs(test.TestVectors) do
		entitylaser.EndPoint = val
		test.AssertEquals(entitylaser.EndPoint, val)
	end
	entitylaser.EndPoint = originalVal
end

function EntityLaserTest:TestVarFirstUpdate(entitylaser)
	local originalVal = entitylaser.FirstUpdate
	entitylaser.FirstUpdate = true
	entitylaser.FirstUpdate = originalVal
end

function EntityLaserTest:TestVarGridHit(entitylaser)
	local originalVal = entitylaser.GridHit
	entitylaser.GridHit = true
	entitylaser.GridHit = originalVal
end
--[[
function EntityLaserTest:TestVarHomingLaser(entitylaser)
	local originalVal = entitylaser.HomingLaser
	for _, val in pairs(test.TestInts) do
		entitylaser.HomingLaser = val
		test.AssertEquals(entitylaser.HomingLaser, val)
	end
	entitylaser.HomingLaser = originalVal
end
]]
function EntityLaserTest:TestVarHomingType(entitylaser)
	local originalVal = entitylaser.HomingType
	for _, val in pairs(test.TestUnsignedInts) do
		entitylaser.HomingType = val
		test.AssertEquals(entitylaser.HomingType, val)
	end
	entitylaser.HomingType = originalVal
end

function EntityLaserTest:TestVarIsActiveRotating(entitylaser)
	local originalVal = entitylaser.IsActiveRotating
	entitylaser.IsActiveRotating = true
	entitylaser.IsActiveRotating = originalVal
end

function EntityLaserTest:TestVarLaserLength(entitylaser)
	local originalVal = entitylaser.LaserLength
	for _, val in pairs(test.TestFloats) do
		entitylaser.LaserLength = val
		test.AssertEquals(entitylaser.LaserLength, val)
	end
	entitylaser.LaserLength = originalVal
end

function EntityLaserTest:TestVarLastAngleDegrees(entitylaser)
	local originalVal = entitylaser.LastAngleDegrees
	for _, val in pairs(test.TestFloats) do
		entitylaser.LastAngleDegrees = val
		test.AssertEquals(entitylaser.LastAngleDegrees, val)
	end
	entitylaser.LastAngleDegrees = originalVal
end

function EntityLaserTest:TestVarMaxDistance(entitylaser)
	local originalVal = entitylaser.MaxDistance
	for _, val in pairs(test.TestFloats) do
		entitylaser.MaxDistance = val
		test.AssertEquals(entitylaser.MaxDistance, val)
	end
	entitylaser.MaxDistance = originalVal
end

function EntityLaserTest:TestVarOneHit(entitylaser)
	local originalVal = entitylaser.OneHit
	entitylaser.OneHit = true
	entitylaser.OneHit = originalVal
end

function EntityLaserTest:TestVarParentOffset(entitylaser)
	local originalVal = entitylaser.ParentOffset
	for _, val in pairs(test.TestVectors) do
		entitylaser.ParentOffset = val
		test.AssertEquals(entitylaser.ParentOffset, val)
	end
	entitylaser.ParentOffset = originalVal
end

function EntityLaserTest:TestVarRadius(entitylaser)
	local originalVal = entitylaser.Radius
	for _, val in pairs(test.TestFloats) do
		entitylaser.Radius = val
		test.AssertEquals(entitylaser.Radius, val)
	end
	entitylaser.Radius = originalVal
end

function EntityLaserTest:TestVarRotationDegrees(entitylaser)
	local originalVal = entitylaser.RotationDegrees
	for _, val in pairs(test.TestFloats) do
		entitylaser.RotationDegrees = val
		test.AssertEquals(entitylaser.RotationDegrees, val)
	end
	entitylaser.RotationDegrees = originalVal
end

function EntityLaserTest:TestVarRotationDelay(entitylaser)
	local originalVal = entitylaser.RotationDelay
	for _, val in pairs(test.TestUnsignedInts) do
		entitylaser.RotationDelay = val
		test.AssertEquals(entitylaser.RotationDelay, val)
	end
	entitylaser.RotationDelay = originalVal
end

function EntityLaserTest:TestVarRotationSpd(entitylaser)
	local originalVal = entitylaser.RotationSpd
	for _, val in pairs(test.TestFloats) do
		entitylaser.RotationSpd = val
		test.AssertEquals(entitylaser.RotationSpd, val)
	end
	entitylaser.RotationSpd = originalVal
end
--[[
function EntityLaserTest:TestVarSampleLaser(entitylaser)
	local originalVal = entitylaser.SampleLaser
	entitylaser.SampleLaser = true
	entitylaser.SampleLaser = originalVal
end
]]
function EntityLaserTest:TestVarShrink(entitylaser)
	local originalVal = entitylaser.Shrink
	entitylaser.Shrink = true
	entitylaser.Shrink = originalVal
end

function EntityLaserTest:TestVarStartAngleDegrees(entitylaser)
	local originalVal = entitylaser.StartAngleDegrees
	for _, val in pairs(test.TestFloats) do
		entitylaser.StartAngleDegrees = val
		test.AssertEquals(entitylaser.StartAngleDegrees, val)
	end
	entitylaser.StartAngleDegrees = originalVal
end

function EntityLaserTest:TestVarTearFlags(entitylaser)
	local originalVal = entitylaser.TearFlags
	entitylaser.TearFlags = BitSet128()
	entitylaser.TearFlags = originalVal
end

function EntityLaserTest:TestVarTimeout(entitylaser)
	local originalVal = entitylaser.Timeout
	for _, val in pairs(test.TestInts) do
		entitylaser.Timeout = val
		test.AssertEquals(entitylaser.Timeout, val)
	end
	entitylaser.Timeout = originalVal
end


return EntityLaserTest
