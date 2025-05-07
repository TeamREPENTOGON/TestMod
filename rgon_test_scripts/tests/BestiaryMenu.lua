local test = REPENTOGON_TEST

local BestiaryMenuTest = {}

function BestiaryMenuTest:BeforeEach()
	
end

function BestiaryMenuTest:AfterEach()
	
end

----------

function BestiaryMenuTest:TestGetBestiaryMenuSprite()
	test.AssertEquals(BestiaryMenu.GetBestiaryMenuSprite():GetFilename(), "gfx/ui/main menu/BestiaryMenu.anm2")
end

function BestiaryMenuTest:TestGetDeathScreenSprite()
	test.AssertEquals(BestiaryMenu.GetDeathScreenSprite():GetFilename(), "gfx/ui/Death Screen.anm2")
end

function BestiaryMenuTest:TestGetEnemySprite()
	test.AssertEquals(BestiaryMenu.GetEnemySprite():GetFilename(), "gfx/010.000_Frowning Gaper.anm2")
end

function BestiaryMenuTest:TestGetNumBossPages()
	BestiaryMenu.GetNumBossPages()
end

function BestiaryMenuTest:TestGetNumMonsterPages()
	BestiaryMenu.GetNumMonsterPages()
end

function BestiaryMenuTest:TestGetNumPages()
	BestiaryMenu.GetNumPages()
end

function BestiaryMenuTest:TestSetSelectedPage()
	local originalVal = BestiaryMenu.GetSelectedPage()
	for _, val in pairs(test.TestInts) do
		BestiaryMenu.SetSelectedPage(val)
		test.AssertEquals(BestiaryMenu.GetSelectedPage(), val)
	end
	BestiaryMenu.SetSelectedPage(originalVal)
end

function BestiaryMenuTest:TestSetSelectedElement()
	local originalVal = BestiaryMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		BestiaryMenu.SetSelectedElement(val)
		test.AssertEquals(BestiaryMenu.GetSelectedElement(), val)
	end
	BestiaryMenu.SetSelectedElement(originalVal)
end


return BestiaryMenuTest
