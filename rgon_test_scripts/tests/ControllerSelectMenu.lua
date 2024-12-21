local test = REPENTOGON_TEST

local ControllerSelectMenuTest = {}

function ControllerSelectMenuTest:BeforeEach()
	
end

function ControllerSelectMenuTest:AfterEach()
	
end

----------

function ControllerSelectMenuTest:TestGetSprite()
	ControllerSelectMenu.GetSprite()
end

function ControllerSelectMenuTest:TestSetSelectedElement()
	local originalVal = ControllerSelectMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		ControllerSelectMenu.SetSelectedElement(val)
		test.AssertEquals(ControllerSelectMenu.GetSelectedElement(), val)
	end
	ControllerSelectMenu.SetSelectedElement(originalVal)
end


return ControllerSelectMenuTest
