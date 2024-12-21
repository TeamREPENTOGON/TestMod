local test = REPENTOGON_TEST

local RoomConfigRoomTest = {}

function RoomConfigRoomTest:BeforeEach()
	return RoomConfigHolder.GetRandomRoom(1234, false, 1, 1)
end

function RoomConfigRoomTest:AfterEach(roomconfigroom)
	
end

----------

function RoomConfigRoomTest:TestVarDifficulty(roomconfigroom)
	local difficulty = roomconfigroom.Difficulty
end

function RoomConfigRoomTest:TestVarDoors(roomconfigroom)
	local doors = roomconfigroom.Doors
end

function RoomConfigRoomTest:TestVarHeight(roomconfigroom)
	local height = roomconfigroom.Height
end

function RoomConfigRoomTest:TestVarInitialWeight(roomconfigroom)
	local initialweight = roomconfigroom.InitialWeight
end

function RoomConfigRoomTest:TestVarMode(roomconfigroom)
	local mode = roomconfigroom.Mode
end

function RoomConfigRoomTest:TestVarName(roomconfigroom)
	local name = roomconfigroom.Name
end

function RoomConfigRoomTest:TestVarOriginalVariant(roomconfigroom)
	local originalvariant = roomconfigroom.OriginalVariant
end

function RoomConfigRoomTest:TestVarShape(roomconfigroom)
	local shape = roomconfigroom.Shape
end

function RoomConfigRoomTest:TestVarSpawnCount(roomconfigroom)
	local spawncount = roomconfigroom.SpawnCount
end

function RoomConfigRoomTest:TestVarSpawns(roomconfigroom)
	local spawns = roomconfigroom.Spawns
end

function RoomConfigRoomTest:TestVarStageID(roomconfigroom)
	local stageid = roomconfigroom.StageID
end

function RoomConfigRoomTest:TestVarSubtype(roomconfigroom)
	local subtype = roomconfigroom.Subtype
end

function RoomConfigRoomTest:TestVarType(roomconfigroom)
	local type = roomconfigroom.Type
end

function RoomConfigRoomTest:TestVarVariant(roomconfigroom)
	local variant = roomconfigroom.Variant
end

function RoomConfigRoomTest:TestVarWeight(roomconfigroom)
	local weight = roomconfigroom.Weight
end

function RoomConfigRoomTest:TestVarWidth(roomconfigroom)
	local width = roomconfigroom.Width
end


return RoomConfigRoomTest
