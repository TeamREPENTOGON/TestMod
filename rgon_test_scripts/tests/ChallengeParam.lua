local test = REPENTOGON_TEST

local ChallengeParamTest = {}

function ChallengeParamTest:BeforeEach()
	return Game():GetChallengeParams()
end

function ChallengeParamTest:AfterEach(challengeparam)
	
end

----------

function ChallengeParamTest:TestCanShoot(challengeparam)
	challengeparam:CanShoot()
end

function ChallengeParamTest:TestGetAchievementList(challengeparam)
	challengeparam:GetAchievementList()
end

function ChallengeParamTest:TestGetAddDamage(challengeparam)
	challengeparam:GetAddDamage()
end

function ChallengeParamTest:TestGetBlackHearts(challengeparam)
	challengeparam:GetBlackHearts()
end

function ChallengeParamTest:TestGetCoins(challengeparam)
	challengeparam:GetCoins()
end

function ChallengeParamTest:TestGetCollectibleList(challengeparam)
	challengeparam:GetCollectibleList()
end

function ChallengeParamTest:TestGetCollectibleTwinList(challengeparam)
	challengeparam:GetCollectibleTwinList()
end

function ChallengeParamTest:TestGetCurse(challengeparam)
	challengeparam:GetCurse()
end

function ChallengeParamTest:TestGetCurseFilter(challengeparam)
	challengeparam:GetCurseFilter()
end

function ChallengeParamTest:TestGetDifficulty(challengeparam)
	challengeparam:GetDifficulty()
end

function ChallengeParamTest:TestGetEndStage(challengeparam)
	challengeparam:GetEndStage()
end

function ChallengeParamTest:TestGetHearts(challengeparam)
	challengeparam:GetHearts()
end

function ChallengeParamTest:TestGetMaxHearts(challengeparam)
	challengeparam:GetMaxHearts()
end

function ChallengeParamTest:TestGetMinFireRate(challengeparam)
	challengeparam:GetMinFireRate()
end

function ChallengeParamTest:TestGetName(challengeparam)
	challengeparam:GetName()
end

function ChallengeParamTest:TestGetPlayerType(challengeparam)
	challengeparam:GetPlayerType()
end

function ChallengeParamTest:TestGetRoomFilter(challengeparam)
	challengeparam:GetRoomFilter()
end

function ChallengeParamTest:TestGetSoulHearts(challengeparam)
	challengeparam:GetSoulHearts()
end

function ChallengeParamTest:TestGetStartingCard(challengeparam)
	challengeparam:GetStartingCard()
end

function ChallengeParamTest:TestGetStartingPill(challengeparam)
	challengeparam:GetStartingPill()
end

function ChallengeParamTest:TestGetTrinketList(challengeparam)
	challengeparam:GetTrinketList()
end

function ChallengeParamTest:TestIsAltPath(challengeparam)
	challengeparam:IsAltPath()
end

function ChallengeParamTest:TestIsBigRangeEnabled(challengeparam)
	challengeparam:IsBigRangeEnabled()
end

function ChallengeParamTest:TestIsMaxDamageEnabled(challengeparam)
	challengeparam:IsMaxDamageEnabled()
end

function ChallengeParamTest:TestIsMegaSatanRun(challengeparam)
	challengeparam:IsMegaSatanRun()
end

function ChallengeParamTest:TestIsMinShotSpeedEnabled(challengeparam)
	challengeparam:IsMinShotSpeedEnabled()
end

function ChallengeParamTest:TestIsSecretPath(challengeparam)
	challengeparam:IsSecretPath()
end


return ChallengeParamTest
