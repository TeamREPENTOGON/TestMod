local test = REPENTOGON_TEST

local GameTest = {}

function GameTest:BeforeEach()
	return Game()
end

function GameTest:AfterEach(game)
	
end

----------

function GameTest:TestAddDevilRoomDeal(game)
	game:AddDevilRoomDeal()
end

function GameTest:TestAddEncounteredBoss(game)
	local boss = 1
	local variant = 1
	game:AddEncounteredBoss(boss, variant)
end

function GameTest:TestAddPixelation(game)
	local duration = 1
	game:AddPixelation(duration)
end

function GameTest:TestAddStageWithoutDamage(game)
	game:AddStageWithoutDamage()
end

function GameTest:TestAddStageWithoutHeartsPicked(game)
	game:AddStageWithoutHeartsPicked()
end

function GameTest:TestAddTreasureRoomsVisited(game)
	game:AddTreasureRoomsVisited()
end

function GameTest:TestBombDamage(game)
	local position = Vector(1,1)
	local damage = 1
	local radius = 1
	local linecheck = true
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local tearflags = BitSet128()
	local damageflags = 1
	local damagesource = true
	game:BombDamage(position, damage, radius, linecheck, source, tearflags, damageflags, damagesource)
	source:Remove()
end

function GameTest:TestBombExplosionEffects(game)
	local position = Vector(1,1)
	local damage = 1
	local tearflags = BitSet128()
	local color = Color(1,1,1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local radiusmult = 1
	local linecheck = true
	local damagesource = true
	local damageflags = 1
	game:BombExplosionEffects(position, damage, tearflags, color, source, radiusmult, linecheck, damagesource, damageflags)
	source:Remove()
end

function GameTest:TestBombTearflagEffects(game)
	local position = Vector(1,1)
	local radius = 1
	local tearflags = BitSet128()
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local radiusmult = 1
	game:BombTearflagEffects(position, radius, tearflags, source, radiusmult)
	source:Remove()
end

function GameTest:TestButterBeanFart(game)
	local position = Vector(1,1)
	local radius = 1
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local showeffect = true
	local dosuperknockback = true
	game:ButterBeanFart(position, radius, source, showeffect, dosuperknockback)
	source:Remove()
end
--[[
function GameTest:TestChangeRoom(game)
	local roomindex = 1
	local dimension = 1
	game:ChangeRoom(roomindex, dimension)
end
]]
function GameTest:TestCharmFart(game)
	local position = Vector(1,1)
	local radius = 1
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	game:CharmFart(position, radius, source)
	source:Remove()
end

function GameTest:TestClearDonationModAngel(game)
	game:ClearDonationModAngel()
end

function GameTest:TestClearDonationModGreed(game)
	game:ClearDonationModGreed()
end

function GameTest:TestClearStagesWithoutDamage(game)
	game:ClearStagesWithoutDamage()
end

function GameTest:TestClearStagesWithoutHeartsPicked(game)
	game:ClearStagesWithoutHeartsPicked()
end

function GameTest:TestDarken(game)
	local darkness = 1
	local timeout = 1
	game:Darken(darkness, timeout)
end

function GameTest:TestDonateAngel(game)
	local donate = 1
	game:DonateAngel(donate)
end

function GameTest:TestDonateGreed(game)
	local donate = 1
	game:DonateGreed(donate)
end
--[[
function GameTest:TestEnd(game)
	local ending = 1
	game:End(ending)
end
]]
function GameTest:TestFadein(game)
	local speed = 1
	game:Fadein(speed)
end
--[[
function GameTest:TestFadeout(game)
	local speed = 1
	local target = 1
	game:Fadeout(speed, target)
end
]]
function GameTest:TestFart(game)
	local position = Vector(1,1)
	local radius = 1
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local fartscale = 1
	local fartsubtype = 1
	local fartcolor = Color(1,1,1,1)
	game:Fart(position, radius, source, fartscale, fartsubtype, fartcolor)
	source:Remove()
end
--[[
function GameTest:TestFinishChallenge(game)
	game:FinishChallenge()
end
]]
function GameTest:TestGetAmbush(game)
	game:GetAmbush()
end

function GameTest:TestGetDarknessModifier(game)
	game:GetDarknessModifier()
end

function GameTest:TestGetDevilRoomDeals(game)
	game:GetDevilRoomDeals()
end

function GameTest:TestGetFont(game)
	game:GetFont()
end

function GameTest:TestGetFrameCount(game)
	game:GetFrameCount()
end

function GameTest:TestGetGreedBossWaveNum(game)
	game:GetGreedBossWaveNum()
end

function GameTest:TestGetGreedWavesNum(game)
	game:GetGreedWavesNum()
end

function GameTest:TestGetHUD(game)
	game:GetHUD()
end

function GameTest:TestGetItemOverlay(game)
	game:GetItemOverlay()
end

function GameTest:TestGetItemPool(game)
	game:GetItemPool()
end

function GameTest:TestGetLevel(game)
	game:GetLevel()
end

function GameTest:TestGetNearestPlayer(game)
	local pos = Vector(1,1)
	game:GetNearestPlayer(pos)
end

function GameTest:TestGetNumEncounteredBosses(game)
	game:GetNumEncounteredBosses()
end

function GameTest:TestGetNumPlayers(game)
	game:GetNumPlayers()
end

function GameTest:TestGetPlayer(game)
	local index = 1
	game:GetPlayer(index)
end

function GameTest:TestGetRandomPlayer(game)
	local pos = Vector(1,1)
	local radius = 1
	game:GetRandomPlayer(pos, radius)
end

function GameTest:TestGetRoom(game)
	game:GetRoom()
end

function GameTest:TestGetScreenShakeCountdown(game)
	game:GetScreenShakeCountdown()
end

function GameTest:TestGetSeeds(game)
	game:GetSeeds()
end

function GameTest:TestGetStagesWithoutDamage(game)
	game:GetStagesWithoutDamage()
end

function GameTest:TestGetStagesWithoutHeartsPicked(game)
	game:GetStagesWithoutHeartsPicked()
end

function GameTest:TestGetStateFlag(game)
	local gamestateflag = 1
	game:GetStateFlag(gamestateflag)
end

function GameTest:TestGetTargetDarkness(game)
	game:GetTargetDarkness()
end

function GameTest:TestGetTreasureRoomVisitCount(game)
	game:GetTreasureRoomVisitCount()
end

function GameTest:TestGetVictoryLap(game)
	game:GetVictoryLap()
end

function GameTest:TestHasEncounteredBoss(game)
	local boss = 1
	local variant = 1
	game:HasEncounteredBoss(boss, variant)
end

function GameTest:TestHasHallucination(game)
	game:HasHallucination()
end

function GameTest:TestIsGreedMode(game)
	game:IsGreedMode()
end

function GameTest:TestIsPaused(game)
	game:IsPaused()
end

function GameTest:TestMakeShockwave(game)
	local position = Vector(1,1)
	local amplitude = 1
	local speed = 1
	local duration = 1
	game:MakeShockwave(position, amplitude, speed, duration)
end
--[[
function GameTest:TestMoveToRandomRoom(game)
	local iamerrorroom = true
	local seed = 1
	local player = Isaac.GetPlayer()
	game:MoveToRandomRoom(iamerrorroom, seed, player)
end
]]--[[
function GameTest:TestNextVictoryLap(game)
	game:NextVictoryLap()
end
]]
function GameTest:TestRender(game)
	game:Render()
end

function GameTest:TestRerollEnemy(game)
	local e = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	game:RerollEnemy(e)
	e:Remove()
end

function GameTest:TestRerollLevelCollectibles(game)
	game:RerollLevelCollectibles()
end

function GameTest:TestRerollLevelPickups(game)
	local seed = 1
	game:RerollLevelPickups(seed)
end

function GameTest:TestSetLastDevilRoomStage(game)
	local minimum = 0
	local maximum = 13

	for i=minimum-2, maximum+2 do
		game:SetLastDevilRoomStage(i)
		if i < minimum then
			test.AssertEquals(game:GetLastDevilRoomStage(), minimum)
		elseif i > maximum then
			test.AssertEquals(game:GetLastDevilRoomStage(), maximum)
		else
			test.AssertEquals(game:GetLastDevilRoomStage(), i)
		end
	end

	game:SetLastDevilRoomStage(0)
end

function GameTest:TestSetLastLevelWithDamage(game)
	local minimum = 0
	local maximum = 13

	for i=minimum-2, maximum+2 do
		game:SetLastLevelWithDamage(i)
		if i < minimum then
			test.AssertEquals(game:GetLastLevelWithDamage(), minimum)
		elseif i > maximum then
			test.AssertEquals(game:GetLastLevelWithDamage(), maximum)
		else
			test.AssertEquals(game:GetLastLevelWithDamage(), i)
		end
	end

	game:SetLastLevelWithDamage(0)
end

function GameTest:TestSetLastLevelWithoutHalfHp(game)
	local minimum = 0
	local maximum = 13

	for i=minimum-2, maximum+2 do
		game:SetLastLevelWithoutHalfHp(i)
		if i < minimum then
			test.AssertEquals(game:GetLastLevelWithoutHalfHp(), minimum)
		elseif i > maximum then
			test.AssertEquals(game:GetLastLevelWithoutHalfHp(), maximum)
		else
			test.AssertEquals(game:GetLastLevelWithoutHalfHp(), i)
		end
	end

	game:SetLastLevelWithoutHalfHp(0)

end

function GameTest:TestSetStateFlag(game)
	local gamestateflag = 1
	local val = true
	game:SetStateFlag(gamestateflag, val)
end

function GameTest:TestShakeScreen(game)
	local timeout = 1
	game:ShakeScreen(timeout)
end

function GameTest:TestShowFortune(game)
	game:ShowFortune()
end

function GameTest:TestShowHallucination(game)
	local framecount = 1
	local backdrop = 1
	game:ShowHallucination(framecount, backdrop)
end

function GameTest:TestShowRule(game)
	game:ShowRule()
end

function GameTest:TestSpawn(game)
	local entitytype = 1
	local variant = 1
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local spawner = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local subtype = 1
	local seed = 1
	game:Spawn(entitytype, variant, position, velocity, spawner, subtype, seed)
	spawner:Remove()
end
--[[
function GameTest:TestSpawnEntityDesc(game)
	local desc = 1
	local position = Vector(1,1)
	local spawner = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	game:SpawnEntityDesc(desc, position, spawner)
	spawner:Remove()
end
]]
function GameTest:TestSpawnParticles(game)
	local pos = Vector(1,1)
	local particletype = 1
	local numparticles = 1
	local speed = 1
	local color = Color(1,1,1,1)
	local height = 1
	local subtype = 1
	game:SpawnParticles(pos, particletype, numparticles, speed, color, height, subtype)
end

function GameTest:TestStartRoomTransition(game)
	local roomindex = 1
	local direction = 1
	local animation = 1
	local player = Isaac.GetPlayer()
	local dimension = 1
	game:StartRoomTransition(roomindex, direction, animation, player, dimension)
end

function GameTest:TestStartStageTransition(game)
	local samestage = true
	local transitionoverride = 1
	local player = Isaac.GetPlayer()
	game:StartStageTransition(samestage, transitionoverride, player)
end
--[[
function GameTest:TestUpdate(game)
	game:Update()
end
]]
function GameTest:TestUpdateStrangeAttractor(game)
	local position = Vector(1,1)
	local force = 1
	local radius = 1
	game:UpdateStrangeAttractor(position, force, radius)
end

function GameTest:TestAchievementUnlocksDisallowed(game)
	game:AchievementUnlocksDisallowed()
end

function GameTest:TestAddDebugFlags(game)
	local flag = 1
	game:AddDebugFlags(flag)
end

function GameTest:TestAddShopVisits(game)
	local count = 1
	game:AddShopVisits(count)
end

function GameTest:TestClearErasedEnemies(game)
	game:ClearErasedEnemies()
end

function GameTest:TestDevolveEnemy(game)
	local entity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	game:DevolveEnemy(entity)
	entity:Remove()
end

function GameTest:TestGetChallengeParams(game)
	game:GetChallengeParams()
end

function GameTest:TestGetCurrentColorModifier(game)
	game:GetCurrentColorModifier()
end

function GameTest:TestGetDebugFlags(game)
	game:GetDebugFlags()
end

function GameTest:TestGetDizzyAmount(game)
	game:GetDizzyAmount()
end
--[[
function GameTest:TestGetGenericPrompt(game)
	game:GetGenericPrompt()
end
]]
function GameTest:TestGetLerpColorModifier(game)
	game:GetLerpColorModifier()
end

function GameTest:TestGetPauseMenuState(game)
	game:GetPauseMenuState()
end

function GameTest:TestGetPlanetariumsVisited(game)
	game:GetPlanetariumsVisited()
end

function GameTest:TestGetShopVisits(game)
	game:GetShopVisits()
end

function GameTest:TestGetTargetColorModifier(game)
	game:GetTargetColorModifier()
end

function GameTest:TestIsErased(game)
	local int = 1
	local variant = 1
	local subtype = 1
	game:IsErased(int, variant, subtype)
end

function GameTest:TestIsGreedBoss(game)
	game:IsGreedBoss()
end

function GameTest:TestIsGreedFinalBoss(game)
	game:IsGreedFinalBoss()
end

function GameTest:TestIsHardMode(game)
	game:IsHardMode()
end

function GameTest:TestIsPauseMenuOpen(game)
	game:IsPauseMenuOpen()
end

function GameTest:TestIsRerun(game)
	game:IsRerun()
end

function GameTest:TestRecordPlayerCompletion(game)
	local completiontype = 1
	game:RecordPlayerCompletion(completiontype)
end

function GameTest:TestSetBloom(game)
	local duration = 1
	local amount = 1
	game:SetBloom(duration, amount)
end

function GameTest:TestSetColorModifier(game)
	local colormodifier = ColorModifier()
	local lerp = true
	local rate = 1
	game:SetColorModifier(colormodifier, lerp, rate)
end

function GameTest:TestSetDizzyAmount(game)
	local targetintensity = 1
	local currentintensity = 1
	game:SetDizzyAmount(targetintensity, currentintensity)
end

function GameTest:TestSetDonationModAngel(game)
	local originalVal = game:GetDonationModAngel()
	for _, val in pairs(test.TestInts) do
		game:SetDonationModAngel(val)
		test.AssertEquals(game:GetDonationModAngel(), val)
	end
	game:SetDonationModAngel(originalVal)
end

function GameTest:TestSetDonationModGreed(game)
	local originalVal = game:GetDonationModGreed()
	for _, val in pairs(test.TestInts) do
		game:SetDonationModGreed(val)
		test.AssertEquals(game:GetDonationModGreed(), val)
	end
	game:SetDonationModGreed(originalVal)
end

function GameTest:TestShowGenericLeaderboard(game)
	game:ShowGenericLeaderboard()
end

function GameTest:TestSpawnBombCrater(game)
	local position = Vector(1,1)
	local radius = 1
	game:SpawnBombCrater(position, radius)
end

function GameTest:TestVarBlueWombParTime(game)
	local originalVal = game.BlueWombParTime
	for _, val in pairs(test.TestInts) do
		game.BlueWombParTime = val
		test.AssertEquals(game.BlueWombParTime, val)
	end
	game.BlueWombParTime = originalVal
end

function GameTest:TestVarBossRushParTime(game)
	local originalVal = game.BossRushParTime
	for _, val in pairs(test.TestInts) do
		game.BossRushParTime = val
		test.AssertEquals(game.BossRushParTime, val)
	end
	game.BossRushParTime = originalVal
end

function GameTest:TestVarChallenge(game)
	game.Challenge = -1
	test.AssertEquals(game.Challenge, 0)
	game.Challenge = 1
	test.AssertEquals(game.Challenge, 1)
	game.Challenge = 46
	test.AssertEquals(game.Challenge, 46)
	game.Challenge = 9999
	test.AssertTrue(game.Challenge < 9999)
	game.Challenge = 0
	test.AssertEquals(game.Challenge, 0)
end

function GameTest:TestVarDifficulty(game)
	local difficulty = game.Difficulty
end

function GameTest:TestVarScreenShakeOffset(game)
	local screenshakeoffset = game.ScreenShakeOffset
end

function GameTest:TestVarTimeCounter(game)
	local originalVal = game.TimeCounter
	for _, val in pairs(test.TestInts) do
		game.TimeCounter = val
		test.AssertEquals(game.TimeCounter, val)
	end
	game.TimeCounter = originalVal
end


return GameTest
