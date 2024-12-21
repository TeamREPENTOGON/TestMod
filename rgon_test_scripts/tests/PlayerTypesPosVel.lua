local test = REPENTOGON_TEST

local PlayerTypesPosVelTest = {}

function PlayerTypesPosVelTest:BeforeEach()
	return Isaac.GetPlayer():GetMultiShotPositionVelocity(0, 1, Vector(1,0), 1, Isaac.GetPlayer():GetMultiShotParams(1))
end

function PlayerTypesPosVelTest:AfterEach(playertypesposvel)
	
end

----------

function PlayerTypesPosVelTest:TestVarPosition(playertypesposvel)
	local originalVal = playertypesposvel.Position
	for _, val in pairs(test.TestVectors) do
		playertypesposvel.Position = val
		test.AssertEquals(playertypesposvel.Position, val)
	end
	playertypesposvel.Position = originalVal
end

function PlayerTypesPosVelTest:TestVarVelocity(playertypesposvel)
	local originalVal = playertypesposvel.Velocity
	for _, val in pairs(test.TestVectors) do
		playertypesposvel.Velocity = val
		test.AssertEquals(playertypesposvel.Velocity, val)
	end
	playertypesposvel.Velocity = originalVal
end


return PlayerTypesPosVelTest
