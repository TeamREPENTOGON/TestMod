local test = REPENTOGON_TEST

local RoomConfigHolderTest = {}

function RoomConfigHolderTest:BeforeEach()
	
end

function RoomConfigHolderTest:AfterEach()
	
end

----------

function RoomConfigHolderTest:TestGetRandomRoom()
	local seed = 1
	local reduceweight = true
	local stage = 1
	local roomtype = 1
	local shape = 1
	local minvariant = 1
	local maxvariant = 1
	local mindifficulty = 1
	local maxdifficulty = 1
	local requireddoors = 1
	local subtype = 1
	local mode = 1
	RoomConfigHolder.GetRandomRoom(seed, reduceweight, stage, roomtype, shape, minvariant, maxvariant, mindifficulty, maxdifficulty, requireddoors, subtype, mode)
end

function RoomConfigHolderTest:TestGetRoomByStageTypeAndVariant()
	local stage = 1
	local roomtype = 1
	local variant = 1
	local mode = 1
	RoomConfigHolder.GetRoomByStageTypeAndVariant(stage, roomtype, variant, mode)
end


return RoomConfigHolderTest
