local test = REPENTOGON_TEST

local SaveMenuTest = {}

function SaveMenuTest:BeforeEach()
	
end

function SaveMenuTest:AfterEach()
	
end

----------

function SaveMenuTest:TestGetSaveSelectMenuSprite()
	test.AssertEquals(SaveMenu.GetSaveSelectMenuSprite():GetFilename(), "gfx/ui/main menu/SaveSelectMenu.anm2")
end

function SaveMenuTest:TestGetDeleteButtonSprite()
	test.AssertEquals(SaveMenu.GetDeleteButtonSprite():GetFilename(), "gfx/ui/main menu/SaveSelectMenu.anm2")
end

function SaveMenuTest:TestGetDeletePopupSprite()
	test.AssertEquals(SaveMenu.GetDeletePopupSprite():GetFilename(), "gfx/ui/main menu/SaveSelectMenu.anm2")
end

function SaveMenuTest:TestIsDeleteActive()
	SaveMenu.IsDeleteActive()
end

function SaveMenuTest:TestSetSelectedElement()
	local originalVal = SaveMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		SaveMenu.SetSelectedElement(val)
		test.AssertEquals(SaveMenu.GetSelectedElement(), val)
	end
	SaveMenu.SetSelectedElement(originalVal)
end


return SaveMenuTest
