local test = REPENTOGON_TEST

local PersistentGameDataTest = {}

function PersistentGameDataTest:BeforeEach()
	return Isaac.GetPersistentGameData()
end

function PersistentGameDataTest:AfterEach(persistentgamedata)
	
end

----------

function PersistentGameDataTest:TestAddBestiaryKill(persistentgamedata)
	local int = 1
	local variant = 1
	persistentgamedata:AddBestiaryKill(int, variant)
end

function PersistentGameDataTest:TestAddBossKilled(persistentgamedata)
	local boss = 1
	persistentgamedata:AddBossKilled(boss)
end

function PersistentGameDataTest:TestGetBestiaryDeathCount(persistentgamedata)
	local int = 1
	local variant = 1
	persistentgamedata:GetBestiaryDeathCount(int, variant)
end

function PersistentGameDataTest:TestGetBestiaryEncounterCount(persistentgamedata)
	local int = 1
	local variant = 1
	persistentgamedata:GetBestiaryEncounterCount(int, variant)
end

function PersistentGameDataTest:TestGetBestiaryKillCount(persistentgamedata)
	local int = 1
	local variant = 1
	persistentgamedata:GetBestiaryKillCount(int, variant)
end

function PersistentGameDataTest:TestGetEventCounter(persistentgamedata)
	local eventcounter = 1
	persistentgamedata:GetEventCounter(eventcounter)
end

function PersistentGameDataTest:TestIncreaseEventCounter(persistentgamedata)
	local eventcounter = 1
	local count = 1
	persistentgamedata:IncreaseEventCounter(eventcounter, count)
end

function PersistentGameDataTest:TestIsBossKilled(persistentgamedata)
	local boss = 1
	persistentgamedata:IsBossKilled(boss)
end

function PersistentGameDataTest:TestIsChallengeCompleted(persistentgamedata)
	local challengeid = 1
	persistentgamedata:IsChallengeCompleted(challengeid)
end

function PersistentGameDataTest:TestIsItemInCollection(persistentgamedata)
	local collectibleid = 1
	persistentgamedata:IsItemInCollection(collectibleid)
end

function PersistentGameDataTest:TestTryUnlock(persistentgamedata)
	local unlock = 1
	local blockpaperpopup = true
	persistentgamedata:TryUnlock(unlock, blockpaperpopup)
end

function PersistentGameDataTest:TestUnlocked(persistentgamedata)
	local unlock = 1
	persistentgamedata:Unlocked(unlock)
end


return PersistentGameDataTest
