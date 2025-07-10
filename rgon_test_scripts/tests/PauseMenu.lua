local test = REPENTOGON_TEST

local PauseMenuTest = {}

function PauseMenuTest:BeforeEach()
	
end

function PauseMenuTest:AfterEach()
	
end

----------

function PauseMenuTest:TestGetCompletionMarksSprite()
	test.AssertEquals(PauseMenu.GetCompletionMarksSprite():GetFilename(), "gfx/ui/completion_widget.anm2")
end

function PauseMenuTest:TestGetMyStuffSprite()
	test.AssertEquals(PauseMenu.GetMyStuffSprite():GetFilename(), "gfx/ui/Death Screen.anm2")
end

function PauseMenuTest:TestGetSprite()
	test.AssertEquals(PauseMenu.GetSprite():GetFilename(), "gfx/ui/PauseScreen.anm2")
end

function PauseMenuTest:TestGetStatsSprite()
	test.AssertEquals(PauseMenu.GetStatsSprite():GetFilename(), "gfx/ui/PauseScreenStats.anm2")
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
