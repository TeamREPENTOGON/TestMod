local test = REPENTOGON_TEST

local CustomCacheTest = {}

function CustomCacheTest:BeforeEach()
	return Isaac.GetPlayer()
end

function CustomCacheTest:AfterEach(player)
	
end


local MAXCOINS_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST MAX COINS ITEM")
local MAXBOMBS_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST MAX BOMBS NULL")
local MAXKEYS_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST MAX KEYS TRINKET")

function CustomCacheTest:TestMaxCoinsCollectible(player)
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

function CustomCacheTest:TestMaxBombsNull(player)
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

function CustomCacheTest:TestMaxBombsPlaceBombs(player)
	test:AddCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertEquals(cache, "maxbombs")
		test.AssertEquals(value, 99)
		return 150
	end, "maxbombs")
	player:AddCustomCacheTag("maxbombs", true)

	local forceBombInput = function(_, player, hook, action)
		if action == ButtonAction.ACTION_BOMB then
			return true
		end
	end
	test:AddCallback(ModCallbacks.MC_INPUT_ACTION, forceBombInput, InputHook.IS_ACTION_TRIGGERED)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_USE_BOMB, function(_, p)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_USE_BOMB, function(_, p, b)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertEquals(b.Type, EntityType.ENTITY_BOMB)
	end)

	player:AddBombs(999)
	test.AssertEquals(player:GetNumBombs(), 150)
	player:SetBombPlaceDelay(0)
	player:Update()
	test.AssertEquals(player:GetNumBombs(), 149)
end

function CustomCacheTest:TestMaxKeysTrinket(player)
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

local TEARS_CAP_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST TEARS CAP ITEM")

function CustomCacheTest:TestTearsCap(player)
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)

	-- Standard tears cap
	test.AssertEquals(player.MaxFireDelay, 5)

	-- Test decreasing tears cap manually
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "tearscap")
		test.AssertEquals(value, 5)
		return 4
	end, "tearscap")
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, p, cache)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, CacheFlag.CACHE_FIREDELAY)
	end)

	player:AddCustomCacheTag("tearscap", true)
	test.AssertEquals(player:GetCustomCacheValue("tearscap"), 4)
	test.AssertEquals(player.MaxFireDelay, 6.5)

	-- Test increasing tears cap via item
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "tearscap")
		test.AssertEquals(value, 6)
	end, "tearscap")
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, p, cache)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, CacheFlag.CACHE_FIREDELAY)
	end)

	player:AddCollectible(TEARS_CAP_ITEM)
	test.AssertEquals(player:GetCustomCacheValue("tearscap"), 6)
	test.AssertEquals(player.MaxFireDelay, 4)

	-- Verify reset to default
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "tearscap")
		test.AssertEquals(value, 5)
	end, "tearscap")
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, p, cache)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, CacheFlag.CACHE_FIREDELAY)
	end)
	player:RemoveCollectible(TEARS_CAP_ITEM)
	test.AssertEquals(player:GetCustomCacheValue("tearscap"), 5)
	test.AssertEquals(player.MaxFireDelay, 5)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
end

local STAT_MULT_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST STAT MULT ITEM")

function CustomCacheTest:TestStatMultiplier(player)
	-- Validate base stats
	test.AssertEquals(player.Damage, 3.5)
	test.AssertEquals(player.MaxFireDelay, 10)
	test.AssertEquals(player.ShotSpeed, 1)
	test.AssertEquals(player.TearRange, 260)
	test.AssertEquals(player.MoveSpeed, 1)
	test.AssertEquals(player.Luck, 0)

	-- Increase all stats
	player:AddCollectible(CollectibleType.COLLECTIBLE_CAT_O_NINE_TAILS)
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:AddCollectible(CollectibleType.COLLECTIBLE_MOMS_HEELS)
	player:AddCollectible(CollectibleType.COLLECTIBLE_BELT)
	player:AddCollectible(CollectibleType.COLLECTIBLE_LUCKY_FOOT)

	-- Validate standard raised stats
	test.AssertEquals(player.Damage, 5.1913)
	test.AssertEquals(player.MaxFireDelay, 7.7078)
	test.AssertEquals(player.ShotSpeed, 1.23)
	test.AssertEquals(player.TearRange, 360)
	test.AssertEquals(player.MoveSpeed, 1.3)
	test.AssertEquals(player.Luck, 1)

	-- Cracked Crown x1
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 1.2)
	end, "statmultiplier")
	player:AddTrinket(TrinketType.TRINKET_CRACKED_CROWN)
	player:Update()

	test.AssertEquals(player.Damage, 5.5296)
	test.AssertEquals(player.MaxFireDelay, 7.3594)
	test.AssertEquals(player.ShotSpeed, 1.276)
	test.AssertEquals(player.TearRange, 380)
	test.AssertEquals(player.MoveSpeed, 1.36)
	test.AssertEquals(player.Luck, 1)

	-- Cracked Crown x2
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 1.4)
	end, "statmultiplier")
	player:AddCollectible(CollectibleType.COLLECTIBLE_MOMS_PURSE)
	player:AddTrinket(TrinketType.TRINKET_CRACKED_CROWN)
	player:Update()

	test.AssertEquals(player.Damage, 5.8679)
	test.AssertEquals(player.MaxFireDelay, 7.0379)
	test.AssertEquals(player.ShotSpeed, 1.322)
	test.AssertEquals(player.TearRange, 400)
	test.AssertEquals(player.MoveSpeed, 1.42)
	test.AssertEquals(player.Luck, 1)

	-- Cracked Crown x1 again
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 1.2)
	end, "statmultiplier")
	player:TryRemoveTrinket(TrinketType.TRINKET_CRACKED_CROWN)
	player:Update()

	test.AssertEquals(player.Damage, 5.5296)
	test.AssertEquals(player.MaxFireDelay, 7.3594)
	test.AssertEquals(player.ShotSpeed, 1.276)
	test.AssertEquals(player.TearRange, 380)
	test.AssertEquals(player.MoveSpeed, 1.36)
	test.AssertEquals(player.Luck, 1)

	-- T.Bethany + Cracked Crown
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 0.9)
	end, "statmultiplier")
	player:ChangePlayerType(PlayerType.PLAYER_BETHANY_B)

	test.AssertEquals(player.Damage, 5.0222)
	test.AssertEquals(player.MaxFireDelay, 7.8931)
	test.AssertEquals(player.ShotSpeed, 1.207)
	test.AssertEquals(player.TearRange, 350)
	test.AssertEquals(player.MoveSpeed, 1.27)
	test.AssertEquals(player.Luck, 1)

	-- T.Bethany
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 0.75)
	end, "statmultiplier")
	player:TryRemoveTrinket(TrinketType.TRINKET_CRACKED_CROWN)
	player:Update()

	test.AssertEquals(player.Damage, 4.7685)
	test.AssertEquals(player.MaxFireDelay, 8.1864)
	test.AssertEquals(player.ShotSpeed, 1.1725)
	test.AssertEquals(player.TearRange, 335)
	test.AssertEquals(player.MoveSpeed, 1.225)
	test.AssertEquals(player.Luck, 1)

	-- Back to isaac
	player:ChangePlayerType(PlayerType.PLAYER_ISAAC)

	test.AssertEquals(player.Damage, 5.1913)
	test.AssertEquals(player.MaxFireDelay, 7.7078)
	test.AssertEquals(player.ShotSpeed, 1.23)
	test.AssertEquals(player.TearRange, 360)
	test.AssertEquals(player.MoveSpeed, 1.3)
	test.AssertEquals(player.Luck, 1)

	-- Test custom statmultiplier gives same results
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 1)
		return 1.4
	end, "statmultiplier")
	player:AddCustomCacheTag("statmultiplier", true)
	test.AssertEquals(player:GetCustomCacheValue("statmultiplier"), 1.4)

	test.AssertEquals(player.Damage, 5.8679)
	test.AssertEquals(player.MaxFireDelay, 7.0379)
	test.AssertEquals(player.ShotSpeed, 1.322)
	test.AssertEquals(player.TearRange, 400)
	test.AssertEquals(player.MoveSpeed, 1.42)
	test.AssertEquals(player.Luck, 1)

	-- Test custom statmultiplier triggered from item
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 0.75)
	end, "statmultiplier")
	player:AddCollectible(STAT_MULT_ITEM)

	test.AssertEquals(player.Damage, 4.7685)
	test.AssertEquals(player.MaxFireDelay, 8.1864)
	test.AssertEquals(player.ShotSpeed, 1.1725)
	test.AssertEquals(player.TearRange, 335)
	test.AssertEquals(player.MoveSpeed, 1.225)
	test.AssertEquals(player.Luck, 1)

	-- Verify custom statmultiplier does not impact base stats
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_CAT_O_NINE_TAILS)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_HEELS)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_BELT)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_LUCKY_FOOT)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_PURSE)

	test.AssertEquals(player.Damage, 3.5)
	test.AssertEquals(player.MaxFireDelay, 10)
	test.AssertEquals(player.ShotSpeed, 1)
	test.AssertEquals(player.TearRange, 260)
	test.AssertEquals(player.MoveSpeed, 1)
	test.AssertEquals(player.Luck, 0)

	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, p, cache, value)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(cache, "statmultiplier")
		test.AssertEquals(value, 1)
	end, "statmultiplier")
	for _, expectedCache in pairs({CacheFlag.CACHE_DAMAGE, CacheFlag.CACHE_FIREDELAY, CacheFlag.CACHE_SHOTSPEED, CacheFlag.CACHE_RANGE, CacheFlag.CACHE_SPEED}) do
		test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, p, cache)
			test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
			test.AssertEquals(cache, expectedCache)
		end, expectedCache)
	end
	player:RemoveCollectible(STAT_MULT_ITEM)
end


return CustomCacheTest
