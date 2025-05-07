local test = REPENTOGON_TEST

local StatsMenuTest = {}

function StatsMenuTest:BeforeEach()
	
end

function StatsMenuTest:AfterEach()
	
end

----------

function StatsMenuTest:TestGetSecretsMenuSprite()
	test.AssertEquals(StatsMenu.GetSecretsMenuSprite():GetFilename(), "gfx/ui/achievement/achievements.anm2")
end

function StatsMenuTest:TestGetSecretsMenuCursorLeftSprite()
	test.AssertEquals(StatsMenu.GetSecretsMenuCursorLeftSprite():GetFilename(), "gfx/ui/main menu/SecretsMenuComponents.anm2")
end

function StatsMenuTest:TestGetSecretsMenuCursorRightSprite()
	test.AssertEquals(StatsMenu.GetSecretsMenuCursorRightSprite():GetFilename(), "gfx/ui/main menu/SecretsMenuComponents.anm2")
end

function StatsMenuTest:TestGetStatsMenuSprite()
	test.AssertEquals(StatsMenu.GetStatsMenuSprite():GetFilename(), "gfx/ui/main menu/StatsMenu.anm2")
end

function StatsMenuTest:TestIsSecretsMenuVisible()
	StatsMenu.IsSecretsMenuVisible()
end

function StatsMenuTest:TestSetSelectedElement()
	local originalVal = StatsMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		StatsMenu.SetSelectedElement(val)
		test.AssertEquals(StatsMenu.GetSelectedElement(), val)
	end
	StatsMenu.SetSelectedElement(originalVal)
end


return StatsMenuTest
