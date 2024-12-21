local test = REPENTOGON_TEST

local RoomConfigStageTest = {}

function RoomConfigStageTest:BeforeEach()
	return RoomConfig.GetStage(1)
end

function RoomConfigStageTest:AfterEach(roomconfigstage)
	
end

----------

function RoomConfigStageTest:TestGetID(roomconfigstage)
	roomconfigstage:GetID()
end

function RoomConfigStageTest:TestGetRoomSet(roomconfigstage)
	local mode = 1
	roomconfigstage:GetRoomSet(mode)
end

function RoomConfigStageTest:TestIsLoaded(roomconfigstage)
	local mode = 1
	roomconfigstage:IsLoaded(mode)
end

function RoomConfigStageTest:TestSetBackdrop(roomconfigstage)
	local originalVal = roomconfigstage:GetBackdrop()
	for _, val in pairs(test.TestInts) do
		roomconfigstage:SetBackdrop(val)
		test.AssertEquals(roomconfigstage:GetBackdrop(), val)
	end
	roomconfigstage:SetBackdrop(originalVal)
end

function RoomConfigStageTest:TestSetBossSpot(roomconfigstage)
	local originalVal = roomconfigstage:GetBossSpot()
	for _, val in pairs(test.TestStrings) do
		roomconfigstage:SetBossSpot(val)
		test.AssertEquals(roomconfigstage:GetBossSpot(), val)
	end
	roomconfigstage:SetBossSpot(originalVal)
end

function RoomConfigStageTest:TestSetDisplayName(roomconfigstage)
	local originalVal = roomconfigstage:GetDisplayName()
	for _, val in pairs(test.TestStrings) do
		roomconfigstage:SetDisplayName(val)
		test.AssertEquals(roomconfigstage:GetDisplayName(), val)
	end
	roomconfigstage:SetDisplayName(originalVal)
end

function RoomConfigStageTest:TestSetMusic(roomconfigstage)
	local originalVal = roomconfigstage:GetMusic()
	roomconfigstage:SetMusic(Music.MUSIC_CREDITS)
	test.AssertEquals(roomconfigstage:GetMusic(), Music.MUSIC_CREDITS)
	roomconfigstage:SetMusic(originalVal)
end

function RoomConfigStageTest:TestSetPlayerSpot(roomconfigstage)
	local originalVal = roomconfigstage:GetPlayerSpot()
	for _, val in pairs(test.TestStrings) do
		roomconfigstage:SetPlayerSpot(val)
		test.AssertEquals(roomconfigstage:GetPlayerSpot(), val)
	end
	roomconfigstage:SetPlayerSpot(originalVal)
end

function RoomConfigStageTest:TestSetSuffix(roomconfigstage)
	local originalVal = roomconfigstage:GetSuffix()
	for _, val in pairs(test.TestStrings) do
		roomconfigstage:SetSuffix(val)
		test.AssertEquals(roomconfigstage:GetSuffix(), val)
	end
	roomconfigstage:SetSuffix(originalVal)
end

function RoomConfigStageTest:TestSetXMLName(roomconfigstage)
	local originalVal = roomconfigstage:GetXMLName()
	for _, val in pairs(test.TestStrings) do
		roomconfigstage:SetXMLName(val)
		test.AssertEquals(roomconfigstage:GetXMLName(), val)
	end
	roomconfigstage:SetXMLName(originalVal)
end

function RoomConfigStageTest:TestUnload(roomconfigstage)
	roomconfigstage:Unload()
end


return RoomConfigStageTest
