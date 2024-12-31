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


local REVIVE_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST REVIVE")
local REVIVE_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL REVIVE")
local REVIVE_NULL_HIDDEN = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL HIDDEN REVIVE")
local REVIVE_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST TRINKET REVIVEEFFECT")

function XmlFeaturesTest:TestRevive()
	local player = Isaac.GetPlayer()
	test.AssertFalse(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 0)
	player:AddCollectible(REVIVE_ITEM)
	test.AssertTrue(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 1)
	player:RemoveCollectible(REVIVE_ITEM)
end

function XmlFeaturesTest:TestReviveEffect()
	local player = Isaac.GetPlayer()
	test.AssertFalse(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 0)
	player:GetEffects():AddTrinketEffect(REVIVE_TRINKET)
	test.AssertTrue(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 1)
	player:GetEffects():RemoveTrinketEffect(REVIVE_TRINKET)
end

function XmlFeaturesTest:TestNullRevive()
	local player = Isaac.GetPlayer()
	test.AssertFalse(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 0)
	player:GetEffects():AddNullEffect(REVIVE_NULL)
	test.AssertTrue(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 1)
	player:GetEffects():RemoveNullEffect(REVIVE_NULL)
end

function XmlFeaturesTest:TestHiddenRevive()
	local player = Isaac.GetPlayer()
	test.AssertFalse(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 0)
	player:GetEffects():AddNullEffect(REVIVE_NULL_HIDDEN)
	test.AssertTrue(player:WillPlayerRevive())
	test.AssertEquals(player:GetExtraLives(), 0)
	player:GetEffects():RemoveNullEffect(REVIVE_NULL_HIDDEN)
end


local TEST_FAMILIAR = Isaac.GetEntityVariantByName("Brother Bobentogon")

function XmlFeaturesTest:TestFamiliarBlockProjectilesAndTakeDamage()
	local fam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, TEST_FAMILIAR, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	local projectile = Isaac.Spawn(EntityType.ENTITY_PROJECTILE, 0, 0, Vector.Zero, Vector.Zero, nil):ToProjectile()
	local tookDamage = false
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ENTITY_TAKE_DMG, function()
		tookDamage = true
	end, EntityType.ENTITY_FAMILIAR)
	fam:ForceCollide(projectile)
	test.AssertTrue(tookDamage)
	test.AssertTrue(projectile:IsDead())
end

function XmlFeaturesTest:TestFamiliarIgnoreBffs()
	local fam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, 1, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	local testFam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, TEST_FAMILIAR, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	test.AssertEquals(fam:GetMultiplier(), 1.0)
	test.AssertEquals(testFam:GetMultiplier(), 1.0)
	Isaac.GetPlayer():AddCollectible(CollectibleType.COLLECTIBLE_BFFS)
	test.AssertEquals(fam:GetMultiplier(), 2.0)
	test.AssertEquals(testFam:GetMultiplier(), 1.0)
end

return XmlFeaturesTest
