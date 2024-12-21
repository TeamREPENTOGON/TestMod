local test = REPENTOGON_TEST

local CustomChallengeMenuTest = {}

function CustomChallengeMenuTest:BeforeEach()
	
end

function CustomChallengeMenuTest:AfterEach()
	
end

----------

function CustomChallengeMenuTest:TestGetSprite()
	CustomChallengeMenu.GetSprite()
end

function CustomChallengeMenuTest:TestSetSelectedChallengeID()
	local originalVal = CustomChallengeMenu.GetSelectedChallengeID()
	for _, val in pairs(test.TestInts) do
		CustomChallengeMenu.SetSelectedChallengeID(val)
		test.AssertEquals(CustomChallengeMenu.GetSelectedChallengeID(), val)
	end
	CustomChallengeMenu.SetSelectedChallengeID(originalVal)
end


return CustomChallengeMenuTest
