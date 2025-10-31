local test = REPENTOGON_TEST

local EvaluateStatsTest = {}

function EvaluateStatsTest:BeforeEach()
	return Isaac.GetPlayer()
end

function EvaluateStatsTest:AfterEach(player)
	
end


local ALL_STATS_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST ALL STATS UP ITEM")
local ALL_STATS_EFFECT_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST ALL STATS UP TRINKET EFFECT")
local FLAT_STATS_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST FLAT TEARS/DAMAGE NULL")
local TEARS_DAMAGE_MULT_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST TEARS/DAMAGE MULT ITEM")

local function FireDelayToTears(fireDelay)
	return 30 / (fireDelay + 1)
end

local function TearsToFireDelay(tears)
	return math.max((30 / tears) - 1, -0.75)
end


function EvaluateStatsTest:TestTearsUp(player)
	local originalFireDelay = player.MaxFireDelay

	-- Compare +0.7 base tears to Sad Onion, which should behave identically.
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, tears)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(stage, EvaluateStatStage.TEARS_UP)
		test.AssertEquals(tears, 0.7)
	end, EvaluateStatStage.TEARS_UP)

	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local expectedFireDelay = player.MaxFireDelay
	test.AssertTrue(expectedFireDelay < originalFireDelay)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	test.AssertEquals(player.MaxFireDelay, originalFireDelay)

	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, tears)
		test.AssertEquals(tears, 0)
	end, EvaluateStatStage.TEARS_UP)

	test:AddCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, tears)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(stage, EvaluateStatStage.TEARS_UP)
		return tears + 0.7
	end, EvaluateStatStage.TEARS_UP)

	player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY, true)
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay)

	-- Test XML stats
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local expectedFireDelay2 = player.MaxFireDelay
	test.AssertTrue(expectedFireDelay2 < expectedFireDelay)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)

	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, tears)
		test.AssertEquals(tears, 0.7)
	end, EvaluateStatStage.TEARS_UP)
	player:GetEffects():AddTrinketEffect(ALL_STATS_EFFECT_TRINKET)
	player:Update()
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay2)
	player:GetEffects():RemoveTrinketEffect(ALL_STATS_EFFECT_TRINKET)
	player:Update()
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay)
end

function EvaluateStatsTest:TestFlatTears(player)
	local originalFireDelay = player.MaxFireDelay
	local originalTears = FireDelayToTears(originalFireDelay)

	-- Compare +0.5 flat tears to Pisces, which should behave identically.
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, tears)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(stage, EvaluateStatStage.FLAT_TEARS)
		test.AssertEquals(tears, originalTears + 0.5)
	end, EvaluateStatStage.FLAT_TEARS)

	player:AddCollectible(CollectibleType.COLLECTIBLE_PISCES)
	local expectedFireDelay = player.MaxFireDelay
	local expectedTears = FireDelayToTears(expectedFireDelay)
	test.AssertTrue(expectedFireDelay < originalFireDelay)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_PISCES)
	test.AssertEquals(player.MaxFireDelay, originalFireDelay)

	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, tears)
		test.AssertEquals(tears, originalTears)
	end, EvaluateStatStage.FLAT_TEARS)

	test:AddCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, tears)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(stage, EvaluateStatStage.FLAT_TEARS)
		return tears + 0.5
	end, EvaluateStatStage.FLAT_TEARS)

	player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY, true)
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay)

	-- Test xml stats
	player:AddCollectible(CollectibleType.COLLECTIBLE_PISCES)
	local expectedFireDelay2 = player.MaxFireDelay
	test.AssertTrue(expectedFireDelay2 < expectedFireDelay)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_PISCES)

	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, tears)
		test.AssertEquals(tears, expectedTears)
	end, EvaluateStatStage.FLAT_TEARS)
	player:GetEffects():AddNullEffect(FLAT_STATS_NULL)
	player:Update()
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay2)
	player:GetEffects():RemoveNullEffect(FLAT_STATS_NULL)
	player:Update()
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay)

	-- Verify the flat tears bonus is affected by vanilla multipliers.
	player:AddCollectible(CollectibleType.COLLECTIBLE_EVES_MASCARA)
	test.AssertEquals(player.MaxFireDelay, TearsToFireDelay(expectedTears * 0.66))
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_EVES_MASCARA)
end

function EvaluateStatsTest:TestTearsMult(player)
	-- Start a tears up & and a flat tears bonus to make sure both are multiplied as expected.
	player:AddCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	player:AddTrinket(TrinketType.TRINKET_CANCER)
	player:Update()

	local originalFireDelay = player.MaxFireDelay

	-- Compare x0.4 tears to Dr Fetus, which should behave identically.
	player:AddCollectible(CollectibleType.COLLECTIBLE_DR_FETUS)
	local expectedFireDelay = player.MaxFireDelay
	local expectedTears = FireDelayToTears(expectedFireDelay)
	test.AssertTrue(expectedFireDelay > originalFireDelay)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_DR_FETUS)
	test.AssertEquals(player.MaxFireDelay, originalFireDelay)

	player:AddCollectible(TEARS_DAMAGE_MULT_ITEM)
	test.AssertEquals(player.MaxFireDelay, expectedFireDelay)

	player:AddCollectible(TEARS_DAMAGE_MULT_ITEM)
	test.AssertEquals(player.MaxFireDelay, TearsToFireDelay(expectedTears * 0.4))

	player:RemoveCollectible(TEARS_DAMAGE_MULT_ITEM)
	player:RemoveCollectible(TEARS_DAMAGE_MULT_ITEM)
	test.AssertEquals(player.MaxFireDelay, originalFireDelay)
end

function EvaluateStatsTest:TestDamageUp(player)
	local originalDamage = player.Damage

	-- Compare +1 base damage to Pentagram, which should behave identically.
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, damage)
		test.AssertEquals(damage, 1)
	end, EvaluateStatStage.DAMAGE_UP)
	player:AddCollectible(CollectibleType.COLLECTIBLE_PENTAGRAM)
	local expectedDamage = player.Damage
	test.AssertTrue(expectedDamage > originalDamage)

	-- Also compare how the effect stacks with Odd Mushroom (which has a unique, early multiplier).
	player:AddCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)
	local expectedOddMushroomDamage = player.Damage
	test.AssertTrue(expectedOddMushroomDamage < expectedDamage)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_PENTAGRAM)
	test.AssertEquals(player.Damage, originalDamage)

	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, damage)
		test.AssertEquals(damage, 0)
	end, EvaluateStatStage.DAMAGE_UP)

	test:AddCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, damage)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(stage, EvaluateStatStage.DAMAGE_UP)
		return damage + 1
	end, EvaluateStatStage.DAMAGE_UP)

	player:AddCacheFlags(CacheFlag.CACHE_DAMAGE, true)
	test.AssertEquals(player.Damage, expectedDamage)

	player:AddCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)
	test.AssertEquals(player.Damage, expectedOddMushroomDamage)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)

	-- Test xml stats
	player:AddCollectible(CollectibleType.COLLECTIBLE_PENTAGRAM)
	test.AssertTrue(player.Damage > expectedDamage)
	local expectedDamage2 = player.Damage
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_PENTAGRAM)

	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, damage)
		test.AssertEquals(damage, 1)
	end, EvaluateStatStage.DAMAGE_UP)
	player:AddCollectible(ALL_STATS_ITEM)
	test.AssertEquals(player.Damage, expectedDamage2)
	player:RemoveCollectible(ALL_STATS_ITEM)
	test.AssertEquals(player.Damage, expectedDamage)
end

function EvaluateStatsTest:TestFlatDamage(player)
	local originalDamage = player.Damage

	-- Compare +2 flat damage to Curved Horn, which should behave identically.
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, damage)
		test.AssertEquals(damage, 5.5)
	end, EvaluateStatStage.FLAT_DAMAGE)
	player:AddTrinket(TrinketType.TRINKET_CURVED_HORN)
	player:EvaluateItems()
	local expectedDamage = player.Damage
	test.AssertTrue(expectedDamage > originalDamage)

	-- Also compare how the effect stacks with Odd Mushroom (which has a unique, early multiplier).
	player:AddCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)
	local expectedOddMushroomDamage = player.Damage
	test.AssertTrue(expectedOddMushroomDamage < expectedDamage)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)
	player:TryRemoveTrinket(TrinketType.TRINKET_CURVED_HORN)
	player:EvaluateItems()
	test.AssertEquals(player.Damage, originalDamage)
	
	test:AddOneTimeCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, damage)
		test.AssertEquals(damage, originalDamage)
	end, EvaluateStatStage.FLAT_DAMAGE)

	test:AddCallback(ModCallbacks.MC_EVALUATE_STAT, function(_, p, stage, damage)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		test.AssertEquals(stage, EvaluateStatStage.FLAT_DAMAGE)
		return damage + 2
	end, EvaluateStatStage.FLAT_DAMAGE)

	player:AddCacheFlags(CacheFlag.CACHE_DAMAGE, true)
	test.AssertEquals(player.Damage, expectedDamage)

	player:AddCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)
	test.AssertEquals(player.Damage, expectedOddMushroomDamage)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_THIN)

	-- Test xml stats
	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, damage)
		test.AssertEquals(damage, expectedDamage)
	end, EvaluateStatStage.FLAT_DAMAGE)
	player:GetEffects():AddNullEffect(FLAT_STATS_NULL)
	player:Update()
	test.AssertEquals(player.Damage, expectedDamage+2)
	test:AddOneTimePriorityCallback(ModCallbacks.MC_EVALUATE_STAT, CallbackPriority.EARLY, function(_, p, stage, damage)
		test.AssertEquals(damage, expectedDamage+2)
	end, EvaluateStatStage.FLAT_DAMAGE)
	player:GetEffects():AddNullEffect(FLAT_STATS_NULL)
	player:Update()
	test.AssertEquals(player.Damage, expectedDamage+4)
	player:GetEffects():RemoveNullEffect(FLAT_STATS_NULL, 2)
	player:Update()
	test.AssertEquals(player.Damage, expectedDamage)

	-- Verify the flat damage bonus is affected by vanilla multipliers.
	player:AddCollectible(CollectibleType.COLLECTIBLE_CROWN_OF_LIGHT)
	test.AssertEquals(player.Damage, expectedDamage*2)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_CROWN_OF_LIGHT)
end

function EvaluateStatsTest:TestDamageMult(player)
	-- Start a damage up & and a flat damage bonus to make sure both are multiplied as expected.
	player:AddCollectible(CollectibleType.COLLECTIBLE_PENTAGRAM)
	player:AddTrinket(TrinketType.TRINKET_CURVED_HORN)
	player:Update()

	local originalDamage = player.Damage

	-- Compare x2 damage to Crown of Light, which should behave identically.
	player:AddCollectible(CollectibleType.COLLECTIBLE_CROWN_OF_LIGHT)
	local expectedDamage = player.Damage
	test.AssertTrue(expectedDamage > originalDamage)
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_CROWN_OF_LIGHT)
	test.AssertEquals(player.Damage, originalDamage)

	player:AddCollectible(TEARS_DAMAGE_MULT_ITEM)
	test.AssertEquals(player.Damage, expectedDamage)

	player:AddCollectible(TEARS_DAMAGE_MULT_ITEM)
	player:AddCollectible(TEARS_DAMAGE_MULT_ITEM)
	test.AssertEquals(player.Damage, expectedDamage * 4)

	player:RemoveCollectible(TEARS_DAMAGE_MULT_ITEM)
	player:RemoveCollectible(TEARS_DAMAGE_MULT_ITEM)
	player:RemoveCollectible(TEARS_DAMAGE_MULT_ITEM)
	test.AssertEquals(player.Damage, originalDamage)
end

function EvaluateStatsTest:TestOtherStats(player)
	local original = { player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck }

	player:AddCollectible(CollectibleType.COLLECTIBLE_SAUSAGE)
	local expected = { player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck }
	for i=1,4 do
		test.AssertTrue(expected[i] > original[i])
	end
	player:RemoveCollectible(CollectibleType.COLLECTIBLE_SAUSAGE)
	for i, current in ipairs({player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck}) do
		test.AssertEquals(current, original[i])
	end

	player:AddCollectible(ALL_STATS_ITEM)
	for i, current in ipairs({player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck}) do
		test.AssertEquals(current, expected[i])
	end

	player:RemoveCollectible(ALL_STATS_ITEM)
	for i, current in ipairs({player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck}) do
		test.AssertEquals(current, original[i])
	end

	player:GetEffects():AddTrinketEffect(ALL_STATS_EFFECT_TRINKET)
	player:Update()
	for i, current in ipairs({player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck}) do
		test.AssertEquals(current, expected[i])
	end

	player:GetEffects():RemoveTrinketEffect(ALL_STATS_EFFECT_TRINKET)
	player:Update()
	for i, current in ipairs({player.ShotSpeed, player.MoveSpeed, player.TearRange, player.Luck}) do
		test.AssertEquals(current, original[i])
	end
end


return EvaluateStatsTest
