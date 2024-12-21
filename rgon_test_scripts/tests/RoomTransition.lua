local test = REPENTOGON_TEST

local RoomTransitionTest = {}

function RoomTransitionTest:BeforeEach()
	
end

function RoomTransitionTest:AfterEach()
	
end

----------

function RoomTransitionTest:TestGetPlayerExtraPortraitSprite()
	RoomTransition.GetPlayerExtraPortraitSprite()
end

function RoomTransitionTest:TestGetTransitionMode()
	RoomTransition.GetTransitionMode()
end

function RoomTransitionTest:TestGetVersusScreenSprite()
	RoomTransition.GetVersusScreenSprite()
end

function RoomTransitionTest:TestIsRenderingBossIntro()
	RoomTransition.IsRenderingBossIntro()
end
--[[
function RoomTransitionTest:TestStartBossIntro()
	local bossid1 = 1
	local bossid2 = 1
	RoomTransition.StartBossIntro(bossid1, bossid2)
end
]]

return RoomTransitionTest
