local test = REPENTOGON_TEST

local MainMenuTest = {}

function MainMenuTest:BeforeEach()
	
end

function MainMenuTest:AfterEach()
	
end

----------

function MainMenuTest:TestGetContinueWidgetSprite()
	MainMenu.GetContinueWidgetSprite()
end

function MainMenuTest:TestGetGameMenuSprite()
	MainMenu.GetGameMenuSprite()
end

function MainMenuTest:TestSetSelectedElement()
	local originalVal = MainMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		MainMenu.SetSelectedElement(val)
		test.AssertEquals(MainMenu.GetSelectedElement(), val)
	end
	MainMenu.SetSelectedElement(originalVal)
end


return MainMenuTest
