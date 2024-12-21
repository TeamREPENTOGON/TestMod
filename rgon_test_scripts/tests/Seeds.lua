local test = REPENTOGON_TEST

local SeedsTest = {}

function SeedsTest:BeforeEach()
	return Game():GetSeeds()
end

function SeedsTest:AfterEach(seeds)
	
end

----------

function SeedsTest:TestAddSeedEffect(seeds)
	local value = 1
	seeds:AddSeedEffect(value)
end

function SeedsTest:TestCanAddSeedEffect(seeds)
	local value = 1
	seeds:CanAddSeedEffect(value)
end

function SeedsTest:TestClearSeedEffects(seeds)
	seeds:ClearSeedEffects()
end

function SeedsTest:TestClearStartSeed(seeds)
	seeds:ClearStartSeed()
end

function SeedsTest:TestCountSeedEffects(seeds)
	seeds:CountSeedEffects()
end

function SeedsTest:TestCountUnlockedSeedEffects(seeds)
	Seeds.CountUnlockedSeedEffects()
end

function SeedsTest:TestForgetStageSeed(seeds)
	local stage = 1
	seeds:ForgetStageSeed(stage)
end

function SeedsTest:TestGetNextSeed(seeds)
	seeds:GetNextSeed()
end

function SeedsTest:TestGetPlayerInitSeed(seeds)
	seeds:GetPlayerInitSeed()
end

function SeedsTest:TestGetSeedEffect(seeds)
	local str = "hello"
	Seeds.GetSeedEffect(str)
end

function SeedsTest:TestGetStageSeed(seeds)
	local stage = 1
	seeds:GetStageSeed(stage)
end

function SeedsTest:TestGetStartSeedString(seeds)
	seeds:GetStartSeedString()
end

function SeedsTest:TestHasSeedEffect(seeds)
	local value = 1
	seeds:HasSeedEffect(value)
end

function SeedsTest:TestInitSeedInfo(seeds)
	Seeds.InitSeedInfo()
end

function SeedsTest:TestIsCustomRun(seeds)
	seeds:IsCustomRun()
end

function SeedsTest:TestIsInitialized(seeds)
	seeds:IsInitialized()
end

function SeedsTest:TestIsSeedComboBanned(seeds)
	local seed1 = 1
	local seed2 = 1
	seeds:IsSeedComboBanned(seed1, seed2)
end

function SeedsTest:TestIsSpecialSeed(seeds)
	local str = "hello"
	Seeds.IsSpecialSeed(str)
end

function SeedsTest:TestIsStringValidSeed(seeds)
	local str = "hello"
	Seeds.IsStringValidSeed(str)
end

function SeedsTest:TestRemoveBlockingSeedEffects(seeds)
	local value = 1
	seeds:RemoveBlockingSeedEffects(value)
end

function SeedsTest:TestRemoveSeedEffect(seeds)
	local value = 1
	seeds:RemoveSeedEffect(value)
end

function SeedsTest:TestReset(seeds)
	seeds:Reset()
end

function SeedsTest:TestRestart(seeds)
	local currentchallenge = 1
	seeds:Restart(currentchallenge)
end
--[[
function SeedsTest:TestSetStartSeed(seeds)
	local originalVal = seeds:GetStartSeed()
	for _, val in pairs(test.TestInts) do
		seeds:SetStartSeed(val)
		test.AssertEquals(seeds:GetStartSeed(), val)
	end
	seeds:SetStartSeed(originalVal)
end
]]

return SeedsTest
