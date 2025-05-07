local test = REPENTOGON_TEST

local CharacterMenuTest = {}

function CharacterMenuTest:BeforeEach()
	
end

function CharacterMenuTest:AfterEach()
	
end

----------

function CharacterMenuTest:TestGetBigCharPageSprite()
	test.AssertEquals(CharacterMenu.GetBigCharPageSprite():GetFilename(), "gfx/ui/main menu/CharacterMenu.anm2")
end

function CharacterMenuTest:TestGetBGSprite()
	test.AssertEquals(CharacterMenu.GetBGSprite():GetFilename(), "gfx/ui/main menu/CharacterMenuBG.anm2")
end

function CharacterMenuTest:TestGetCharacterPortraitSprite()
	test.AssertEquals(CharacterMenu.GetCharacterPortraitSprite():GetFilename(), "gfx/ui/main menu/CharacterPortraits.anm2")
end

function CharacterMenuTest:TestGetDifficultyPageSprite()
	test.AssertEquals(CharacterMenu.GetDifficultyPageSprite():GetFilename(), "gfx/ui/main menu/DifficultyWidget.anm2")
end

function CharacterMenuTest:TestGetDifficultyOverlaySprite()
	test.AssertEquals(CharacterMenu.GetDifficultyOverlaySprite():GetFilename(), "gfx/ui/main menu/CharacterMenu.anm2")
end

function CharacterMenuTest:TestGetEasterEggPageSprite()
	test.AssertEquals(CharacterMenu.GetEasterEggPageSprite():GetFilename(), "gfx/ui/main menu/SeedSelectionWidget.anm2")
end

function CharacterMenuTest:TestGetIsCharacterUnlocked()
	CharacterMenu.GetIsCharacterUnlocked()
end

function CharacterMenuTest:TestGetGreedDecoSprite()
	test.AssertEquals(CharacterMenu.GetGreedDecoSprite():GetFilename(), "gfx/ui/main menu/CharacterMenu.anm2")
end

function CharacterMenuTest:TestGetNumCharacters()
	CharacterMenu.GetNumCharacters()
end

function CharacterMenuTest:TestGetPageSwapWidgetSprite()
	test.AssertEquals(CharacterMenu.GetPageSwapWidgetSprite():GetFilename(), "gfx/ui/main menu/PageSwapWidget.anm2")
end

function CharacterMenuTest:TestGetSeedEntrySprite()
	test.AssertEquals(CharacterMenu.GetSeedEntrySprite():GetFilename(), "gfx/ui/main menu/SeedEntry.anm2")
end

function CharacterMenuTest:TestGetSeedPageSprite()
	test.AssertEquals(CharacterMenu.GetSeedPageSprite():GetFilename(), "gfx/ui/main menu/SeedWidget.anm2")
end

function CharacterMenuTest:TestGetSeedUnlockPageSprite()
	test.AssertEquals(CharacterMenu.GetSeedUnlockPageSprite():GetFilename(), "gfx/ui/main menu/SeedUnlockPaper.anm2")
end

function CharacterMenuTest:TestGetTaintedBGDecoSprite()
	test.AssertEquals(CharacterMenu.GetTaintedBGDecoSprite():GetFilename(), "gfx/ui/main menu/CharacterMenuBGExtra.anm2")
end

function CharacterMenuTest:TestGetWinStreakPageSprite()
	test.AssertEquals(CharacterMenu.GetWinStreakPageSprite():GetFilename(), "gfx/ui/main menu/WinStreakWidget.anm2")
end

function CharacterMenuTest:TestSetActiveStatus()
	local status = CharacterMenu.GetActiveStatus()
	CharacterMenu.SetActiveStatus(status)
end

function CharacterMenuTest:TestSetCharacterWheelDepth()
	local originalVal = CharacterMenu.GetCharacterWheelDepth()
	for _, val in pairs(test.TestFloats) do
		CharacterMenu.SetCharacterWheelDepth(val)
		test.AssertEquals(CharacterMenu.GetCharacterWheelDepth(), val)
	end
	CharacterMenu.SetCharacterWheelDepth(originalVal)
end

function CharacterMenuTest:TestSetCharacterWheelWidth()
	local originalVal = CharacterMenu.GetCharacterWheelWidth()
	for _, val in pairs(test.TestFloats) do
		CharacterMenu.SetCharacterWheelWidth(val)
		test.AssertEquals(CharacterMenu.GetCharacterWheelWidth(), val)
	end
	CharacterMenu.SetCharacterWheelWidth(originalVal)
end

function CharacterMenuTest:TestSetDifficulty()
	local originalVal = CharacterMenu.GetDifficulty()
	for _, val in pairs(test.TestInts) do
		CharacterMenu.SetDifficulty(val)
		test.AssertEquals(CharacterMenu.GetDifficulty(), val)
	end
	CharacterMenu.SetDifficulty(originalVal)
end

function CharacterMenuTest:TestSetIsCharacterUnlocked()
	local isunlocked = true
	CharacterMenu.SetIsCharacterUnlocked(isunlocked)
end

function CharacterMenuTest:TestSetScrollSpeed()
	local originalVal = CharacterMenu.GetScrollSpeed()
	for _, val in pairs(test.TestFloats) do
		CharacterMenu.SetScrollSpeed(val)
		test.AssertEquals(CharacterMenu.GetScrollSpeed(), val)
	end
	CharacterMenu.SetScrollSpeed(originalVal)
end

function CharacterMenuTest:TestSetSelectedCharacterMenu()
	local originalVal = CharacterMenu.GetSelectedCharacterMenu()
	for _, val in pairs(test.TestInts) do
		CharacterMenu.SetSelectedCharacterMenu(val)
		test.AssertEquals(CharacterMenu.GetSelectedCharacterMenu(), val)
	end
	CharacterMenu.SetSelectedCharacterMenu(originalVal)
end

function CharacterMenuTest:TestSetSelectedCharacterID()
	local originalVal = CharacterMenu.GetSelectedCharacterID()
	for _, val in pairs(test.TestInts) do
		CharacterMenu.SetSelectedCharacterID(val)
		test.AssertEquals(CharacterMenu.GetSelectedCharacterID(), val)
	end
	CharacterMenu.SetSelectedCharacterID(originalVal)
end


return CharacterMenuTest
