local test = REPENTOGON_TEST

local TearParamsTest = {}

function TearParamsTest:BeforeEach()
	return Isaac.GetPlayer():GetTearHitParams(WeaponType.WEAPON_TEARS, 1, 1, nil)
end

function TearParamsTest:AfterEach(tearparams)
	
end

----------

function TearParamsTest:TestVarBombVariant(tearparams)
	local originalVal = tearparams.BombVariant
	for _, val in pairs(test.TestInts) do
		tearparams.BombVariant = val
		test.AssertEquals(tearparams.BombVariant, val)
	end
	tearparams.BombVariant = originalVal
end

function TearParamsTest:TestVarTearColor(tearparams)
	local originalVal = tearparams.TearColor
	for _, val in pairs(test.TestColors) do
		tearparams.TearColor = val
		test.AssertEquals(tearparams.TearColor, val)
	end
	tearparams.TearColor = originalVal
end

function TearParamsTest:TestVarTearDamage(tearparams)
	local originalVal = tearparams.TearDamage
	for _, val in pairs(test.TestFloats) do
		tearparams.TearDamage = val
		test.AssertEquals(tearparams.TearDamage, val)
	end
	tearparams.TearDamage = originalVal
end

function TearParamsTest:TestVarTearFlags(tearparams)
	local originalVal = tearparams.TearFlags
	tearparams.TearFlags = BitSet128()
	tearparams.TearFlags = originalVal
end

function TearParamsTest:TestVarTearHeight(tearparams)
	local originalVal = tearparams.TearHeight
	for _, val in pairs(test.TestFloats) do
		tearparams.TearHeight = val
		test.AssertEquals(tearparams.TearHeight, val)
	end
	tearparams.TearHeight = originalVal
end

function TearParamsTest:TestVarTearScale(tearparams)
	local originalVal = tearparams.TearScale
	for _, val in pairs(test.TestFloats) do
		tearparams.TearScale = val
		test.AssertEquals(tearparams.TearScale, val)
	end
	tearparams.TearScale = originalVal
end

function TearParamsTest:TestVarTearVariant(tearparams)
	local originalVal = tearparams.TearVariant
	for _, val in pairs(test.TestInts) do
		tearparams.TearVariant = val
		test.AssertEquals(tearparams.TearVariant, val)
	end
	tearparams.TearVariant = originalVal
end


return TearParamsTest
