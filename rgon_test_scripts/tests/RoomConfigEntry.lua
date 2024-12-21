local test = REPENTOGON_TEST

local RoomConfigEntryTest = {}

function RoomConfigEntryTest:BeforeEach()
	return RoomConfigHolder.GetRandomRoom(1234, false, 1, 1).Spawns:Get(0):PickEntry(0.5)
end

function RoomConfigEntryTest:AfterEach(roomconfigentry)
	
end

----------

function RoomConfigEntryTest:TestVarSubtype(roomconfigentry)
	local originalVal = roomconfigentry.Subtype
	for _, val in pairs(test.TestUInt16s) do
		roomconfigentry.Subtype = val
		test.AssertEquals(roomconfigentry.Subtype, val)
	end
	roomconfigentry.Subtype = originalVal
end

function RoomConfigEntryTest:TestVarType(roomconfigentry)
	local originalVal = roomconfigentry.Type
	for _, val in pairs(test.TestInts) do
		roomconfigentry.Type = val
		test.AssertEquals(roomconfigentry.Type, val)
	end
	roomconfigentry.Type = originalVal
end

function RoomConfigEntryTest:TestVarVariant(roomconfigentry)
	local originalVal = roomconfigentry.Variant
	for _, val in pairs(test.TestUInt16s) do
		roomconfigentry.Variant = val
		test.AssertEquals(roomconfigentry.Variant, val)
	end
	roomconfigentry.Variant = originalVal
end

function RoomConfigEntryTest:TestVarWeight(roomconfigentry)
	local originalVal = roomconfigentry.Weight
	for _, val in pairs(test.TestFloats) do
		roomconfigentry.Weight = val
		test.AssertEquals(roomconfigentry.Weight, val)
	end
	roomconfigentry.Weight = originalVal
end


return RoomConfigEntryTest
