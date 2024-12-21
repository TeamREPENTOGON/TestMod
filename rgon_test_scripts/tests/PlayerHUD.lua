local test = REPENTOGON_TEST

local PlayerHUDTest = {}

function PlayerHUDTest:BeforeEach()
	return Game():GetHUD():GetPlayerHUD(0)
end

function PlayerHUDTest:AfterEach(playerhud)
	
end

----------

function PlayerHUDTest:TestGetHeartByIndex(playerhud)
	local index = 1
	playerhud:GetHeartByIndex(index)
end

function PlayerHUDTest:TestGetHearts(playerhud)
	playerhud:GetHearts()
end

function PlayerHUDTest:TestGetHUD(playerhud)
	playerhud:GetHUD()
end

function PlayerHUDTest:TestGetPlayer(playerhud)
	playerhud:GetPlayer()
end

function PlayerHUDTest:TestRenderActiveItem(playerhud)
	local slot = 1
	local position = Vector(1,1)
	local alpha = 1
	local scale = 1
	playerhud:RenderActiveItem(slot, position, alpha, scale)
end


return PlayerHUDTest
