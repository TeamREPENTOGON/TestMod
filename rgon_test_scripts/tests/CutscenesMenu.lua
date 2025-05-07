local test = REPENTOGON_TEST

local CutscenesMenuTest = {}

function CutscenesMenuTest:BeforeEach()
	
end

function CutscenesMenuTest:AfterEach()
	
end

----------

function CutscenesMenuTest:TestGetSprite()
	test.AssertEquals(CutscenesMenu.GetSprite():GetFilename(), "gfx/ui/main menu/EndingsMenu.anm2")
end

function CutscenesMenuTest:TestSetSelectedElement()
	local originalVal = CutscenesMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		CutscenesMenu.SetSelectedElement(val)
		test.AssertEquals(CutscenesMenu.GetSelectedElement(), val)
	end
	CutscenesMenu.SetSelectedElement(originalVal)
end


return CutscenesMenuTest
