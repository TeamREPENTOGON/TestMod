local test = REPENTOGON_TEST

local OptionsMenuTest = {}

function OptionsMenuTest:BeforeEach()
	
end

function OptionsMenuTest:AfterEach()
	
end

----------

function OptionsMenuTest:TestGetGammaWidgetSprite()
	OptionsMenu.GetGammaWidgetSprite()
end

function OptionsMenuTest:TestGetOptionsMenuSprite()
	OptionsMenu.GetOptionsMenuSprite()
end

function OptionsMenuTest:TestSetSelectedElement()
	local originalVal = OptionsMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		OptionsMenu.SetSelectedElement(val)
		test.AssertEquals(OptionsMenu.GetSelectedElement(), val)
	end
	OptionsMenu.SetSelectedElement(originalVal)
end


return OptionsMenuTest
