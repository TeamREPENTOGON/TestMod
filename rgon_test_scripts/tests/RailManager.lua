local test = REPENTOGON_TEST

local RailManagerTest = {}

function RailManagerTest:BeforeEach()
	return Game():GetRoom():GetRailManager()
end

function RailManagerTest:AfterEach(railmanager)
	
end

----------

function RailManagerTest:TestGetRailsSprite(railmanager)
	railmanager:GetRailsSprite()
end


return RailManagerTest
