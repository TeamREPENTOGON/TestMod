local test = REPENTOGON_TEST

local EntityDeliriumTest = include(REPENTOGON_TEST.TestsRoot .. "EntityNPC")

function EntityDeliriumTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_DELIRIUM, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToDelirium()
end

function EntityDeliriumTest:AfterEach(entitydelirium)
	entitydelirium:Remove()
end

----------

function EntityDeliriumTest:TestIsRedMode(entitydelirium)
	entitydelirium:IsRedMode()
end

function EntityDeliriumTest:TestSetRedMode(entitydelirium)
	local on = true
	entitydelirium:SetRedMode(on)
end

function EntityDeliriumTest:TestSetTeleportationTimer(entitydelirium)
	local originalVal = entitydelirium:GetTeleportationTimer()
	for _, val in pairs(test.TestUInt8s) do
		entitydelirium:SetTeleportationTimer(val)
		test.AssertEquals(entitydelirium:GetTeleportationTimer(), val)
	end
	entitydelirium:SetTeleportationTimer(originalVal)
end

function EntityDeliriumTest:TestTransform(entitydelirium)
	entitydelirium:Transform(EntityType.ENTITY_MONSTRO, 0)
end

function EntityDeliriumTest:TestVarAngle(entitydelirium)
	local originalVal = entitydelirium.Angle
	for _, val in pairs(test.TestUInt8s) do
		entitydelirium.Angle = val
		test.AssertEquals(entitydelirium.Angle, val)
	end
	entitydelirium.Angle = originalVal
end

function EntityDeliriumTest:TestVarAttackID(entitydelirium)
	local originalVal = entitydelirium.AttackID
	for _, val in pairs(test.TestUnsignedInts) do
		entitydelirium.AttackID = val
		test.AssertEquals(entitydelirium.AttackID, val)
	end
	entitydelirium.AttackID = originalVal
end

function EntityDeliriumTest:TestVarBossType(entitydelirium)
	local bosstype = entitydelirium.BossType
end

function EntityDeliriumTest:TestVarBossVariant(entitydelirium)
	local bossvariant = entitydelirium.BossVariant
end

function EntityDeliriumTest:TestVarCycle(entitydelirium)
	local originalVal = entitydelirium.Cycle
	for _, val in pairs(test.TestUnsignedInts) do
		entitydelirium.Cycle = val
		test.AssertEquals(entitydelirium.Cycle, val)
	end
	entitydelirium.Cycle = originalVal
end

function EntityDeliriumTest:TestVarRemainingAttacks(entitydelirium)
	local originalVal = entitydelirium.RemainingAttacks
	for _, val in pairs(test.TestUInt8s) do
		entitydelirium.RemainingAttacks = val
		test.AssertEquals(entitydelirium.RemainingAttacks, val)
	end
	entitydelirium.RemainingAttacks = originalVal
end

function EntityDeliriumTest:TestVarStateD(entitydelirium)
	local originalVal = entitydelirium.StateD
	for _, val in pairs(test.TestUInt8s) do
		entitydelirium.StateD = val
		test.AssertEquals(entitydelirium.StateD, val)
	end
	entitydelirium.StateD = originalVal
end

function EntityDeliriumTest:TestVarTransformationTimer(entitydelirium)
	local originalVal = entitydelirium.TransformationTimer
	for _, val in pairs(test.TestUInt16s) do
		entitydelirium.TransformationTimer = val
		test.AssertEquals(entitydelirium.TransformationTimer, val)
	end
	entitydelirium.TransformationTimer = originalVal
end


return EntityDeliriumTest
