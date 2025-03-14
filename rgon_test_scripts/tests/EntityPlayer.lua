local test = REPENTOGON_TEST

local EntityPlayerTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityPlayerTest:BeforeEach()
	local player = Isaac.GetPlayer()
	if player:IsDead() then
		player:Revive()
	end
	if player:GetPlayerType() ~= PlayerType.PLAYER_ISAAC then
		player:ChangePlayerType(PlayerType.PLAYER_ISAAC)
	end
	player:AddSoulHearts(-999)
	player:AddBlackHearts(-999)
	player:AddBoneHearts(-999)
	player:AddGoldenHearts(-999)
	player:AddEternalHearts(-999)
	player:AddBrokenHearts(-999)
	player:AddRottenHearts(-999)
	player:AddRottenHearts(-999)
	if player:GetMaxHearts() ~= 6 then
		player:AddMaxHearts(6 - player:GetMaxHearts())
	end
	player:AddHearts(player:GetMaxHearts())
	player.ControlsEnabled = true
	player.ControlsCooldown = 0
	player:ResetDamageCooldown()
	player:StopExtraAnimation()
	return player
end

function EntityPlayerTest:AfterEach(entityplayer)
	
end

----------

function EntityPlayerTest:TestAddBlackHearts(entityplayer)
	test.AssertEquals(entityplayer:GetBlackHearts(), 0)
	entityplayer:AddBlackHearts(1)
	test.AssertTrue(entityplayer:GetBlackHearts() > 0)
	entityplayer:AddBlackHearts(-1)
	test.AssertEquals(entityplayer:GetBlackHearts(), 0)
end

function EntityPlayerTest:TestAddBloodCharge(entityplayer)
	local amount = 1
	entityplayer:AddBloodCharge(amount)
end

function EntityPlayerTest:TestAddBlueFlies(entityplayer)
	local amount = 1
	local position = Vector(1,1)
	local target = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:AddBlueFlies(amount, position, target)
	target:Remove()
end

function EntityPlayerTest:TestAddBlueSpider(entityplayer)
	local position = Vector(1,1)
	entityplayer:AddBlueSpider(position)
end

function EntityPlayerTest:TestAddBombs(entityplayer)
	local amount = 1
	entityplayer:AddBombs(amount)
end

function EntityPlayerTest:TestAddBoneHearts(entityplayer)
	test.AssertEquals(entityplayer:GetBoneHearts(), 0)
	entityplayer:AddBoneHearts(1)
	test.AssertEquals(entityplayer:GetBoneHearts(), 1)
	entityplayer:AddBoneHearts(-1)
	test.AssertEquals(entityplayer:GetBoneHearts(), 0)
end

function EntityPlayerTest:TestAddBrokenHearts(entityplayer)
	test.AssertEquals(entityplayer:GetBrokenHearts(), 0)
	entityplayer:AddBrokenHearts(1)
	test.AssertEquals(entityplayer:GetBrokenHearts(), 1)
	entityplayer:AddBrokenHearts(-1)
	test.AssertEquals(entityplayer:GetBrokenHearts(), 0)
end

function EntityPlayerTest:TestAddCacheFlags(entityplayer)
	local cacheflag = 1
	local evaluateitems = true
	entityplayer:AddCacheFlags(cacheflag, evaluateitems)
end

function EntityPlayerTest:TestAddCard(entityplayer)
	local id = 1
	entityplayer:AddCard(id)
end

function EntityPlayerTest:TestAddCoins(entityplayer)
	local amount = 1
	entityplayer:AddCoins(amount)
end

function EntityPlayerTest:TestAddCollectible(entityplayer)
	local collectibletype = 1
	local charge = 1
	local firsttimepickingup = true
	local slot = 1
	local vardata = 1
	entityplayer:AddCollectible(collectibletype, charge, firsttimepickingup, slot, vardata)
end

function EntityPlayerTest:TestControlsCooldown(entityplayer)
	entityplayer.ControlsCooldown = 10
	test.AssertEquals(entityplayer.ControlsCooldown, 10)
	entityplayer:AddControlsCooldown(5)
	test.AssertEquals(entityplayer.ControlsCooldown, 15)
	entityplayer.ControlsCooldown = 0
	test.AssertEquals(entityplayer.ControlsCooldown, 0)
end

function EntityPlayerTest:TestAddCostume(entityplayer)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local itemstateonly = true
	entityplayer:AddCostume(item, itemstateonly)
end

function EntityPlayerTest:TestAddCurseMistEffect(entityplayer)
	entityplayer:AddCurseMistEffect()
end

function EntityPlayerTest:TestAddDeadEyeCharge(entityplayer)
	entityplayer:AddDeadEyeCharge()
end

function EntityPlayerTest:TestAddDollarBillEffect(entityplayer)
	entityplayer:AddDollarBillEffect()
end

function EntityPlayerTest:TestAddEternalHearts(entityplayer)
	test.AssertEquals(entityplayer:GetEternalHearts(), 0)
	entityplayer:AddEternalHearts(1)
	test.AssertEquals(entityplayer:GetEternalHearts(), 1)
	entityplayer:AddEternalHearts(-1)
	test.AssertEquals(entityplayer:GetEternalHearts(), 0)
end

function EntityPlayerTest:TestAddFriendlyDip(entityplayer)
	local subtype = 1
	local position = Vector(1,1)
	entityplayer:AddFriendlyDip(subtype, position)
end

function EntityPlayerTest:TestAddGigaBombs(entityplayer)
	local gigabombs = 1
	entityplayer:AddGigaBombs(gigabombs)
end

function EntityPlayerTest:TestAddGoldenBomb(entityplayer)
	entityplayer:AddGoldenBomb()
end

function EntityPlayerTest:TestAddGoldenHearts(entityplayer)
	test.AssertEquals(entityplayer:GetGoldenHearts(), 0)
	entityplayer:AddGoldenHearts(1)
	test.AssertEquals(entityplayer:GetGoldenHearts(), 1)
	entityplayer:AddGoldenHearts(-1)
	test.AssertEquals(entityplayer:GetGoldenHearts(), 0)
end

function EntityPlayerTest:TestAddGoldenKey(entityplayer)
	entityplayer:AddGoldenKey()
end

function EntityPlayerTest:TestAddHearts(entityplayer)
	entityplayer:AddHearts(1-entityplayer:GetHearts())
	test.AssertEquals(entityplayer:GetHearts(), 1)
	entityplayer:AddHearts(1)
	test.AssertEquals(entityplayer:GetHearts(), 2)
	entityplayer:AddHearts(-1)
	test.AssertEquals(entityplayer:GetHearts(), 1)
	entityplayer:AddHearts(entityplayer:GetMaxHearts())
	test.AssertEquals(entityplayer:GetHearts(), entityplayer:GetMaxHearts())
end

function EntityPlayerTest:TestAddItemWisp(entityplayer)
	local collectible = 1
	local position = Vector(1,1)
	local adjustorbitlayer = true
	entityplayer:AddItemWisp(collectible, position, adjustorbitlayer)
end

function EntityPlayerTest:TestAddJarFlies(entityplayer)
	local flies = 1
	entityplayer:AddJarFlies(flies)
end

function EntityPlayerTest:TestAddJarHearts(entityplayer)
	local hearts = 1
	entityplayer:AddJarHearts(hearts)
end

function EntityPlayerTest:TestAddKeys(entityplayer)
	local amount = 1
	entityplayer:AddKeys(amount)
end

function EntityPlayerTest:TestAddMaxHearts(entityplayer)
	local maxhearts = entityplayer:GetMaxHearts()
	test.AssertEquals(maxhearts, entityplayer:GetMaxHearts())
	local ignorekeeper = true
	entityplayer:AddMaxHearts(2, ignorekeeper)
	test.AssertEquals(entityplayer:GetMaxHearts(), maxhearts+2)
	entityplayer:AddMaxHearts(-2, ignorekeeper)
	test.AssertEquals(entityplayer:GetMaxHearts(), maxhearts)
end

function EntityPlayerTest:TestAddMinisaac(entityplayer)
	local position = Vector(1,1)
	local playanim = true
	entityplayer:AddMinisaac(position, playanim)
end

function EntityPlayerTest:TestAddNullCostume(entityplayer)
	local nullid = 1
	entityplayer:AddNullCostume(nullid)
end

function EntityPlayerTest:TestAddPill(entityplayer)
	local pill = 1
	local overridePill = PillColor.PILL_GOLD

	-- Test #1: No returns

	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_ADD_PILL, function(_, cPlayer, cPillColor, cSlot)
		test.AssertEquals(GetPtrHash(cPlayer), GetPtrHash(entityplayer))
		test.AssertEquals(pill, cPillColor)
		test.AssertEquals(cSlot, PillCardSlot.PRIMARY)
	end)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_ADD_PILL, function(_, cPlayer, cPillColor, cSlot)
		test.AssertEquals(GetPtrHash(cPlayer), GetPtrHash(entityplayer))
		test.AssertEquals(pill, cPillColor)
		test.AssertEquals(cSlot, PillCardSlot.PRIMARY)
	end)

	entityplayer:AddPill(pill)
	entityplayer:RemovePocketItem(PillCardSlot.PRIMARY)

	-- Test #2: Cancel pill adding
	
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_ADD_PILL, function(_, cPlayer, cPillColor, cSlot)
		test.AssertEquals(GetPtrHash(cPlayer), GetPtrHash(entityplayer))
		test.AssertEquals(pill, cPillColor)
		test.AssertEquals(cSlot, PillCardSlot.PRIMARY)
		return false
	end)

	entityplayer:AddPill(pill)
	test.AssertEquals(entityplayer:GetPill(PillCardSlot.PRIMARY), PillColor.PILL_NULL)
	entityplayer:RemovePocketItem(PillCardSlot.PRIMARY)

	-- Test #3: Pill overriding

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_ADD_PILL, function(_, cPlayer, cPillColor, cSlot)
		test.AssertEquals(GetPtrHash(cPlayer), GetPtrHash(entityplayer))
		test.AssertEquals(pill, cPillColor)
		test.AssertEquals(cSlot, PillCardSlot.PRIMARY)
		return overridePill
	end)

	entityplayer:AddPill(pill)
	test.AssertEquals(entityplayer:GetPill(PillCardSlot.PRIMARY), overridePill)
	entityplayer:RemovePocketItem(PillCardSlot.PRIMARY)
end

function EntityPlayerTest:TestAddPlayerFormCostume(entityplayer)
	local form = 1
	entityplayer:AddPlayerFormCostume(form)
end

function EntityPlayerTest:TestAddPoopMana(entityplayer)
	local num = 1
	entityplayer:AddPoopMana(num)
end

function EntityPlayerTest:TestAddPrettyFly(entityplayer)
	entityplayer:AddPrettyFly()
end

function EntityPlayerTest:TestAddRottenHearts(entityplayer)
	entityplayer:AddRottenHearts(1)
	test.AssertEquals(entityplayer:GetRottenHearts(), 1)
	entityplayer:AddRottenHearts(-1)
	test.AssertEquals(entityplayer:GetRottenHearts(), 0)
	entityplayer:AddHearts(2)
end

function EntityPlayerTest:TestAddSoulCharge(entityplayer)
	local amount = 1
	entityplayer:AddSoulCharge(amount)
end

function EntityPlayerTest:TestAddSoulHearts(entityplayer)
	test.AssertEquals(entityplayer:GetSoulHearts(), 0)
	entityplayer:AddSoulHearts(1)
	test.AssertEquals(entityplayer:GetSoulHearts(), 1)
	entityplayer:AddSoulHearts(-1)
	test.AssertEquals(entityplayer:GetSoulHearts(), 0)
end

function EntityPlayerTest:TestAddSwarmFlyOrbital(entityplayer)
	local position = Vector(1,1)
	entityplayer:AddSwarmFlyOrbital(position)
end

function EntityPlayerTest:TestAddTrinket(entityplayer)
	local trinkettype = 1
	local firsttimepickingup = true
	entityplayer:AddTrinket(trinkettype, firsttimepickingup)
end

function EntityPlayerTest:TestAddWisp(entityplayer)
	local collectible = 1
	local position = Vector(1,1)
	local adjustorbitlayer = true
	local dontupdate = true
	entityplayer:AddWisp(collectible, position, adjustorbitlayer, dontupdate)
end

function EntityPlayerTest:TestAnimateAppear(entityplayer)
	entityplayer:AnimateAppear()
end

function EntityPlayerTest:TestAnimateCard(entityplayer)
	local id = 1
	local animname = "hello"
	entityplayer:AnimateCard(id, animname)
end

function EntityPlayerTest:TestAnimateCollectible(entityplayer)
	local collectible = 1
	local animname = "hello"
	local spriteanimname = "hello"
	entityplayer:AnimateCollectible(collectible, animname, spriteanimname)
end

function EntityPlayerTest:TestAnimateHappy(entityplayer)
	entityplayer:AnimateHappy()
end

function EntityPlayerTest:TestAnimateLightTravel(entityplayer)
	entityplayer:AnimateLightTravel()
end

function EntityPlayerTest:TestAnimatePickup(entityplayer)
	local sprite = test.GetTestSprite()
	local hideshadow = true
	local animname = "hello"
	entityplayer:AnimatePickup(sprite, hideshadow, animname)
end

function EntityPlayerTest:TestAnimatePill(entityplayer)
	local pill = 1
	local animname = "hello"
	entityplayer:AnimatePill(pill, animname)
end

function EntityPlayerTest:TestAnimatePitfallIn(entityplayer)
	entityplayer:AnimatePitfallIn()
end

function EntityPlayerTest:TestAnimatePitfallOut(entityplayer)
	entityplayer:AnimatePitfallOut()
end

function EntityPlayerTest:TestAnimateSad(entityplayer)
	entityplayer:AnimateSad()
end

function EntityPlayerTest:TestAnimateTeleport(entityplayer)
	local up = true
	entityplayer:AnimateTeleport(up)
end

function EntityPlayerTest:TestAnimateTrapdoor(entityplayer)
	entityplayer:AnimateTrapdoor()
end

function EntityPlayerTest:TestAnimateTrinket(entityplayer)
	local trinket = 1
	local animname = "hello"
	local spriteanimname = "hello"
	entityplayer:AnimateTrinket(trinket, animname, spriteanimname)
end

function EntityPlayerTest:TestAreControlsEnabled(entityplayer)
	entityplayer:AreControlsEnabled()
end

function EntityPlayerTest:TestAreOpposingShootDirectionsPressed(entityplayer)
	entityplayer:AreOpposingShootDirectionsPressed()
end

function EntityPlayerTest:TestCanAddCollectible(entityplayer)
	local collectibletype = 1
	entityplayer:CanAddCollectible(collectibletype)
end

function EntityPlayerTest:TestCanPickBlackHearts(entityplayer)
	entityplayer:CanPickBlackHearts()
end

function EntityPlayerTest:TestCanPickBoneHearts(entityplayer)
	entityplayer:CanPickBoneHearts()
end

function EntityPlayerTest:TestCanPickGoldenHearts(entityplayer)
	entityplayer:CanPickGoldenHearts()
end

function EntityPlayerTest:TestCanPickRedHearts(entityplayer)
	entityplayer:CanPickRedHearts()
end

function EntityPlayerTest:TestCanPickRottenHearts(entityplayer)
	entityplayer:CanPickRottenHearts()
end

function EntityPlayerTest:TestCanPickSoulHearts(entityplayer)
	entityplayer:CanPickSoulHearts()
end

function EntityPlayerTest:TestCanPickupItem(entityplayer)
	entityplayer:CanPickupItem()
end

function EntityPlayerTest:TestCanShoot(entityplayer)
	entityplayer:CanShoot()
end

function EntityPlayerTest:TestCanTurnHead(entityplayer)
	entityplayer:CanTurnHead()
end

function EntityPlayerTest:TestChangePlayerType(entityplayer)
	entityplayer:ChangePlayerType(PlayerType.PLAYER_MAGDALENE)
	test.AssertEquals(entityplayer:GetPlayerType(), PlayerType.PLAYER_MAGDALENE)
	entityplayer:ChangePlayerType(PlayerType.PLAYER_ISAAC)
	test.AssertEquals(entityplayer:GetPlayerType(), PlayerType.PLAYER_ISAAC)
end

function EntityPlayerTest:TestCheckFamiliar(entityplayer)
	local familiarvariant = 1
	local targetcount = 1
	local rng = RNG()
	local sourceitemconfigitem = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local familiarsubtype = 1
	entityplayer:CheckFamiliar(familiarvariant, targetcount, rng, sourceitemconfigitem, familiarsubtype)
end

function EntityPlayerTest:TestIsItemCostumeVisibleByName(entityplayer)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	entityplayer:IsItemCostumeVisible(item, 1)
end

function EntityPlayerTest:TestIsItemCostumeVisibleByID(entityplayer)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	entityplayer:IsItemCostumeVisible(item, "head0")
end

function EntityPlayerTest:TestIsCollectibleCostumeVisible(entityplayer)
	local collectible = 1
	entityplayer:IsCollectibleCostumeVisible(collectible, "head0")
end

function EntityPlayerTest:TestIsNullItemCostumeVisible(entityplayer)
	local nullitem = 1
	entityplayer:IsNullItemCostumeVisible(nullitem, "head0")
end

function EntityPlayerTest:TestClearCostumes(entityplayer)
	entityplayer:ClearCostumes()
end

function EntityPlayerTest:TestClearDeadEyeCharge(entityplayer)
	local force = true
	entityplayer:ClearDeadEyeCharge(force)
end

function EntityPlayerTest:TestClearTemporaryEffects(entityplayer)
	entityplayer:ClearTemporaryEffects()
end

function EntityPlayerTest:TestDischargeActiveItem(entityplayer)
	local activeslot = 1
	entityplayer:DischargeActiveItem(activeslot)
end

function EntityPlayerTest:TestDonateLuck(entityplayer)
	local luck = 1
	entityplayer:DonateLuck(luck)
end

function EntityPlayerTest:TestDoZitEffect(entityplayer)
	local direction = Vector(1,1)
	entityplayer:DoZitEffect(direction)
end

function EntityPlayerTest:TestDropPocketItem(entityplayer)
	local pocketnum = 1
	local pos = Vector(1,1)
	entityplayer:DropPocketItem(pocketnum, pos)
end

function EntityPlayerTest:TestDropTrinket(entityplayer)
	local droppos = Vector(1,1)
	local replacetick = true
	entityplayer:DropTrinket(droppos, replacetick)
end

function EntityPlayerTest:TestEvaluateItems(entityplayer)
	entityplayer:EvaluateItems()
end

function EntityPlayerTest:TestFireBomb(entityplayer)
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:FireBomb(position, velocity, source)
	source:Remove()
end

function EntityPlayerTest:TestFireBrimstone(entityplayer)
	local direction = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local damagemultiplier = 1
	entityplayer:FireBrimstone(direction, source, damagemultiplier)
	source:Remove()
end

function EntityPlayerTest:TestFireDelayedBrimstone(entityplayer)
	local angle = 1
	local parent = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:FireDelayedBrimstone(angle, parent)
	parent:Remove()
end

function EntityPlayerTest:TestFireKnife(entityplayer)
	local parent = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local rotationoffset = 1
	local cantoverwrite = true
	local subtype = 1
	local variant = 1
	entityplayer:FireKnife(parent, rotationoffset, cantoverwrite, subtype, variant)
	parent:Remove()
end

function EntityPlayerTest:TestFireTear(entityplayer)
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local canbeeye = true
	local notractorbeam = true
	local cantriggerstreakend = true
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local damagemultiplier = 1
	entityplayer:FireTear(position, velocity, canbeeye, notractorbeam, cantriggerstreakend, source, damagemultiplier)
	source:Remove()
end

function EntityPlayerTest:TestFireTechLaser(entityplayer)
	local position = Vector(1,1)
	local offsetid = 1
	local direction = Vector(1,1)
	local lefteye = true
	local onehit = true
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local damagemultiplier = 1
	entityplayer:FireTechLaser(position, offsetid, direction, lefteye, onehit, source, damagemultiplier)
	source:Remove()
end

function EntityPlayerTest:TestFireTechXLaser(entityplayer)
	local position = Vector(1,1)
	local direction = Vector(1,1)
	local radius = 1
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local damagemultiplier = 1
	entityplayer:FireTechXLaser(position, direction, radius, source, damagemultiplier)
	source:Remove()
end

function EntityPlayerTest:TestFlushQueueItem(entityplayer)
	entityplayer:FlushQueueItem()
end

function EntityPlayerTest:TestFullCharge(entityplayer)
	local activeslot = 1
	local force = 1
	entityplayer:FullCharge(activeslot, force)
end

function EntityPlayerTest:TestGetActiveCharge(entityplayer)
	local activeslot = 1
	entityplayer:GetActiveCharge(activeslot)
end

function EntityPlayerTest:TestGetActiveItem(entityplayer)
	local activeslot = 1
	entityplayer:GetActiveItem(activeslot)
end

function EntityPlayerTest:TestGetActiveSubCharge(entityplayer)
	local activeslot = 1
	entityplayer:GetActiveSubCharge(activeslot)
end

function EntityPlayerTest:TestGetActiveWeaponEntity(entityplayer)
	entityplayer:GetActiveWeaponEntity()
end

function EntityPlayerTest:TestGetAimDirection(entityplayer)
	entityplayer:GetAimDirection()
end

function EntityPlayerTest:TestGetBabySkin(entityplayer)
	entityplayer:GetBabySkin()
end

function EntityPlayerTest:TestGetBatteryCharge(entityplayer)
	local activeslot = 1
	entityplayer:GetBatteryCharge(activeslot)
end

function EntityPlayerTest:TestGetBodyColor(entityplayer)
	entityplayer:GetBodyColor()
end

function EntityPlayerTest:TestGetBombFlags(entityplayer)
	entityplayer:GetBombFlags()
end

function EntityPlayerTest:TestGetBombVariant(entityplayer)
	local tearflags = BitSet128()
	local forcesmallbomb = true
	entityplayer:GetBombVariant(tearflags, forcesmallbomb)
end

function EntityPlayerTest:TestGetBrokenHearts(entityplayer)
	entityplayer:GetBrokenHearts()
end

function EntityPlayerTest:TestGetCard(entityplayer)
	local slotid = 1
	entityplayer:GetCard(slotid)
end

function EntityPlayerTest:TestGetCardRNG(entityplayer)
	local id = 1
	entityplayer:GetCardRNG(id)
end

function EntityPlayerTest:TestGetCollectibleCount(entityplayer)
	entityplayer:GetCollectibleCount()
end

function EntityPlayerTest:TestGetCollectibleNum(entityplayer)
	local collectible = 1
	local onlycounttrueitems = true
	local ignorespoof = true
	entityplayer:GetCollectibleNum(collectible, onlycounttrueitems, ignorespoof)
end

function EntityPlayerTest:TestGetCollectibleRNG(entityplayer)
	local id = 1
	entityplayer:GetCollectibleRNG(id)
end

function EntityPlayerTest:TestGetCostumeNullPos(entityplayer)
	local nullframename = "hello"
	local headscale = true
	local direction = Vector(1,1)
	entityplayer:GetCostumeNullPos(nullframename, headscale, direction)
end

function EntityPlayerTest:TestGetDamageCooldown(entityplayer)
	entityplayer:GetDamageCooldown()
end

function EntityPlayerTest:TestGetEffectiveBloodCharge(entityplayer)
	entityplayer:GetEffectiveBloodCharge()
end

function EntityPlayerTest:TestGetEffectiveMaxHearts(entityplayer)
	entityplayer:GetEffectiveMaxHearts()
end

function EntityPlayerTest:TestGetEffectiveSoulCharge(entityplayer)
	entityplayer:GetEffectiveSoulCharge()
end

function EntityPlayerTest:TestGetEffects(entityplayer)
	entityplayer:GetEffects()
end

function EntityPlayerTest:TestGetExtraLives(entityplayer)
	entityplayer:GetExtraLives()
end

function EntityPlayerTest:TestGetFireDirection(entityplayer)
	entityplayer:GetFireDirection()
end

function EntityPlayerTest:TestGetFlyingOffset(entityplayer)
	entityplayer:GetFlyingOffset()
end

function EntityPlayerTest:TestGetGreedDonationBreakChance(entityplayer)
	entityplayer:GetGreedDonationBreakChance()
end

function EntityPlayerTest:TestGetHeadColor(entityplayer)
	entityplayer:GetHeadColor()
end

function EntityPlayerTest:TestGetHeadDirection(entityplayer)
	entityplayer:GetHeadDirection()
end

function EntityPlayerTest:TestGetHeartLimit(entityplayer)
	entityplayer:GetHeartLimit()
end

function EntityPlayerTest:TestGetJarFlies(entityplayer)
	entityplayer:GetJarFlies()
end

function EntityPlayerTest:TestGetJarHearts(entityplayer)
	entityplayer:GetJarHearts()
end

function EntityPlayerTest:TestGetLaserOffset(entityplayer)
	local id = 1
	local direction = Vector(1,1)
	entityplayer:GetLaserOffset(id, direction)
end

function EntityPlayerTest:TestGetLastActionTriggers(entityplayer)
	entityplayer:GetLastActionTriggers()
end

function EntityPlayerTest:TestGetLastDamageFlags(entityplayer)
	entityplayer:GetLastDamageFlags()
end

function EntityPlayerTest:TestGetLastDamageSource(entityplayer)
	entityplayer:GetLastDamageSource()
end

function EntityPlayerTest:TestGetLastDirection(entityplayer)
	entityplayer:GetLastDirection()
end

function EntityPlayerTest:TestGetMainTwin(entityplayer)
	entityplayer:GetMainTwin()
end

function EntityPlayerTest:TestGetMaxPocketItems(entityplayer)
	entityplayer:GetMaxPocketItems()
end

function EntityPlayerTest:TestGetMaxPoopMana(entityplayer)
	entityplayer:GetMaxPoopMana()
end

function EntityPlayerTest:TestGetMaxTrinkets(entityplayer)
	entityplayer:GetMaxTrinkets()
end

function EntityPlayerTest:TestGetModelingClayEffect(entityplayer)
	entityplayer:GetModelingClayEffect()
end

function EntityPlayerTest:TestGetMovementDirection(entityplayer)
	entityplayer:GetMovementDirection()
end

function EntityPlayerTest:TestGetMovementInput(entityplayer)
	entityplayer:GetMovementInput()
end

function EntityPlayerTest:TestGetMovementJoystick(entityplayer)
	entityplayer:GetMovementJoystick()
end

function EntityPlayerTest:TestGetMovementVector(entityplayer)
	entityplayer:GetMovementVector()
end

function EntityPlayerTest:TestGetMultiShotParams(entityplayer)
	local weapontype = 1
	entityplayer:GetMultiShotParams(weapontype)
end

function EntityPlayerTest:TestGetMultiShotPositionVelocity(entityplayer)
	local loopindex = 1
	local weapontype = 1
	local shotdirection = Vector(1,1)
	local shotspeed = 1
	local params = Isaac.GetPlayer():GetMultiShotParams(1)
	entityplayer:GetMultiShotPositionVelocity(loopindex, weapontype, shotdirection, shotspeed, params)
end

function EntityPlayerTest:TestGetName(entityplayer)
	entityplayer:GetName()
end

function EntityPlayerTest:TestGetNPCTarget(entityplayer)
	entityplayer:GetNPCTarget()
end

function EntityPlayerTest:TestGetNumBlueFlies(entityplayer)
	entityplayer:GetNumBlueFlies()
end

function EntityPlayerTest:TestGetNumBlueSpiders(entityplayer)
	entityplayer:GetNumBlueSpiders()
end

function EntityPlayerTest:TestGetNumBombs(entityplayer)
	entityplayer:GetNumBombs()
end

function EntityPlayerTest:TestGetNumCoins(entityplayer)
	entityplayer:GetNumCoins()
end

function EntityPlayerTest:TestGetNumGigaBombs(entityplayer)
	entityplayer:GetNumGigaBombs()
end

function EntityPlayerTest:TestGetNumKeys(entityplayer)
	entityplayer:GetNumKeys()
end

function EntityPlayerTest:TestGetOtherTwin(entityplayer)
	entityplayer:GetOtherTwin()
end

function EntityPlayerTest:TestGetPill(entityplayer)
	local slotid = 1
	entityplayer:GetPill(slotid)
end

function EntityPlayerTest:TestGetPillRNG(entityplayer)
	local id = 1
	entityplayer:GetPillRNG(id)
end

function EntityPlayerTest:TestGetPlayerType(entityplayer)
	entityplayer:GetPlayerType()
end

function EntityPlayerTest:TestGetPocketItem(entityplayer)
	local slot = 1
	entityplayer:GetPocketItem(slot)
end

function EntityPlayerTest:TestGetPoopMana(entityplayer)
	entityplayer:GetPoopMana()
end

function EntityPlayerTest:TestGetPoopSpell(entityplayer)
	local position = 1
	entityplayer:GetPoopSpell(position)
end

function EntityPlayerTest:TestGetRecentMovementVector(entityplayer)
	entityplayer:GetRecentMovementVector()
end

function EntityPlayerTest:TestGetShootingInput(entityplayer)
	entityplayer:GetShootingInput()
end

function EntityPlayerTest:TestGetShootingJoystick(entityplayer)
	entityplayer:GetShootingJoystick()
end

function EntityPlayerTest:TestGetSmoothBodyRotation(entityplayer)
	entityplayer:GetSmoothBodyRotation()
end

function EntityPlayerTest:TestGetSubPlayer(entityplayer)
	entityplayer:GetSubPlayer()
end

function EntityPlayerTest:TestGetTearHitParams(entityplayer)
	local weapontype = 1
	local damagescale = 1
	local teardisplacement = 1
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:GetTearHitParams(weapontype, damagescale, teardisplacement, source)
	source:Remove()
end

function EntityPlayerTest:TestGetTearMovementInheritance(entityplayer)
	local shotdirection = Vector(1,1)
	entityplayer:GetTearMovementInheritance(shotdirection)
end

function EntityPlayerTest:TestGetTotalDamageTaken(entityplayer)
	entityplayer:GetTotalDamageTaken()
end

function EntityPlayerTest:TestGetTractorBeam(entityplayer)
	entityplayer:GetTractorBeam()
end

function EntityPlayerTest:TestGetTrinket(entityplayer)
	local trinketindex = 1
	entityplayer:GetTrinket(trinketindex)
end

function EntityPlayerTest:TestGetTrinketMultiplier(entityplayer)
	local trinketid = 1
	entityplayer:GetTrinketMultiplier(trinketid)
end

function EntityPlayerTest:TestGetTrinketRNG(entityplayer)
	local trinketid = 1
	entityplayer:GetTrinketRNG(trinketid)
end

function EntityPlayerTest:TestGetVelocityBeforeUpdate(entityplayer)
	entityplayer:GetVelocityBeforeUpdate()
end

function EntityPlayerTest:TestGetZodiacEffect(entityplayer)
	entityplayer:GetZodiacEffect()
end

function EntityPlayerTest:TestHasCollectible(entityplayer)
	local collectible = 1
	local ignoremodifiers = true
	local ignorespoof = true
	entityplayer:HasCollectible(collectible, ignoremodifiers, ignorespoof)
end

function EntityPlayerTest:TestHasCurseMistEffect(entityplayer)
	entityplayer:HasCurseMistEffect()
end

function EntityPlayerTest:TestHasFullHearts(entityplayer)
	entityplayer:HasFullHearts()
end

function EntityPlayerTest:TestHasFullHeartsAndSoulHearts(entityplayer)
	entityplayer:HasFullHeartsAndSoulHearts()
end

function EntityPlayerTest:TestHasGoldenBomb(entityplayer)
	entityplayer:HasGoldenBomb()
end

function EntityPlayerTest:TestHasGoldenKey(entityplayer)
	entityplayer:HasGoldenKey()
end

function EntityPlayerTest:TestHasInvincibility(entityplayer)
	local flags = 1
	entityplayer:HasInvincibility(flags)
end

function EntityPlayerTest:TestHasPlayerForm(entityplayer)
	local form = 1
	entityplayer:HasPlayerForm(form)
end

function EntityPlayerTest:TestHasTimedItem(entityplayer)
	entityplayer:HasTimedItem()
end

function EntityPlayerTest:TestHasTrinket(entityplayer)
	local trinkettype = 1
	local ignoremodifiers = true
	entityplayer:HasTrinket(trinkettype, ignoremodifiers)
end

function EntityPlayerTest:TestHasWeaponType(entityplayer)
	local weapontype = 1
	entityplayer:HasWeaponType(weapontype)
end

function EntityPlayerTest:TestInitBabySkin(entityplayer)
	entityplayer:InitBabySkin()
end

function EntityPlayerTest:TestIsBlackHeart(entityplayer)
	local heart = 1
	entityplayer:IsBlackHeart(heart)
end

function EntityPlayerTest:TestIsBoneHeart(entityplayer)
	local heart = 1
	entityplayer:IsBoneHeart(heart)
end

function EntityPlayerTest:TestIsCoopGhost(entityplayer)
	entityplayer:IsCoopGhost()
end

function EntityPlayerTest:TestIsExtraAnimationFinished(entityplayer)
	entityplayer:IsExtraAnimationFinished()
end

function EntityPlayerTest:TestIsFullSpriteRendering(entityplayer)
	entityplayer:IsFullSpriteRendering()
end

function EntityPlayerTest:TestIsHeldItemVisible(entityplayer)
	entityplayer:IsHeldItemVisible()
end

function EntityPlayerTest:TestIsHoldingItem(entityplayer)
	entityplayer:IsHoldingItem()
end

function EntityPlayerTest:TestIsItemQueueEmpty(entityplayer)
	entityplayer:IsItemQueueEmpty()
end

function EntityPlayerTest:TestIsPosInSpotLight(entityplayer)
	local position = Vector(1,1)
	entityplayer:IsPosInSpotLight(position)
end

function EntityPlayerTest:TestIsSubPlayer(entityplayer)
	entityplayer:IsSubPlayer()
end

function EntityPlayerTest:TestNeedsCharge(entityplayer)
	local activeslot = 1
	entityplayer:NeedsCharge(activeslot)
end

function EntityPlayerTest:TestPlayExtraAnimation(entityplayer)
	local animation = "hello"
	entityplayer:PlayExtraAnimation(animation)
end

function EntityPlayerTest:TestQueueExtraAnimation(entityplayer)
	local animation = "hello"
	entityplayer:QueueExtraAnimation(animation)
end

function EntityPlayerTest:TestQueueItem(entityplayer)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local charge = 1
	local touched = true
	local golden = true
	local vardata = 1
	entityplayer:QueueItem(item, charge, touched, golden, vardata)
end

function EntityPlayerTest:TestRemoveBlackHeart(entityplayer)
	local blackheart = 1
	entityplayer:RemoveBlackHeart(blackheart)
end

function EntityPlayerTest:TestRemoveBlueFly(entityplayer)
	entityplayer:RemoveBlueFly()
end

function EntityPlayerTest:TestRemoveBlueSpider(entityplayer)
	entityplayer:RemoveBlueSpider()
end

function EntityPlayerTest:TestRemoveCollectible(entityplayer)
	local collectibletype = 1
	local ignoremodifiers = true
	local activeslot = 1
	local removefromplayerform = true
	entityplayer:RemoveCollectible(collectibletype, ignoremodifiers, activeslot, removefromplayerform)
end

function EntityPlayerTest:TestRemoveCostume(entityplayer)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	entityplayer:RemoveCostume(item)
end

function EntityPlayerTest:TestRemoveCurseMistEffect(entityplayer)
	entityplayer:RemoveCurseMistEffect()
end

function EntityPlayerTest:TestRemoveGoldenBomb(entityplayer)
	entityplayer:RemoveGoldenBomb()
end

function EntityPlayerTest:TestRemoveGoldenKey(entityplayer)
	entityplayer:RemoveGoldenKey()
end

function EntityPlayerTest:TestRemoveSkinCostume(entityplayer)
	entityplayer:RemoveSkinCostume()
end

function EntityPlayerTest:TestRenderBody(entityplayer)
	local position = Vector(1,1)
	entityplayer:RenderBody(position)
end

function EntityPlayerTest:TestRenderGlow(entityplayer)
	local position = Vector(1,1)
	entityplayer:RenderGlow(position)
end

function EntityPlayerTest:TestRenderHead(entityplayer)
	local position = Vector(1,1)
	entityplayer:RenderHead(position)
end

function EntityPlayerTest:TestRenderTop(entityplayer)
	local position = Vector(1,1)
	entityplayer:RenderTop(position)
end

function EntityPlayerTest:TestReplaceCostumeSprite(entityplayer)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local spritepath = "hello"
	local spriteid = 1
	entityplayer:ReplaceCostumeSprite(item, spritepath, spriteid)
end

function EntityPlayerTest:TestResetDamageCooldown(entityplayer)
	entityplayer:ResetDamageCooldown()
end

function EntityPlayerTest:TestResetItemState(entityplayer)
	entityplayer:ResetItemState()
end

function EntityPlayerTest:TestRespawnFamiliars(entityplayer)
	entityplayer:RespawnFamiliars()
end

function EntityPlayerTest:TestRevive(entityplayer)
	entityplayer:Revive()
end

function EntityPlayerTest:TestSetActiveCharge(entityplayer)
	local charge = 1
	local activeslot = 1
	entityplayer:SetActiveCharge(charge, activeslot)
end

function EntityPlayerTest:TestSetBloodCharge(entityplayer)
	local originalVal = entityplayer:GetBloodCharge()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetBloodCharge(val)
		test.AssertEquals(entityplayer:GetBloodCharge(), val)
	end
	entityplayer:SetBloodCharge(originalVal)
end

function EntityPlayerTest:TestSetCard(entityplayer)
	local slotid = 1
	local id = 1
	entityplayer:SetCard(slotid, id)
end

function EntityPlayerTest:TestSetFullHearts(entityplayer)
	entityplayer:SetFullHearts()
end

function EntityPlayerTest:TestSetMinDamageCooldown(entityplayer)
	local damagecooldown = 1
	entityplayer:SetMinDamageCooldown(damagecooldown)
end

function EntityPlayerTest:TestSetPill(entityplayer)
	local slotid = 1
	local pill = 1
	entityplayer:SetPill(slotid, pill)
end

function EntityPlayerTest:TestSetPocketActiveItem(entityplayer)
	local keepinpools = true
	entityplayer:SetPocketActiveItem(CollectibleType.COLLECTIBLE_BIBLE, ActiveSlot.SLOT_POCKET, keepinpools)
end

function EntityPlayerTest:TestSetShootingCooldown(entityplayer)
	local cooldown = 1
	entityplayer:SetShootingCooldown(cooldown)
end

function EntityPlayerTest:TestSetSoulCharge(entityplayer)
	local originalVal = entityplayer:GetSoulCharge()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetSoulCharge(val)
		test.AssertEquals(entityplayer:GetSoulCharge(), val)
	end
	entityplayer:SetSoulCharge(originalVal)
end

function EntityPlayerTest:TestShootRedCandle(entityplayer)
	local direction = Vector(1,1)
	entityplayer:ShootRedCandle(direction)
end

function EntityPlayerTest:TestSpawnMawOfVoid(entityplayer)
	local timeout = 1
	entityplayer:SpawnMawOfVoid(timeout)
end

function EntityPlayerTest:TestStopExtraAnimation(entityplayer)
	entityplayer:StopExtraAnimation()
end

function EntityPlayerTest:TestSwapActiveItems(entityplayer)
	entityplayer:SwapActiveItems()
end

function EntityPlayerTest:TestThrowBlueSpider(entityplayer)
	local position = Vector(1,1)
	local target = Vector(1,1)
	entityplayer:ThrowBlueSpider(position, target)
end

function EntityPlayerTest:TestThrowFriendlyDip(entityplayer)
	local subtype = 1
	local position = Vector(1,1)
	local target = Vector(1,1)
	entityplayer:ThrowFriendlyDip(subtype, position, target)
end

function EntityPlayerTest:TestThrowHeldEntity(entityplayer)
	local velocity = Vector(1,1)
	entityplayer:ThrowHeldEntity(velocity)
end

function EntityPlayerTest:TestTriggerBookOfVirtues(entityplayer)
	local collectibletype = 1
	local charge = 1
	entityplayer:TriggerBookOfVirtues(collectibletype, charge)
end

function EntityPlayerTest:TestTryHoldEntity(entityplayer)
	local entity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:TryHoldEntity(entity)
	entity:Remove()
end

function EntityPlayerTest:TestTryHoldTrinket(entityplayer)
	local trinkettype = 1
	entityplayer:TryHoldTrinket(trinkettype)
end

function EntityPlayerTest:TestTryRemoveCollectibleCostume(entityplayer)
	local collectible = 1
	local keeppersistent = true
	entityplayer:TryRemoveCollectibleCostume(collectible, keeppersistent)
end

function EntityPlayerTest:TestTryRemoveNullCostume(entityplayer)
	local nullid = 1
	entityplayer:TryRemoveNullCostume(nullid)
end

function EntityPlayerTest:TestTryRemoveTrinket(entityplayer)
	local trinkettype = 1
	entityplayer:TryRemoveTrinket(trinkettype)
end

function EntityPlayerTest:TestTryRemoveTrinketCostume(entityplayer)
	local trinket = 1
	entityplayer:TryRemoveTrinketCostume(trinket)
end

function EntityPlayerTest:TestTryUseKey(entityplayer)
	entityplayer:TryUseKey()
end

function EntityPlayerTest:TestUpdateCanShoot(entityplayer)
	entityplayer:UpdateCanShoot()
end

function EntityPlayerTest:TestUseActiveItem(entityplayer)
	local item = 1
	local showanim = true
	local keepactiveitem = true
	local allownonmainplayer = true
	local toaddcostume = true
	local slot = 1
	local customvardata = 1
	entityplayer:UseActiveItem(item, showanim, keepactiveitem, allownonmainplayer, toaddcostume, slot, customvardata)
end

function EntityPlayerTest:TestUseCard(entityplayer)
	local id = 1
	local useflags = 1
	entityplayer:UseCard(id, useflags)
end

function EntityPlayerTest:TestUsePill(entityplayer)
	local id = 1
	local pillcolor = 1
	local useflags = 1
	entityplayer:UsePill(id, pillcolor, useflags)
end

function EntityPlayerTest:TestUsePoopSpell(entityplayer)
	local poopspelltype = 1
	entityplayer:UsePoopSpell(poopspelltype)
end

function EntityPlayerTest:TestWillPlayerRevive(entityplayer)
	entityplayer:WillPlayerRevive()
end

function EntityPlayerTest:TestAddCollectibleEffect(entityplayer)
	local ctype = 1
	local applycostume = true
	local cooldown = 1
	local additive = true
	entityplayer:AddCollectibleEffect(ctype, applycostume, cooldown, additive)
end

function EntityPlayerTest:TestAddNullItemEffect(entityplayer)
	local nullitemid = 1
	local applycostume = true
	local cooldown = 1
	local additive = true
	entityplayer:AddNullItemEffect(nullitemid, applycostume, cooldown, additive)
end

function EntityPlayerTest:TestAddActiveCharge(player)
	player:AddCollectible(CollectibleType.COLLECTIBLE_D6)

	player:SetActiveCharge(0)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 0)

	local flashhud = true
	local overcharge = false
	local force = false

	player:AddActiveCharge(1, ActiveSlot.SLOT_PRIMARY, flashhud, overcharge, force)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 1)

	player:AddActiveCharge(5, ActiveSlot.SLOT_PRIMARY, flashhud, overcharge, force)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 6)

	player:AddActiveCharge(1, ActiveSlot.SLOT_PRIMARY, flashhud, overcharge, force)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 6)

	player:AddActiveCharge(1, -1, flashhud, overcharge, force)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 6)

	overcharge = true
	player:AddActiveCharge(1, ActiveSlot.SLOT_PRIMARY, flashhud, overcharge, force)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 7)

	player:AddActiveCharge(1, -1, flashhud, overcharge, force)
	test.AssertEquals(player:GetActiveCharge() + player:GetBatteryCharge(), 8)
end

function EntityPlayerTest:TestAddBoneOrbital(entityplayer)
	local position = Vector(1,1)
	entityplayer:AddBoneOrbital(position)
end

function EntityPlayerTest:TestAddCustomCacheTag(entityplayer)
	local string = "hello"
	local evaluateitems = true
	entityplayer:AddCustomCacheTag(string, evaluateitems)
end

function EntityPlayerTest:TestAddInnateCollectible(entityplayer)
	local collectible = 1
	local amount = 1
	entityplayer:AddInnateCollectible(collectible, amount)
end

function EntityPlayerTest:TestAddLeprosy(entityplayer)
	entityplayer:AddLeprosy()
end

function EntityPlayerTest:TestAddLocust(entityplayer)
	local collectible = 1
	local position = Vector(1,1)
	entityplayer:AddLocust(collectible, position)
end

function EntityPlayerTest:TestAddUrnSouls(entityplayer)
	local count = 1
	entityplayer:AddUrnSouls(count)
end

function EntityPlayerTest:TestBlockCollectible(entityplayer)
	local collectible = 1
	entityplayer:BlockCollectible(collectible)
end

function EntityPlayerTest:TestCanAddCollectibleToInventory(entityplayer)
	local collectible = 1
	entityplayer:CanAddCollectibleToInventory(collectible)
end

function EntityPlayerTest:TestCanCrushRocks(entityplayer)
	entityplayer:CanCrushRocks()
end

function EntityPlayerTest:TestCanOverrideActiveItem(entityplayer)
	local slot = 1
	entityplayer:CanOverrideActiveItem(slot)
end

function EntityPlayerTest:TestCanUsePill(entityplayer)
	local id = 1
	entityplayer:CanUsePill(id)
end

function EntityPlayerTest:TestCheckFamiliarEx(entityplayer)
	local familiarvariant = 1
	local targetcount = 1
	local rng = RNG()
	local sourceitemconfigitem = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local familiarsubtype = 1
	entityplayer:CheckFamiliarEx(familiarvariant, targetcount, rng, sourceitemconfigitem, familiarsubtype)
end

function EntityPlayerTest:TestClearCollectibleAnim(entityplayer)
	local collectible = 1
	entityplayer:ClearCollectibleAnim(collectible)
end

function EntityPlayerTest:TestClearQueueItem(entityplayer)
	entityplayer:ClearQueueItem()
end

function EntityPlayerTest:TestDropCollectible(entityplayer)
	local collectible = 1
	local existingpedestal = Isaac.Spawn(EntityType.ENTITY_PICKUP, 20, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToPickup()
	local removefromplayerform = true
	entityplayer:DropCollectible(collectible, existingpedestal, removefromplayerform)
	existingpedestal:Remove()
end

function EntityPlayerTest:TestDropCollectibleByHistoryIndex(entityplayer)
	local idx = 1
	local existingpedestal = Isaac.Spawn(EntityType.ENTITY_PICKUP, 20, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToPickup()
	entityplayer:DropCollectibleByHistoryIndex(idx, existingpedestal)
	existingpedestal:Remove()
end

function EntityPlayerTest:TestEnableWeaponType(entityplayer)
	local weapon = 1
	local set = true
	entityplayer:EnableWeaponType(weapon, set)
end

function EntityPlayerTest:TestFireBrimstoneBall(entityplayer)
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local offset = Vector(1,1)
	entityplayer:FireBrimstoneBall(position, velocity, offset)
end

function EntityPlayerTest:TestGetActiveItemDesc(entityplayer)
	local slot = 1
	entityplayer:GetActiveItemDesc(slot)
end

function EntityPlayerTest:TestGetActiveItemSlot(entityplayer)
	local collectible = 1
	entityplayer:GetActiveItemSlot(collectible)
end

function EntityPlayerTest:TestGetActiveMaxCharge(entityplayer)
	local slot = 1
	entityplayer:GetActiveMaxCharge(slot)
end

function EntityPlayerTest:TestGetActiveMinUsableCharge(entityplayer)
	local slot = 1
	entityplayer:GetActiveMinUsableCharge(slot)
end

function EntityPlayerTest:TestGetActiveWeaponNumFired(entityplayer)
	entityplayer:GetActiveWeaponNumFired()
end

function EntityPlayerTest:TestGetBagOfCraftingContent(entityplayer)
	entityplayer:GetBagOfCraftingContent()
end

function EntityPlayerTest:TestGetBagOfCraftingSlot(entityplayer)
	local slotid = 1
	entityplayer:GetBagOfCraftingSlot(slotid)
end

function EntityPlayerTest:TestGetBodyMoveDirection(entityplayer)
	entityplayer:GetBodyMoveDirection()
end

function EntityPlayerTest:TestGetCambionPregnancyLevel(entityplayer)
	entityplayer:GetCambionPregnancyLevel()
end

function EntityPlayerTest:TestGetCollectiblesList(entityplayer)
	entityplayer:GetCollectiblesList()
end

function EntityPlayerTest:TestGetCostumeLayerMap(entityplayer)
	entityplayer:GetCostumeLayerMap()
end

function EntityPlayerTest:TestGetCostumeSpriteDescs(entityplayer)
	entityplayer:GetCostumeSpriteDescs()
end

function EntityPlayerTest:TestGetCustomCacheValue(entityplayer)
	local customcachetag = "hello"
	entityplayer:GetCustomCacheValue(customcachetag)
end

function EntityPlayerTest:TestGetDeadEyeCharge(entityplayer)
	entityplayer:GetDeadEyeCharge()
end

function EntityPlayerTest:TestGetDeathAnimName(entityplayer)
	entityplayer:GetDeathAnimName()
end

function EntityPlayerTest:TestGetEnterPosition(entityplayer)
	entityplayer:GetEnterPosition()
end

function EntityPlayerTest:TestGetEntityConfigPlayer(entityplayer)
	entityplayer:GetEntityConfigPlayer()
end

function EntityPlayerTest:TestGetEpiphoraCharge(entityplayer)
	entityplayer:GetEpiphoraCharge()
end

function EntityPlayerTest:TestGetFlippedForm(entityplayer)
	entityplayer:GetFlippedForm()
end

function EntityPlayerTest:TestGetFocusEntity(entityplayer)
	entityplayer:GetFocusEntity()
end

function EntityPlayerTest:TestGetFootprintColor(entityplayer)
	local leftfootprint = true
	entityplayer:GetFootprintColor(leftfootprint)
end

function EntityPlayerTest:TestGetGlitchBabySubType(entityplayer)
	entityplayer:GetGlitchBabySubType()
end

function EntityPlayerTest:TestGetGlyphOfBalanceDrop(entityplayer)
	local variant = 1
	local subtype = 1
	entityplayer:GetGlyphOfBalanceDrop(variant, subtype)
end

function EntityPlayerTest:TestGetGreedsGulletHearts(entityplayer)
	entityplayer:GetGreedsGulletHearts()
end

function EntityPlayerTest:TestGetHeldEntity(entityplayer)
	entityplayer:GetHeldEntity()
end

function EntityPlayerTest:TestGetHeldSprite(entityplayer)
	entityplayer:GetHeldSprite()
end

function EntityPlayerTest:TestGetHistory(entityplayer)
	entityplayer:GetHistory()
end

function EntityPlayerTest:TestGetMarkedTarget(entityplayer)
	entityplayer:GetMarkedTarget()
end

function EntityPlayerTest:TestGetMaxBombs(entityplayer)
	entityplayer:GetMaxBombs()
end

function EntityPlayerTest:TestGetMaxCoins(entityplayer)
	entityplayer:GetMaxCoins()
end

function EntityPlayerTest:TestGetMaxKeys(entityplayer)
	entityplayer:GetMaxKeys()
end

function EntityPlayerTest:TestGetMaxPeeBurstCooldown(entityplayer)
	entityplayer:GetMaxPeeBurstCooldown()
end

function EntityPlayerTest:TestGetMetronomeCollectibleID(entityplayer)
	entityplayer:GetMetronomeCollectibleID()
end

function EntityPlayerTest:TestGetMovingBoxContents(entityplayer)
	entityplayer:GetMovingBoxContents()
end

function EntityPlayerTest:TestGetPeeBurstCooldown(entityplayer)
	entityplayer:GetPeeBurstCooldown()
end

function EntityPlayerTest:TestGetPlayerFormCounter(entityplayer)
	local playerformid = 1
	entityplayer:GetPlayerFormCounter(playerformid)
end

function EntityPlayerTest:TestGetPlayerIndex(entityplayer)
	entityplayer:GetPlayerIndex()
end

function EntityPlayerTest:TestAddSmeltedTrinket(entityplayer)
	entityplayer:AddSmeltedTrinket(TrinketType.TRINKET_WOODEN_CROSS, true)
	entityplayer:AddSmeltedTrinket(TrinketType.TRINKET_SWALLOWED_PENNY | TrinketType.TRINKET_GOLDEN_FLAG, false)

	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_WOODEN_CROSS].trinketAmount, 1)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_WOODEN_CROSS].goldenTrinketAmount, 0)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_SWALLOWED_PENNY].trinketAmount, 0)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_SWALLOWED_PENNY].goldenTrinketAmount, 1)

	test.AssertTrue(entityplayer:GetEffects():HasCollectibleEffect(CollectibleType.COLLECTIBLE_HOLY_MANTLE))

	entityplayer:TryRemoveSmeltedTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)

	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_WOODEN_CROSS].trinketAmount, 1)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_WOODEN_CROSS].goldenTrinketAmount, 0)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_SWALLOWED_PENNY].trinketAmount, 0)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_SWALLOWED_PENNY].goldenTrinketAmount, 0)

	entityplayer:TryRemoveSmeltedTrinket(TrinketType.TRINKET_WOODEN_CROSS)
	test.AssertEquals(entityplayer:GetSmeltedTrinkets()[TrinketType.TRINKET_WOODEN_CROSS].trinketAmount, 0)
end

function EntityPlayerTest:TestGetSpecialGridCollision(entityplayer)
	local position = Vector(1,1)
	entityplayer:GetSpecialGridCollision(position)
end

function EntityPlayerTest:TestGetSpoofedCollectiblesList(entityplayer)
	entityplayer:GetSpoofedCollectiblesList()
end

function EntityPlayerTest:TestGetTearDisplacement(entityplayer)
	entityplayer:GetTearDisplacement()
end

function EntityPlayerTest:TestGetTotalActiveCharge(entityplayer)
	local slot = 1
	entityplayer:GetTotalActiveCharge(slot)
end

function EntityPlayerTest:TestGetUrnSouls(entityplayer)
	entityplayer:GetUrnSouls()
end


function EntityPlayerTest:TestVoidedCollectibles(entityplayer)
	test.AssertEquals(#entityplayer:GetVoidedCollectiblesList(), 0)

	entityplayer:AddCollectible(CollectibleType.COLLECTIBLE_VOID)

	local pickup1 = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_SAD_ONION, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local pickup2 = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_D6, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local pickup3 = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_MOMS_BOTTLE_OF_PILLS, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:UseActiveItem(CollectibleType.COLLECTIBLE_VOID, UseFlag.USE_OWNED)
	pickup1:Remove()
	pickup2:Remove()
	pickup3:Remove()

	test.AssertEquals(#entityplayer:GetVoidedCollectiblesList(), 2)
	test.AssertEquals(entityplayer:GetVoidedCollectiblesList()[1], CollectibleType.COLLECTIBLE_D6)
	test.AssertEquals(entityplayer:GetVoidedCollectiblesList()[2], CollectibleType.COLLECTIBLE_MOMS_BOTTLE_OF_PILLS)

	test.AssertFalse(entityplayer:VoidHasCollectible(CollectibleType.COLLECTIBLE_SAD_ONION))
	test.AssertTrue(entityplayer:VoidHasCollectible(CollectibleType.COLLECTIBLE_D6))
	test.AssertTrue(entityplayer:VoidHasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOTTLE_OF_PILLS))

	entityplayer:RemoveCollectible(CollectibleType.COLLECTIBLE_VOID)
	test.AssertFalse(entityplayer:VoidHasCollectible(CollectibleType.COLLECTIBLE_D6))
	test.AssertFalse(entityplayer:VoidHasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOTTLE_OF_PILLS))
end

function EntityPlayerTest:TestGetWeapon(entityplayer)
	local slot = 1
	entityplayer:GetWeapon(slot)
end

function EntityPlayerTest:TestGetWeaponModifiers(entityplayer)
	entityplayer:GetWeaponModifiers()
end

function EntityPlayerTest:TestGetWildCardItem(entityplayer)
	entityplayer:GetWildCardItem()
end

function EntityPlayerTest:TestGetWildCardItemType(entityplayer)
	entityplayer:GetWildCardItemType()
end

function EntityPlayerTest:TestGetWispCollectiblesList(entityplayer)
	entityplayer:GetWispCollectiblesList()
end

function EntityPlayerTest:TestHasChanceRevive(entityplayer)
	entityplayer:HasChanceRevive()
end

function EntityPlayerTest:TestHasGoldenTrinket(entityplayer)
	local trinket = 1
	entityplayer:HasGoldenTrinket(trinket)
end

function EntityPlayerTest:TestHasInstantDeathCurse(entityplayer)
	entityplayer:HasInstantDeathCurse()
end

function EntityPlayerTest:TestHasPoisonImmunity(entityplayer)
	entityplayer:HasPoisonImmunity()
end

function EntityPlayerTest:TestIncrementPlayerFormCounter(entityplayer)
	local form = 1
	local count = 1
	entityplayer:IncrementPlayerFormCounter(form, count)
end

function EntityPlayerTest:TestInitPostLevelInitStats(entityplayer)
	entityplayer:InitPostLevelInitStats()
end

function EntityPlayerTest:TestInitTwin(entityplayer)
	local playertype = 1
	entityplayer:InitTwin(playertype)
end

function EntityPlayerTest:TestIsCollectibleAnimFinished(entityplayer)
	local collectible = 1
	local animation = "hello"
	entityplayer:IsCollectibleAnimFinished(collectible, animation)
end

function EntityPlayerTest:TestIsCollectibleBlocked(entityplayer)
	local collectible = 1
	entityplayer:IsCollectibleBlocked(collectible)
end

function EntityPlayerTest:TestIsEntityValidTarget(entityplayer)
	local entity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityplayer:IsEntityValidTarget(entity)
	entity:Remove()
end

function EntityPlayerTest:TestIsFootstepFrame(entityplayer)
	local foot = 1
	entityplayer:IsFootstepFrame(foot)
end

function EntityPlayerTest:TestIsHeadless(entityplayer)
	entityplayer:IsHeadless()
end

function EntityPlayerTest:TestIsHologram(entityplayer)
	entityplayer:IsHologram()
end

function EntityPlayerTest:TestIsInvisible(entityplayer)
	entityplayer:IsInvisible()
end

function EntityPlayerTest:TestIsLocalPlayer(entityplayer)
	entityplayer:IsLocalPlayer()
end

function EntityPlayerTest:TestIsPacifist(entityplayer)
	entityplayer:IsPacifist()
end

function EntityPlayerTest:TestIsUrethraBlocked(entityplayer)
	entityplayer:IsUrethraBlocked()
end

--[[
function EntityPlayerTest:TestMorphToCoopGhost(entityplayer)
	entityplayer:MorphToCoopGhost()
end
]]

function EntityPlayerTest:TestPlayCollectibleAnim(entityplayer)
	local collectible = 1
	local checkbodylayers = true
	local animationname = "hello"
	local frame = 1
	entityplayer:PlayCollectibleAnim(collectible, checkbodylayers, animationname, frame)
end

function EntityPlayerTest:TestPlayDelayedSFX(entityplayer)
	local id = 1
	local sounddelay = 1
	local framedelay = 1
	local volume = 1
	entityplayer:PlayDelayedSFX(id, sounddelay, framedelay, volume)
end

function EntityPlayerTest:TestRemoveCollectibleByHistoryIndex(entityplayer)
	local index = 1
	entityplayer:RemoveCollectibleByHistoryIndex(index)
end

function EntityPlayerTest:TestRemovePocketItem(entityplayer)
	local slot = 1
	entityplayer:RemovePocketItem(slot)
end

function EntityPlayerTest:TestRemovePoopSpell(entityplayer)
	local position = 1
	entityplayer:RemovePoopSpell(position)
end

function EntityPlayerTest:TestRerollAllCollectibles(entityplayer)
	local rng = RNG()
	local includeactiveitems = true
	entityplayer:RerollAllCollectibles(rng, includeactiveitems)
end

function EntityPlayerTest:TestResetPlayer(entityplayer)
	entityplayer:ResetPlayer()
end

function EntityPlayerTest:TestReviveCoopGhost(entityplayer)
	entityplayer:ReviveCoopGhost()
end

function EntityPlayerTest:TestSalvageCollectible(entityplayer)
	local collectible = 1
	local position = Vector(1,1)
	local rng = RNG()
	local pool = 1
	entityplayer:SalvageCollectible(collectible, position, rng, pool)
end

function EntityPlayerTest:TestSetActionHoldDrop(entityplayer)
	local originalVal = entityplayer:GetActionHoldDrop()
	for _, val in pairs(test.TestUnsignedInts) do
		entityplayer:SetActionHoldDrop(val)
		test.AssertEquals(entityplayer:GetActionHoldDrop(), val)
	end
	entityplayer:SetActionHoldDrop(originalVal)
end

function EntityPlayerTest:TestSetActiveVarData(entityplayer)
	local vardata = 1
	local slot = 1
	entityplayer:SetActiveVarData(vardata, slot)
end

function EntityPlayerTest:TestSetBagOfCraftingContent(entityplayer)
	local contenttable = {1}
	entityplayer:SetBagOfCraftingContent(contenttable)
end

function EntityPlayerTest:TestSetBagOfCraftingOutput(entityplayer)
	local originalVal = entityplayer:GetBagOfCraftingOutput()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetBagOfCraftingOutput(val)
		test.AssertEquals(entityplayer:GetBagOfCraftingOutput(), val)
	end
	entityplayer:SetBagOfCraftingOutput(originalVal)
end

function EntityPlayerTest:TestSetBagOfCraftingSlot(entityplayer)
	local slotid = 1
	local pickupid = 1
	entityplayer:SetBagOfCraftingSlot(slotid, pickupid)
end

function EntityPlayerTest:TestSetBlackHeart(entityplayer)
	local blackheart = 1
	entityplayer:SetBlackHeart(blackheart)
end

function EntityPlayerTest:TestSetBladderCharge(entityplayer)
	local originalVal = entityplayer:GetBladderCharge()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetBladderCharge(val)
		test.AssertEquals(entityplayer:GetBladderCharge(), val)
	end
	entityplayer:SetBladderCharge(originalVal)
end

function EntityPlayerTest:TestSetBloodLustCounter(entityplayer)
	local originalVal = entityplayer:GetBloodLustCounter()
	for _, val in pairs(test.TestInt16s) do
		entityplayer:SetBloodLustCounter(val)
		test.AssertEquals(entityplayer:GetBloodLustCounter(), val)
	end
	entityplayer:SetBloodLustCounter(originalVal)
end

function EntityPlayerTest:TestSetBombPlaceDelay(entityplayer)
	local originalVal = entityplayer:GetBombPlaceDelay()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetBombPlaceDelay(val)
		test.AssertEquals(entityplayer:GetBombPlaceDelay(), val)
	end
	entityplayer:SetBombPlaceDelay(originalVal)
end

function EntityPlayerTest:TestSetCanShoot(entityplayer)
	local canshoot = true
	entityplayer:SetCanShoot(canshoot)
end

function EntityPlayerTest:TestSetConceptionFamiliarFlags(entityplayer)
	local originalVal = entityplayer:GetConceptionFamiliarFlags()
	for _, val in pairs(test.TestUnsignedInts) do
		entityplayer:SetConceptionFamiliarFlags(val)
		test.AssertEquals(entityplayer:GetConceptionFamiliarFlags(), val)
	end
	entityplayer:SetConceptionFamiliarFlags(originalVal)
end
--[[
function EntityPlayerTest:TestSetControllerIndex(entityplayer)
	local idx = 1
	entityplayer:SetControllerIndex(idx)
end
]]
function EntityPlayerTest:TestSetDamageModifier(entityplayer)
	local originalVal = entityplayer:GetDamageModifier()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetDamageModifier(val)
		test.AssertEquals(entityplayer:GetDamageModifier(), val)
	end
	entityplayer:SetDamageModifier(originalVal)
end

function EntityPlayerTest:TestSetEdenDamage(entityplayer)
	local originalVal = entityplayer:GetEdenDamage()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetEdenDamage(val)
		test.AssertEquals(entityplayer:GetEdenDamage(), val)
	end
	entityplayer:SetEdenDamage(originalVal)
end

function EntityPlayerTest:TestSetEdenFireDelay(entityplayer)
	local originalVal = entityplayer:GetEdenFireDelay()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetEdenFireDelay(val)
		test.AssertEquals(entityplayer:GetEdenFireDelay(), val)
	end
	entityplayer:SetEdenFireDelay(originalVal)
end

function EntityPlayerTest:TestSetEdenLuck(entityplayer)
	local originalVal = entityplayer:GetEdenLuck()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetEdenLuck(val)
		test.AssertEquals(entityplayer:GetEdenLuck(), val)
	end
	entityplayer:SetEdenLuck(originalVal)
end

function EntityPlayerTest:TestSetEdenRange(entityplayer)
	local originalVal = entityplayer:GetEdenRange()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetEdenRange(val)
		test.AssertEquals(entityplayer:GetEdenRange(), val)
	end
	entityplayer:SetEdenRange(originalVal)
end

function EntityPlayerTest:TestSetEdenShotSpeed(entityplayer)
	local originalVal = entityplayer:GetEdenShotSpeed()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetEdenShotSpeed(val)
		test.AssertEquals(entityplayer:GetEdenShotSpeed(), val)
	end
	entityplayer:SetEdenShotSpeed(originalVal)
end

function EntityPlayerTest:TestSetEdenSpeed(entityplayer)
	local originalVal = entityplayer:GetEdenSpeed()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetEdenSpeed(val)
		test.AssertEquals(entityplayer:GetEdenSpeed(), val)
	end
	entityplayer:SetEdenSpeed(originalVal)
end

function EntityPlayerTest:TestSetEveSumptoriumCharge(entityplayer)
	local originalVal = entityplayer:GetEveSumptoriumCharge()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetEveSumptoriumCharge(val)
		test.AssertEquals(entityplayer:GetEveSumptoriumCharge(), val)
	end
	entityplayer:SetEveSumptoriumCharge(originalVal)
end

function EntityPlayerTest:TestSetFireDelayModifier(entityplayer)
	local originalVal = entityplayer:GetFireDelayModifier()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetFireDelayModifier(val)
		test.AssertEquals(entityplayer:GetFireDelayModifier(), val)
	end
	entityplayer:SetFireDelayModifier(originalVal)
end

function EntityPlayerTest:TestSetFootprintColor(entityplayer)
	local color = KColor(1,1,1,1)
	local rightfoot = true
	entityplayer:SetFootprintColor(color, rightfoot)
end

function EntityPlayerTest:TestSetForgottenSwapFormCooldown(entityplayer)
	local originalVal = entityplayer:GetForgottenSwapFormCooldown()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetForgottenSwapFormCooldown(val)
		test.AssertEquals(entityplayer:GetForgottenSwapFormCooldown(), val)
	end
	entityplayer:SetForgottenSwapFormCooldown(originalVal)
end

function EntityPlayerTest:TestSetGnawedLeafTimer(entityplayer)
	local originalVal = entityplayer:GetGnawedLeafTimer()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetGnawedLeafTimer(val)
		test.AssertEquals(entityplayer:GetGnawedLeafTimer(), val)
	end
	entityplayer:SetGnawedLeafTimer(originalVal)
end

function EntityPlayerTest:TestSetHallowedGroundCountdown(entityplayer)
	local originalVal = entityplayer:GetHallowedGroundCountdown()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetHallowedGroundCountdown(val)
		test.AssertEquals(entityplayer:GetHallowedGroundCountdown(), val)
	end
	entityplayer:SetHallowedGroundCountdown(originalVal)
end

function EntityPlayerTest:TestSetHeadDirection(entityplayer)
	local direction = 1
	local time = 1
	local force = true
	entityplayer:SetHeadDirection(direction, time, force)
end

function EntityPlayerTest:TestSetHeadDirectionLockTime(entityplayer)
	local originalVal = entityplayer:GetHeadDirectionLockTime()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetHeadDirectionLockTime(val)
		test.AssertEquals(entityplayer:GetHeadDirectionLockTime(), val)
	end
	entityplayer:SetHeadDirectionLockTime(originalVal)
end

function EntityPlayerTest:TestSetItemState(entityplayer)
	local originalVal = entityplayer:GetItemState()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetItemState(val)
		test.AssertEquals(entityplayer:GetItemState(), val)
	end
	entityplayer:SetItemState(originalVal)
end

function EntityPlayerTest:TestSetKeepersSackBonus(entityplayer)
	local originalVal = entityplayer:GetKeepersSackBonus()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetKeepersSackBonus(val)
		test.AssertEquals(entityplayer:GetKeepersSackBonus(), val)
	end
	entityplayer:SetKeepersSackBonus(originalVal)
end

function EntityPlayerTest:TestSetLaserColor(entityplayer)
	local originalVal = entityplayer:GetLaserColor()
	for _, val in pairs(test.TestColors) do
		entityplayer:SetLaserColor(val)
		test.AssertEquals(entityplayer:GetLaserColor(), val)
	end
	entityplayer:SetLaserColor(originalVal)
end

function EntityPlayerTest:TestSetLuckModifier(entityplayer)
	local originalVal = entityplayer:GetLuckModifier()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetLuckModifier(val)
		test.AssertEquals(entityplayer:GetLuckModifier(), val)
	end
	entityplayer:SetLuckModifier(originalVal)
end

function EntityPlayerTest:TestSetMaggySwingCooldown(entityplayer)
	local originalVal = entityplayer:GetMaggySwingCooldown()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetMaggySwingCooldown(val)
		test.AssertEquals(entityplayer:GetMaggySwingCooldown(), val)
	end
	entityplayer:SetMaggySwingCooldown(originalVal)
end

function EntityPlayerTest:TestSetMaxBladderCharge(entityplayer)
	local originalVal = entityplayer:GetMaxBladderCharge()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetMaxBladderCharge(val)
		test.AssertEquals(entityplayer:GetMaxBladderCharge(), val)
	end
	entityplayer:SetMaxBladderCharge(originalVal)
end

function EntityPlayerTest:TestSetMegaBlastDuration(entityplayer)
	local originalVal = entityplayer:GetMegaBlastDuration()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetMegaBlastDuration(val)
		test.AssertEquals(entityplayer:GetMegaBlastDuration(), val)
	end
	entityplayer:SetMegaBlastDuration(originalVal)
end

function EntityPlayerTest:TestSetNextUrethraBlockFrame(entityplayer)
	local originalVal = entityplayer:GetNextUrethraBlockFrame()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetNextUrethraBlockFrame(val)
		test.AssertEquals(entityplayer:GetNextUrethraBlockFrame(), val)
	end
	entityplayer:SetNextUrethraBlockFrame(originalVal)
end

function EntityPlayerTest:TestSetPonyCharge(entityplayer)
	local originalVal = entityplayer:GetPonyCharge()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetPonyCharge(val)
		test.AssertEquals(entityplayer:GetPonyCharge(), val)
	end
	entityplayer:SetPonyCharge(originalVal)
end

function EntityPlayerTest:TestSetPoopSpell(entityplayer)
	local slot = 1
	local poopspelltype = 1
	entityplayer:SetPoopSpell(slot, poopspelltype)
end

function EntityPlayerTest:TestSetPurityState(entityplayer)
	local originalVal = entityplayer:GetPurityState()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetPurityState(val)
		test.AssertEquals(entityplayer:GetPurityState(), val)
	end
	entityplayer:SetPurityState(originalVal)
end

function EntityPlayerTest:TestSetRedStewBonusDuration(entityplayer)
	local originalVal = entityplayer:GetRedStewBonusDuration()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetRedStewBonusDuration(val)
		test.AssertEquals(entityplayer:GetRedStewBonusDuration(), val)
	end
	entityplayer:SetRedStewBonusDuration(originalVal)
end

function EntityPlayerTest:TestSetShotSpeedModifier(entityplayer)
	local originalVal = entityplayer:GetShotSpeedModifier()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetShotSpeedModifier(val)
		test.AssertEquals(entityplayer:GetShotSpeedModifier(), val)
	end
	entityplayer:SetShotSpeedModifier(originalVal)
end

function EntityPlayerTest:TestSetSpeedModifier(entityplayer)
	local originalVal = entityplayer:GetSpeedModifier()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetSpeedModifier(val)
		test.AssertEquals(entityplayer:GetSpeedModifier(), val)
	end
	entityplayer:SetSpeedModifier(originalVal)
end

function EntityPlayerTest:TestSetTearPoisonDamage(entityplayer)
	local originalVal = entityplayer:GetTearPoisonDamage()
	for _, val in pairs(test.TestFloats) do
		entityplayer:SetTearPoisonDamage(val)
		test.AssertEquals(entityplayer:GetTearPoisonDamage(), val)
	end
	entityplayer:SetTearPoisonDamage(originalVal)
end

function EntityPlayerTest:TestSetTearRangeModifier(entityplayer)
	local originalVal = entityplayer:GetTearRangeModifier()
	for _, val in pairs(test.TestInts) do
		entityplayer:SetTearRangeModifier(val)
		test.AssertEquals(entityplayer:GetTearRangeModifier(), val)
	end
	entityplayer:SetTearRangeModifier(originalVal)
end

function EntityPlayerTest:TestSetUrethraBlock(entityplayer)
	local blocked = true
	entityplayer:SetUrethraBlock(blocked)
end

function EntityPlayerTest:TestSetWeapon(entityplayer)
	local weapon = Isaac.GetPlayer():GetWeapon(1)
	local weaponslot = 1
	entityplayer:SetWeapon(weapon, weaponslot)
end

function EntityPlayerTest:TestShootBlueCandle(entityplayer)
	local direction = Vector(1,1)
	entityplayer:ShootBlueCandle(direction)
end

function EntityPlayerTest:TestShuffleCostumes(entityplayer)
	local seed = 1
	entityplayer:ShuffleCostumes(seed)
end

function EntityPlayerTest:TestSpawnAquariusCreep(entityplayer)
	local tearparams = Isaac.GetPlayer():GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	entityplayer:SpawnAquariusCreep(tearparams)
end

function EntityPlayerTest:TestSpawnClot(entityplayer)
	local pos = Vector(1,1)
	local allowplayerdeath = true
	entityplayer:SpawnClot(pos, allowplayerdeath)
end

function EntityPlayerTest:TestSpawnSaturnusTears(entityplayer)
	entityplayer:SpawnSaturnusTears()
end

function EntityPlayerTest:TestSwapForgottenForm(entityplayer)
	local force = true
	local noeffects = true
	entityplayer:SwapForgottenForm(force, noeffects)
end

function EntityPlayerTest:TestSyncConsumableCounts(entityplayer)
	local player = Isaac.GetPlayer()
	local collectibleflags = 1
	entityplayer:SyncConsumableCounts(player, collectibleflags)
end

function EntityPlayerTest:TestTeleport(entityplayer)
	local position = Vector(1,1)
	local doeffects = true
	local teleporttwinplayers = true
	entityplayer:Teleport(position, doeffects, teleporttwinplayers)
end

function EntityPlayerTest:TestTriggerRoomClear(entityplayer)
	entityplayer:TriggerRoomClear()
end

function EntityPlayerTest:TestTryAddToBagOfCrafting(entityplayer)
	local pickup = Isaac.Spawn(EntityType.ENTITY_PICKUP, 20, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToPickup()
	entityplayer:TryAddToBagOfCrafting(pickup)
	pickup:Remove()
end

function EntityPlayerTest:TestTryDecreaseGlowingHourglassUses(entityplayer)
	local uses = 1
	local forcehourglass = true
	entityplayer:TryDecreaseGlowingHourglassUses(uses, forcehourglass)
end

function EntityPlayerTest:TestTryFakeDeath(entityplayer)
	entityplayer:TryFakeDeath()
end

function EntityPlayerTest:TestTryForgottenThrow(entityplayer)
	local direction = Vector(1,1)
	entityplayer:TryForgottenThrow(direction)
end

function EntityPlayerTest:TestTryPreventDeath(entityplayer)
	entityplayer:TryPreventDeath()
end

function EntityPlayerTest:TestUnblockCollectible(entityplayer)
	local collectible = 1
	entityplayer:UnblockCollectible(collectible)
end

function EntityPlayerTest:TestUpdateIsaacPregnancy(entityplayer)
	local updatecambion = true
	entityplayer:UpdateIsaacPregnancy(updatecambion)
end

function EntityPlayerTest:TestVarBabySkin(entityplayer)
	local originalVal = entityplayer.BabySkin
	for _, val in pairs(test.TestInts) do
		entityplayer.BabySkin = val
		test.AssertEquals(entityplayer.BabySkin, val)
	end
	entityplayer.BabySkin = originalVal
end

function EntityPlayerTest:TestVarCanFly(entityplayer)
	local originalVal = entityplayer.CanFly
	entityplayer.CanFly = true
	entityplayer.CanFly = originalVal
end

function EntityPlayerTest:TestVarControllerIndex(entityplayer)
	local controllerindex = entityplayer.ControllerIndex
end

function EntityPlayerTest:TestVarControlsEnabled(entityplayer)
	local originalVal = entityplayer.ControlsEnabled
	entityplayer.ControlsEnabled = true
	entityplayer.ControlsEnabled = originalVal
end

function EntityPlayerTest:TestVarDamage(entityplayer)
	local originalVal = entityplayer.Damage
	for _, val in pairs(test.TestFloats) do
		entityplayer.Damage = val
		test.AssertEquals(entityplayer.Damage, val)
	end
	entityplayer.Damage = originalVal
end

function EntityPlayerTest:TestVarFireDelay(entityplayer)
	local originalVal = entityplayer.FireDelay
	for _, val in pairs(test.TestFloats) do
		entityplayer.FireDelay = val
		test.AssertEquals(entityplayer.FireDelay, val)
	end
	entityplayer.FireDelay = originalVal
end

function EntityPlayerTest:TestVarFriendBallEnemy(entityplayer)
	local friendballenemy = entityplayer.FriendBallEnemy
end

function EntityPlayerTest:TestVarHeadFrameDelay(entityplayer)
	local originalVal = entityplayer.HeadFrameDelay
	for _, val in pairs(test.TestInts) do
		entityplayer.HeadFrameDelay = val
		test.AssertEquals(entityplayer.HeadFrameDelay, val)
	end
	entityplayer.HeadFrameDelay = originalVal
end

function EntityPlayerTest:TestVarIBSCharge(entityplayer)
	local originalVal = entityplayer.IBSCharge
	for _, val in pairs(test.TestFloats) do
		entityplayer.IBSCharge = val
		test.AssertEquals(entityplayer.IBSCharge, val)
	end
	entityplayer.IBSCharge = originalVal
end

function EntityPlayerTest:TestVarItemHoldCooldown(entityplayer)
	local originalVal = entityplayer.ItemHoldCooldown
	for _, val in pairs(test.TestInts) do
		entityplayer.ItemHoldCooldown = val
		test.AssertEquals(entityplayer.ItemHoldCooldown, val)
	end
	entityplayer.ItemHoldCooldown = originalVal
end

function EntityPlayerTest:TestVarLaserColor(entityplayer)
	local originalVal = entityplayer.LaserColor
	for _, val in pairs(test.TestColors) do
		entityplayer.LaserColor = val
		test.AssertEquals(entityplayer.LaserColor, val)
	end
	entityplayer.LaserColor = originalVal
end

function EntityPlayerTest:TestVarLuck(entityplayer)
	local originalVal = entityplayer.Luck
	for _, val in pairs(test.TestFloats) do
		entityplayer.Luck = val
		test.AssertEquals(entityplayer.Luck, val)
	end
	entityplayer.Luck = originalVal
end

function EntityPlayerTest:TestVarMaxFireDelay(entityplayer)
	local originalVal = entityplayer.MaxFireDelay
	for _, val in pairs(test.TestFloats) do
		entityplayer.MaxFireDelay = val
		test.AssertEquals(entityplayer.MaxFireDelay, val)
	end
	entityplayer.MaxFireDelay = originalVal
end

function EntityPlayerTest:TestVarMoveSpeed(entityplayer)
	local originalVal = entityplayer.MoveSpeed
	for _, val in pairs(test.TestFloats) do
		entityplayer.MoveSpeed = val
		test.AssertEquals(entityplayer.MoveSpeed, val)
	end
	entityplayer.MoveSpeed = originalVal
end

function EntityPlayerTest:TestVarQueuedItem(entityplayer)
	local originalVal = entityplayer.QueuedItem
	entityplayer.QueuedItem = Isaac.GetPlayer().QueuedItem
	entityplayer.QueuedItem = originalVal
end

function EntityPlayerTest:TestVarSamsonBerserkCharge(entityplayer)
	local originalVal = entityplayer.SamsonBerserkCharge
	for _, val in pairs(test.TestInts) do
		entityplayer.SamsonBerserkCharge = val
		test.AssertEquals(entityplayer.SamsonBerserkCharge, val)
	end
	entityplayer.SamsonBerserkCharge = originalVal
end

function EntityPlayerTest:TestVarShotSpeed(entityplayer)
	local originalVal = entityplayer.ShotSpeed
	for _, val in pairs(test.TestFloats) do
		entityplayer.ShotSpeed = val
		test.AssertEquals(entityplayer.ShotSpeed, val)
	end
	entityplayer.ShotSpeed = originalVal
end

function EntityPlayerTest:TestVarTearColor(entityplayer)
	local originalVal = entityplayer.TearColor
	for _, val in pairs(test.TestColors) do
		entityplayer.TearColor = val
		test.AssertEquals(entityplayer.TearColor, val)
	end
	entityplayer.TearColor = originalVal
end

function EntityPlayerTest:TestVarTearFallingAcceleration(entityplayer)
	local originalVal = entityplayer.TearFallingAcceleration
	for _, val in pairs(test.TestFloats) do
		entityplayer.TearFallingAcceleration = val
		test.AssertEquals(entityplayer.TearFallingAcceleration, val)
	end
	entityplayer.TearFallingAcceleration = originalVal
end

function EntityPlayerTest:TestVarTearFallingSpeed(entityplayer)
	local originalVal = entityplayer.TearFallingSpeed
	for _, val in pairs(test.TestFloats) do
		entityplayer.TearFallingSpeed = val
		test.AssertEquals(entityplayer.TearFallingSpeed, val)
	end
	entityplayer.TearFallingSpeed = originalVal
end

function EntityPlayerTest:TestVarTearFlags(entityplayer)
	local originalVal = entityplayer.TearFlags
	entityplayer.TearFlags = BitSet128()
	entityplayer.TearFlags = originalVal
end

function EntityPlayerTest:TestVarTearHeight(entityplayer)
	local originalVal = entityplayer.TearHeight
	for _, val in pairs(test.TestFloats) do
		entityplayer.TearHeight = val
		test.AssertEquals(entityplayer.TearHeight, val)
	end
	entityplayer.TearHeight = originalVal
end

function EntityPlayerTest:TestVarTearRange(entityplayer)
	local originalVal = entityplayer.TearRange
	for _, val in pairs(test.TestFloats) do
		entityplayer.TearRange = val
		test.AssertEquals(entityplayer.TearRange, val)
	end
	entityplayer.TearRange = originalVal
end

function EntityPlayerTest:TestVarTearsOffset(entityplayer)
	local originalVal = entityplayer.TearsOffset
	for _, val in pairs(test.TestVectors) do
		entityplayer.TearsOffset = val
		test.AssertEquals(entityplayer.TearsOffset, val)
	end
	entityplayer.TearsOffset = originalVal
end

function EntityPlayerTest:TestSetCambionConceptionState(player)
	player:AddCollectible(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION)

	player:SetCambionConceptionState(0)
	test.AssertEquals(player:GetCambionConceptionState(), 0)
	player:SetCambionConceptionState(14)
	test.AssertEquals(player:GetCambionConceptionState(), 14)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_GIVE_BIRTH_CAMBION, function(_, p, flag)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertTrue(flag > 0 and flag <= ConceptionFamiliarFlag.TWISTED_PAIR)
	end)

	player:AddHearts(1)
	player:ResetDamageCooldown()
	test.AssertTrue(player:TakeDamage(1, 0, EntityRef(player), 0))

	test.AssertEquals(player:GetCambionConceptionState(), 15)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION)
end

function EntityPlayerTest:TestSetImmaculateConceptionState(player)
	player:AddCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_CONCEPTION)

	player:SetImmaculateConceptionState(0)
	test.AssertEquals(player:GetImmaculateConceptionState(), 0)
	player:SetImmaculateConceptionState(14)
	test.AssertEquals(player:GetImmaculateConceptionState(), 14)
	player:SetImmaculateConceptionState(15)
	test.AssertEquals(player:GetImmaculateConceptionState(), 14)

	local heart = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_FULL, player.Position, Vector.Zero, nil):ToPickup()
	heart:GetSprite():SetLastFrame()
	heart:Update()

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_GIVE_BIRTH_IMMACULATE, function(_, p, flag)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
		test.AssertTrue(flag > 0 and flag <= ConceptionFamiliarFlag.TWISTED_PAIR)
	end)

	player:AddMaxHearts(2)
	player:AddHearts(-2)
	player:ForceCollide(heart, true)

	test.AssertTrue(heart:IsDead())
	test.AssertEquals(player:GetImmaculateConceptionState(), 0)

	player:RemoveCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_CONCEPTION)
end

function EntityPlayerTest:TestPlaceBombCallbacks(player)
	local forceBombInput = function(_, player, hook, action)
		if action == ButtonAction.ACTION_BOMB then
			return true
		end
	end
	test:AddCallback(ModCallbacks.MC_INPUT_ACTION, forceBombInput, InputHook.IS_ACTION_TRIGGERED)

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_USE_BOMB, function(_, p)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
	end)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_USE_BOMB, function(_, p)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(p))
	end)

	player:AddBombs(1)
	player:SetBombPlaceDelay(0)
	player:Update()
end

function EntityPlayerTest:TestTakeDamage(player)
	local testdamage = 2
	local testflags = DamageFlag.DAMAGE_SPIKES | DamageFlag.DAMAGE_POOP
	local testsource = EntityRef(Isaac.GetPlayer())
	local testdamagecountdown = 7

	local testfunc = function(_, entity, damage, flags, source, countdown)
		test.AssertEquals(GetPtrHash(entity), GetPtrHash(player))
		test.AssertEquals(damage, testdamage)
		test.AssertEquals(flags, testflags)
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(testsource.Entity))
		test.AssertEquals(countdown, testdamagecountdown)
	end

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_PLAYER_TAKE_DMG, testfunc)
	test:AddOneTimeCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, testfunc)
	test:AddOneTimeCallback(ModCallbacks.MC_POST_ENTITY_TAKE_DMG, testfunc)

	player:TakeDamage(testdamage, testflags, testsource, testdamagecountdown)
end

function EntityPlayerTest:TestGetHealthType(player)
	test.AssertEquals(player:GetHealthType(), HealthType.RED)
end

function EntityPlayerTest:TestChangeHealthTypeToSoul(player)
	player:AddRottenHearts(1)
	player:AddGoldenHearts(1)

	test:AddCallback(ModCallbacks.MC_PLAYER_GET_HEALTH_TYPE, function(_, p)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		return HealthType.SOUL
	end)

	test.AssertEquals(player:GetHealthType(), HealthType.SOUL)
	test.AssertEquals(player:GetHearts(), 0)
	test.AssertEquals(player:GetRottenHearts(), 0)
	test.AssertEquals(player:GetMaxHearts(), 0)
	test.AssertEquals(player:GetSoulHearts(), 6)
	test.AssertEquals(player:GetBoneHearts(), 0)
	test.AssertEquals(player:GetGoldenHearts(), 1)
end

function EntityPlayerTest:TestChangeHealthTypeToSoulWithBoneHearts(player)
	player:AddBoneHearts(1)
	player:AddHearts(2)
	player:AddRottenHearts(1)
	player:AddGoldenHearts(1)

	test:AddCallback(ModCallbacks.MC_PLAYER_GET_HEALTH_TYPE, function(_, p)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		return HealthType.SOUL
	end)

	test.AssertEquals(player:GetHealthType(), HealthType.SOUL)
	test.AssertEquals(player:GetHearts(), 0)
	test.AssertEquals(player:GetRottenHearts(), 0)
	test.AssertEquals(player:GetMaxHearts(), 0)
	test.AssertEquals(player:GetSoulHearts(), 6)
	test.AssertEquals(player:GetBoneHearts(), 1)
	test.AssertEquals(player:GetGoldenHearts(), 1)
end

function EntityPlayerTest:TestChangeHealthTypeToLost(player)
	player:AddBoneHearts(1)
	player:AddHearts(2)
	player:AddRottenHearts(1)
	player:AddGoldenHearts(1)
	player:AddEternalHearts(1)
	player:AddSoulHearts(2)

	local callback = function(_, p)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		return HealthType.NO_HEALTH
	end

	test:AddCallback(ModCallbacks.MC_PLAYER_GET_HEALTH_TYPE, callback)

	test.AssertEquals(player:GetHealthType(), HealthType.NO_HEALTH)
	test.AssertEquals(player:GetHearts(), 0)
	test.AssertEquals(player:GetRottenHearts(), 0)
	test.AssertEquals(player:GetMaxHearts(), 0)
	test.AssertEquals(player:GetSoulHearts(), 1)
	test.AssertEquals(player:GetBoneHearts(), 0)
	test.AssertEquals(player:GetEternalHearts(), 0)
	test.AssertEquals(player:GetGoldenHearts(), 1)  -- lol
end

function EntityPlayerTest:TestChangeHealthTypeToCoin(player)
	player:AddBoneHearts(1)
	player:AddMaxHearts(-999)
	player:AddHearts(-999)
	player:AddRottenHearts(1)
	player:AddSoulHearts(4)
	player:AddEternalHearts(1)
	player:AddGoldenHearts(1)

	local callback = function(_, p)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		return HealthType.COIN
	end

	test:AddCallback(ModCallbacks.MC_PLAYER_GET_HEALTH_TYPE, callback)

	test.AssertEquals(player:GetHealthType(), HealthType.COIN)
	test.AssertEquals(player:GetHearts(), 2)
	test.AssertEquals(player:GetRottenHearts(), 0)
	test.AssertEquals(player:GetMaxHearts(), 2)
	test.AssertEquals(player:GetSoulHearts(), 0)
	test.AssertEquals(player:GetBoneHearts(), 0)
	test.AssertEquals(player:GetGoldenHearts(), 1)
	test.AssertEquals(player:GetEternalHearts(), 1)
end

function EntityPlayerTest:TestChangeHealthTypeToBone(player)
	player:AddRottenHearts(1)
	player:AddSoulHearts(2)
	player:AddEternalHearts(1)
	player:AddGoldenHearts(1)

	local callback = function(_, p)
		test.AssertEquals(GetPtrHash(p), GetPtrHash(player))
		return HealthType.BONE
	end

	test:AddCallback(ModCallbacks.MC_PLAYER_GET_HEALTH_TYPE, callback)

	test.AssertEquals(player:GetHealthType(), HealthType.BONE)
	test.AssertEquals(player:GetMaxHearts(), 0)
	test.AssertEquals(player:GetBoneHearts(), 3)
	test.AssertEquals(player:GetHearts(), 6)
	test.AssertEquals(player:GetRottenHearts(), 1)
	test.AssertEquals(player:GetSoulHearts(), 2)
	test.AssertEquals(player:GetGoldenHearts(), 1)
	test.AssertEquals(player:GetEternalHearts(), 1)
end

function EntityPlayerTest:TestDropPill(player)
	local slot = 0
	local pillColor = PillColor.PILL_WHITE_BLUE
	
	player:AddPill(pillColor) 

	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_DROP_PILL, function(_, cPlayer, cPickup, cSlot)
		test.AssertEquals(GetPtrHash(cPlayer), GetPtrHash(player))
		test.AssertEquals(cPickup.Type, EntityType.ENTITY_PICKUP)
		test.AssertEquals(cPickup.Variant, PickupVariant.PICKUP_PILL)
		test.AssertEquals(cPickup.SubType, pillColor)
		test.AssertEquals(cSlot, slot)
	end)

	player:DropPocketItem(slot, player.Position)
end

---@param player EntityPlayer
function EntityPlayerTest:TestDropCard(player)
	local slot = 0
	local card = Card.CARD_ACE_OF_CLUBS
	
	player:AddCard(card) 

	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_DROP_CARD, function(_, cPlayer, cPickup, cSlot)
		test.AssertEquals(GetPtrHash(cPlayer), GetPtrHash(player))
		test.AssertEquals(cPickup.Type, EntityType.ENTITY_PICKUP)
		test.AssertEquals(cPickup.Variant, PickupVariant.PICKUP_TAROTCARD)
		test.AssertEquals(cPickup.SubType, card)
		test.AssertEquals(cSlot, slot)
	end)

	player:DropPocketItem(slot, player.Position)
end

function EntityPlayerTest:TestRemovePill(player)
	local slot = PillCardSlot.PRIMARY
	local pillColor = PillColor.PILL_BLACK_YELLOW

	local callback = function(_, cPlayer, cPillColor, cSlot)
		test.AssertEquals(slot, cSlot)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(cPlayer))
		test.AssertEquals(pillColor, cPillColor)
	end
	
	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_REMOVE_PILL, callback)

	player:AddPill(pillColor)
	player:DropPocketItem(slot, player.Position)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_REMOVE_PILL, callback)

	player:AddPill(pillColor)
	player:RemovePocketItem(slot)
end

function EntityPlayerTest:TestRemoveCard(player)
	local slot = PillCardSlot.PRIMARY
	local card = Card.CARD_ACE_OF_DIAMONDS

	local callback = function(_, cPlayer, cCard, cSlot)
		test.AssertEquals(slot, cSlot)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(cPlayer))
		test.AssertEquals(card, cCard)
	end
	
	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_REMOVE_CARD, callback)

	player:AddCard(card)
	player:DropPocketItem(slot, player.Position)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_PLAYER_REMOVE_CARD, callback)

	player:AddCard(card)
	player:RemovePocketItem(slot)
end


return EntityPlayerTest
