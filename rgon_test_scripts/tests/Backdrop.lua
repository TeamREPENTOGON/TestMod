local test = REPENTOGON_TEST

local BackdropTest = {}

function BackdropTest:BeforeEach()
	return Game():GetRoom():GetBackdrop()
end

function BackdropTest:AfterEach(backdrop)
	
end

----------

function BackdropTest:TestGetFloorImage(backdrop)
	backdrop:GetFloorImage()
end

function BackdropTest:TestGetWallImage(backdrop)
	backdrop:GetWallImage()
end


return BackdropTest
