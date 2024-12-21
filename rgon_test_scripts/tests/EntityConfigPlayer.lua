local test = REPENTOGON_TEST

local EntityConfigPlayerTest = {}

function EntityConfigPlayerTest:BeforeEach()
	return EntityConfig.GetPlayer(0)
end

function EntityConfigPlayerTest:AfterEach(entityconfigplayer)
	
end

----------

function EntityConfigPlayerTest:TestCanShoot(entityconfigplayer)
	entityconfigplayer:CanShoot()
end

function EntityConfigPlayerTest:TestGetAchievementID(entityconfigplayer)
	entityconfigplayer:GetAchievementID()
end

function EntityConfigPlayerTest:TestGetBirthrightDescription(entityconfigplayer)
	entityconfigplayer:GetBirthrightDescription()
end

function EntityConfigPlayerTest:TestGetBlackHearts(entityconfigplayer)
	entityconfigplayer:GetBlackHearts()
end

function EntityConfigPlayerTest:TestGetBombs(entityconfigplayer)
	entityconfigplayer:GetBombs()
end

function EntityConfigPlayerTest:TestGetBrokenHearts(entityconfigplayer)
	entityconfigplayer:GetBrokenHearts()
end

function EntityConfigPlayerTest:TestGetCard(entityconfigplayer)
	entityconfigplayer:GetCard()
end

function EntityConfigPlayerTest:TestGetCoins(entityconfigplayer)
	entityconfigplayer:GetCoins()
end

function EntityConfigPlayerTest:TestGetCollectibles(entityconfigplayer)
	entityconfigplayer:GetCollectibles()
end

function EntityConfigPlayerTest:TestGetCostumeID(entityconfigplayer)
	entityconfigplayer:GetCostumeID()
end

function EntityConfigPlayerTest:TestGetCostumeSuffix(entityconfigplayer)
	entityconfigplayer:GetCostumeSuffix()
end

function EntityConfigPlayerTest:TestGetExtraPortraitPath(entityconfigplayer)
	entityconfigplayer:GetExtraPortraitPath()
end

function EntityConfigPlayerTest:TestGetKeys(entityconfigplayer)
	entityconfigplayer:GetKeys()
end

function EntityConfigPlayerTest:TestGetModdedControlsSprite(entityconfigplayer)
	entityconfigplayer:GetModdedControlsSprite()
end

function EntityConfigPlayerTest:TestGetModdedCoopMenuSprite(entityconfigplayer)
	entityconfigplayer:GetModdedCoopMenuSprite()
end

function EntityConfigPlayerTest:TestGetModdedGameOverSprite(entityconfigplayer)
	entityconfigplayer:GetModdedGameOverSprite()
end

function EntityConfigPlayerTest:TestGetModdedMenuBackgroundSprite(entityconfigplayer)
	entityconfigplayer:GetModdedMenuBackgroundSprite()
end

function EntityConfigPlayerTest:TestGetModdedMenuPortraitSprite(entityconfigplayer)
	entityconfigplayer:GetModdedMenuPortraitSprite()
end

function EntityConfigPlayerTest:TestGetName(entityconfigplayer)
	entityconfigplayer:GetName()
end

function EntityConfigPlayerTest:TestGetNameImagePath(entityconfigplayer)
	entityconfigplayer:GetNameImagePath()
end

function EntityConfigPlayerTest:TestGetPill(entityconfigplayer)
	entityconfigplayer:GetPill()
end

function EntityConfigPlayerTest:TestGetPlayerType(entityconfigplayer)
	entityconfigplayer:GetPlayerType()
end

function EntityConfigPlayerTest:TestGetPocketActive(entityconfigplayer)
	entityconfigplayer:GetPocketActive()
end

function EntityConfigPlayerTest:TestGetPortraitPath(entityconfigplayer)
	entityconfigplayer:GetPortraitPath()
end

function EntityConfigPlayerTest:TestGetRedHearts(entityconfigplayer)
	entityconfigplayer:GetRedHearts()
end

function EntityConfigPlayerTest:TestGetSkinColor(entityconfigplayer)
	entityconfigplayer:GetSkinColor()
end

function EntityConfigPlayerTest:TestGetSkinPath(entityconfigplayer)
	entityconfigplayer:GetSkinPath()
end

function EntityConfigPlayerTest:TestGetSoulHearts(entityconfigplayer)
	entityconfigplayer:GetSoulHearts()
end

function EntityConfigPlayerTest:TestGetTaintedCounterpart(entityconfigplayer)
	entityconfigplayer:GetTaintedCounterpart()
end

function EntityConfigPlayerTest:TestGetTrinket(entityconfigplayer)
	entityconfigplayer:GetTrinket()
end

function EntityConfigPlayerTest:TestIsHidden(entityconfigplayer)
	entityconfigplayer:IsHidden()
end

function EntityConfigPlayerTest:TestIsTainted(entityconfigplayer)
	entityconfigplayer:IsTainted()
end


return EntityConfigPlayerTest
