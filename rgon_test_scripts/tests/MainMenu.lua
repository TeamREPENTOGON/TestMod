local test = REPENTOGON_TEST

local MainMenuTest = {}

function MainMenuTest:BeforeEach()
	
end

function MainMenuTest:AfterEach()
	
end

----------

function MainMenuTest:TestGetContinueWidgetSprite()
	test.AssertEquals(MainMenu.GetContinueWidgetSprite():GetFilename(), "gfx/ui/main menu/ContinueProgress_Widget.anm2")
end

function MainMenuTest:TestGetGameMenuSprite()
	test.AssertEquals(MainMenu.GetGameMenuSprite():GetFilename(), "gfx/ui/main menu/GameMenu.anm2")
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
