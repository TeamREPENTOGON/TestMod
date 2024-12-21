local test = REPENTOGON_TEST

local SaveMenuTest = {}

function SaveMenuTest:BeforeEach()
	
end

function SaveMenuTest:AfterEach()
	
end

----------

function SaveMenuTest:TestGetSaveSelectMenuSprite()
	SaveMenu.GetSaveSelectMenuSprite()
end

function SaveMenuTest:TestGetDeleteButtonSprite()
	SaveMenu.GetDeleteButtonSprite()
end

function SaveMenuTest:TestGetDeletePopupSprite()
	SaveMenu.GetDeletePopupSprite()
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
