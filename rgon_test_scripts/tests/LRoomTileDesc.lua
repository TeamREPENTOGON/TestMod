local test = REPENTOGON_TEST

local LRoomTileDescTest = {}

function LRoomTileDescTest:BeforeEach()
	return Game():GetRoom():GetLRoomTileDesc()
end

function LRoomTileDescTest:AfterEach(lroomtiledesc)
	
end

----------

function LRoomTileDescTest:TestGetHighBottomRight(lroomtiledesc)
	lroomtiledesc:GetHighBottomRight()
end

function LRoomTileDescTest:TestGetHighTopLeft(lroomtiledesc)
	lroomtiledesc:GetHighTopLeft()
end

function LRoomTileDescTest:TestGetLowBottomRight(lroomtiledesc)
	lroomtiledesc:GetLowBottomRight()
end

function LRoomTileDescTest:TestGetLowTopLeft(lroomtiledesc)
	lroomtiledesc:GetLowTopLeft()
end

function LRoomTileDescTest:TestGetRandomTile(lroomtiledesc)
	local seed = 1
	lroomtiledesc:GetRandomTile(seed)
end


return LRoomTileDescTest
