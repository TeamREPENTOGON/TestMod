local test = REPENTOGON_TEST

local ItemPoolTest = {}

function ItemPoolTest:BeforeEach()
	return Game():GetItemPool()
end

function ItemPoolTest:AfterEach(itempool)
	
end

----------

function ItemPoolTest:TestAddBibleUpgrade(itempool)
	local add = 1
	local pooltype = 1
	itempool:AddBibleUpgrade(add, pooltype)
end

function ItemPoolTest:TestAddRoomBlacklist(itempool)
	local item = 1
	itempool:AddRoomBlacklist(item)
end

function ItemPoolTest:TestGetCard(itempool)
	local seed = 1
	local playing = true
	local rune = true
	local onlyrunes = true
	itempool:GetCard(seed, playing, rune, onlyrunes)
end

function ItemPoolTest:TestGetCollectible(itempool)
	local pooltype = 1
	local decrease = true
	local seed = 1
	local defaultitem = 1
	local flags = 1
	itempool:GetCollectible(pooltype, decrease, seed, defaultitem, flags)
end

function ItemPoolTest:TestGetPill(itempool)
	local seed = 1
	itempool:GetPill(seed)
end

function ItemPoolTest:TestGetPoolForRoom(itempool)
	local roomtype = 1
	local seed = 1
	itempool:GetPoolForRoom(roomtype, seed)
end

function ItemPoolTest:TestGetTrinket(itempool)
	local dontadvancerng = true
	itempool:GetTrinket(dontadvancerng)
end

function ItemPoolTest:TestRemoveCollectible(itempool)
	local collectible = 1
	itempool:RemoveCollectible(collectible)
end

function ItemPoolTest:TestRemoveTrinket(itempool)
	local trinket = 1
	itempool:RemoveTrinket(trinket)
end

function ItemPoolTest:TestResetRoomBlacklist(itempool)
	itempool:ResetRoomBlacklist()
end

function ItemPoolTest:TestResetTrinkets(itempool)
	itempool:ResetTrinkets()
end

function ItemPoolTest:TestCanSpawnCollectible(itempool)
	local collectible = 1
	local ignorelocked = true
	itempool:CanSpawnCollectible(collectible, ignorelocked)
end

function ItemPoolTest:TestGetBibleUpgrades(itempool)
	local pooltype = 1
	itempool:GetBibleUpgrades(pooltype)
end

function ItemPoolTest:TestGetCardEx(itempool)
	local seed = 1
	local specialchance = 1
	local runechance = 1
	local suitchance = 1
	local allownoncards = true
	itempool:GetCardEx(seed, specialchance, runechance, suitchance, allownoncards)
end

function ItemPoolTest:TestGetCollectibleFromList(itempool)
	local itemlist = {1}
	local seed = 1
	local defaultitem = 1
	local addtoblacklist = true
	local excludelockeditems = true
	itempool:GetCollectibleFromList(itemlist, seed, defaultitem, addtoblacklist, excludelockeditems)
end

function ItemPoolTest:TestGetCollectiblesFromPool(itempool)
	local pooltype = 1
	itempool:GetCollectiblesFromPool(pooltype)
end

function ItemPoolTest:TestGetNumAvailableTrinkets(itempool)
	itempool:GetNumAvailableTrinkets()
end

function ItemPoolTest:TestGetNumItemPools(itempool)
	itempool:GetNumItemPools()
end

function ItemPoolTest:TestGetPillColor(itempool)
	local id = 1
	itempool:GetPillColor(id)
end

function ItemPoolTest:TestGetRandomPool(itempool)
	local rng = RNG()
	local advancedsearch = true
	local filter = {1}
	local iswhitelist = true
	itempool:GetRandomPool(rng, advancedsearch, filter, iswhitelist)
end

function ItemPoolTest:TestGetRemovedCollectibles(itempool)
	itempool:GetRemovedCollectibles()
end

function ItemPoolTest:TestGetRoomBlacklistedCollectibles(itempool)
	itempool:GetRoomBlacklistedCollectibles()
end

function ItemPoolTest:TestHasCollectible(itempool)
	local collectible = 1
	itempool:HasCollectible(collectible)
end

function ItemPoolTest:TestHasTrinket(itempool)
	local trinket = 1
	itempool:HasTrinket(trinket)
end

function ItemPoolTest:TestPickCollectible(itempool)
	local pooltype = 1
	local decrease = true
	local rng = RNG()
	local flags = 1
	itempool:PickCollectible(pooltype, decrease, rng, flags)
end

function ItemPoolTest:TestResetCollectible(itempool)
	local collectible = 1
	itempool:ResetCollectible(collectible)
end

function ItemPoolTest:TestSetLastPool(itempool)
	itempool:SetLastPool(1)
end

function ItemPoolTest:TestIdentifyPill(itempool)
	-- Test valid PillColors
	for pillColor = PillColor.PILL_NULL, PillColor.PILL_GOLD do
		test.AssertFalse(itempool:IsPillIdentified(pillColor))
		itempool:IdentifyPill(pillColor)
		test.AssertTrue(itempool:IsPillIdentified(pillColor))
		itempool:UnidentifyPill(pillColor)
		test.AssertFalse(itempool:IsPillIdentified(pillColor))

		local pillEffect = itempool:GetPillEffect(pillColor)
		if pillColor == PillColor.PILL_NULL then
			test.AssertEquals(pillEffect, PillEffect.PILLEFFECT_NULL)
		else
			test.AssertTrue(pillEffect > PillEffect.PILLEFFECT_NULL and pillEffect < #Isaac.GetItemConfig():GetPillEffects())
		end
	end

	-- Test invalid PillColors
	for i = 0, 10 do
		for _, pillColor in ipairs({-1-i, PillColor.NUM_PILLS+i}) do
			test.AssertFalse(itempool:IsPillIdentified(pillColor))
			itempool:IdentifyPill(pillColor)
			test.AssertFalse(itempool:IsPillIdentified(PillColor.PILL_GOLD))
			test.AssertFalse(itempool:IsPillIdentified(pillColor))
			itempool:UnidentifyPill(pillColor)
			test.AssertFalse(itempool:IsPillIdentified(pillColor))

			test.AssertEquals(itempool:GetPillEffect(pillColor), PillEffect.PILLEFFECT_NULL)
		end
	end
end

function ItemPoolTest:TestGetPillEffect(itempool)
	local player = Isaac.GetPlayer()
	test.AssertEquals(itempool:GetPillEffect(PillColor.PILL_NULL, player), PillEffect.PILLEFFECT_NULL)
	for pillColor = PillColor.PILL_BLUE_BLUE, PillColor.PILL_GOLD do
		local pillEffect = itempool:GetPillEffect(pillColor, player)
		test.AssertTrue(pillEffect > PillEffect.PILLEFFECT_NULL and pillEffect < #Isaac.GetItemConfig():GetPillEffects())
	end
	test.AssertEquals(itempool:GetPillEffect(PillColor.NUM_PILLS, player), PillEffect.PILLEFFECT_NULL)

	local tearsDownPillColor = itempool:ForceAddPillEffect(PillEffect.PILLEFFECT_TEARS_DOWN)
	test.AssertEquals(itempool:GetPillEffect(tearsDownPillColor, player), PillEffect.PILLEFFECT_TEARS_DOWN)
	player:AddCollectible(CollectibleType.COLLECTIBLE_PHD)
	test.AssertEquals(itempool:GetPillEffect(tearsDownPillColor, player), PillEffect.PILLEFFECT_TEARS_UP)
end

function ItemPoolTest:TestForceAddPillEffect(itempool)
	for _, pillEffect in ipairs({PillEffect.PILLEFFECT_BAD_GAS, PillEffect.PILLEFFECT_RETRO_VISION, PillEffect.PILLEFFECT_EXPERIMENTAL}) do
		test.AssertEquals(itempool:GetPillEffect(itempool:ForceAddPillEffect(pillEffect)), pillEffect)
	end
end


return ItemPoolTest
