local test = REPENTOGON_TEST

local CutscenesMenuTest = {}

function CutscenesMenuTest:BeforeEach()
	
end

function CutscenesMenuTest:AfterEach()
	
end

----------

function CutscenesMenuTest:TestGetSprite()
	CutscenesMenu.GetSprite()
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
