local test = REPENTOGON_TEST

local RoomConfigSpawnTest = {}

function RoomConfigSpawnTest:BeforeEach()
	return RoomConfigHolder.GetRandomRoom(1234, false, 1, 1).Spawns:Get(0)
end

function RoomConfigSpawnTest:AfterEach(roomconfigspawn)
	
end

----------

function RoomConfigSpawnTest:TestPickEntry(roomconfigspawn)
	local r = 1
	roomconfigspawn:PickEntry(r)
end

function RoomConfigSpawnTest:TestVarEntries(roomconfigspawn)
	local entries = roomconfigspawn.Entries
end

function RoomConfigSpawnTest:TestVarEntryCount(roomconfigspawn)
	local originalVal = roomconfigspawn.EntryCount
	for _, val in pairs(test.TestUInt8s) do
		roomconfigspawn.EntryCount = val
		test.AssertEquals(roomconfigspawn.EntryCount, val)
	end
	roomconfigspawn.EntryCount = originalVal
end

function RoomConfigSpawnTest:TestVarSumWeights(roomconfigspawn)
	local originalVal = roomconfigspawn.SumWeights
	for _, val in pairs(test.TestFloats) do
		roomconfigspawn.SumWeights = val
		test.AssertEquals(roomconfigspawn.SumWeights, val)
	end
	roomconfigspawn.SumWeights = originalVal
end

function RoomConfigSpawnTest:TestVarX(roomconfigspawn)
	local originalVal = roomconfigspawn.X
	for _, val in pairs(test.TestInt16s) do
		roomconfigspawn.X = val
		test.AssertEquals(roomconfigspawn.X, val)
	end
	roomconfigspawn.X = originalVal
end

function RoomConfigSpawnTest:TestVarY(roomconfigspawn)
	local originalVal = roomconfigspawn.Y
	for _, val in pairs(test.TestInt16s) do
		roomconfigspawn.Y = val
		test.AssertEquals(roomconfigspawn.Y, val)
	end
	roomconfigspawn.Y = originalVal
end


return RoomConfigSpawnTest
