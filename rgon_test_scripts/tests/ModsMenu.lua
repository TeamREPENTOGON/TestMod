local test = REPENTOGON_TEST

local ModsMenuTest = {}

function ModsMenuTest:BeforeEach()
	
end

function ModsMenuTest:AfterEach()
	
end

----------

function ModsMenuTest:TestGetSprite()
	test.AssertEquals(ModsMenu.GetSprite():GetFilename(), "gfx/ui/main menu/ModsMenu.anm2")
end

function ModsMenuTest:TestSetSelectedElement()
	for _, i in ipairs({3,2,1}) do
		ModsMenu.SetSelectedElement(i)
		test.AssertEquals(ModsMenu.GetSelectedElement(), i)
	end
	ModsMenu.SetSelectedElement(0)
	test.AssertEquals(ModsMenu.GetSelectedElement(), 1)
	ModsMenu.SetSelectedElement(-1)
	test.AssertEquals(ModsMenu.GetSelectedElement(), 1)
end

function ModsMenuTest:TestWasListEdited()
	ModsMenu.WasListEdited()
end


return ModsMenuTest
