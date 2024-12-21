local test = REPENTOGON_TEST

local CharacterMenuTest = {}

function CharacterMenuTest:BeforeEach()
	
end

function CharacterMenuTest:AfterEach()
	
end

----------

function CharacterMenuTest:TestGetBigCharPageSprite()
	CharacterMenu.GetBigCharPageSprite()
end

function CharacterMenuTest:TestGetBGSprite()
	CharacterMenu.GetBGSprite()
end

function CharacterMenuTest:TestGetCharacterPortraitSprite()
	CharacterMenu.GetCharacterPortraitSprite()
end

function CharacterMenuTest:TestGetDifficultyPageSprite()
	CharacterMenu.GetDifficultyPageSprite()
end

function CharacterMenuTest:TestGetDifficultyOverlaySprite()
	CharacterMenu.GetDifficultyOverlaySprite()
end

function CharacterMenuTest:TestGetEasterEggPageSprite()
	CharacterMenu.GetEasterEggPageSprite()
end

function CharacterMenuTest:TestGetIsCharacterUnlocked()
	CharacterMenu.GetIsCharacterUnlocked()
end

function CharacterMenuTest:TestGetGreedDecoSprite()
	CharacterMenu.GetGreedDecoSprite()
end

function CharacterMenuTest:TestGetNumCharacters()
	CharacterMenu.GetNumCharacters()
end

function CharacterMenuTest:TestGetPageSwapWidgetSprite()
	CharacterMenu.GetPageSwapWidgetSprite()
end

function CharacterMenuTest:TestGetSeedEntrySprite()
	CharacterMenu.GetSeedEntrySprite()
end

function CharacterMenuTest:TestGetSeedPageSprite()
	CharacterMenu.GetSeedPageSprite()
end

function CharacterMenuTest:TestGetSeedUnlockPageSprite()
	CharacterMenu.GetSeedUnlockPageSprite()
end

function CharacterMenuTest:TestGetTaintedBGDecoSprite()
	CharacterMenu.GetTaintedBGDecoSprite()
end

function CharacterMenuTest:TestGetWinStreakPageSprite()
	CharacterMenu.GetWinStreakPageSprite()
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
