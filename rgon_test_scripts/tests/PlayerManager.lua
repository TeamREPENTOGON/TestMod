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
	local trinket = 1
	local rng = RNG()
	local lazsharedglobaltag = true
	PlayerManager.FirstTrinketOwner(trinket, rng, lazsharedglobaltag)
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
function PlayerManagerTest:TestSpawnSelectedBaby()
	local babytype = 1
	local controllerindex = 1
	PlayerManager.SpawnSelectedBaby(babytype, controllerindex)
end

function PlayerManagerTest:TestTriggerRoomClear()
	PlayerManager.TriggerRoomClear()
end


return PlayerManagerTest
