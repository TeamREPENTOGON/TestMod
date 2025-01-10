local test = REPENTOGON_TEST

local PlayerManagerTest = {}

function PlayerManagerTest:BeforeEach()
	
end

function PlayerManagerTest:AfterEach()
	
end

----------

function PlayerManagerTest:TestAnyoneHasCollectible()
	local collectible = 1
	PlayerManager.AnyoneHasCollectible(collectible)
end

function PlayerManagerTest:TestAnyoneHasTrinket()
	local trinket = 1
	PlayerManager.AnyoneHasTrinket(trinket)
end

function PlayerManagerTest:TestAnyoneIsPlayerType()
	local playertype = 1
	PlayerManager.AnyoneIsPlayerType(playertype)
end

function PlayerManagerTest:TestAnyPlayerTypeHasBirthright()
	local playertype = 1
	PlayerManager.AnyPlayerTypeHasBirthright(playertype)
end

function PlayerManagerTest:TestAnyPlayerTypeHasCollectible()
	local playertype = 1
	local collectible = 1
	local ignoremodifiers = true
	PlayerManager.AnyPlayerTypeHasCollectible(playertype, collectible, ignoremodifiers)
end

function PlayerManagerTest:TestAnyPlayerTypeHasTrinket()
	local playertype = 1
	local trinket = 1
	local ignoremodifiers = true
	PlayerManager.AnyPlayerTypeHasTrinket(playertype, trinket, ignoremodifiers)
end

function PlayerManagerTest:TestFirstBirthrightOwner()
	local playertype = 1
	PlayerManager.FirstBirthrightOwner(playertype)
end

function PlayerManagerTest:TestFirstCollectibleOwner()
	local collectible = 1
	local lazsharedglobaltag = true
	PlayerManager.FirstCollectibleOwner(collectible, lazsharedglobaltag)
end

function PlayerManagerTest:TestFirstPlayerByType()
	local playertype = 1
	PlayerManager.FirstPlayerByType(playertype)
end

function PlayerManagerTest:TestFirstTrinketOwner()
	local player = Isaac.GetPlayer()
	player:ChangePlayerType(PlayerType.PLAYER_LAZARUS_B)

	local trinket = TrinketType.TRINKET_SWALLOWED_PENNY
	local globalLazTrinket = TrinketType.TRINKET_GOLDEN_HORSE_SHOE

	local rng = RNG(1234)  -- legacy rng param that never actually did anything ever

	player:AddTrinket(globalLazTrinket)
	player:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP)
	Game():GetRoom():Update()
	player = Isaac.GetPlayer()
	player:AddTrinket(trinket)

	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket)), GetPtrHash(player:GetFlippedForm()))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, true)), GetPtrHash(player:GetFlippedForm()))
	test.AssertNil(PlayerManager.FirstTrinketOwner(globalLazTrinket, false))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil)), GetPtrHash(player:GetFlippedForm()))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, true)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, false)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, nil)), GetPtrHash(player))
	-- Legacy compat
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng, true)), GetPtrHash(player:GetFlippedForm()))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil, true)), GetPtrHash(player:GetFlippedForm()))
	test.AssertNil(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng, false))
	test.AssertNil(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil, false))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng, nil)), GetPtrHash(player:GetFlippedForm()))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil, nil)), GetPtrHash(player:GetFlippedForm()))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng)), GetPtrHash(player:GetFlippedForm()))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, rng, true)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, nil, true)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, rng, false)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, nil, false)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, rng, nil)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, nil, nil)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(trinket, rng)), GetPtrHash(player))

	player:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP)
	Game():GetRoom():Update()
	player = Isaac.GetPlayer()

	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, true)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, false)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil)), GetPtrHash(player))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, true))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, false))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, nil))
	-- Legacy compat
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng, true)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil, true)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng, false)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil, false)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng, nil)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, nil, nil)), GetPtrHash(player))
	test.AssertEquals(GetPtrHash(PlayerManager.FirstTrinketOwner(globalLazTrinket, rng)), GetPtrHash(player))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, rng, true))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, nil, true))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, rng, false))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, nil, false))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, rng, nil))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, nil, nil))
	test.AssertNil(PlayerManager.FirstTrinketOwner(trinket, rng))

	player:ChangePlayerType(PlayerType.PLAYER_ISAAC)
	Game():GetRoom():Update()
end

function PlayerManagerTest:TestGetEsauJrState()
	local index = 1
	PlayerManager.GetEsauJrState(index)
end

function PlayerManagerTest:TestGetNumCollectibles()
	local collectible = 1
	PlayerManager.GetNumCollectibles(collectible)
end

function PlayerManagerTest:TestGetPlayers()
	PlayerManager.GetPlayers()
end

function PlayerManagerTest:TestGetTotalTrinketMultiplier()
	local trinket = 1
	PlayerManager.GetTotalTrinketMultiplier(trinket)
end

function PlayerManagerTest:TestIsCoopPlay()
	PlayerManager.IsCoopPlay()
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

function PlayerManagerTest:TestTriggerRoomClear()
	PlayerManager.TriggerRoomClear()
end


return PlayerManagerTest
