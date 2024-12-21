local test = REPENTOGON_TEST

local EntitiesSaveStateTest = {}

function EntitiesSaveStateTest:BeforeEach()
	if #Game():GetLevel():GetCurrentRoomDesc():GetEntitiesSaveState() == 0 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP,20,0,Vector.Zero,Vector.Zero, nil)
		Game():ChangeRoom(Game():GetLevel():GetCurrentRoomIndex())
	end
	return Game():GetLevel():GetCurrentRoomDesc():GetEntitiesSaveState():Get(0)
end

function EntitiesSaveStateTest:AfterEach(entitiessavestate)
	
end

----------

function EntitiesSaveStateTest:TestGetDropSeed(entitiessavestate)
	entitiessavestate:GetDropSeed()
end

function EntitiesSaveStateTest:TestGetGridSpawnIdx(entitiessavestate)
	entitiessavestate:GetGridSpawnIdx()
end

function EntitiesSaveStateTest:TestGetInitSeed(entitiessavestate)
	entitiessavestate:GetInitSeed()
end

function EntitiesSaveStateTest:TestGetSpawnerType(entitiessavestate)
	entitiessavestate:GetSpawnerType()
end

function EntitiesSaveStateTest:TestGetSpawnerVariant(entitiessavestate)
	entitiessavestate:GetSpawnerVariant()
end

function EntitiesSaveStateTest:TestSetPos(entitiessavestate)
	local originalVal = entitiessavestate:GetPos()
	for _, val in pairs(test.TestVectors) do
		entitiessavestate:SetPos(val)
		test.AssertEquals(entitiessavestate:GetPos(), val)
	end
	entitiessavestate:SetPos(originalVal)
end

function EntitiesSaveStateTest:TestSetSubType(entitiessavestate)
	local originalVal = entitiessavestate:GetSubType()
	for _, val in pairs(test.TestInts) do
		entitiessavestate:SetSubType(val)
		test.AssertEquals(entitiessavestate:GetSubType(), val)
	end
	entitiessavestate:SetSubType(originalVal)
end

function EntitiesSaveStateTest:TestSetType(entitiessavestate)
	local originalVal = entitiessavestate:GetType()
	for _, val in pairs(test.TestInts) do
		entitiessavestate:SetType(val)
		test.AssertEquals(entitiessavestate:GetType(), val)
	end
	entitiessavestate:SetType(originalVal)
end

function EntitiesSaveStateTest:TestSetVariant(entitiessavestate)
	local originalVal = entitiessavestate:GetVariant()
	for _, val in pairs(test.TestInts) do
		entitiessavestate:SetVariant(val)
		test.AssertEquals(entitiessavestate:GetVariant(), val)
	end
	entitiessavestate:SetVariant(originalVal)
end


return EntitiesSaveStateTest
