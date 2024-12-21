local test = REPENTOGON_TEST

local RoomDescriptorTest = {}

function RoomDescriptorTest:BeforeEach()
	return Game():GetLevel():GetCurrentRoomDesc()
end

function RoomDescriptorTest:AfterEach(roomdescriptor)
	
end

----------

function RoomDescriptorTest:TestAddRestrictedGridIndex(roomdescriptor)
	local gridindex = 1
	roomdescriptor:AddRestrictedGridIndex(gridindex)
end

function RoomDescriptorTest:TestGetDecoSaveState(roomdescriptor)
	roomdescriptor:GetDecoSaveState()
end

function RoomDescriptorTest:TestGetDimension(roomdescriptor)
	roomdescriptor:GetDimension()
end

function RoomDescriptorTest:TestGetEntitiesSaveState(roomdescriptor)
	roomdescriptor:GetEntitiesSaveState()
end

function RoomDescriptorTest:TestGetGridEntitiesSaveState(roomdescriptor)
	roomdescriptor:GetGridEntitiesSaveState()
end

function RoomDescriptorTest:TestGetNeighboringRooms(roomdescriptor)
	roomdescriptor:GetNeighboringRooms()
end

function RoomDescriptorTest:TestGetRestrictedGridIndexes(roomdescriptor)
	roomdescriptor:GetRestrictedGridIndexes()
end

function RoomDescriptorTest:TestInitSeeds(roomdescriptor)
	local rng = RNG()
	roomdescriptor:InitSeeds(rng)
end

function RoomDescriptorTest:TestVarAllowedDoors(roomdescriptor)
	local originalVal = roomdescriptor.AllowedDoors
	for _, val in pairs(test.TestInts) do
		roomdescriptor.AllowedDoors = val
		test.AssertEquals(roomdescriptor.AllowedDoors, val)
	end
	roomdescriptor.AllowedDoors = originalVal
end

function RoomDescriptorTest:TestVarAwardSeed(roomdescriptor)
	local originalVal = roomdescriptor.AwardSeed
	for _, val in pairs(test.TestUnsignedInts) do
		roomdescriptor.AwardSeed = val
		test.AssertEquals(roomdescriptor.AwardSeed, val)
	end
	roomdescriptor.AwardSeed = originalVal
end

function RoomDescriptorTest:TestVarChallengeDone(roomdescriptor)
	local originalVal = roomdescriptor.ChallengeDone
	roomdescriptor.ChallengeDone = true
	roomdescriptor.ChallengeDone = originalVal
end

function RoomDescriptorTest:TestVarClear(roomdescriptor)
	local originalVal = roomdescriptor.Clear
	roomdescriptor.Clear = true
	roomdescriptor.Clear = originalVal
end

function RoomDescriptorTest:TestVarClearCount(roomdescriptor)
	local originalVal = roomdescriptor.ClearCount
	for _, val in pairs(test.TestUInt16s) do
		roomdescriptor.ClearCount = val
		test.AssertEquals(roomdescriptor.ClearCount, val)
	end
	roomdescriptor.ClearCount = originalVal
end

function RoomDescriptorTest:TestVarData(roomdescriptor)
	local originalVal = roomdescriptor.Data
	roomdescriptor.Data = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	roomdescriptor.Data = originalVal
end

function RoomDescriptorTest:TestVarDecorationSeed(roomdescriptor)
	local originalVal = roomdescriptor.DecorationSeed
	for _, val in pairs(test.TestUnsignedInts) do
		roomdescriptor.DecorationSeed = val
		test.AssertEquals(roomdescriptor.DecorationSeed, val)
	end
	roomdescriptor.DecorationSeed = originalVal
end

function RoomDescriptorTest:TestVarDeliriumDistance(roomdescriptor)
	local originalVal = roomdescriptor.DeliriumDistance
	for _, val in pairs(test.TestInts) do
		roomdescriptor.DeliriumDistance = val
		test.AssertEquals(roomdescriptor.DeliriumDistance, val)
	end
	roomdescriptor.DeliriumDistance = originalVal
end

function RoomDescriptorTest:TestVarDisplayFlags(roomdescriptor)
	local originalVal = roomdescriptor.DisplayFlags
	for _, val in pairs(test.TestUnsignedInts) do
		roomdescriptor.DisplayFlags = val
		test.AssertEquals(roomdescriptor.DisplayFlags, val)
	end
	roomdescriptor.DisplayFlags = originalVal
end

function RoomDescriptorTest:TestVarFlags(roomdescriptor)
	local originalVal = roomdescriptor.Flags
	for _, val in pairs(test.TestUnsignedInts) do
		roomdescriptor.Flags = val
		test.AssertEquals(roomdescriptor.Flags, val)
	end
	roomdescriptor.Flags = originalVal
end

function RoomDescriptorTest:TestVarGridIndex(roomdescriptor)
	local originalVal = roomdescriptor.GridIndex
	for _, val in pairs(test.TestInts) do
		roomdescriptor.GridIndex = val
		test.AssertEquals(roomdescriptor.GridIndex, val)
	end
	roomdescriptor.GridIndex = originalVal
end

function RoomDescriptorTest:TestVarHasWater(roomdescriptor)
	local originalVal = roomdescriptor.HasWater
	roomdescriptor.HasWater = true
	roomdescriptor.HasWater = originalVal
end

function RoomDescriptorTest:TestVarListIndex(roomdescriptor)
	local originalVal = roomdescriptor.ListIndex
	for _, val in pairs(test.TestInts) do
		roomdescriptor.ListIndex = val
		test.AssertEquals(roomdescriptor.ListIndex, val)
	end
	roomdescriptor.ListIndex = originalVal
end

function RoomDescriptorTest:TestVarNoReward(roomdescriptor)
	local originalVal = roomdescriptor.NoReward
	roomdescriptor.NoReward = true
	roomdescriptor.NoReward = originalVal
end

function RoomDescriptorTest:TestVarOverrideData(roomdescriptor)
	local originalVal = roomdescriptor.OverrideData
	roomdescriptor.OverrideData = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	roomdescriptor.OverrideData = originalVal
end

function RoomDescriptorTest:TestVarPitsCount(roomdescriptor)
	local originalVal = roomdescriptor.PitsCount
	for _, val in pairs(test.TestInts) do
		roomdescriptor.PitsCount = val
		test.AssertEquals(roomdescriptor.PitsCount, val)
	end
	roomdescriptor.PitsCount = originalVal
end

function RoomDescriptorTest:TestVarPoopCount(roomdescriptor)
	local originalVal = roomdescriptor.PoopCount
	for _, val in pairs(test.TestInt16s) do
		roomdescriptor.PoopCount = val
		test.AssertEquals(roomdescriptor.PoopCount, val)
	end
	roomdescriptor.PoopCount = originalVal
end

function RoomDescriptorTest:TestVarPressurePlatesTriggered(roomdescriptor)
	local originalVal = roomdescriptor.PressurePlatesTriggered
	roomdescriptor.PressurePlatesTriggered = true
	roomdescriptor.PressurePlatesTriggered = originalVal
end

function RoomDescriptorTest:TestVarSacrificeDone(roomdescriptor)
	local originalVal = roomdescriptor.SacrificeDone
	roomdescriptor.SacrificeDone = true
	roomdescriptor.SacrificeDone = originalVal
end

function RoomDescriptorTest:TestVarSafeGridIndex(roomdescriptor)
	local originalVal = roomdescriptor.SafeGridIndex
	for _, val in pairs(test.TestInts) do
		roomdescriptor.SafeGridIndex = val
		test.AssertEquals(roomdescriptor.SafeGridIndex, val)
	end
	roomdescriptor.SafeGridIndex = originalVal
end

function RoomDescriptorTest:TestVarShopItemDiscountIdx(roomdescriptor)
	local originalVal = roomdescriptor.ShopItemDiscountIdx
	for _, val in pairs(test.TestInt16s) do
		roomdescriptor.ShopItemDiscountIdx = val
		test.AssertEquals(roomdescriptor.ShopItemDiscountIdx, val)
	end
	roomdescriptor.ShopItemDiscountIdx = originalVal
end

function RoomDescriptorTest:TestVarShopItemIdx(roomdescriptor)
	local originalVal = roomdescriptor.ShopItemIdx
	for _, val in pairs(test.TestInt16s) do
		roomdescriptor.ShopItemIdx = val
		test.AssertEquals(roomdescriptor.ShopItemIdx, val)
	end
	roomdescriptor.ShopItemIdx = originalVal
end

function RoomDescriptorTest:TestVarSpawnSeed(roomdescriptor)
	local originalVal = roomdescriptor.SpawnSeed
	for _, val in pairs(test.TestUnsignedInts) do
		roomdescriptor.SpawnSeed = val
		test.AssertEquals(roomdescriptor.SpawnSeed, val)
	end
	roomdescriptor.SpawnSeed = originalVal
end

function RoomDescriptorTest:TestVarSurpriseMiniboss(roomdescriptor)
	local originalVal = roomdescriptor.SurpriseMiniboss
	roomdescriptor.SurpriseMiniboss = true
	roomdescriptor.SurpriseMiniboss = originalVal
end

function RoomDescriptorTest:TestVarVisitedCount(roomdescriptor)
	local originalVal = roomdescriptor.VisitedCount
	for _, val in pairs(test.TestUnsignedInts) do
		roomdescriptor.VisitedCount = val
		test.AssertEquals(roomdescriptor.VisitedCount, val)
	end
	roomdescriptor.VisitedCount = originalVal
end

function RoomDescriptorTest:TestVarBossDeathSeed(roomdescriptor)
	local bossdeathseed = roomdescriptor.BossDeathSeed
end

function RoomDescriptorTest:TestVarDoors(roomdescriptor)
	local doors = roomdescriptor.Doors
end


return RoomDescriptorTest
