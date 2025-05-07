local test = REPENTOGON_TEST

local KeyConfigMenuTest = {}

function KeyConfigMenuTest:BeforeEach()
	
end

function KeyConfigMenuTest:AfterEach()
	
end

----------

function KeyConfigMenuTest:TestGetSprite()
	test.AssertEquals(KeyConfigMenu.GetSprite():GetFilename(), "gfx/ui/main menu/KeyConfigMenu.anm2")
end

function KeyConfigMenuTest:TestSetSelectedColumn()
	local originalVal = KeyConfigMenu.GetSelectedColumn()
	for _, val in pairs(test.TestInts) do
		KeyConfigMenu.SetSelectedColumn(val)
		test.AssertEquals(KeyConfigMenu.GetSelectedColumn(), val)
	end
	KeyConfigMenu.SetSelectedColumn(originalVal)
end

function KeyConfigMenuTest:TestSetSelectedElement()
	local originalVal = KeyConfigMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		KeyConfigMenu.SetSelectedElement(val)
		test.AssertEquals(KeyConfigMenu.GetSelectedElement(), val)
	end
	KeyConfigMenu.SetSelectedElement(originalVal)
end

function KeyConfigMenuTest:TestIsEditActive()
	KeyConfigMenu.IsEditActive()
end


return KeyConfigMenuTest
