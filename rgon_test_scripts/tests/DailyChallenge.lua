local test = REPENTOGON_TEST

local DailyChallengeTest = {}

function DailyChallengeTest:BeforeEach()
	
end

function DailyChallengeTest:AfterEach()
	
end

----------

function DailyChallengeTest:TestGetChallengeParams()
	DailyChallenge.GetChallengeParams()
end


return DailyChallengeTest
