local test = REPENTOGON_TEST

local XmlFeaturesTest = {}

function XmlFeaturesTest:BeforeEach()
	
end

function XmlFeaturesTest:AfterEach()
	
end

----------


function XmlFeaturesTest:TestPlayerStats()
	local player = Isaac.GetPlayer()
	player:ChangePlayerType(test.TEST_PLAYER)

	test.AssertEquals(player.MoveSpeed, 1.1)
	test.AssertEquals(player.MaxFireDelay, 5)
	test.AssertEquals(player.Damage, 4)
	test.AssertEquals(player.TearRange, 280)
	test.AssertEquals(player.ShotSpeed, 2)
	test.AssertEquals(player.Luck, 1)

	player:ChangePlayerType(PlayerType.PLAYER_ISAAC)
end


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
	test.AssertEquals(EntityConfig.GetPlayer(test.TEST_PLAYER):GetCostumeID(), TEST_COSTUME)
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


function XmlFeaturesTest:TestFamiliarBlockProjectilesAndTakeDamage()
	local fam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, test.TEST_FAMILIAR, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	local projectile = Isaac.Spawn(EntityType.ENTITY_PROJECTILE, 0, 0, Vector.Zero, Vector.Zero, nil):ToProjectile()
	local tookDamage = false
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ENTITY_TAKE_DMG, function()
		tookDamage = true
	end, EntityType.ENTITY_FAMILIAR)
	fam:ForceCollide(projectile)
	test.AssertTrue(tookDamage)
	test.AssertTrue(projectile:IsDead())
	fam:Remove()
end

function XmlFeaturesTest:TestFamiliarIgnoreBffs()
	local fam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, 1, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	local testFam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, test.TEST_FAMILIAR, 0, Isaac.GetPlayer().Position, Vector.Zero, Isaac.GetPlayer()):ToFamiliar()
	test.AssertEquals(fam:GetMultiplier(), 1.0)
	test.AssertEquals(testFam:GetMultiplier(), 1.0)
	Isaac.GetPlayer():AddCollectible(CollectibleType.COLLECTIBLE_BFFS)
	test.AssertEquals(fam:GetMultiplier(), 2.0)
	test.AssertEquals(testFam:GetMultiplier(), 1.0)
	fam:Remove()
end


local MAXCOINS_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST MAX COINS ITEM")
local MAXBOMBS_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST MAX BOMBS NULL")
local MAXKEYS_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST MAX KEYS TRINKET")

function XmlFeaturesTest:TestMaxCoinsCollectible()
	local player = Isaac.GetPlayer()

	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)

	-- Evaluated only when triggered
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertEquals(cache, "maxcoins")
		test.AssertEquals(value, 99)
		return 123
	end, "maxcoins")
	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)
	player:AddCustomCacheTag("maxcoins", true)
	test.AssertEquals(player:GetMaxCoins(), 123)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 123)
	player:AddCustomCacheTag("maxcoins", true)
	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)

	-- Triggered by AddCollectible
	player:AddCollectible(MAXCOINS_ITEM)
	test.AssertEquals(player:GetMaxCoins(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 9)

	-- Triggered by RemoveCollectible
	player:RemoveCollectible(MAXCOINS_ITEM)
	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)

	-- Not immediately triggered for TemporaryEffects, but triggers next update
	player:GetEffects():AddCollectibleEffect(MAXCOINS_ITEM)
	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)
	player:Update()
	test.AssertEquals(player:GetMaxCoins(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 9)

	player:GetEffects():RemoveCollectibleEffect(MAXCOINS_ITEM)
	test.AssertEquals(player:GetMaxCoins(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 9)
	player:Update()
	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)

	-- Wisps trigger immediately when added/killed
	local wisp = player:AddItemWisp(MAXCOINS_ITEM, Vector.Zero)
	test.AssertEquals(player:GetMaxCoins(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 9)

	wisp:Kill()
	test.AssertEquals(player:GetMaxCoins(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxcoins"), 99)
end

function XmlFeaturesTest:TestMaxBombsNull()
	local player = Isaac.GetPlayer()

	test.AssertEquals(player:GetMaxBombs(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 99)

	-- Evaluated only when triggered
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertEquals(cache, "maxbombs")
		test.AssertEquals(value, 99)
		return 123
	end, "maxbombs")
	test.AssertEquals(player:GetMaxBombs(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 99)
	player:AddCustomCacheTag("maxbombs", true)
	test.AssertEquals(player:GetMaxBombs(), 123)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 123)
	player:AddCustomCacheTag("maxbombs", true)
	test.AssertEquals(player:GetMaxBombs(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 99)

	-- Not immediately triggered for TemporaryEffects, but triggers next update
	player:GetEffects():AddNullEffect(MAXBOMBS_NULL)
	test.AssertEquals(player:GetMaxBombs(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 99)
	player:Update()
	test.AssertEquals(player:GetMaxBombs(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 9)

	player:GetEffects():RemoveNullEffect(MAXBOMBS_NULL)
	test.AssertEquals(player:GetMaxBombs(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 9)
	player:Update()
	test.AssertEquals(player:GetMaxBombs(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxbombs"), 99)
end

function XmlFeaturesTest:TestMaxKeysTrinket()
	local player = Isaac.GetPlayer()

	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)

	-- Evaluated only when triggered
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertEquals(cache, "maxkeys")
		test.AssertEquals(value, 99)
		return 123
	end, "maxkeys")
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)
	player:AddCustomCacheTag("maxkeys", true)
	test.AssertEquals(player:GetMaxKeys(), 123)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 123)
	player:AddCustomCacheTag("maxkeys", true)
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)

	-- Adding a trinket does not trigger until next update
	player:AddTrinket(MAXKEYS_TRINKET)
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)
	player:Update()
	test.AssertEquals(player:GetMaxKeys(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 9)

	-- Removing a trinket does not trigger until next update
	player:TryRemoveTrinket(MAXKEYS_TRINKET)
	test.AssertEquals(player:GetMaxKeys(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 9)
	player:Update()
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)

	-- Likewise for smelted trinkets
	player:AddSmeltedTrinket(MAXKEYS_TRINKET)
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)
	player:Update()
	test.AssertEquals(player:GetMaxKeys(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 9)

	player:TryRemoveTrinket(MAXKEYS_TRINKET)
	test.AssertEquals(player:GetMaxKeys(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 9)
	player:Update()
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)

	-- Not immediately triggered for TemporaryEffects, but triggers next update
	player:GetEffects():AddTrinketEffect(MAXKEYS_TRINKET)
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)
	player:Update()
	test.AssertEquals(player:GetMaxKeys(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 9)

	player:GetEffects():RemoveTrinketEffect(MAXKEYS_TRINKET)
	test.AssertEquals(player:GetMaxKeys(), 9)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 9)
	player:Update()
	test.AssertEquals(player:GetMaxKeys(), 99)
	test.AssertEquals(player:GetCustomCacheValue("maxkeys"), 99)
end


return XmlFeaturesTest
