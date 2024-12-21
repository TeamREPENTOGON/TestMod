local test = REPENTOGON_TEST

local DailyChallengeMenuTest = {}

function DailyChallengeMenuTest:BeforeEach()
	
end

function DailyChallengeMenuTest:AfterEach()
	
end

----------

function DailyChallengeMenuTest:TestGetSprite()
	DailyChallengeMenu.GetSprite()
end

function DailyChallengeMenuTest:TestGetLeaderboardSprite()
	DailyChallengeMenu.GetLeaderboardSprite()
end

function DailyChallengeMenuTest:TestGetLeaderboardScoreMenuSprite()
	DailyChallengeMenu.GetLeaderboardScoreMenuSprite()
end

function DailyChallengeMenuTest:TestGetTimeLeftHours()
	DailyChallengeMenu.GetTimeLeftHours()
end

function DailyChallengeMenuTest:TestGetTimeLeftMinutes()
	DailyChallengeMenu.GetTimeLeftMinutes()
end

function DailyChallengeMenuTest:TestGetTimeLeftSeconds()
	DailyChallengeMenu.GetTimeLeftSeconds()
end

function DailyChallengeMenuTest:TestIsLeaderboardVisible()
	DailyChallengeMenu.IsLeaderboardVisible()
end

function DailyChallengeMenuTest:TestSetSelectedElement()
	local originalVal = DailyChallengeMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		DailyChallengeMenu.SetSelectedElement(val)
		test.AssertEquals(DailyChallengeMenu.GetSelectedElement(), val)
	end
	DailyChallengeMenu.SetSelectedElement(originalVal)
end

function DailyChallengeMenuTest:TestSetState()
	local state = DailyChallengeMenu.GetState()
	DailyChallengeMenu.SetState(state)
end


return DailyChallengeMenuTest
