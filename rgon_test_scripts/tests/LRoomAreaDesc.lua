local test = REPENTOGON_TEST

local LRoomAreaDescTest = {}

function LRoomAreaDescTest:BeforeEach()
	return Game():GetRoom():GetLRoomAreaDesc()
end

function LRoomAreaDescTest:AfterEach(lroomareadesc)
	
end

----------

function LRoomAreaDescTest:TestGetHighBottomRight(lroomareadesc)
	lroomareadesc:GetHighBottomRight()
end

function LRoomAreaDescTest:TestGetHighTopLeft(lroomareadesc)
	lroomareadesc:GetHighTopLeft()
end

function LRoomAreaDescTest:TestGetLowBottomRight(lroomareadesc)
	lroomareadesc:GetLowBottomRight()
end

function LRoomAreaDescTest:TestGetLowTopLeft(lroomareadesc)
	lroomareadesc:GetLowTopLeft()
end


return LRoomAreaDescTest
