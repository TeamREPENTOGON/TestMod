local test = REPENTOGON_TEST

local RoomConfigTest = {}

function RoomConfigTest:BeforeEach()
	
end

function RoomConfigTest:AfterEach()
	
end

----------

function RoomConfigTest:TestGetStage()
	local stage = 1
	RoomConfig.GetStage(stage)
end


return RoomConfigTest
