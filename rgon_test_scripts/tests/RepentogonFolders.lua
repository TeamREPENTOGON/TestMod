local test = REPENTOGON_TEST

local RgonFoldersTest = {}

function RgonFoldersTest:BeforeEach()
	
end

function RgonFoldersTest:AfterEach()
	
end

----------

-- Most of the xmls used by other tests are now stored in content-repentogon.
-- They override dummy XMLs in content and content-dlc3 which contain entries with the name CONTENT.
-- This test verifies that those overridden XMLs are not loaded, either by the game or by XMLData.
function RgonFoldersTest:TestContentFolderNotLoaded()
	test.AssertEquals(Isaac.GetPlayerTypeByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetItemIdByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetPoolIdByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetEntityTypeByName("CONTENT"), 0)
	test.AssertEquals(Isaac.GetCostumeIdByPath("CONTENT.anm2"), -1)
	test.AssertEquals(Isaac.GetChallengeIdByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetAchievementIdByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetPillEffectByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetCardIdByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetCutsceneIdByName("CONTENT"), -1)
	test.AssertEquals(Isaac.GetBackdropIdByName("CONTENT"), -1)

	for _, nodeType in pairs(XMLNode) do
		test.AssertNil(XMLData.GetEntryByName(nodeType, "CONTENT"))
	end

	test.AssertTrue(Isaac.GetCutsceneIdByName("test") > 0)
	test.AssertEquals(XMLData.GetEntryByName(XMLNode.CUTSCENE, "test").name, "test")
end

-- The test pill/card are actually in content-dl3, and not overridden in content-repentogon, to verify the behaviour of that folder.
function RgonFoldersTest:TestDlc3()
	test.AssertTrue(Isaac.GetPillEffectByName("REPENTOGON TEST PILL") >= PillEffect.NUM_PILL_EFFECTS)
	test.AssertTrue(Isaac.GetCardIdByName("REPENTOGON TEST CARD") >= Card.NUM_CARDS)

	test.AssertEquals(XMLData.GetEntryByName(XMLNode.PILL, "REPENTOGON TEST PILL").mimiccharge, "3")
	test.AssertEquals(XMLData.GetEntryByName(XMLNode.CARD, "REPENTOGON TEST CARD").mimiccharge, "6")

	test.AssertTrue(Isaac.GetBackdropIdByName("test") > 0)
	test.AssertEquals(XMLData.GetEntryByName(XMLNode.BACKDROP, "test").name, "test")
end

-- The test sound is in regular content, with no -dlc3 or -repentogon override.
function RgonFoldersTest:TestContent()
	test.AssertTrue(Isaac.GetSoundIdByName("REPENTOGON TEST SOUND") > 0)
	test.AssertEquals(XMLData.GetEntryByName(XMLNode.SOUND, "REPENTOGON TEST SOUND").name, "REPENTOGON TEST SOUND")
end

-- Test resources replacement of anm2s
function RgonFoldersTest:TestResourceReplacement()
	local frowningGaper = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Vector.Zero, Vector.Zero, nil)
	test.AssertTrue(frowningGaper:GetSprite():GetAnimationData("resources") ~= nil)

	local rottenGaper = Isaac.Spawn(EntityType.ENTITY_GAPER, 3, 0, Vector.Zero, Vector.Zero, nil)
	test.AssertTrue(rottenGaper:GetSprite():GetAnimationData("resources-dlc3") ~= nil)

	local happyGaper = Isaac.Spawn(EntityType.ENTITY_GAPER, 1, 0, Vector.Zero, Vector.Zero, nil)
	test.AssertTrue(happyGaper:GetSprite():GetAnimationData("resources-repentogon") ~= nil)
end

-- Test resources replacement of xmls
function RgonFoldersTest:TestResourceXmls()
	test.AssertEquals(Isaac.GetItemConfig():GetCollectible(2).Name, "test renamed in resources-repentogon")
	test.AssertEquals(XMLData.GetEntryById (XMLNode.ITEM, 2).name, "test renamed in resources-repentogon")
	test.AssertEquals(XMLData.GetEntryByName(XMLNode.ITEM, "test renamed in resources-repentogon").name, "test renamed in resources-repentogon")

	test.AssertEquals(Isaac.GetItemConfig():GetCard(2).Name, "test renamed in resources-dlc3")
	test.AssertEquals(XMLData.GetEntryById (XMLNode.CARD, 2).name, "test renamed in resources-dlc3")
	test.AssertEquals(XMLData.GetEntryByName(XMLNode.CARD, "test renamed in resources-dlc3").name, "test renamed in resources-dlc3")
end


return RgonFoldersTest
