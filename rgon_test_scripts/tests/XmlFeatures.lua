local test = REPENTOGON_TEST

local XmlFeaturesTest = {}

function XmlFeaturesTest:BeforeEach()
	
end

function XmlFeaturesTest:AfterEach()
	
end

----------

local TEST_PLAYER = Isaac.GetPlayerTypeByName("Testsaac")
local TEST_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST ITEM")
local TEST_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL")
local TEST_COSTUME = Isaac.GetCostumeIdByPath("gfx/characters/repentogon_test_costume.anm2")

function XmlFeaturesTest:TestNullItemLoaded()
	test.AssertEquals(Isaac.GetItemConfig():GetNullItem(TEST_NULL).Name, "REPENTOGON TEST NULL")
end

function XmlFeaturesTest:TestNullItemCostume()
	test.AssertEquals(Isaac.GetItemConfig():GetNullItem(TEST_NULL).Costume.ID, TEST_COSTUME)

	local player = Isaac.GetPlayer()
	test.AssertFalse(player:IsNullItemCostumeVisible(TEST_NULL, "head4"))
	player:GetEffects():AddNullEffect(TEST_NULL)
	test.AssertTrue(player:IsNullItemCostumeVisible(TEST_NULL, "head4"))
	player:GetEffects():RemoveNullEffect(TEST_NULL)
	test.AssertFalse(player:IsNullItemCostumeVisible(TEST_NULL, "head4"))
end

function XmlFeaturesTest:TestPlayerModCostume()
	test.AssertEquals(EntityConfig.GetPlayer(TEST_PLAYER):GetCostumeID(), TEST_COSTUME)
end


return XmlFeaturesTest
