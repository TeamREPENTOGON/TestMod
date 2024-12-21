local test = REPENTOGON_TEST

local RoomTest = {}

function RoomTest:BeforeEach()
	return Game():GetRoom()
end

function RoomTest:AfterEach(room)
	
end

----------

function RoomTest:TestCheckLine(room)
	local pos1 = Vector(1,1)
	local pos2 = Vector(1,1)
	local mode = 1
	local gridpaththreshold = 1
	local ignorewalls = true
	local ignorecrushable = true
	room:CheckLine(pos1, pos2, mode, gridpaththreshold, ignorewalls, ignorecrushable)
end

function RoomTest:TestDamageGrid(room)
	local index = 1
	local damage = 1
	room:DamageGrid(index, damage)
end

function RoomTest:TestDestroyGrid(room)
	local index = 1
	local immediate = true
	room:DestroyGrid(index, immediate)
end

function RoomTest:TestEmitBloodFromWalls(room)
	local duration = 1
	local count = 1
	room:EmitBloodFromWalls(duration, count)
end

function RoomTest:TestFindFreePickupSpawnPosition(room)
	local pos = Vector(1,1)
	local initialstep = 1
	local avoidactiveentities = true
	local allowpits = true
	room:FindFreePickupSpawnPosition(pos, initialstep, avoidactiveentities, allowpits)
end

function RoomTest:TestFindFreeTilePosition(room)
	local pos = Vector(1,1)
	local distancethreshold = 1
	room:FindFreeTilePosition(pos, distancethreshold)
end

function RoomTest:TestGetAliveBossesCount(room)
	room:GetAliveBossesCount()
end

function RoomTest:TestGetAliveEnemiesCount(room)
	room:GetAliveEnemiesCount()
end

function RoomTest:TestGetAwardSeed(room)
	room:GetAwardSeed()
end

function RoomTest:TestGetBackdropType(room)
	room:GetBackdropType()
end

function RoomTest:TestGetBossID(room)
	room:GetBossID()
end

function RoomTest:TestGetBottomRightPos(room)
	room:GetBottomRightPos()
end

function RoomTest:TestGetCenterPos(room)
	room:GetCenterPos()
end

function RoomTest:TestGetClampedGridIndex(room)
	local position = Vector(1,1)
	room:GetClampedGridIndex(position)
end

function RoomTest:TestGetClampedPosition(room)
	local pos = Vector(1,1)
	local margin = 1
	room:GetClampedPosition(pos, margin)
end

function RoomTest:TestGetDecorationSeed(room)
	room:GetDecorationSeed()
end

function RoomTest:TestGetDeliriumDistance(room)
	room:GetDeliriumDistance()
end

function RoomTest:TestGetDevilRoomChance(room)
	room:GetDevilRoomChance()
end

function RoomTest:TestGetDoor(room)
	local slot = 1
	room:GetDoor(slot)
end

function RoomTest:TestGetDoorSlotPosition(room)
	local slot = 1
	room:GetDoorSlotPosition(slot)
end

function RoomTest:TestGetDungeonRockIdx(room)
	room:GetDungeonRockIdx()
end

function RoomTest:TestGetEnemyDamageInflicted(room)
	room:GetEnemyDamageInflicted()
end

function RoomTest:TestGetEntities(room)
	room:GetEntities()
end

function RoomTest:TestGetFrameCount(room)
	room:GetFrameCount()
end

function RoomTest:TestGetGridCollision(room)
	local gridindex = 1
	room:GetGridCollision(gridindex)
end

function RoomTest:TestGetGridCollisionAtPos(room)
	local pos = Vector(1,1)
	room:GetGridCollisionAtPos(pos)
end

function RoomTest:TestGetGridEntity(room)
	local index = 1
	room:GetGridEntity(index)
end

function RoomTest:TestGetGridEntityFromPos(room)
	local position = Vector(1,1)
	room:GetGridEntityFromPos(position)
end

function RoomTest:TestGetGridHeight(room)
	room:GetGridHeight()
end

function RoomTest:TestGetGridIndex(room)
	local position = Vector(1,1)
	room:GetGridIndex(position)
end

function RoomTest:TestGetGridPath(room)
	local index = 1
	room:GetGridPath(index)
end

function RoomTest:TestGetGridPathFromPos(room)
	local position = Vector(1,1)
	room:GetGridPathFromPos(position)
end

function RoomTest:TestGetGridPosition(room)
	local gridindex = 1
	room:GetGridPosition(gridindex)
end

function RoomTest:TestGetGridSize(room)
	room:GetGridSize()
end

function RoomTest:TestGetGridWidth(room)
	room:GetGridWidth()
end

function RoomTest:TestGetLaserTarget(room)
	local pos = Vector(1,1)
	local dir = Vector(1,1)
	room:GetLaserTarget(pos, dir)
end

function RoomTest:TestGetLightingAlpha(room)
	room:GetLightingAlpha()
end

function RoomTest:TestGetLRoomAreaDesc(room)
	room:GetLRoomAreaDesc()
end

function RoomTest:TestGetLRoomTileDesc(room)
	room:GetLRoomTileDesc()
end

function RoomTest:TestGetRandomPosition(room)
	local margin = 1
	room:GetRandomPosition(margin)
end

function RoomTest:TestGetRandomTileIndex(room)
	local seed = 1
	room:GetRandomTileIndex(seed)
end

function RoomTest:TestGetRedHeartDamage(room)
	room:GetRedHeartDamage()
end

function RoomTest:TestGetRenderMode(room)
	room:GetRenderMode()
end

function RoomTest:TestGetRenderScrollOffset(room)
	room:GetRenderScrollOffset()
end

function RoomTest:TestGetRenderSurfaceTopLeft(room)
	room:GetRenderSurfaceTopLeft()
end

function RoomTest:TestGetRoomConfigStage(room)
	room:GetRoomConfigStage()
end

function RoomTest:TestGetRoomShape(room)
	room:GetRoomShape()
end

function RoomTest:TestGetSecondBossID(room)
	room:GetSecondBossID()
end

function RoomTest:TestGetSeededCollectible(room)
	local seed = 1
	local nodecrease = true
	room:GetSeededCollectible(seed, nodecrease)
end

function RoomTest:TestGetShopLevel(room)
	room:GetShopLevel()
end

function RoomTest:TestGetSpawnSeed(room)
	room:GetSpawnSeed()
end

function RoomTest:TestGetTintedRockIdx(room)
	room:GetTintedRockIdx()
end

function RoomTest:TestGetTopLeftPos(room)
	room:GetTopLeftPos()
end

function RoomTest:TestGetType(room)
	room:GetType()
end

function RoomTest:TestHasCurseMist(room)
	room:HasCurseMist()
end

function RoomTest:TestHasLava(room)
	room:HasLava()
end

function RoomTest:TestHasSlowDown(room)
	room:HasSlowDown()
end

function RoomTest:TestHasTriggerPressurePlates(room)
	room:HasTriggerPressurePlates()
end

function RoomTest:TestHasWater(room)
	room:HasWater()
end

function RoomTest:TestHasWaterPits(room)
	room:HasWaterPits()
end

function RoomTest:TestInvalidatePickupVision(room)
	room:InvalidatePickupVision()
end

function RoomTest:TestIsAmbushActive(room)
	room:IsAmbushActive()
end

function RoomTest:TestIsAmbushDone(room)
	room:IsAmbushDone()
end

function RoomTest:TestIsClear(room)
	room:IsClear()
end

function RoomTest:TestIsCurrentRoomLastBoss(room)
	room:IsCurrentRoomLastBoss()
end

function RoomTest:TestIsDoorSlotAllowed(room)
	local slot = 1
	room:IsDoorSlotAllowed(slot)
end

function RoomTest:TestIsFirstEnemyDead(room)
	room:IsFirstEnemyDead()
end

function RoomTest:TestIsFirstVisit(room)
	room:IsFirstVisit()
end

function RoomTest:TestIsInitialized(room)
	room:IsInitialized()
end

function RoomTest:TestIsLShapedRoom(room)
	room:IsLShapedRoom()
end

function RoomTest:TestIsMirrorWorld(room)
	room:IsMirrorWorld()
end

function RoomTest:TestIsPositionInRoom(room)
	local pos = Vector(1,1)
	local margin = 1
	room:IsPositionInRoom(pos, margin)
end

function RoomTest:TestIsSacrificeDone(room)
	room:IsSacrificeDone()
end

function RoomTest:TestKeepDoorsClosed(room)
	room:KeepDoorsClosed()
end

function RoomTest:TestMamaMegaExplosion(room)
	local position = Vector(1,1)
	room:MamaMegaExplosion(position)
end

function RoomTest:TestPlayMusic(room)
	room:PlayMusic()
end

function RoomTest:TestRemoveDoor(room)
	local slot = 1
	room:RemoveDoor(slot)
end

function RoomTest:TestRemoveGridEntity(room)
	local gridindex = 1
	local pathtrail = 1
	local keepdecoration = true
	room:RemoveGridEntity(gridindex, pathtrail, keepdecoration)
end

function RoomTest:TestRender(room)
	room:Render()
end

function RoomTest:TestRespawnEnemies(room)
	room:RespawnEnemies()
end

function RoomTest:TestScreenWrapPosition(room)
	local pos = Vector(1,1)
	local margin = 1
	room:ScreenWrapPosition(pos, margin)
end

function RoomTest:TestSetAmbushDone(room)
	local value = true
	room:SetAmbushDone(value)
end

function RoomTest:TestSetBrokenWatchState(room)
	local originalVal = room:GetBrokenWatchState()
	for _, val in pairs(test.TestInts) do
		room:SetBrokenWatchState(val)
		test.AssertEquals(room:GetBrokenWatchState(), val)
	end
	room:SetBrokenWatchState(originalVal)
end

function RoomTest:TestSetCardAgainstHumanity(room)
	room:SetCardAgainstHumanity()
end

function RoomTest:TestSetClear(room)
	local clear = true
	room:SetClear(clear)
end

function RoomTest:TestSetFirstEnemyDead(room)
	local value = true
	room:SetFirstEnemyDead(value)
end

function RoomTest:TestSetFloorColor(room)
	local originalVal = room:GetFloorColor()
	for _, val in pairs(test.TestColors) do
		room:SetFloorColor(val)
		test.AssertEquals(room:GetFloorColor(), val)
	end
	room:SetFloorColor(originalVal)
end

function RoomTest:TestSetGridPath(room)
	local index = 1
	local value = 1
	room:SetGridPath(index, value)
end

function RoomTest:TestSetRedHeartDamage(room)
	room:SetRedHeartDamage()
end

function RoomTest:TestSetSacrificeDone(room)
	local done = true
	room:SetSacrificeDone(done)
end

function RoomTest:TestSetSlowDown(room)
	local duration = 1
	room:SetSlowDown(duration)
end

function RoomTest:TestSetWallColor(room)
	local originalVal = room:GetWallColor()
	for _, val in pairs(test.TestColors) do
		room:SetWallColor(val)
		test.AssertEquals(room:GetWallColor(), val)
	end
	room:SetWallColor(originalVal)
end

function RoomTest:TestShopReshuffle(room)
	local keepcollectibleidx = true
	local reselectsaleitem = true
	room:ShopReshuffle(keepcollectibleidx, reselectsaleitem)
end

function RoomTest:TestShopRestockFull(room)
	room:ShopRestockFull()
end

function RoomTest:TestShopRestockPartial(room)
	room:ShopRestockPartial()
end

function RoomTest:TestSpawnClearAward(room)
	room:SpawnClearAward()
end

function RoomTest:TestSpawnGridEntity(room)
	local gridindex = 1
	local descriptor = 1
	room:SpawnGridEntity(gridindex, descriptor)
end

function RoomTest:TestStopRain(room)
	room:StopRain()
end

function RoomTest:TestTriggerClear(room)
	local silent = true
	room:TriggerClear(silent)
end

function RoomTest:TestTryMakeBridge(room)
	local pit = REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_PIT)
	local rock = REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_ROCK)
	room:TryMakeBridge(pit, rock)
end
--[[
function RoomTest:TestTryPlaceLadder(room)
	local playerpos = Vector(1,1)
	local playervelocity = Vector(1,1)
	local ladder = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	room:TryPlaceLadder(playerpos, playervelocity, ladder)
	ladder:Remove()
end
]]
function RoomTest:TestTrySpawnBlueWombDoor(room)
	local firsttime = true
	local ignoretime = true
	local force = true
	room:TrySpawnBlueWombDoor(firsttime, ignoretime, force)
end

function RoomTest:TestTrySpawnBossRushDoor(room)
	local ignoretime = true
	local force = true
	room:TrySpawnBossRushDoor(ignoretime, force)
end

function RoomTest:TestTrySpawnDevilRoomDoor(room)
	local animate = true
	local force = true
	room:TrySpawnDevilRoomDoor(animate, force)
end

function RoomTest:TestTrySpawnMegaSatanRoomDoor(room)
	local force = true
	room:TrySpawnMegaSatanRoomDoor(force)
end

function RoomTest:TestTrySpawnSecretExit(room)
	local animate = true
	local force = true
	room:TrySpawnSecretExit(animate, force)
end

function RoomTest:TestTrySpawnSecretShop(room)
	local force = true
	room:TrySpawnSecretShop(force)
end

function RoomTest:TestTrySpawnSpecialQuestDoor(room)
	local ignorestagetype = true
	room:TrySpawnSpecialQuestDoor(ignorestagetype)
end

function RoomTest:TestTrySpawnTheVoidDoor(room)
	local force = true
	room:TrySpawnTheVoidDoor(force)
end

function RoomTest:TestTurnGold(room)
	room:TurnGold()
end
--[[
function RoomTest:TestUpdate(room)
	room:Update()
end
]]
function RoomTest:TestWorldToScreenPosition(room)
	local worldpos = Vector(1,1)
	room:WorldToScreenPosition(worldpos)
end

function RoomTest:TestCanPickupGridEntity(room)
	local gridindex = 1
	room:CanPickupGridEntity(gridindex)
end

function RoomTest:TestCanSpawnObstacleAtPosition(room)
	local gridindex = 1
	local force = true
	room:CanSpawnObstacleAtPosition(gridindex, force)
end

function RoomTest:TestDoLightningStrike(room)
	local seed = 1
	room:DoLightningStrike(seed)
end

function RoomTest:TestGetBackdrop(room)
	room:GetBackdrop()
end

function RoomTest:TestGetBossVictoryJingle(room)
	room:GetBossVictoryJingle()
end

function RoomTest:TestGetCamera(room)
	room:GetCamera()
end

function RoomTest:TestGetChampionBossChance(room)
	room:GetChampionBossChance()
end

function RoomTest:TestGetEffects(room)
	room:GetEffects()
end

function RoomTest:TestGetFXParams(room)
	room:GetFXParams()
end

function RoomTest:TestGetGridIndexByTile(room)
	local tile = {1,1}
	room:GetGridIndexByTile(tile)
end

function RoomTest:TestGetItemPool(room)
	local seed = 1
	local raw = true
	room:GetItemPool(seed, raw)
end

function RoomTest:TestGetNumRainSpawners(room)
	room:GetNumRainSpawners()
end

function RoomTest:TestGetRail(room)
	local gridindex = 1
	room:GetRail(gridindex)
end

function RoomTest:TestGetRailManager(room)
	room:GetRailManager()
end

function RoomTest:TestGetShopItemPrice(room)
	local entityvariant = 1
	local entitysubtype = 1
	local shopitemid = 1
	room:GetShopItemPrice(entityvariant, entitysubtype, shopitemid)
end

function RoomTest:TestGetWaterColor(room)
	room:GetWaterColor()
end

function RoomTest:TestGetWaterColorMultiplier(room)
	room:GetWaterColorMultiplier()
end

function RoomTest:TestIsChampionBossSeed(room)
	room:IsChampionBossSeed()
end

function RoomTest:TestIsPersistentRoomEntity(room)
	local entitytype = 1
	local variant = 1
	room:IsPersistentRoomEntity(entitytype, variant)
end

function RoomTest:TestPickupGridEntity(room)
	local gridindex = 1
	room:PickupGridEntity(gridindex)
end

function RoomTest:TestRemoveGridEntityImmediate(room)
	local gridindex = 1
	local pathtrail = 1
	local keepdecoration = true
	room:RemoveGridEntityImmediate(gridindex, pathtrail, keepdecoration)
end

function RoomTest:TestSaveState(room)
	room:SaveState()
end

function RoomTest:TestSetBackdropType(room)
	local backdroptype = 1
	local unknown = 1
	room:SetBackdropType(backdroptype, unknown)
end

function RoomTest:TestSetGreedWaveTimer(room)
	local originalVal = room:GetGreedWaveTimer()
	for _, val in pairs(test.TestInts) do
		room:SetGreedWaveTimer(val)
		test.AssertEquals(room:GetGreedWaveTimer(), val)
	end
	room:SetGreedWaveTimer(originalVal)
end

function RoomTest:TestSetItemPool(room)
	local pooltype = 1
	room:SetItemPool(pooltype)
end

function RoomTest:TestSetLavaIntensity(room)
	local originalVal = room:GetLavaIntensity()
	for _, val in pairs(test.TestFloats) do
		room:SetLavaIntensity(val)
		test.AssertEquals(room:GetLavaIntensity(), val)
	end
	room:SetLavaIntensity(originalVal)
end

function RoomTest:TestSetLightningIntensity(room)
	local originalVal = room:GetLightningIntensity()
	for _, val in pairs(test.TestFloats) do
		room:SetLightningIntensity(val)
		test.AssertEquals(room:GetLightningIntensity(), val)
	end
	room:SetLightningIntensity(originalVal)
end

function RoomTest:TestSetPauseTimer(room)
	local duration = 1
	room:SetPauseTimer(duration)
end

function RoomTest:TestSetRail(room)
	local gridindex = 1
	local railvariant = 1
	room:SetRail(gridindex, railvariant)
end

function RoomTest:TestSetRainIntensity(room)
	local originalVal = room:GetRainIntensity()
	for _, val in pairs(test.TestFloats) do
		room:SetRainIntensity(val)
		test.AssertEquals(room:GetRainIntensity(), val)
	end
	room:SetRainIntensity(originalVal)
end

function RoomTest:TestSetRoomClearDelay(room)
	local originalVal = room:GetRoomClearDelay()
	for _, val in pairs(test.TestInts) do
		room:SetRoomClearDelay(val)
		test.AssertEquals(room:GetRoomClearDelay(), val)
	end
	room:SetRoomClearDelay(originalVal)
end

function RoomTest:TestSetWaterAmount(room)
	local originalVal = room:GetWaterAmount()
	for _, val in pairs(test.TestFloats) do
		room:SetWaterAmount(val)
		test.AssertEquals(room:GetWaterAmount(), val)
	end
	room:SetWaterAmount(originalVal)
end

function RoomTest:TestSetWaterColor(room)
	local watercolor = KColor(1,1,1,1)
	room:SetWaterColor(watercolor)
end

function RoomTest:TestSetWaterColorMultiplier(room)
	local watercolor = KColor(1,1,1,1)
	room:SetWaterColorMultiplier(watercolor)
end

function RoomTest:TestSetWaterCurrent(room)
	local originalVal = room:GetWaterCurrent()
	for _, val in pairs(test.TestVectors) do
		room:SetWaterCurrent(val)
		test.AssertEquals(room:GetWaterCurrent(), val)
	end
	room:SetWaterCurrent(originalVal)
end

function RoomTest:TestTryGetShopDiscount(room)
	local shopitemidx = 1
	local price = 1
	room:TryGetShopDiscount(shopitemidx, price)
end

function RoomTest:TestUpdateColorModifier(room)
	local process = true
	local lerp = true
	local rate = 1
	room:UpdateColorModifier(process, lerp, rate)
end


return RoomTest
