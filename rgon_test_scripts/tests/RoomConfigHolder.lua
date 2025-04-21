-- This is just an alias now, but may as well.
local RoomConfigHolderTest = include(REPENTOGON_TEST.TestsRoot .. "RoomConfig")

function RoomConfigHolderTest:BeforeEach()
	return RoomConfigHolder
end

return RoomConfigHolderTest
