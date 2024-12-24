local test = REPENTOGON_TEST

local EntityTest = {}

function EntityTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
end

function EntityTest:AfterEach(entity)
	entity:Remove()
end

----------

local TEST_DURATION_1 = 10
local TEST_DURATION_2 = 20

local function CreateTestStatusCallbacks(entity, playerRef, testStatusID, hasIgnoreBossStatusCooldownBool)
	local precallback
	precallback = function(_, statusid, target, source, duration, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
		test.AssertEquals(statusid, testStatusID)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_1)
		if hasIgnoreBossStatusCooldownBool then
			test.AssertTrue(ignoreBossStatusCooldown)
			return {TEST_DURATION_2, false}
		end
		return TEST_DURATION_2
	end
	local postcallback
	postcallback = function(_, statusid, target, source, duration, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
		test.AssertEquals(statusid, testStatusID)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_2)
		if hasIgnoreBossStatusCooldownBool then
			test.AssertFalse(ignoreBossStatusCooldown)
		end
	end
	test:AddCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
	test:AddCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
end


function EntityTest:TestAddBrimstoneMark(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.BRIMSTONE_MARK)
	entity:AddBrimstoneMark(playerRef, TEST_DURATION_1)
	test.AssertEquals(entity:GetBrimstoneMarkCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddIce(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.ICE)
	entity:AddIce(playerRef, TEST_DURATION_1)
	test.AssertEquals(entity:GetIceCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddWeakness(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.WEAKNESS)
	entity:AddWeakness(playerRef, TEST_DURATION_1)
	test.AssertEquals(entity:GetWeaknessCountdown(), TEST_DURATION_2)
end


function EntityTest:TestAddBaited(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.BAITED)
	entity:AddBaited(playerRef, TEST_DURATION_1)
	test.AssertEquals(entity:GetBaitedCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddBleeding(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.BLEEDING)
	entity:AddBleeding(playerRef, TEST_DURATION_1)
	test.AssertEquals(entity:GetBleedingCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddMagnetized(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.MAGNETIZED)
	entity:AddMagnetized(playerRef, TEST_DURATION_1)
	test.AssertEquals(entity:GetMagnetizedCountdown(), TEST_DURATION_2)
end


function EntityTest:TestAddCharmed(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.CHARMED, true)
	entity:AddCharmed(playerRef, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetCharmedCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddConfusion(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.CONFUSION, true)
	entity:AddConfusion(playerRef, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetConfusionCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddFear(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.FEAR, true)
	entity:AddFear(playerRef, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetFearCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddFreeze(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.FREEZE, true)
	entity:AddFreeze(playerRef, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetFreezeCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddMidasFreeze(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.MIDAS_FREEZE, true)
	entity:AddMidasFreeze(playerRef, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetMidasFreezeCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddShrink(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	CreateTestStatusCallbacks(entity, playerRef, StatusEffect.SHRINK, true)
	entity:AddShrink(playerRef, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetShrinkCountdown(), TEST_DURATION_2)
end


function EntityTest:TestAddBurn(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	local testDamage = 1.5
	local precallback
	precallback = function(_, statusid, target, source, duration, damage, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
		test.AssertEquals(statusid, StatusEffect.BURN)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_1)
		test.AssertEquals(damage, testDamage)
		test.AssertTrue(ignoreBossStatusCooldown)
		return {TEST_DURATION_2, testDamage+1, false}
	end
	local postcallback
	postcallback = function(_, statusid, target, source, duration, damage, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
		test.AssertEquals(statusid, StatusEffect.BURN)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_2)
		test.AssertEquals(damage, testDamage+1)
		test.AssertFalse(ignoreBossStatusCooldown)
	end
	test:AddCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
	test:AddCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
	entity:AddBurn(playerRef, TEST_DURATION_1, testDamage, true)
	test.AssertEquals(entity:GetBurnCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddPoison(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	local testDamage = 1.5
	local precallback
	precallback = function(_, statusid, target, source, duration, damage, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
		test.AssertEquals(statusid, StatusEffect.POISON)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_1)
		test.AssertEquals(damage, testDamage)
		test.AssertTrue(ignoreBossStatusCooldown)
		return {TEST_DURATION_2, testDamage+1, false}
	end
	local postcallback
	postcallback = function(_, statusid, target, source, duration, damage, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
		test.AssertEquals(statusid, StatusEffect.POISON)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_2)
		test.AssertEquals(damage, testDamage+1)
		test.AssertFalse(ignoreBossStatusCooldown)
	end
	test:AddCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
	test:AddCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
	entity:AddPoison(playerRef, TEST_DURATION_1, testDamage, true)
	test.AssertEquals(entity:GetPoisonCountdown(), TEST_DURATION_2)
end


function EntityTest:TestAddSlowing(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	local testSlowValue = 1.5
	local testColor1 = Color(1,1,1,1)
	local testColor2 = Color(2,2,2,1)
	local precallback
	precallback = function(_, statusid, target, source, duration, slow, color, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
		test.AssertEquals(statusid, StatusEffect.SLOWING)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_1)
		test.AssertEquals(slow, testSlowValue)
		test.AssertEquals(color, testColor1)
		test.AssertTrue(ignoreBossStatusCooldown)
		return {TEST_DURATION_2, testSlowValue+1, testColor2, false}
	end
	local postcallback
	postcallback = function(_, statusid, target, source, duration, slow, color, ignoreBossStatusCooldown)
		test:RemoveCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
		test.AssertEquals(statusid, StatusEffect.SLOWING)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_2)
		test.AssertEquals(slow, testSlowValue+1)
		test.AssertEquals(color, testColor2)
		test.AssertFalse(ignoreBossStatusCooldown)
	end
	test:AddCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
	test:AddCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
	entity:AddSlowing(playerRef, TEST_DURATION_1, testSlowValue, testColor1, true)
	test.AssertEquals(entity:GetSlowingCountdown(), TEST_DURATION_2)
end

function EntityTest:TestAddKnockback(entity)
	local playerRef = EntityRef(Isaac.GetPlayer())
	local testPushDir1 = Vector(1,0)
	local testPushDir2 = Vector(0,1)
	local precallback
	precallback = function(_, statusid, target, source, duration, pushDir, takeImpactDamage)
		test:RemoveCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
		test.AssertEquals(statusid, StatusEffect.KNOCKBACK)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_1)
		test.AssertEquals(pushDir, testPushDir1)
		test.AssertTrue(takeImpactDamage)
		return {TEST_DURATION_2, testPushDir2, false}
	end
	local postcallback
	postcallback = function(_, statusid, target, source, duration, pushDir, takeImpactDamage)
		test:RemoveCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
		test.AssertEquals(statusid, StatusEffect.KNOCKBACK)
		test.AssertEquals(GetPtrHash(target), GetPtrHash(entity))
		test.AssertEquals(GetPtrHash(source.Entity), GetPtrHash(playerRef.Entity))
		test.AssertEquals(duration, TEST_DURATION_2)
		test.AssertEquals(pushDir, testPushDir2)
		test.AssertFalse(takeImpactDamage)
	end
	test:AddCallback(ModCallbacks.MC_PRE_STATUS_EFFECT_APPLY, precallback)
	test:AddCallback(ModCallbacks.MC_POST_STATUS_EFFECT_APPLY, postcallback)
	entity:AddKnockback(playerRef, testPushDir1, TEST_DURATION_1, true)
	test.AssertEquals(entity:GetKnockbackCountdown(), TEST_DURATION_2)
	test.AssertEquals(entity:GetKnockbackDirection(), testPushDir2)
end


function EntityTest:TestAddEntityFlags(entity)
	local flags = 1
	entity:AddEntityFlags(flags)
end

function EntityTest:TestAddHealth(entity)
	local hitpoints = 1
	entity:AddHealth(hitpoints)
end

function EntityTest:TestAddVelocity(entity)
	local velocity = Vector(1,1)
	entity:AddVelocity(velocity)
end

function EntityTest:TestBloodExplode(entity)
	entity:BloodExplode()
end

function EntityTest:TestCanShutDoors(entity)
	entity:CanShutDoors()
end

function EntityTest:TestClearEntityFlags(entity)
	local flags = 1
	entity:ClearEntityFlags(flags)
end

function EntityTest:TestCollidesWithGrid(entity)
	entity:CollidesWithGrid()
end

function EntityTest:TestDie(entity)
	entity:Die()
end

function EntityTest:TestExists(entity)
	entity:Exists()
end

function EntityTest:TestGetBossID(entity)
	entity:GetBossID()
end

function EntityTest:TestGetColor(entity)
	entity:GetColor()
end

function EntityTest:TestGetData(entity)
	entity:GetData()
end

function EntityTest:TestGetDropRNG(entity)
	entity:GetDropRNG()
end

function EntityTest:TestGetEntityFlags(entity)
	entity:GetEntityFlags()
end

function EntityTest:TestGetLastChild(entity)
	entity:GetLastChild()
end

function EntityTest:TestGetLastParent(entity)
	entity:GetLastParent()
end

function EntityTest:TestGetSprite(entity)
	entity:GetSprite()
end

function EntityTest:TestHasCommonParentWithEntity(entity)
	local other = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entity:HasCommonParentWithEntity(other)
	other:Remove()
end

function EntityTest:TestHasEntityFlags(entity)
	local flags = 1
	entity:HasEntityFlags(flags)
end

function EntityTest:TestHasFullHealth(entity)
	entity:HasFullHealth()
end

function EntityTest:TestHasMortalDamage(entity)
	entity:HasMortalDamage()
end

function EntityTest:TestIsActiveEnemy(entity)
	local includedead = true
	entity:IsActiveEnemy(includedead)
end

function EntityTest:TestIsBoss(entity)
	entity:IsBoss()
end

function EntityTest:TestIsDead(entity)
	entity:IsDead()
end

function EntityTest:TestIsEnemy(entity)
	entity:IsEnemy()
end

function EntityTest:TestIsFlying(entity)
	entity:IsFlying()
end

function EntityTest:TestIsFrame(entity)
	local frame = 1
	local offset = 1
	entity:IsFrame(frame, offset)
end

function EntityTest:TestIsInvincible(entity)
	entity:IsInvincible()
end

function EntityTest:TestIsVisible(entity)
	entity:IsVisible()
end

function EntityTest:TestIsVulnerableEnemy(entity)
	entity:IsVulnerableEnemy()
end

function EntityTest:TestKill(entity)
	entity:Kill()
end

function EntityTest:TestMultiplyFriction(entity)
	local value = 1
	entity:MultiplyFriction(value)
end

function EntityTest:TestPostRender(entity)
	entity:PostRender()
end

function EntityTest:TestRemove(entity)
	entity:Remove()
end

function EntityTest:TestRemoveStatusEffects(entity)
	entity:RemoveStatusEffects()
end

function EntityTest:TestRender(entity)
	local offset = Vector(1,1)
	entity:Render(offset)
end

function EntityTest:TestRenderShadowLayer(entity)
	local offset = Vector(1,1)
	entity:RenderShadowLayer(offset)
end

function EntityTest:TestSetColor(entity)
	local color = Color(1,1,1,1)
	local duration = 1
	local priority = 1
	local fadeout = true
	local share = true
	entity:SetColor(color, duration, priority, fadeout, share)
end

function EntityTest:TestSetSize(entity)
	local size = 1
	local sizemulti = Vector(1,1)
	local numgridcollisionpoints = 1
	entity:SetSize(size, sizemulti, numgridcollisionpoints)
end

function EntityTest:TestSetSpriteFrame(entity)
	local animationname = "hello"
	local framenum = 1
	entity:SetSpriteFrame(animationname, framenum)
end

function EntityTest:TestSetSpriteOverlayFrame(entity)
	local animationname = "hello"
	local framenum = 1
	entity:SetSpriteOverlayFrame(animationname, framenum)
end

function EntityTest:TestTakeDamage(entity)
	local damage = 1
	local flags = 1
	local source = EntityRef(Isaac.GetPlayer())
	local damagecountdown = 1
	entity:TakeDamage(damage, flags, source, damagecountdown)
end

function EntityTest:TestToBomb(entity)
	entity:ToBomb()
end

function EntityTest:TestToEffect(entity)
	entity:ToEffect()
end

function EntityTest:TestToFamiliar(entity)
	entity:ToFamiliar()
end

function EntityTest:TestToKnife(entity)
	entity:ToKnife()
end

function EntityTest:TestToLaser(entity)
	entity:ToLaser()
end

function EntityTest:TestToNPC(entity)
	entity:ToNPC()
end

function EntityTest:TestToPickup(entity)
	entity:ToPickup()
end

function EntityTest:TestToPlayer(entity)
	entity:ToPlayer()
end

function EntityTest:TestToProjectile(entity)
	entity:ToProjectile()
end

function EntityTest:TestToTear(entity)
	entity:ToTear()
end

function EntityTest:TestUpdate(entity)
	entity:Update()
end

function EntityTest:TestComputeStatusEffectDuration(entity)
	local initiallength = 1
	local source = EntityRef(Isaac.GetPlayer())
	entity:ComputeStatusEffectDuration(initiallength, source)
end

function EntityTest:TestCopyStatusEffects(entity)
	local target = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local overwrite = true
	entity:CopyStatusEffects(target, overwrite)
	target:Remove()
end

function EntityTest:TestForceCollide(entity)
	local otherentity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local low = true
	entity:ForceCollide(otherentity, low)
	otherentity:Remove()
end

function EntityTest:TestGetCollisionCapsule(entity)
	local vector = Vector(1,1)
	entity:GetCollisionCapsule(vector)
end

function EntityTest:TestGetColorParams(entity)
	entity:GetColorParams()
end

function EntityTest:TestGetDebugShape(entity)
	local unknown = true
	entity:GetDebugShape(unknown)
end

function EntityTest:TestGetEntityConfigEntity(entity)
	entity:GetEntityConfigEntity()
end

function EntityTest:TestGetHitListIndex(entity)
	entity:GetHitListIndex()
end

function EntityTest:TestGetMinecart(entity)
	entity:GetMinecart()
end

function EntityTest:TestGetNullCapsule(entity)
	local nulllayername = "hello"
	entity:GetNullCapsule(nulllayername)
end

function EntityTest:TestGetNullOffset(entity)
	local nulllayername = "hello"
	entity:GetNullOffset(nulllayername)
end

function EntityTest:TestGetPosVel(entity)
	entity:GetPosVel()
end

function EntityTest:TestGetPredictedTargetPosition(entity)
	local target = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local delay = 1
	entity:GetPredictedTargetPosition(target, delay)
	target:Remove()
end

function EntityTest:TestGetShadowSize(entity)
	entity:GetShadowSize()
end

function EntityTest:TestGetType(entity)
	entity:GetType()
end

function EntityTest:TestGiveMinecart(entity)
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	entity:GiveMinecart(position, velocity)
end

function EntityTest:TestIgnoreEffectFromFriendly(entity)
	local source = EntityRef(Isaac.GetPlayer())
	entity:IgnoreEffectFromFriendly(source)
end

function EntityTest:TestMakeBloodPoof(entity)
	local position = Vector(1,1)
	local color = Color(1,1,1,1)
	local scale = 1
	entity:MakeBloodPoof(position, color, scale)
end

function EntityTest:TestMakeGroundPoof(entity)
	local position = Vector(1,1)
	local color = Color(1,1,1,1)
	local scale = 1
	entity:MakeGroundPoof(position, color, scale)
end

function EntityTest:TestSetBaitedCountdown(entity)
	local originalVal = entity:GetBaitedCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetBaitedCountdown(val)
		test.AssertEquals(entity:GetBaitedCountdown(), val)
	end
	entity:SetBaitedCountdown(originalVal)
end

function EntityTest:TestSetBleedingCountdown(entity)
	local originalVal = entity:GetBleedingCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetBleedingCountdown(val)
		test.AssertEquals(entity:GetBleedingCountdown(), val)
	end
	entity:SetBleedingCountdown(originalVal)
end

function EntityTest:TestSetBossStatusEffectCooldown(entity)
	local originalVal = entity:GetBossStatusEffectCooldown()
	for _, val in pairs(test.TestInts) do
		entity:SetBossStatusEffectCooldown(val)
		test.AssertEquals(entity:GetBossStatusEffectCooldown(), val)
	end
	entity:SetBossStatusEffectCooldown(originalVal)
end

function EntityTest:TestSetBrimstoneMarkCountdown(entity)
	local originalVal = entity:GetBrimstoneMarkCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetBrimstoneMarkCountdown(val)
		test.AssertEquals(entity:GetBrimstoneMarkCountdown(), val)
	end
	entity:SetBrimstoneMarkCountdown(originalVal)
end

function EntityTest:TestSetBurnCountdown(entity)
	local originalVal = entity:GetBurnCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetBurnCountdown(val)
		test.AssertEquals(entity:GetBurnCountdown(), val)
	end
	entity:SetBurnCountdown(originalVal)
end

function EntityTest:TestSetBurnDamageTimer(entity)
	local originalVal = entity:GetBurnDamageTimer()
	for _, val in pairs(test.TestInts) do
		entity:SetBurnDamageTimer(val)
		test.AssertEquals(entity:GetBurnDamageTimer(), val)
	end
	entity:SetBurnDamageTimer(originalVal)
end

function EntityTest:TestSetCharmedCountdown(entity)
	local originalVal = entity:GetCharmedCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetCharmedCountdown(val)
		test.AssertEquals(entity:GetCharmedCountdown(), val)
	end
	entity:SetCharmedCountdown(originalVal)
end

function EntityTest:TestSetColorParams(entity)
	local params = {ColorParams(Color(1,0,0,1),255,150,false,false)}
	entity:SetColorParams(params)
end

function EntityTest:TestSetConfusionCountdown(entity)
	local originalVal = entity:GetConfusionCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetConfusionCountdown(val)
		test.AssertEquals(entity:GetConfusionCountdown(), val)
	end
	entity:SetConfusionCountdown(originalVal)
end

function EntityTest:TestSetDamageCountdown(entity)
	local originalVal = entity:GetDamageCountdown()
	for _, val in pairs(test.TestNonNegativeInts) do
		entity:SetDamageCountdown(val)
		test.AssertEquals(entity:GetDamageCountdown(), val)
	end
	entity:SetDamageCountdown(originalVal)
end

function EntityTest:TestSetDead(entity)
	local isdead = true
	entity:SetDead(isdead)
end

function EntityTest:TestSetFearCountdown(entity)
	local originalVal = entity:GetFearCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetFearCountdown(val)
		test.AssertEquals(entity:GetFearCountdown(), val)
	end
	entity:SetFearCountdown(originalVal)
end

function EntityTest:TestSetFireDamageCooldown(entity)
	local originalVal = entity:GetFireDamageCooldown()
	for _, val in pairs(test.TestInts) do
		entity:SetFireDamageCooldown(val)
		test.AssertEquals(entity:GetFireDamageCooldown(), val)
	end
	entity:SetFireDamageCooldown(originalVal)
end

function EntityTest:TestSetFreezeCountdown(entity)
	local originalVal = entity:GetFreezeCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetFreezeCountdown(val)
		test.AssertEquals(entity:GetFreezeCountdown(), val)
	end
	entity:SetFreezeCountdown(originalVal)
end

function EntityTest:TestSetIceCountdown(entity)
	local originalVal = entity:GetIceCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetIceCountdown(val)
		test.AssertEquals(entity:GetIceCountdown(), val)
	end
	entity:SetIceCountdown(originalVal)
end

function EntityTest:TestSetInvincible(entity)
	local isinvincible = true
	entity:SetInvincible(isinvincible)
end

function EntityTest:TestSetKnockbackCountdown(entity)
	local originalVal = entity:GetKnockbackCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetKnockbackCountdown(val)
		test.AssertEquals(entity:GetKnockbackCountdown(), val)
	end
	entity:SetKnockbackCountdown(originalVal)
end

function EntityTest:TestSetKnockbackDirection(entity)
	local originalVal = entity:GetKnockbackDirection()
	for _, val in pairs(test.TestVectors) do
		entity:SetKnockbackDirection(val)
		test.AssertEquals(entity:GetKnockbackDirection(), val)
	end
	entity:SetKnockbackDirection(originalVal)
end

function EntityTest:TestSetMagnetizedCountdown(entity)
	local originalVal = entity:GetMagnetizedCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetMagnetizedCountdown(val)
		test.AssertEquals(entity:GetMagnetizedCountdown(), val)
	end
	entity:SetMagnetizedCountdown(originalVal)
end

function EntityTest:TestSetMidasFreezeCountdown(entity)
	local originalVal = entity:GetMidasFreezeCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetMidasFreezeCountdown(val)
		test.AssertEquals(entity:GetMidasFreezeCountdown(), val)
	end
	entity:SetMidasFreezeCountdown(originalVal)
end

function EntityTest:TestSetPauseTime(entity)
	local originalVal = entity:GetPauseTime()
	for _, val in pairs(test.TestInts) do
		entity:SetPauseTime(val)
		test.AssertEquals(entity:GetPauseTime(), val)
	end
	entity:SetPauseTime(originalVal)
end

function EntityTest:TestSetPoisonCountdown(entity)
	local originalVal = entity:GetPoisonCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetPoisonCountdown(val)
		test.AssertEquals(entity:GetPoisonCountdown(), val)
	end
	entity:SetPoisonCountdown(originalVal)
end

function EntityTest:TestSetPoisonDamageTimer(entity)
	local originalVal = entity:GetPoisonDamageTimer()
	for _, val in pairs(test.TestInts) do
		entity:SetPoisonDamageTimer(val)
		test.AssertEquals(entity:GetPoisonDamageTimer(), val)
	end
	entity:SetPoisonDamageTimer(originalVal)
end

function EntityTest:TestSetShadowSize(entity)
	local size = 1
	entity:SetShadowSize(size)
end

function EntityTest:TestSetShrinkCountdown(entity)
	local originalVal = entity:GetShrinkCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetShrinkCountdown(val)
		test.AssertEquals(entity:GetShrinkCountdown(), val)
	end
	entity:SetShrinkCountdown(originalVal)
end

function EntityTest:TestSetSlowingCountdown(entity)
	local originalVal = entity:GetSlowingCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetSlowingCountdown(val)
		test.AssertEquals(entity:GetSlowingCountdown(), val)
	end
	entity:SetSlowingCountdown(originalVal)
end

function EntityTest:TestSetSpeedMultiplier(entity)
	local originalVal = entity:GetSpeedMultiplier()
	for _, val in pairs(test.TestFloats) do
		entity:SetSpeedMultiplier(val)
		test.AssertEquals(entity:GetSpeedMultiplier(), val)
	end
	entity:SetSpeedMultiplier(originalVal)
end

function EntityTest:TestSetWeaknessCountdown(entity)
	local originalVal = entity:GetWeaknessCountdown()
	for _, val in pairs(test.TestInts) do
		entity:SetWeaknessCountdown(val)
		test.AssertEquals(entity:GetWeaknessCountdown(), val)
	end
	entity:SetWeaknessCountdown(originalVal)
end

function EntityTest:TestSpawnBloodEffect(entity)
	local subtype = 1
	local position = Vector(1,1)
	local offset = Vector(1,1)
	local color = Color(1,1,1,1)
	local velocity = Vector(1,1)
	entity:SpawnBloodEffect(subtype, position, offset, color, velocity)
end

function EntityTest:TestSpawnWaterImpactEffects(entity)
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local strength = 1
	entity:SpawnWaterImpactEffects(position, velocity, strength)
end

function EntityTest:TestTeleportToRandomPosition(entity)
	entity:TeleportToRandomPosition()
end

function EntityTest:TestToDelirium(entity)
	entity:ToDelirium()
end

function EntityTest:TestToSlot(entity)
	entity:ToSlot()
end

function EntityTest:TestTryThrow(entity)
	local source = EntityRef(Isaac.GetPlayer())
	local throwdirection = Vector(1,1)
	local force = 1
	entity:TryThrow(source, throwdirection, force)
end

function EntityTest:TestVarChild(entity)
	local originalVal = entity.Child
	entity.Child = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entity.Child:Remove()
	entity.Child = originalVal
end

function EntityTest:TestVarCollisionDamage(entity)
	local originalVal = entity.CollisionDamage
	for _, val in pairs(test.TestFloats) do
		entity.CollisionDamage = val
		test.AssertEquals(entity.CollisionDamage, val)
	end
	entity.CollisionDamage = originalVal
end

function EntityTest:TestVarColor(entity)
	local originalVal = entity.Color
	for _, val in pairs(test.TestColors) do
		entity.Color = val
		test.AssertEquals(entity.Color, val)
	end
	entity.Color = originalVal
end

function EntityTest:TestVarDepthOffset(entity)
	local originalVal = entity.DepthOffset
	for _, val in pairs(test.TestFloats) do
		entity.DepthOffset = val
		test.AssertEquals(entity.DepthOffset, val)
	end
	entity.DepthOffset = originalVal
end

function EntityTest:TestVarDropSeed(entity)
	local dropseed = entity.DropSeed
end

function EntityTest:TestVarEntityCollisionClass(entity)
	local originalVal = entity.EntityCollisionClass
	for _, val in pairs(test.TestInts) do
		entity.EntityCollisionClass = val
		test.AssertEquals(entity.EntityCollisionClass, val)
	end
	entity.EntityCollisionClass = originalVal
end

function EntityTest:TestVarFlipX(entity)
	local originalVal = entity.FlipX
	entity.FlipX = true
	entity.FlipX = originalVal
end

function EntityTest:TestVarFrameCount(entity)
	local framecount = entity.FrameCount
end

function EntityTest:TestVarFriction(entity)
	local originalVal = entity.Friction
	for _, val in pairs(test.TestFloats) do
		entity.Friction = val
		test.AssertEquals(entity.Friction, val)
	end
	entity.Friction = originalVal
end

function EntityTest:TestVarGridCollisionClass(entity)
	local originalVal = entity.GridCollisionClass
	for _, val in pairs(test.TestInts) do
		entity.GridCollisionClass = val
		test.AssertEquals(entity.GridCollisionClass, val)
	end
	entity.GridCollisionClass = originalVal
end

function EntityTest:TestVarHitPoints(entity)
	local originalVal = entity.HitPoints
	for _, val in pairs(test.TestFloats) do
		entity.HitPoints = val
		test.AssertEquals(entity.HitPoints, val)
	end
	entity.HitPoints = originalVal
end

function EntityTest:TestVarIndex(entity)
	local index = entity.Index
end

function EntityTest:TestVarInitSeed(entity)
	local initseed = entity.InitSeed
end

function EntityTest:TestVarMass(entity)
	local originalVal = entity.Mass
	for _, val in pairs(test.TestFloats) do
		entity.Mass = val
		test.AssertEquals(entity.Mass, val)
	end
	entity.Mass = originalVal
end

function EntityTest:TestVarMaxHitPoints(entity)
	local originalVal = entity.MaxHitPoints
	for _, val in pairs(test.TestFloats) do
		entity.MaxHitPoints = val
		test.AssertEquals(entity.MaxHitPoints, val)
	end
	entity.MaxHitPoints = originalVal
end

function EntityTest:TestVarParent(entity)
	local originalVal = entity.Parent
	entity.Parent = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entity.Parent:Remove()
	entity.Parent = originalVal
end

function EntityTest:TestVarPosition(entity)
	local originalVal = entity.Position
	for _, val in pairs(test.TestVectors) do
		entity.Position = val
		test.AssertEquals(entity.Position, val)
	end
	entity.Position = originalVal
end

function EntityTest:TestVarPositionOffset(entity)
	local positionoffset = entity.PositionOffset
end

function EntityTest:TestVarRenderZOffset(entity)
	local originalVal = entity.RenderZOffset
	for _, val in pairs(test.TestInts) do
		entity.RenderZOffset = val
		test.AssertEquals(entity.RenderZOffset, val)
	end
	entity.RenderZOffset = originalVal
end

function EntityTest:TestVarSize(entity)
	local originalVal = entity.Size
	for _, val in pairs(test.TestFloats) do
		entity.Size = val
		test.AssertEquals(entity.Size, val)
	end
	entity.Size = originalVal
end

function EntityTest:TestVarSizeMulti(entity)
	local originalVal = entity.SizeMulti
	for _, val in pairs(test.TestVectors) do
		entity.SizeMulti = val
		test.AssertEquals(entity.SizeMulti, val)
	end
	entity.SizeMulti = originalVal
end

function EntityTest:TestVarSortingLayer(entity)
	local originalVal = entity.SortingLayer
	for _, val in pairs(test.TestInts) do
		entity.SortingLayer = val
		test.AssertEquals(entity.SortingLayer, val)
	end
	entity.SortingLayer = originalVal
end

function EntityTest:TestVarSpawnerEntity(entity)
	local originalVal = entity.SpawnerEntity
	entity.SpawnerEntity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entity.SpawnerEntity:Remove()
	entity.SpawnerEntity = originalVal
end

function EntityTest:TestVarSpawnerType(entity)
	local originalVal = entity.SpawnerType
	for _, val in pairs(test.TestInts) do
		entity.SpawnerType = val
		test.AssertEquals(entity.SpawnerType, val)
	end
	entity.SpawnerType = originalVal
end

function EntityTest:TestVarSpawnerVariant(entity)
	local originalVal = entity.SpawnerVariant
	for _, val in pairs(test.TestUnsignedInts) do
		entity.SpawnerVariant = val
		test.AssertEquals(entity.SpawnerVariant, val)
	end
	entity.SpawnerVariant = originalVal
end

function EntityTest:TestVarSpawnGridIndex(entity)
	local spawngridindex = entity.SpawnGridIndex
end

function EntityTest:TestVarSplatColor(entity)
	local originalVal = entity.SplatColor
	for _, val in pairs(test.TestColors) do
		entity.SplatColor = val
		test.AssertEquals(entity.SplatColor, val)
	end
	entity.SplatColor = originalVal
end

function EntityTest:TestVarSpriteOffset(entity)
	local originalVal = entity.SpriteOffset
	for _, val in pairs(test.TestVectors) do
		entity.SpriteOffset = val
		test.AssertEquals(entity.SpriteOffset, val)
	end
	entity.SpriteOffset = originalVal
end

function EntityTest:TestVarSpriteRotation(entity)
	local originalVal = entity.SpriteRotation
	for _, val in pairs(test.TestFloats) do
		entity.SpriteRotation = val
		test.AssertEquals(entity.SpriteRotation, val)
	end
	entity.SpriteRotation = originalVal
end

function EntityTest:TestVarSpriteScale(entity)
	local originalVal = entity.SpriteScale
	for _, val in pairs(test.TestVectors) do
		entity.SpriteScale = val
		test.AssertEquals(entity.SpriteScale, val)
	end
	entity.SpriteScale = originalVal
end

function EntityTest:TestVarSubType(entity)
	local originalVal = entity.SubType
	for _, val in pairs(test.TestUnsignedInts) do
		entity.SubType = val
		test.AssertEquals(entity.SubType, val)
	end
	entity.SubType = originalVal
end

function EntityTest:TestVarTarget(entity)
	local originalVal = entity.Target
	entity.Target = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entity.Target:Remove()
	entity.Target = originalVal
end

function EntityTest:TestVarTargetPosition(entity)
	local originalVal = entity.TargetPosition
	for _, val in pairs(test.TestVectors) do
		entity.TargetPosition = val
		test.AssertEquals(entity.TargetPosition, val)
	end
	entity.TargetPosition = originalVal
end

function EntityTest:TestVarType(entity)
	local type = entity.Type
end

function EntityTest:TestVarVariant(entity)
	local originalVal = entity.Variant
	for _, val in pairs(test.TestUnsignedInts) do
		entity.Variant = val
		test.AssertEquals(entity.Variant, val)
	end
	entity.Variant = originalVal
end

function EntityTest:TestVarVelocity(entity)
	local originalVal = entity.Velocity
	for _, val in pairs(test.TestVectors) do
		entity.Velocity = val
		test.AssertEquals(entity.Velocity, val)
	end
	entity.Velocity = originalVal
end

function EntityTest:TestVarVisible(entity)
	local originalVal = entity.Visible
	entity.Visible = true
	entity.Visible = originalVal
end


return EntityTest
