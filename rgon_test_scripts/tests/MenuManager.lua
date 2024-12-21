local test = REPENTOGON_TEST

local MenuManagerTest = {}

function MenuManagerTest:BeforeEach()
	
end

function MenuManagerTest:AfterEach()
	
end

----------

function MenuManagerTest:TestGetActiveMenu()
	MenuManager.GetActiveMenu()
end

function MenuManagerTest:TestGetBackWidgetSprite()
	MenuManager.GetBackWidgetSprite()
end

function MenuManagerTest:TestGetColorModifierLerpAmount()
	MenuManager.GetColorModifierLerpAmount()
end

function MenuManagerTest:TestGetCurrentColorModifier()
	MenuManager.GetCurrentColorModifier()
end

function MenuManagerTest:TestGetSelectWidgetSprite()
	MenuManager.GetSelectWidgetSprite()
end

function MenuManagerTest:TestGetShadowSprite()
	MenuManager.GetShadowSprite()
end

function MenuManagerTest:TestGetTargetColorModifier()
	MenuManager.GetTargetColorModifier()
end

function MenuManagerTest:TestSetActiveMenu()
	local menu = 1
	MenuManager.SetActiveMenu(menu)
end

function MenuManagerTest:TestSetColorModifier()
	local colormodifier = ColorModifier()
	local lerp = true
	local rate = 1
	MenuManager.SetColorModifier(colormodifier, lerp, rate)
end

function MenuManagerTest:TestSetInputMask()
	local originalVal = MenuManager.GetInputMask()
	for _, val in pairs(test.TestUnsignedInts) do
		MenuManager.SetInputMask(val)
		test.AssertEquals(MenuManager.GetInputMask(), val)
	end
	MenuManager.SetInputMask(originalVal)
end

function MenuManagerTest:TestSetViewPosition()
	local originalVal = MenuManager.GetViewPosition()
	for _, val in pairs(test.TestVectors) do
		MenuManager.SetViewPosition(val)
		test.AssertEquals(MenuManager.GetViewPosition(), val)
	end
	MenuManager.SetViewPosition(originalVal)
end


return MenuManagerTest