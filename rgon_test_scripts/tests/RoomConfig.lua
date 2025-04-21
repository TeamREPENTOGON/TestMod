local test = REPENTOGON_TEST

local RoomConfigTest = {}

function RoomConfigTest:BeforeEach()
	return RoomConfig
end

function RoomConfigTest:AfterEach()
	
end

----------

function RoomConfigTest:TestGetStage(roomConfig)
	local stage = 1
	roomConfig.GetStage(stage)
end

function RoomConfigTest:TestGetRandomRoom(roomConfig)
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
	roomConfig.GetRandomRoom(seed, reduceweight, stage, roomtype, shape, minvariant, maxvariant, mindifficulty, maxdifficulty, requireddoors, subtype, mode)
end

function RoomConfigTest:TestGetRoomByStageTypeAndVariant(roomConfig)
	local stage = 1
	local roomtype = 1
	local variant = 1
	local mode = 1
	roomConfig.GetRoomByStageTypeAndVariant(stage, roomtype, variant, mode)
end


return RoomConfigTest
