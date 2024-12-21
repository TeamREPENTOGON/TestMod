local test = REPENTOGON_TEST

local ModsMenuTest = {}

function ModsMenuTest:BeforeEach()
	
end

function ModsMenuTest:AfterEach()
	
end

----------

function ModsMenuTest:TestGetSprite()
	ModsMenu.GetSprite()
end

function ModsMenuTest:TestSetSelectedElement()
	local originalVal = ModsMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		ModsMenu.SetSelectedElement(val)
		test.AssertEquals(ModsMenu.GetSelectedElement(), val)
	end
	ModsMenu.SetSelectedElement(originalVal)
end

function ModsMenuTest:TestWasListEdited()
	ModsMenu.WasListEdited()
end


return ModsMenuTest
