local test = REPENTOGON_TEST

local TearParamsTest = {}

function TearParamsTest:BeforeEach()
	
end

function TearParamsTest:AfterEach(tearparams)
	
end

----------

function TearParamsTest:TestBombVariant()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.BombVariant, 0)
	params1.BombVariant = 1
	test.AssertEquals(params1.BombVariant, 1)
end

function TearParamsTest:TestTearColor()
	local player = Isaac.GetPlayer()
	player.TearColor = Color.TearHoming

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearColor, Color.TearHoming)
	params1.TearColor = Color.TearNumberOne
	test.AssertEquals(params1.TearColor, Color.TearNumberOne)

	player:AddCollectible(CollectibleType.COLLECTIBLE_SCORPIO)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.TearColor, Color.TearScorpio)
end

function TearParamsTest:TestTearDamage()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearDamage, player.Damage)
	params1.TearDamage = player.Damage - 1
	test.AssertEquals(params1.TearDamage, player.Damage - 1)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, -1, nil)
	test.AssertEquals(params2.TearDamage, player.Damage)

	player:AddCollectible(CollectibleType.COLLECTIBLE_BLOOD_CLOT)

	local params3 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params3.TearDamage, player.Damage)

	local params4 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, -1, nil)
	test.AssertEquals(params4.TearDamage, player.Damage + 1)
end

function TearParamsTest:TestTearFlags()
	local player = Isaac.GetPlayer()
	player.TearFlags = TearFlags.TEAR_POISON

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearFlags, TearFlags.TEAR_POISON)
	params1.TearFlags = TearFlags.TEAR_HOMING
	test.AssertEquals(params1.TearFlags, TearFlags.TEAR_HOMING)

	player:AddCollectible(CollectibleType.COLLECTIBLE_HEAD_OF_THE_KEEPER)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.TearFlags, TearFlags.TEAR_GREED_COIN)
end

function TearParamsTest:TestTearHeight()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearHeight, player.TearHeight)
	params1.TearHeight = player.TearHeight - 1
	test.AssertEquals(params1.TearHeight, player.TearHeight - 1)

	player.TearHeight = player.TearHeight + 1

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.TearHeight, player.TearHeight)
end

local function CalculateTearScale(player, baseScale)
	local damage = player.Damage
	if baseScale > 1.0 then
		baseScale = math.log(baseScale) + 1
	end
	return math.sqrt(damage) * 0.23 + baseScale * 0.55 + damage * 0.01
end

function TearParamsTest:TestTearScale()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearScale, CalculateTearScale(player, 1.0))
	params1.TearScale = 1.5
	test.AssertEquals(params1.TearScale, 1.5)

	player:AddCollectible(CollectibleType.COLLECTIBLE_PROPTOSIS)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.TearScale, CalculateTearScale(player, 3.0))
end

function TearParamsTest:TestTearVariant()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearVariant, TearVariant.BLUE)
	params1.TearVariant = TearVariant.TOOTH
	test.AssertEquals(params1.TearVariant, TearVariant.TOOTH)

	player:AddCollectible(CollectibleType.COLLECTIBLE_PUPULA_DUPLEX)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.TearVariant, TearVariant.PUPULA)
end

function TearParamsTest:TestMassMultiplier()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.MassMultiplier, 1.0)
	params1.MassMultiplier = 1.5
	test.AssertEquals(params1.MassMultiplier, 1.5)

	player:AddTrinket(TrinketType.TRINKET_BLISTER)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.MassMultiplier, 3.0)

	player:AddCollectible(CollectibleType.COLLECTIBLE_SOY_MILK)

	local params3 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params3.MassMultiplier, 0.6)
end

function TearParamsTest:TestKnockbackMultiplier()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.KnockbackMultiplier, 1.7)
	params1.KnockbackMultiplier = 1.2
	test.AssertEquals(params1.KnockbackMultiplier, 1.2)

	player:AddCollectible(CollectibleType.COLLECTIBLE_TERRA)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.KnockbackMultiplier, 2.0)

	player:AddTrinket(TrinketType.TRINKET_BLISTER)

	local params3 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params3.KnockbackMultiplier, 3.0)
end

function TearParamsTest:TestSpeedMultiplier()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.SpeedMultiplier, 1.0)
	params1.SpeedMultiplier = 1.5
	test.AssertEquals(params1.SpeedMultiplier, 1.5)

	player:AddCollectible(CollectibleType.COLLECTIBLE_STYE)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params2.SpeedMultiplier, 0.8)

	local params3 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, -1, nil)
	test.AssertEquals(params3.SpeedMultiplier, 1.0)
end

function TearParamsTest:TestTearDisplacement()
	local player = Isaac.GetPlayer()

	local params1 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
	test.AssertEquals(params1.TearDisplacement, 1)
	params1.TearDisplacement = -1
	test.AssertEquals(params1.TearDisplacement, -1)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, -1, nil)
	test.AssertEquals(params2.TearDisplacement, -1)

	local params3 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 0, nil)
	test.AssertEquals(params3.TearDisplacement, 0)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 123, nil)
	test.AssertEquals(params2.TearDisplacement, 1)

	local params2 = player:GetTearHitParams(WeaponType.WEAPON_TEARS, 1, -123, nil)
	test.AssertEquals(params2.TearDisplacement, -1)
end


return TearParamsTest
