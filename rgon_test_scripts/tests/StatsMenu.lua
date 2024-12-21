local test = REPENTOGON_TEST

local StatsMenuTest = {}

function StatsMenuTest:BeforeEach()
	
end

function StatsMenuTest:AfterEach()
	
end

----------

function StatsMenuTest:TestGetSecretsMenuSprite()
	StatsMenu.GetSecretsMenuSprite()
end

function StatsMenuTest:TestGetSecretsMenuCursorLeftSprite()
	StatsMenu.GetSecretsMenuCursorLeftSprite()
end

function StatsMenuTest:TestGetSecretsMenuCursorRightSprite()
	StatsMenu.GetSecretsMenuCursorRightSprite()
end

function StatsMenuTest:TestGetStatsMenuSprite()
	StatsMenu.GetStatsMenuSprite()
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
