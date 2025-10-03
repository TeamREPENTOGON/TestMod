local test = REPENTOGON_TEST

local SplitTearsTest = {}


function SplitTearsTest:TestCricketsBodyTear()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_QUADSPLIT | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceTear, splitType)
		test.AssertTrue(sourceTear:Exists())
		test.AssertTrue(sourceTear:IsDead())
		test.AssertEquals(GetPtrHash(sourceTear), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceTear))
		test.AssertEquals(splitType, SplitTearType.QUAD)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.QUAD)

	tear:Kill()
	test.AssertEquals(triggerCount, 0)
	tear:Update()
	test.AssertEquals(triggerCount, 4)
end

function SplitTearsTest:TestParasiteTear()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetTopLeftPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_SPLIT | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceTear, splitType)
		test.AssertTrue(sourceTear:Exists())
		test.AssertTrue(sourceTear:IsDead())
		test.AssertEquals(GetPtrHash(sourceTear), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceTear))
		test.AssertEquals(splitType, SplitTearType.PARASITE)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_SPLIT | TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.PARASITE)

	test.AssertEquals(triggerCount, 0)

	Game():GetRoom():Update()
	Game():GetRoom():Update()

	test.AssertEquals(triggerCount, 2)
end

function SplitTearsTest:TestSporeTear()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, enemy.Position, Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_SPORE | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceTear, splitType)
		test.AssertTrue(sourceTear:Exists())
		test.AssertTrue(sourceTear:IsDead())
		test.AssertEquals(GetPtrHash(sourceTear), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceTear))
		test.AssertEquals(splitType, SplitTearType.SPORE)
		test.AssertTrue(newTear:HasTearFlags(TearFlags.TEAR_SPORE | TearFlags.TEAR_POISON))
		triggerCount = triggerCount + 1
	end, SplitTearType.SPORE)

	tear:ForceCollide(enemy)

	test.AssertEquals(triggerCount, 0)

	test.AssertEquals(GetPtrHash(tear.StickTarget), GetPtrHash(enemy))
	tear.StickTimer = 0
	tear:Update()

	test.AssertTrue(triggerCount >= 2 and triggerCount <= 4)
end

function SplitTearsTest:TestHaemoTear()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_BURSTSPLIT | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceTear, splitType)
		test.AssertTrue(sourceTear:Exists())
		test.AssertTrue(sourceTear:IsDead())
		test.AssertEquals(GetPtrHash(sourceTear), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceTear))
		test.AssertEquals(splitType, SplitTearType.BURST)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.BURST)

	tear:Kill()
	test.AssertEquals(triggerCount, 0)
	tear:Update()

	test.AssertTrue(triggerCount >= 6 and triggerCount <= 11)
end

function SplitTearsTest:TestBoneTear()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetTopLeftPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_BONE | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceTear, splitType)
		test.AssertTrue(sourceTear:Exists())
		test.AssertTrue(sourceTear:IsDead())
		test.AssertEquals(GetPtrHash(sourceTear), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceTear))
		test.AssertEquals(splitType, SplitTearType.BONE)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.BONE)

	test.AssertEquals(triggerCount, 0)

	Game():GetRoom():Update()
	Game():GetRoom():Update()

	test.AssertEquals(triggerCount, 2)
end

function SplitTearsTest:TestStickyLudoTear()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, enemy.Position, Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_STICKY | TearFlags.TEAR_POISON | TearFlags.TEAR_LUDOVICO)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceTear, splitType)
		test.AssertTrue(sourceTear:Exists())
		test.AssertFalse(sourceTear:IsDead())
		test.AssertEquals(GetPtrHash(sourceTear), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceTear))
		test.AssertEquals(splitType, SplitTearType.STICKY)
		test.AssertTrue(newTear:HasTearFlags(TearFlags.TEAR_STICKY | TearFlags.TEAR_POISON))
		triggerCount = triggerCount + 1
	end, SplitTearType.STICKY)

	tear:ForceCollide(enemy)

	test.AssertEquals(triggerCount, 1)
end

function SplitTearsTest:TestCricketsBodyLaser()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local laser = EntityLaser.ShootAngle(1, enemy.Position + Vector(-50, 0), 0, 10, Vector.Zero, Isaac.GetPlayer())
	laser:AddTearFlags(TearFlags.TEAR_QUADSPLIT | TearFlags.TEAR_POISON)
	laser.CollisionDamage = 0

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(laser))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.QUAD)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON | TearFlags.TEAR_PIERCING)
		triggerCount = triggerCount + 1
	end, SplitTearType.QUAD)

	test.AssertEquals(triggerCount, 0)
	laser:Update()
	test.AssertEquals(triggerCount, 4)
end

function SplitTearsTest:TestStickyLaser()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local laser = EntityLaser.ShootAngle(1, enemy.Position + Vector(-50, 0), 0, 10, Vector.Zero, Isaac.GetPlayer())
	laser:AddTearFlags(TearFlags.TEAR_STICKY | TearFlags.TEAR_POISON)
	laser.CollisionDamage = 0

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(laser))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.STICKY)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_STICKY | TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.STICKY)

	test.AssertEquals(triggerCount, 0)
	laser:Update()
	test.AssertEquals(triggerCount, 1)
end

function SplitTearsTest:TestPopLaser()
	local laser = EntityLaser.ShootAngle(1, Game():GetRoom():GetCenterPos(), 0, 10, Vector.Zero, Isaac.GetPlayer())
	laser:AddTearFlags(TearFlags.TEAR_POP | TearFlags.TEAR_POISON)
	laser.CollisionDamage = 0

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(laser))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.POP)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POP | TearFlags.TEAR_POISON | TearFlags.TEAR_PIERCING)
		triggerCount = triggerCount + 1
	end, SplitTearType.POP)

	test.AssertEquals(triggerCount, 0)
	laser:Update()
	test.AssertEquals(triggerCount, 1)
end

function SpawnMeleeSwing(pos, tearFlags)
	local player = Isaac.GetPlayer()
	local knife = Isaac.Spawn(EntityType.ENTITY_KNIFE, KnifeVariant.BONE_CLUB, KnifeSubType.CLUB_HITBOX, pos, Vector.Zero, player):ToKnife()
	knife:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
	knife:GetSprite():Play("Swing", true)
	knife.Parent = player
	knife.SpawnerEntity = player
	knife:SetIsSwinging(true)
	knife:AddTearFlags(tearFlags)
	return knife
end

function SplitTearsTest:TestCricketsBodyMelee()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local knife = SpawnMeleeSwing(enemy.Position + Vector(0, -10), TearFlags.TEAR_QUADSPLIT | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(knife))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.QUAD)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.QUAD)

	Game():GetRoom():Update()
	knife:Update()
	knife:Update()

	test.AssertEquals(triggerCount, 4)
end

function SplitTearsTest:TestBoneMelee()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local knife = SpawnMeleeSwing(enemy.Position + Vector(0, -10), TearFlags.TEAR_BONE | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(knife))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.BONE)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.BONE)

	Game():GetRoom():Update()
	knife:Update()
	knife:Update()

	test.AssertEquals(triggerCount, 2)
end

function SplitTearsTest:TestParasiteMelee()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local knife = SpawnMeleeSwing(enemy.Position + Vector(0, -10), TearFlags.TEAR_SPLIT | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(knife))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.PARASITE)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_SPLIT | TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.PARASITE)

	Game():GetRoom():Update()
	knife:Update()
	knife:Update()

	test.AssertEquals(triggerCount, 2)
end

function SplitTearsTest:TestHaemoMelee()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local knife = SpawnMeleeSwing(enemy.Position + Vector(0, -10), TearFlags.TEAR_BURSTSPLIT | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(knife))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.BURST)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.BURST)

	Game():GetRoom():Update()
	knife:Update()
	knife:Update()

	test.AssertTrue(triggerCount >= 6 and triggerCount <= 11)
end

function SplitTearsTest:TestStickyMelee()
	local enemy = Isaac.Spawn(EntityType.ENTITY_GUSHER, 1, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	enemy:ClearEntityFlags(EntityFlag.FLAG_APPEAR)

	local knife = SpawnMeleeSwing(enemy.Position + Vector(0, -10), TearFlags.TEAR_STICKY | TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(knife))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.STICKY)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_STICKY | TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.STICKY)

	Game():GetRoom():Update()
	knife:Update()
	knife:Update()

	test.AssertEquals(triggerCount, 1)
end

function SplitTearsTest:TestMultidimensionalTear()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_POISON)

	local triggerCount = 0

	local copyTearRef

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(tear))
		copyTearRef = newTear
		test.AssertEquals(splitType, SplitTearType.MULTIDIMENSIONAL)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.MULTIDIMENSIONAL)

	local copyTear = tear:MakeMultidimensionalCopy()
	test.AssertEquals(GetPtrHash(copyTear), GetPtrHash(copyTearRef))

	test.AssertEquals(triggerCount, 1)
end

function SplitTearsTest:TestAngelicPrism()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_POISON)

	local triggerCount = 0

	test:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertTrue(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.ANGELIC_PRISM)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		triggerCount = triggerCount + 1
	end, SplitTearType.ANGELIC_PRISM)

	local prism = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.ANGELIC_PRISM, 0, tear.Position, Vector.Zero, nil)
	prism:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
	prism:Update()

	test.AssertEquals(triggerCount, 4)
end

function SplitTearsTest:TestCustomTearMinimal()
	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, TearVariant.BLOOD, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_POISON | TearFlags.TEAR_LUDOVICO | TearFlags.TEAR_FETUS)
	tear.CollisionDamage = 10
	tear.Scale = 0.8

	local color = Color(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7)
	tear:GetSprite().Color = color

	local vel = Vector(1,0)

	test:AddOneTimeCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, SplitTearType.GENERIC)
		test.AssertEquals(newTear.Variant, 0)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		test.AssertEquals(newTear.CollisionDamage, tear.CollisionDamage * 0.5)
		test.AssertEquals(newTear.Scale, tear.Scale * 0.6)
		test.AssertEquals(newTear:GetSprite().Color, color)
		test.AssertEquals(newTear.Parent, nil)
	end, SplitTearType.GENERIC)

	tear:FireSplitTear(tear.Position, vel)
end

function SplitTearsTest:TestCustomTear()
	local player = Isaac.GetPlayer()

	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, TearVariant.BLOOD, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, player):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_POISON | TearFlags.TEAR_LUDOVICO | TearFlags.TEAR_FETUS)
	tear.CollisionDamage = 10
	tear.Scale = 0.6

	local color = Color(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7)
	tear:GetSprite().Color = color

	local vel = Vector(1,0)
	local damageMult = 0.2
	local scaleMult = 0.8
	local variant = TearVariant.TOOTH
	local splitType = "TEST"

	test:AddOneTimeCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, splitType)
		test.AssertEquals(newTear.Variant, variant)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		test.AssertEquals(newTear.CollisionDamage, tear.CollisionDamage * damageMult)
		test.AssertEquals(newTear.Scale, tear.Scale * scaleMult)
		test.AssertEquals(newTear:GetSprite().Color, color)
		test.AssertEquals(GetPtrHash(newTear.Parent), GetPtrHash(player))
	end, splitType)

	tear:FireSplitTear(tear.Position, vel, damageMult, scaleMult, variant, splitType)
end

function SplitTearsTest:TestFetusTear()
	local player = Isaac.GetPlayer()

	local tear = Isaac.Spawn(EntityType.ENTITY_TEAR, TearVariant.BLOOD, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, player):ToTear()
	tear:AddTearFlags(TearFlags.TEAR_POISON | TearFlags.TEAR_LUDOVICO | TearFlags.TEAR_FETUS)
	tear.CollisionDamage = 10
	tear.Scale = 0.6

	local color = Color(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7)
	tear:GetSprite().Color = color

	local vel = Vector(1,0)
	local damageMult = 0.2
	local variant = TearVariant.FETUS
	local splitType = "TEST"

	test:AddOneTimeCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(tear))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, splitType)
		test.AssertEquals(newTear.Variant, variant)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON | TearFlags.TEAR_FETUS)
		test.AssertEquals(newTear.CollisionDamage, tear.CollisionDamage * damageMult)
		test.AssertEquals(newTear:GetSprite().Color, color)
		test.AssertEquals(GetPtrHash(newTear.Parent), GetPtrHash(player))
	end, splitType)

	tear:FireSplitTear(tear.Position, vel, damageMult, scaleMult, variant, splitType)
end

function SplitTearsTest:TestCustomLaser()
	local player = Isaac.GetPlayer()

	local laser = EntityLaser.ShootAngle(1, Game():GetRoom():GetCenterPos(), 0, 10, Vector.Zero, player)
	laser:AddTearFlags(TearFlags.TEAR_POISON)
	laser.CollisionDamage = 10
	laser:SetScale(0.6)

	local color = Color(1,1,1,.4, 0,.5,0)
	laser:GetSprite().Color = color
	local expectedTearColor = Color(1,1,1,.4, .425,.25,.0, .425,.25,0,1)

	local vel = Vector(1,0)
	local damageMult = 0.2
	local scaleMult = 0.8
	local variant = TearVariant.TOOTH
	local splitType = "TEST"

	test:AddOneTimeCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(laser))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, splitType)
		test.AssertEquals(newTear.Variant, variant)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		test.AssertEquals(newTear.CollisionDamage, laser.CollisionDamage * damageMult)
		test.AssertEquals(newTear.Scale, laser:GetScale() * scaleMult)
		test.AssertEquals(newTear:GetSprite().Color, expectedTearColor)
		test.AssertEquals(GetPtrHash(newTear.Parent), GetPtrHash(player))
	end, splitType)

	laser:FireSplitTear(laser:GetEndPoint(), vel, damageMult, scaleMult, variant, splitType)
end

function SplitTearsTest:TestCustomKnife()
	local player = Isaac.GetPlayer()

	local knife = Isaac.Spawn(EntityType.ENTITY_KNIFE, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, player):ToKnife()
	knife.Parent = player
	knife:AddTearFlags(TearFlags.TEAR_POISON)
	knife.CollisionDamage = 10
	knife.SpriteScale = Vector(0.6, 0.6)

	local color = Color(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7)
	knife:GetSprite().Color = color

	local vel = Vector(1,0)
	local damageMult = 0.2
	local scaleMult = 0.8
	local variant = TearVariant.TOOTH
	local splitType = "TEST"

	test:AddOneTimeCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, newTear, sourceEntity, splitType)
		test.AssertTrue(sourceEntity:Exists())
		test.AssertFalse(sourceEntity:IsDead())
		test.AssertEquals(GetPtrHash(sourceEntity), GetPtrHash(knife))
		test.AssertTrue(GetPtrHash(newTear) ~= GetPtrHash(sourceEntity))
		test.AssertEquals(splitType, splitType)
		test.AssertEquals(newTear.Variant, variant)
		test.AssertEquals(newTear.TearFlags, TearFlags.TEAR_POISON)
		test.AssertEquals(newTear.CollisionDamage, knife.CollisionDamage * damageMult)
		test.AssertEquals(newTear.Scale, knife.SpriteScale.Y * scaleMult)
		test.AssertEquals(newTear:GetSprite().Color, color)
		test.AssertEquals(GetPtrHash(newTear.Parent), GetPtrHash(player))
	end, splitType)

	knife:FireSplitTear(knife.Position, vel, damageMult, scaleMult, variant, splitType)
end


-- for k,v in pairs(TearFlags) do if newTear:HasTearFlags(v) then print(k) end end
-- l tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToTear() tear:AddTearFlags(TearFlags.TEAR_BURSTSPLIT)

return SplitTearsTest
