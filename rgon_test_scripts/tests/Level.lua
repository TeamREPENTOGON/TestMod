local test = REPENTOGON_TEST

local LevelTest = {}

function LevelTest:BeforeEach()
	return Game():GetLevel()
end

function LevelTest:AfterEach(level)
	
end

----------

function LevelTest:TestAddAngelRoomChance(level)
	local chance = 1
	level:AddAngelRoomChance(chance)
end

function LevelTest:TestAddCurse(level)
	local curse = 1
	local showname = true
	level:AddCurse(curse, showname)
end

function LevelTest:TestApplyBlueMapEffect(level)
	level:ApplyBlueMapEffect()
end

function LevelTest:TestApplyCompassEffect(level)
	local persistent = true
	level:ApplyCompassEffect(persistent)
end

function LevelTest:TestApplyMapEffect(level)
	level:ApplyMapEffect()
end

function LevelTest:TestCanOpenChallengeRoom(level)
	local roomindex = 1
	level:CanOpenChallengeRoom(roomindex)
end

function LevelTest:TestCanSpawnDevilRoom(level)
	level:CanSpawnDevilRoom()
end

function LevelTest:TestCanStageHaveCurseOfLabyrinth(level)
	local stage = 1
	level:CanStageHaveCurseOfLabyrinth(stage)
end
--[[
function LevelTest:TestChangeRoom(level)
	local roomindex = 1
	local dimension = 1
	level:ChangeRoom(roomindex, dimension)
end
]]
function LevelTest:TestDisableDevilRoom(level)
	level:DisableDevilRoom()
end

function LevelTest:TestForceHorsemanBoss(level)
	local seed = 1
	level:ForceHorsemanBoss(seed)
end

function LevelTest:TestGetAbsoluteStage(level)
	level:GetAbsoluteStage()
end

function LevelTest:TestGetAngelRoomChance(level)
	level:GetAngelRoomChance()
end

function LevelTest:TestGetCanSeeEverything(level)
	level:GetCanSeeEverything()
end

function LevelTest:TestGetCurrentRoom(level)
	level:GetCurrentRoom()
end

function LevelTest:TestGetCurrentRoomDesc(level)
	level:GetCurrentRoomDesc()
end

function LevelTest:TestGetCurrentRoomIndex(level)
	level:GetCurrentRoomIndex()
end

function LevelTest:TestGetCurseName(level)
	level:GetCurseName()
end

function LevelTest:TestGetCurses(level)
	level:GetCurses()
end

function LevelTest:TestGetDevilAngelRoomRNG(level)
	level:GetDevilAngelRoomRNG()
end

function LevelTest:TestGetDungeonPlacementSeed(level)
	level:GetDungeonPlacementSeed()
end

function LevelTest:TestGetEnterPosition(level)
	level:GetEnterPosition()
end

function LevelTest:TestGetHeartPicked(level)
	level:GetHeartPicked()
end

function LevelTest:TestGetLastBossRoomListIndex(level)
	level:GetLastBossRoomListIndex()
end

function LevelTest:TestGetLastRoomDesc(level)
	level:GetLastRoomDesc()
end

function LevelTest:TestGetNonCompleteRoomIndex(level)
	level:GetNonCompleteRoomIndex()
end

function LevelTest:TestGetPlanetariumChance(level)
	level:GetPlanetariumChance()
end

function LevelTest:TestGetPreviousRoomIndex(level)
	level:GetPreviousRoomIndex()
end

function LevelTest:TestGetRandomRoomIndex(level)
	local iamerrorroom = true
	local seed = 1
	local overrideRoom = GridRooms.ROOM_THE_VOID_IDX

	-- Case #1: No return

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GET_RANDOM_ROOM_INDEX, function(_, cRoomIndex, cIAmError, cSeed)
		test.AssertEquals(cIAmError, iamerrorroom)
		test.AssertEquals(cSeed, seed)
	end)
	
	level:GetRandomRoomIndex(iamerrorroom, seed)

	-- Case #2: Room index overriding

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_GET_RANDOM_ROOM_INDEX, function(_, cRoomIndex, cIAmError, cSeed)
		test.AssertEquals(cIAmError, iamerrorroom)
		test.AssertEquals(cSeed, seed)
		return overrideRoom
	end)
	
	local index = level:GetRandomRoomIndex(iamerrorroom, seed)
	test.AssertEquals(index, overrideRoom)
end

function LevelTest:TestGetRoomByIdx(level)
	local roomidx = 1
	local dimension = 1
	level:GetRoomByIdx(roomidx, dimension)
end

function LevelTest:TestGetRoomCount(level)
	level:GetRoomCount()
end

function LevelTest:TestGetRooms(level)
	level:GetRooms()
end

function LevelTest:TestGetStage(level)
	level:GetStage()
end

function LevelTest:TestGetStageType(level)
	level:GetStageType()
end

function LevelTest:TestGetStartingRoomIndex(level)
	level:GetStartingRoomIndex()
end

function LevelTest:TestGetStateFlag(level)
	local levelstateflag = 1
	level:GetStateFlag(levelstateflag)
end

function LevelTest:TestHasBossChallenge(level)
	level:HasBossChallenge()
end

function LevelTest:TestInitializeDevilAngelRoom(level)
	local forceangel = true
	local forcedevil = true
	level:InitializeDevilAngelRoom(forceangel, forcedevil)
end

function LevelTest:TestIsAltStage(level)
	level:IsAltStage()
end

function LevelTest:TestIsAscent(level)
	level:IsAscent()
end

function LevelTest:TestIsDevilRoomDisabled(level)
	level:IsDevilRoomDisabled()
end

function LevelTest:TestIsNextStageAvailable(level)
	level:IsNextStageAvailable()
end

function LevelTest:TestIsPreAscent(level)
	level:IsPreAscent()
end

function LevelTest:TestMakeRedRoomDoor(level)
	local currentroomidx = 1
	local slot = 1
	level:MakeRedRoomDoor(currentroomidx, slot)
end

function LevelTest:TestQueryRoomTypeIndex(level)
	local roomtype = 1
	local visited = true
	local rng = RNG()
	local ignoregroup = true
	level:QueryRoomTypeIndex(roomtype, visited, rng, ignoregroup)
end

function LevelTest:TestRemoveCompassEffect(level)
	level:RemoveCompassEffect()
end

function LevelTest:TestRemoveCurses(level)
	local curses = 1
	level:RemoveCurses(curses)
end

function LevelTest:TestSetCanSeeEverything(level)
	local value = true
	level:SetCanSeeEverything(value)
end

function LevelTest:TestSetHeartPicked(level)
	level:SetHeartPicked()
end

function LevelTest:TestSetNextStage(level)
	level:SetNextStage()
end

function LevelTest:TestSetRedHeartDamage(level)
	level:SetRedHeartDamage()
end

function LevelTest:TestSetStage(level)
	local stageoffset = 1
	local stagetypeoffset = 1
	level:SetStage(stageoffset, stagetypeoffset)
end

function LevelTest:TestSetStateFlag(level)
	local levelstateflag = 1
	local val = true
	level:SetStateFlag(levelstateflag, val)
end

function LevelTest:TestShowMap(level)
	level:ShowMap()
end

function LevelTest:TestShowName(level)
	local sticky = true
	level:ShowName(sticky)
end

function LevelTest:TestUncoverHiddenDoor(level)
	local currentroomidx = 1
	local slot = 1
	level:UncoverHiddenDoor(currentroomidx, slot)
end
--[[
function LevelTest:TestUpdate(level)
	level:Update()
end
]]
function LevelTest:TestUpdateVisibility(level)
	level:UpdateVisibility()
end

function LevelTest:TestCanPlaceRoom(level)
	local roomconfigtoplace = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	local gridindex = 1
	local dimension = 1
	local allowmultipledoors = true
	local allowspecialneighbors = true
	local allownoneighbors = true
	level:CanPlaceRoom(roomconfigtoplace, gridindex, dimension, allowmultipledoors, allowspecialneighbors, allownoneighbors)
end

function LevelTest:TestCanPlaceRoomAtDoor(level)
	local roomconfigtoplace = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	local neighborroomdescriptor = Game():GetLevel():GetCurrentRoomDesc()
	local doorslot = 1
	local allowmultipledoors = true
	local allowspecialneighbors = true
	level:CanPlaceRoomAtDoor(roomconfigtoplace, neighborroomdescriptor, doorslot, allowmultipledoors, allowspecialneighbors)
end
--[[
function LevelTest:TestCanSpawnDoorOutline(level)
	local roomidx = 1
	local doorslot = 1
	level:CanSpawnDoorOutline(roomidx, doorslot)
end
]]
function LevelTest:TestFindValidRoomPlacementLocations(level)
	local roomconfig = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	local dimension = 1
	local allowmultipledoors = true
	local allowspecialneighbors = true
	level:FindValidRoomPlacementLocations(roomconfig, dimension, allowmultipledoors, allowspecialneighbors)
end

function LevelTest:TestGetDimension(level)
	level:GetDimension()
end

function LevelTest:TestGetMyosotisPickups(level)
	level:GetMyosotisPickups()
end

function LevelTest:TestGetNeighboringRooms(level)
	local gridindex = 1
	local roomshape = 1
	local dimension = 1
	level:GetNeighboringRooms(gridindex, roomshape, dimension)
end

function LevelTest:TestHasAbandonedMineshaft(level)
	level:HasAbandonedMineshaft()
end

function LevelTest:TestHasMirrorDimension(level)
	level:HasMirrorDimension()
end

function LevelTest:TestHasPhotoDoor(level)
	level:HasPhotoDoor()
end

function LevelTest:TestIsStageAvailable(level)
	local otherlevel = 1
	local stage = 1
	level:IsStageAvailable(otherlevel, stage)
end
--[[
function LevelTest:TestPlaceRoom(level)
	local room = 1
	local roomconfig = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	local seed = 1
	level:PlaceRoom(room, roomconfig, seed)
end
]]
function LevelTest:TestSetForceSpecialQuest(level)
	local originalVal = level:GetForceSpecialQuest()
	for _, val in pairs(test.TestInts) do
		level:SetForceSpecialQuest(val)
		test.AssertEquals(level:GetForceSpecialQuest(), val)
	end
	level:SetForceSpecialQuest(originalVal)
end

function LevelTest:TestSetGreedWavesClearedWithoutRedHeartDamage(level)
	local originalVal = level:GetGreedWavesClearedWithoutRedHeartDamage()
	for _, val in pairs(test.TestUnsignedInts) do
		level:SetGreedWavesClearedWithoutRedHeartDamage(val)
		test.AssertEquals(level:GetGreedWavesClearedWithoutRedHeartDamage(), val)
	end
	level:SetGreedWavesClearedWithoutRedHeartDamage(originalVal)
end

function LevelTest:TestSetName(level)
	local originalVal = level:GetName()
	for _, val in pairs(test.TestNonEmptyStrings) do
		level:SetName(val)
		test.AssertEquals(level:GetName(), val)
	end
	level:SetName(originalVal)
end

function LevelTest:TestTryPlaceRoom(level)
	local roomconfigtoplace = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	local gridindex = 1
	local dimension = 1
	local seed = 1
	local allowmultipledoors = true
	local allowspecialneighbors = true
	local allownoneighbors = true
	level:TryPlaceRoom(roomconfigtoplace, gridindex, dimension, seed, allowmultipledoors, allowspecialneighbors, allownoneighbors)
end

function LevelTest:TestTryPlaceRoomAtDoor(level)
	local roomconfigtoplace = RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
	local neighborroomdescriptor = Game():GetLevel():GetCurrentRoomDesc()
	local doorslot = 1
	local seed = 1
	local allowmultipledoors = true
	local allowspecialneighbors = true
	level:TryPlaceRoomAtDoor(roomconfigtoplace, neighborroomdescriptor, doorslot, seed, allowmultipledoors, allowspecialneighbors)
end

function LevelTest:TestVarDungeonReturnPosition(level)
	local originalVal = level.DungeonReturnPosition
	for _, val in pairs(test.TestVectors) do
		level.DungeonReturnPosition = val
		test.AssertEquals(level.DungeonReturnPosition, val)
	end
	level.DungeonReturnPosition = originalVal
end

function LevelTest:TestVarDungeonReturnRoomIndex(level)
	local minimum = -20
	local maximum = 168

	for i=minimum-2, maximum+2 do
		level.DungeonReturnRoomIndex = i
		if i < minimum then
			test.AssertEquals(level.DungeonReturnRoomIndex, minimum)
		elseif i > maximum then
			test.AssertEquals(level.DungeonReturnRoomIndex, maximum)
		else
			test.AssertEquals(level.DungeonReturnRoomIndex, i)
		end
	end

	level.DungeonReturnRoomIndex = 0
end

function LevelTest:TestVarGreedModeWave(level)
	local minimum = 0
	local maximum = 12

	for i=minimum-2, maximum+2 do
		level.GreedModeWave = i
		if i < minimum or i > maximum then
			test.AssertEquals(level.GreedModeWave, maximum)
		else
			test.AssertEquals(level.GreedModeWave, i)
		end
	end

	level.GreedModeWave = 0
end

function LevelTest:TestVarEnterDoor(level)
	local minimum = -1
	local maximum = 7

	for i=minimum-2, maximum+2 do
		level.EnterDoor = i
		if i < minimum then
			test.AssertEquals(level.EnterDoor, minimum)
		elseif i > maximum then
			test.AssertEquals(level.EnterDoor, maximum)
		else
			test.AssertEquals(level.EnterDoor, i)
		end
	end

	level.EnterDoor = -1
end

function LevelTest:TestVarLeaveDoor(level)
	local minimum = -1
	local maximum = 7

	for i=minimum-2, maximum+2 do
		level.LeaveDoor = i
		if i < minimum then
			test.AssertEquals(level.LeaveDoor, minimum)
		elseif i > maximum then
			test.AssertEquals(level.LeaveDoor, maximum)
		else
			test.AssertEquals(level.LeaveDoor, i)
		end
	end

	level.LeaveDoor = -1
end


return LevelTest
