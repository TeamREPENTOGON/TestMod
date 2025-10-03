local test = REPENTOGON_TEST

local TemporaryEffectsRoomTest = {}

function TemporaryEffectsRoomTest:BeforeEach()
	return Game():GetRoom():GetEffects()
end

function TemporaryEffectsRoomTest:AfterEach(effects)
	
end

----------

function TemporaryEffectsRoomTest:TestAddCollectibleEffect(effects)
	-- Callback without param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)))
	end)

	-- Callback with param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)))
	end, Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION))

	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)
end

function TemporaryEffectsRoomTest:TestAddNullEffect(effects)
	-- Callback without param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY)))
	end)

	-- Callback with param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY)))
	end, Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY))

	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)
end

function TemporaryEffectsRoomTest:TestAddTrinketEffect(effects)
	-- Callback without param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)))
	end)

	-- Callback with param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)))
	end, Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY))

	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)
end

function TemporaryEffectsRoomTest:TestGetEffectsList(effects)
	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)
	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)
	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)

	local list = effects:GetEffectsList()

	test.AssertEquals(list.Size, 3)

	test.AssertEquals(list:Get(0).Count, 3)
	test.AssertEquals(GetPtrHash(list:Get(0).Item), GetPtrHash(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)))
	test.AssertEquals(list:Get(1).Count, 2)
	test.AssertEquals(GetPtrHash(list:Get(1).Item), GetPtrHash(Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY)))
	test.AssertEquals(list:Get(2).Count, 1)
	test.AssertEquals(GetPtrHash(list:Get(2).Item), GetPtrHash(Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)))
end

function TemporaryEffectsRoomTest:TestGetCollectibleEffect(effects)
	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)
	test.AssertEquals(effects:GetCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION).Count, 3)
	test.AssertNil(effects:GetCollectibleEffect(CollectibleType.COLLECTIBLE_D6))
end

function TemporaryEffectsRoomTest:TestGetCollectibleEffectNum(effects)
	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)
	test.AssertEquals(effects:GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_SAD_ONION), 3)
	test.AssertEquals(effects:GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_D6), 0)
end

function TemporaryEffectsRoomTest:TestGetNullEffect(effects)
	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)
	test.AssertEquals(effects:GetNullEffect(NullItemID.ID_PUBERTY).Count, 2)
	test.AssertNil(effects:GetNullEffect(NullItemID.ID_I_FOUND_PILLS))
end

function TemporaryEffectsRoomTest:TestGetNullEffectNum(effects)
	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)
	test.AssertEquals(effects:GetNullEffectNum(NullItemID.ID_PUBERTY), 2)
	test.AssertEquals(effects:GetNullEffectNum(NullItemID.ID_I_FOUND_PILLS), 0)
end

function TemporaryEffectsRoomTest:TestGetTrinketEffect(effects)
	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)
	test.AssertEquals(effects:GetTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY).Count, 1)
	test.AssertNil(effects:GetTrinketEffect(TrinketType.TRINKET_PETRIFIED_POOP))
end

function TemporaryEffectsRoomTest:TestGetTrinketEffectNum(effects)
	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)
	test.AssertEquals(effects:GetTrinketEffectNum(TrinketType.TRINKET_SWALLOWED_PENNY), 1)
	test.AssertEquals(effects:GetTrinketEffectNum(TrinketType.TRINKET_PETRIFIED_POOP), 0)
end

function TemporaryEffectsRoomTest:TestHasCollectibleEffect(effects)
	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)
	test.AssertTrue(effects:HasCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION))
	test.AssertFalse(effects:HasCollectibleEffect(CollectibleType.COLLECTIBLE_D6))
end

function TemporaryEffectsRoomTest:TestHasNullEffect(effects)
	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)
	test.AssertTrue(effects:HasNullEffect(NullItemID.ID_PUBERTY))
	test.AssertFalse(effects:HasNullEffect(NullItemID.ID_I_FOUND_PILLS))
end

function TemporaryEffectsRoomTest:TestHasTrinketEffect(effects)
	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)
	test.AssertTrue(effects:HasTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY))
	test.AssertFalse(effects:HasTrinketEffect(TrinketType.TRINKET_PETRIFIED_POOP))
end

function TemporaryEffectsRoomTest:TestRemoveCollectibleEffect(effects)
	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)

	-- Callback without param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)))
	end)

	-- Callback with param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)))
	end, Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION))

	effects:RemoveCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, 2)
end

function TemporaryEffectsRoomTest:TestRemoveNullEffect(effects)
	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)

	-- Callback without param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY)))
	end)

	-- Callback with param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY)))
	end, Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY))

	effects:RemoveNullEffect(NullItemID.ID_PUBERTY, 1)
end

function TemporaryEffectsRoomTest:TestRemoveTrinketEffect(effects)
	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)

	-- Callback without param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)))
	end)

	-- Callback with param
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)))
	end, Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY))

	effects:RemoveTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, 1)
end

function TemporaryEffectsRoomTest:TestClearEffects(effects)
	effects:AddCollectibleEffect(CollectibleType.COLLECTIBLE_SAD_ONION, true, 3)
	effects:AddNullEffect(NullItemID.ID_PUBERTY, false, 2)
	effects:AddTrinketEffect(TrinketType.TRINKET_SWALLOWED_PENNY, true, 1)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)))
	end, Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION))
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY)))
	end, Isaac.GetItemConfig():GetNullItem(NullItemID.ID_PUBERTY))
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item, count)
		test.AssertEquals(GetPtrHash(item), GetPtrHash(Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)))
	end, Isaac.GetItemConfig():GetTrinket(TrinketType.TRINKET_SWALLOWED_PENNY))

	effects:ClearEffects()
end


return TemporaryEffectsRoomTest
