local test = REPENTOGON_TEST

local OptionsMenuTest = {}

function OptionsMenuTest:BeforeEach()
	
end

function OptionsMenuTest:AfterEach()
	
end

----------

function OptionsMenuTest:TestGetGammaWidgetSprite()
	test.AssertEquals(OptionsMenu.GetGammaWidgetSprite():GetFilename(), "gfx/ui/main menu/GammaMenu.anm2")
end

function OptionsMenuTest:TestGetOptionsMenuSprite()
	test.AssertEquals(OptionsMenu.GetOptionsMenuSprite():GetFilename(), "gfx/ui/main menu/OptionsMenu.anm2")
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
