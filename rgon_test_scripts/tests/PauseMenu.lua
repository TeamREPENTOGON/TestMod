local test = REPENTOGON_TEST

local PauseMenuTest = {}

function PauseMenuTest:BeforeEach()
	
end

function PauseMenuTest:AfterEach()
	
end

----------

function PauseMenuTest:TestGetCompletionMarksSprite()
	PauseMenu.GetCompletionMarksSprite()
end

function PauseMenuTest:TestGetMyStuffSprite()
	PauseMenu.GetMyStuffSprite()
end

function PauseMenuTest:TestGetSprite()
	PauseMenu.GetSprite()
end

function PauseMenuTest:TestGetStatsSprite()
	PauseMenu.GetStatsSprite()
end

function PauseMenuTest:TestSetSelectedElement()
	local originalVal = PauseMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		PauseMenu.SetSelectedElement(val)
		test.AssertEquals(PauseMenu.GetSelectedElement(), val)
	end
	PauseMenu.SetSelectedElement(originalVal)
end

function PauseMenuTest:TestSetState()
	local originalVal = PauseMenu.GetState()
	for _, val in pairs(test.TestInts) do
		PauseMenu.SetState(val)
		test.AssertEquals(PauseMenu.GetState(), val)
	end
	PauseMenu.SetState(originalVal)
end


return PauseMenuTest
