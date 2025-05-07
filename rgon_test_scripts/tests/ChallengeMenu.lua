local test = REPENTOGON_TEST

local ChallengeMenuTest = {}

function ChallengeMenuTest:BeforeEach()
	
end

function ChallengeMenuTest:AfterEach()
	
end

----------

function ChallengeMenuTest:TestGetSprite()
	test.AssertEquals(ChallengeMenu.GetSprite():GetFilename(), "gfx/ui/main menu/ChallengeMenu.anm2")
end

function ChallengeMenuTest:TestSetSelectedChallengeID()
	local originalVal = ChallengeMenu.GetSelectedChallengeID()
	for _, val in pairs(test.TestInts) do
		ChallengeMenu.SetSelectedChallengeID(val)
		test.AssertEquals(ChallengeMenu.GetSelectedChallengeID(), val)
	end
	ChallengeMenu.SetSelectedChallengeID(originalVal)
end


return ChallengeMenuTest
