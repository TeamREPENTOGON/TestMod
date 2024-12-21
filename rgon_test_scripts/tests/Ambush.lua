local test = REPENTOGON_TEST

local AmbushTest = {}

function AmbushTest:BeforeEach()
	
end

function AmbushTest:AfterEach()
	
end

----------

function AmbushTest:TestGetCurrentWave()
	Ambush.GetCurrentWave()
end
--[[
function AmbushTest:TestGetNextWave()
	Ambush.GetNextWave()
end

function AmbushTest:TestGetNextWaves()
	Ambush.GetNextWaves()
end
]]
function AmbushTest:TestSetMaxBossChallengeWaves()
	local originalVal = Ambush.GetMaxBossChallengeWaves()
	for _, val in pairs(test.TestInts) do
		Ambush.SetMaxBossChallengeWaves(val)
		test.AssertEquals(Ambush.GetMaxBossChallengeWaves(), val)
	end
	Ambush.SetMaxBossChallengeWaves(originalVal)
end

function AmbushTest:TestSetMaxBossrushWaves()
	local originalVal = Ambush.GetMaxBossrushWaves()
	for _, val in pairs(test.TestInts) do
		Ambush.SetMaxBossrushWaves(val)
		test.AssertEquals(Ambush.GetMaxBossrushWaves(), math.min(val, 25))
	end
	Ambush.SetMaxBossrushWaves(originalVal)
end

function AmbushTest:TestSetMaxChallengeWaves()
	local originalVal = Ambush.GetMaxChallengeWaves()
	for _, val in pairs(test.TestInts) do
		Ambush.SetMaxChallengeWaves(val)
		test.AssertEquals(Ambush.GetMaxChallengeWaves(), val)
	end
	Ambush.SetMaxChallengeWaves(originalVal)
end
--[[
function AmbushTest:TestSpawnBossrushWave()
	Ambush.SpawnBossrushWave()
end
]]--[[
function AmbushTest:TestSpawnWave()
	Ambush.SpawnWave()
end
]]
function AmbushTest:TestStartChallenge()
	Ambush.StartChallenge()
end


return AmbushTest
