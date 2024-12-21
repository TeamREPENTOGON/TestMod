local test = REPENTOGON_TEST

local EntityRefTest = {}

function EntityRefTest:BeforeEach()
	return EntityRef(Isaac.GetPlayer())
end

function EntityRefTest:AfterEach(entityref)
	
end

----------

function EntityRefTest:TestVarEntity(entityref)
	local originalVal = entityref.Entity
	entityref.Entity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityref.Entity:Remove()
	entityref.Entity = originalVal
end

function EntityRefTest:TestVarIsCharmed(entityref)
	local originalVal = entityref.IsCharmed
	entityref.IsCharmed = true
	entityref.IsCharmed = originalVal
end

function EntityRefTest:TestVarIsFriendly(entityref)
	local originalVal = entityref.IsFriendly
	entityref.IsFriendly = true
	entityref.IsFriendly = originalVal
end

function EntityRefTest:TestVarPosition(entityref)
	local originalVal = entityref.Position
	for _, val in pairs(test.TestVectors) do
		entityref.Position = val
		test.AssertEquals(entityref.Position, val)
	end
	entityref.Position = originalVal
end

function EntityRefTest:TestVarSpawnerType(entityref)
	local originalVal = entityref.SpawnerType
	for _, val in pairs(test.TestInts) do
		entityref.SpawnerType = val
		test.AssertEquals(entityref.SpawnerType, val)
	end
	entityref.SpawnerType = originalVal
end

function EntityRefTest:TestVarSpawnerVariant(entityref)
	local originalVal = entityref.SpawnerVariant
	for _, val in pairs(test.TestUnsignedInts) do
		entityref.SpawnerVariant = val
		test.AssertEquals(entityref.SpawnerVariant, val)
	end
	entityref.SpawnerVariant = originalVal
end

function EntityRefTest:TestVarType(entityref)
	local originalVal = entityref.Type
	for _, val in pairs(test.TestInts) do
		entityref.Type = val
		test.AssertEquals(entityref.Type, val)
	end
	entityref.Type = originalVal
end

function EntityRefTest:TestVarVariant(entityref)
	local originalVal = entityref.Variant
	for _, val in pairs(test.TestUnsignedInts) do
		entityref.Variant = val
		test.AssertEquals(entityref.Variant, val)
	end
	entityref.Variant = originalVal
end


return EntityRefTest
