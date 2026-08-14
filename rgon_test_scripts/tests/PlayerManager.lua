local test = REPENTOGON_TEST

local PlayerManagerTest = {}

function PlayerManagerTest:BeforeEach()
	local isaac = Isaac.GetPlayer(0)
	local laz = Isaac.GetPlayer(1)
	if GetPtrHash(isaac) == GetPtrHash(laz) then
		laz = PlayerManager.SpawnCoPlayer2(PlayerType.PLAYER_LAZARUS_B)
	elseif laz:GetPlayerType() == PlayerType.PLAYER_LAZARUS2_B then
		laz:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP)
		Game():GetRoom():Update()
		laz = Isaac.GetPlayer(1)
	end
	return isaac, laz, laz:GetFlippedForm()
end

function PlayerManagerTest:AfterEach()
	
end

----------

local COLLECTIBLE = CollectibleType.COLLECTIBLE_SAD_ONION
local LAZ_GLOBAL_COLLECTIBLE = CollectibleType.COLLECTIBLE_COMPASS
local REWORKED_COLLECTIBLE = CollectibleType.COLLECTIBLE_LINGER_BEAN

local TRINKET = TrinketType.TRINKET_SWALLOWED_PENNY
local LAZ_GLOBAL_TRINKET = TrinketType.TRINKET_GOLDEN_HORSE_SHOE
local REWORKED_TRINKET = TrinketType.TRINKET_BROKEN_ANKH

function PlayerManagerTest:TestAnyoneHasCollectible(isaac, laz, laz2)
	test.AssertFalse(PlayerManager.AnyoneHasCollectible(COLLECTIBLE))
	laz2:AddCollectible(COLLECTIBLE)
	test.AssertFalse(PlayerManager.AnyoneHasCollectible(COLLECTIBLE))
	laz:AddCollectible(COLLECTIBLE)
	test.AssertTrue(PlayerManager.AnyoneHasCollectible(COLLECTIBLE))

	test.AssertFalse(PlayerManager.AnyoneHasCollectible(REWORKED_COLLECTIBLE))
	laz2:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertFalse(PlayerManager.AnyoneHasCollectible(REWORKED_COLLECTIBLE))
	laz:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertTrue(PlayerManager.AnyoneHasCollectible(REWORKED_COLLECTIBLE))

	test.AssertFalse(PlayerManager.AnyoneHasCollectible(LAZ_GLOBAL_COLLECTIBLE))
	laz2:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertTrue(PlayerManager.AnyoneHasCollectible(LAZ_GLOBAL_COLLECTIBLE))

	isaac:AddInnateCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES)
	test.AssertTrue(PlayerManager.AnyoneHasCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES, false))
	test.AssertFalse(PlayerManager.AnyoneHasCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES, true))
end

function PlayerManagerTest:TestAnyoneHasTrinket(isaac, laz, laz2)
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(TRINKET))
	laz2:AddTrinket(TRINKET)
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(TRINKET))
	laz:AddTrinket(TRINKET)
	test.AssertTrue(PlayerManager.AnyoneHasTrinket(TRINKET))
	laz:TryRemoveTrinket(TRINKET)
	laz2:TryRemoveTrinket(TRINKET)
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(TRINKET))

	test.AssertFalse(PlayerManager.AnyoneHasTrinket(REWORKED_TRINKET))
	laz2:AddTrinket(REWORKED_TRINKET)
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(REWORKED_TRINKET))
	laz:AddTrinket(REWORKED_TRINKET)
	test.AssertTrue(PlayerManager.AnyoneHasTrinket(REWORKED_TRINKET))
	laz:TryRemoveTrinket(REWORKED_TRINKET)
	laz2:TryRemoveTrinket(REWORKED_TRINKET)
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(REWORKED_TRINKET))

	test.AssertFalse(PlayerManager.AnyoneHasTrinket(LAZ_GLOBAL_TRINKET))
	laz2:AddTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertTrue(PlayerManager.AnyoneHasTrinket(LAZ_GLOBAL_TRINKET))
	laz:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	laz2:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(LAZ_GLOBAL_TRINKET))

	isaac:AddInnateTrinket(TrinketType.TRINKET_LUCKY_ROCK)
	test.AssertTrue(PlayerManager.AnyoneHasTrinket(TrinketType.TRINKET_LUCKY_ROCK, false))
	test.AssertFalse(PlayerManager.AnyoneHasTrinket(TrinketType.TRINKET_LUCKY_ROCK, true))
end

function PlayerManagerTest:TestAnyoneIsPlayerType()
	test.AssertTrue(PlayerManager.AnyoneIsPlayerType(PlayerType.PLAYER_ISAAC))
	test.AssertTrue(PlayerManager.AnyoneIsPlayerType(PlayerType.PLAYER_LAZARUS_B))
	test.AssertFalse(PlayerManager.AnyoneIsPlayerType(PlayerType.PLAYER_LAZARUS2_B))
	test.AssertFalse(PlayerManager.AnyoneIsPlayerType(PlayerType.PLAYER_MAGDALENE))
end

function PlayerManagerTest:TestAnyPlayerTypeHasBirthright(isaac, laz, laz2)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasBirthright(PlayerType.PLAYER_LAZARUS_B))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasBirthright(PlayerType.PLAYER_LAZARUS2_B))
	test.AssertNil(PlayerManager.FirstBirthrightOwner(PlayerType.PLAYER_LAZARUS_B))

	laz2:AddCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasBirthright(PlayerType.PLAYER_LAZARUS_B))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasBirthright(PlayerType.PLAYER_LAZARUS2_B))
	test.AssertNil(PlayerManager.FirstBirthrightOwner(PlayerType.PLAYER_LAZARUS_B))

	laz:AddCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasBirthright(PlayerType.PLAYER_LAZARUS_B))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasBirthright(PlayerType.PLAYER_LAZARUS2_B))
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.FirstBirthrightOwner(PlayerType.PLAYER_LAZARUS_B)))
end

function PlayerManagerTest:TestAnyPlayerTypeHasCollectible(isaac, laz, laz2)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, COLLECTIBLE))
	laz2:AddCollectible(COLLECTIBLE)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, COLLECTIBLE))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS2_B, COLLECTIBLE))
	laz:AddCollectible(COLLECTIBLE)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, COLLECTIBLE))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_ISAAC, COLLECTIBLE))

	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, REWORKED_COLLECTIBLE))
	laz2:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, REWORKED_COLLECTIBLE))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS2_B, REWORKED_COLLECTIBLE))
	laz:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, REWORKED_COLLECTIBLE))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_ISAAC, REWORKED_COLLECTIBLE))

	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, LAZ_GLOBAL_COLLECTIBLE))
	laz2:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS_B, LAZ_GLOBAL_COLLECTIBLE))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_LAZARUS2_B, LAZ_GLOBAL_COLLECTIBLE))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_ISAAC, LAZ_GLOBAL_COLLECTIBLE))

	isaac:AddInnateCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_ISAAC, CollectibleType.COLLECTIBLE_HALO_OF_FLIES, false))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasCollectible(PlayerType.PLAYER_ISAAC, CollectibleType.COLLECTIBLE_HALO_OF_FLIES, true))
end

function PlayerManagerTest:TestAnyPlayerTypeHasTrinket(isaac, laz, laz2)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, TRINKET))
	laz2:AddTrinket(TRINKET)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, TRINKET))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS2_B, TRINKET))
	laz:AddTrinket(TRINKET)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, TRINKET))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_ISAAC, TRINKET))
	laz:TryRemoveTrinket(TRINKET)
	laz2:TryRemoveTrinket(TRINKET)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, TRINKET))

	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, REWORKED_TRINKET))
	laz2:AddTrinket(REWORKED_TRINKET)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, REWORKED_TRINKET))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS2_B, REWORKED_TRINKET))
	laz:AddTrinket(REWORKED_TRINKET)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, REWORKED_TRINKET))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_ISAAC, REWORKED_TRINKET))
	laz:TryRemoveTrinket(REWORKED_TRINKET)
	laz2:TryRemoveTrinket(REWORKED_TRINKET)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, REWORKED_TRINKET))

	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, LAZ_GLOBAL_TRINKET))
	laz2:AddTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, LAZ_GLOBAL_TRINKET))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS2_B, LAZ_GLOBAL_TRINKET))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_ISAAC, LAZ_GLOBAL_TRINKET))
	laz:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	laz2:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_LAZARUS_B, LAZ_GLOBAL_TRINKET))

	isaac:AddInnateTrinket(TrinketType.TRINKET_LUCKY_ROCK)
	test.AssertTrue(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_ISAAC, TrinketType.TRINKET_LUCKY_ROCK, false))
	test.AssertFalse(PlayerManager.AnyPlayerTypeHasTrinket(PlayerType.PLAYER_ISAAC, TrinketType.TRINKET_LUCKY_ROCK, true))
end

function PlayerManagerTest:TestFirstCollectibleOwner(isaac, laz, laz2)
	test.AssertNil(PlayerManager.FirstCollectibleOwner(COLLECTIBLE))
	laz2:AddCollectible(COLLECTIBLE)
	test.AssertNil(PlayerManager.FirstCollectibleOwner(COLLECTIBLE))
	laz:AddCollectible(COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.FirstCollectibleOwner(COLLECTIBLE)))

	test.AssertNil(PlayerManager.FirstCollectibleOwner(REWORKED_COLLECTIBLE))
	laz2:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertNil(PlayerManager.FirstCollectibleOwner(REWORKED_COLLECTIBLE))
	laz:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.FirstCollectibleOwner(REWORKED_COLLECTIBLE)))

	test.AssertNil(PlayerManager.FirstCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, true))
	laz2:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz2), GetPtrHash(PlayerManager.FirstCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE)))
	test.AssertEquals(GetPtrHash(laz2), GetPtrHash(PlayerManager.FirstCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, true)))
	test.AssertNil(PlayerManager.FirstCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, false))
	laz:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.FirstCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, false)))
end

function PlayerManagerTest:TestFirstPlayerByType(isaac, laz, laz2)
	test.AssertEquals(GetPtrHash(isaac), GetPtrHash(PlayerManager.FirstPlayerByType(PlayerType.PLAYER_ISAAC)))
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.FirstPlayerByType(PlayerType.PLAYER_LAZARUS_B)))
	test.AssertNil(PlayerManager.FirstPlayerByType(PlayerType.PLAYER_LAZARUS2_B))
	test.AssertNil(PlayerManager.FirstPlayerByType(PlayerType.PLAYER_MAGDALENE))
end

function PlayerManagerTest:TestFirstTrinketOwner(isaac, laz, laz2)
	local rng = RNG(1234)  -- legacy rng param that never actually did anything ever

	laz2:AddTrinket(LAZ_GLOBAL_TRINKET)
	laz:AddTrinket(TRINKET)

	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET)), GetPtrHash(laz2))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, true)), GetPtrHash(laz2))
	test.AssertNil(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, false))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, nil)), GetPtrHash(laz2))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, true)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, false)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, nil)), GetPtrHash(laz))
	-- Legacy compat
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, rng, true)), GetPtrHash(laz2))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, nil, true)), GetPtrHash(laz2))
	test.AssertNil(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, rng, false))
	test.AssertNil(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, nil, false))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, rng, nil)), GetPtrHash(laz2))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, nil, nil)), GetPtrHash(laz2))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(LAZ_GLOBAL_TRINKET, rng)), GetPtrHash(laz2))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, rng, true)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, nil, true)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, rng, false)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, nil, false)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, rng, nil)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, nil, nil)), GetPtrHash(laz))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(TRINKET, rng)), GetPtrHash(laz))

	laz2:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	laz:TryRemoveTrinket(TRINKET)

	test.AssertNil(PlayerManager.FirstTrinketOwner(REWORKED_TRINKET))
	laz2:AddTrinket(REWORKED_TRINKET)
	test.AssertNil(PlayerManager.FirstTrinketOwner(REWORKED_TRINKET))
	laz:AddTrinket(REWORKED_TRINKET)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.FirstTrinketOwner(REWORKED_TRINKET)))
end

function PlayerManagerTest:TestGetEsauJrState()
	local index = 1
	PlayerManager.GetEsauJrState(index)
end

function PlayerManagerTest:TestGetNumCollectibles(isaac, laz, laz2)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE), 0)
	laz2:AddCollectible(COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE), 0)
	laz:AddCollectible(COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE), 1)
	isaac:AddCollectible(COLLECTIBLE)
	isaac:AddCollectible(COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE), 3)
	isaac:AddInnateCollectible(COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE), 4)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE, false), 4)
	test.AssertEquals(PlayerManager.GetNumCollectibles(COLLECTIBLE, true), 3)

	test.AssertEquals(PlayerManager.GetNumCollectibles(REWORKED_COLLECTIBLE), 0)
	laz2:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(REWORKED_COLLECTIBLE), 0)
	laz:AddCollectible(REWORKED_COLLECTIBLE)
	laz:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(REWORKED_COLLECTIBLE), 2)
	isaac:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(REWORKED_COLLECTIBLE), 3)

	test.AssertEquals(PlayerManager.GetNumCollectibles(LAZ_GLOBAL_COLLECTIBLE), 0)
	laz2:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(LAZ_GLOBAL_COLLECTIBLE), 1)
	laz:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertEquals(PlayerManager.GetNumCollectibles(LAZ_GLOBAL_COLLECTIBLE), 2)
end

function PlayerManagerTest:TestGetPlayers(isaac, laz, laz2)
	local players = PlayerManager.GetPlayers()
	test.AssertEquals(#players, 2)
	test.AssertEquals(GetPtrHash(isaac), GetPtrHash(players[1]))
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(players[2]))
end

function PlayerManagerTest:TestGetTotalTrinketMultiplier(isaac, laz, laz2)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(TRINKET), 0)
	laz2:AddTrinket(TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(TRINKET), 0)
	laz:AddTrinket(TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(TRINKET), 1)
	isaac:AddTrinket(TRINKET | TrinketType.TRINKET_GOLDEN_FLAG)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(TRINKET), 3)
	isaac:AddInnateTrinket(TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(TRINKET), 4)
	isaac:RemoveInnateTrinket(TRINKET)
	isaac:TryRemoveTrinket(TRINKET)
	laz:TryRemoveTrinket(TRINKET)
	laz2:TryRemoveTrinket(TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(TRINKET), 0)

	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(REWORKED_TRINKET), 0)
	laz2:AddTrinket(REWORKED_TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(REWORKED_TRINKET), 0)
	laz:AddTrinket(REWORKED_TRINKET | TrinketType.TRINKET_GOLDEN_FLAG)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(REWORKED_TRINKET), 2)
	isaac:AddTrinket(REWORKED_TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(REWORKED_TRINKET), 3)
	isaac:TryRemoveTrinket(REWORKED_TRINKET)
	laz:TryRemoveTrinket(REWORKED_TRINKET)
	laz2:TryRemoveTrinket(REWORKED_TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(REWORKED_TRINKET), 0)

	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(LAZ_GLOBAL_TRINKET), 0)
	laz2:AddTrinket(LAZ_GLOBAL_TRINKET | TrinketType.TRINKET_GOLDEN_FLAG)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(LAZ_GLOBAL_TRINKET), 2)
	laz:AddTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(LAZ_GLOBAL_TRINKET), 3)
	laz:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	laz2:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertEquals(PlayerManager.GetTotalTrinketMultiplier(LAZ_GLOBAL_TRINKET), 0)
end

function PlayerManagerTest:TestIsCoopPlay()
	test.AssertTrue(PlayerManager.IsCoopPlay())
end

--[[
function PlayerManagerTest:TestRemoveCoPlayer()
	local player = Isaac.GetPlayer()
	PlayerManager.RemoveCoPlayer(player)
end
]]

-- Leads to "controller disconnected" popups.
--[[
function PlayerManagerTest:TestSpawnSelectedBaby()
	local babytype = 1
	local controllerindex = 2
	PlayerManager.SpawnSelectedBaby(babytype, controllerindex)
end
]]

function PlayerManagerTest:TestTriggerRoomClear(isaac, laz, laz2)
	local pretriggers = 0
	test:AddCallback(ModCallbacks.MC_PRE_PLAYER_TRIGGER_ROOM_CLEAR, function(_, player)
		pretriggers = pretriggers + 1
		if pretriggers == 1 then
			test.AssertEquals(GetPtrHash(player), GetPtrHash(isaac))
		elseif pretriggers == 2 then
			test.AssertEquals(GetPtrHash(player), GetPtrHash(laz))
		end
	end)
	local posttriggers = 0
	test:AddCallback(ModCallbacks.MC_POST_PLAYER_TRIGGER_ROOM_CLEAR, function(_, player)
		posttriggers = posttriggers + 1
		if posttriggers == 1 then
			test.AssertEquals(GetPtrHash(player), GetPtrHash(isaac))
		elseif posttriggers == 2 then
			test.AssertEquals(GetPtrHash(player), GetPtrHash(laz2))
		end
	end)
	PlayerManager.TriggerRoomClear()
	test.AssertEquals(pretriggers, 3)
	test.AssertEquals(posttriggers, 3)
end

function PlayerManagerTest:TestGetRandomCollectibleOwner(isaac, laz, laz2)
	local seed = 1
	local seed2 = 4

	test.AssertNil(PlayerManager.GetRandomCollectibleOwner(COLLECTIBLE, seed))
	laz2:AddCollectible(COLLECTIBLE)
	test.AssertNil(PlayerManager.GetRandomCollectibleOwner(COLLECTIBLE, seed))
	laz:AddCollectible(COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomCollectibleOwner(COLLECTIBLE, seed)))
	isaac:AddCollectible(COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomCollectibleOwner(COLLECTIBLE, seed)))
	test.AssertEquals(GetPtrHash(isaac), GetPtrHash(PlayerManager.GetRandomCollectibleOwner(COLLECTIBLE, seed2)))

	local _, rng = PlayerManager.GetRandomCollectibleOwner(COLLECTIBLE, seed2)
	test.AssertEquals(GetPtrHash(rng), GetPtrHash(isaac:GetCollectibleRNG(COLLECTIBLE)))

	test.AssertNil(PlayerManager.GetRandomCollectibleOwner(REWORKED_COLLECTIBLE, seed))
	laz2:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertNil(PlayerManager.GetRandomCollectibleOwner(REWORKED_COLLECTIBLE, seed))
	laz:AddCollectible(REWORKED_COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomCollectibleOwner(REWORKED_COLLECTIBLE, seed)))

	test.AssertNil(PlayerManager.GetRandomCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, seed))
	laz2:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertNil(PlayerManager.GetRandomCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, seed))
	laz:AddCollectible(LAZ_GLOBAL_COLLECTIBLE)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, seed)))
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomCollectibleOwner(LAZ_GLOBAL_COLLECTIBLE, seed2)))
end

function PlayerManagerTest:TestGetRandomTrinketOwner(isaac, laz, laz2)
	local seed = 1
	local seed2 = 4

	test.AssertNil(PlayerManager.GetRandomTrinketOwner(TRINKET, seed))
	laz2:AddTrinket(TRINKET)
	test.AssertNil(PlayerManager.GetRandomTrinketOwner(TRINKET, seed))
	laz:AddTrinket(TRINKET)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomTrinketOwner(TRINKET, seed)))
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomTrinketOwner(TRINKET, seed2)))
	isaac:AddTrinket(TRINKET)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomTrinketOwner(TRINKET, seed)))
	test.AssertEquals(GetPtrHash(isaac), GetPtrHash(PlayerManager.GetRandomTrinketOwner(TRINKET, seed2)))

	local _, rng = PlayerManager.GetRandomTrinketOwner(COLLECTIBLE, seed2)
	test.AssertEquals(GetPtrHash(rng), GetPtrHash(isaac:GetTrinketRNG(COLLECTIBLE)))

	isaac:TryRemoveTrinket(TRINKET)
	laz:TryRemoveTrinket(TRINKET)
	laz2:TryRemoveTrinket(TRINKET)
	test.AssertNil(PlayerManager.GetRandomTrinketOwner(TRINKET, seed))

	test.AssertNil(PlayerManager.GetRandomTrinketOwner(REWORKED_TRINKET, seed))
	laz2:AddTrinket(REWORKED_TRINKET)
	test.AssertNil(PlayerManager.GetRandomTrinketOwner(REWORKED_TRINKET, seed))
	laz:AddTrinket(REWORKED_TRINKET)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomTrinketOwner(REWORKED_TRINKET, seed)))
	laz:TryRemoveTrinket(REWORKED_TRINKET)
	laz2:TryRemoveTrinket(REWORKED_TRINKET)
	test.AssertNil(PlayerManager.GetRandomTrinketOwner(REWORKED_TRINKET, seed))

	test.AssertNil(PlayerManager.GetRandomTrinketOwner(LAZ_GLOBAL_TRINKET, seed))
	laz2:AddTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertNil(PlayerManager.GetRandomTrinketOwner(LAZ_GLOBAL_TRINKET, seed))
	laz:AddTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomTrinketOwner(LAZ_GLOBAL_TRINKET, seed)))
	test.AssertEquals(GetPtrHash(laz), GetPtrHash(PlayerManager.GetRandomTrinketOwner(LAZ_GLOBAL_TRINKET, seed2)))
	laz:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	laz2:TryRemoveTrinket(LAZ_GLOBAL_TRINKET)
	test.AssertNil(PlayerManager.GetRandomTrinketOwner(LAZ_GLOBAL_TRINKET, seed))
end


return PlayerManagerTest
