local test = REPENTOGON_TEST

local MultiShotParamsTest = {}

function MultiShotParamsTest:BeforeEach()
	return Isaac.GetPlayer():GetMultiShotParams(1)
end

function MultiShotParamsTest:AfterEach(multishotparams)
	
end

----------

function MultiShotParamsTest:TestGetSpreadAngle(multishotparams)
	local weapontype = 1
	multishotparams:GetSpreadAngle(weapontype)
end

function MultiShotParamsTest:TestIsCrossEyed(multishotparams)
	multishotparams:IsCrossEyed()
end

function MultiShotParamsTest:TestIsShootingBackwards(multishotparams)
	multishotparams:IsShootingBackwards()
end

function MultiShotParamsTest:TestIsShootingSideways(multishotparams)
	multishotparams:IsShootingSideways()
end

function MultiShotParamsTest:TestSetIsCrossEyed(multishotparams)
	local value = true
	multishotparams:SetIsCrossEyed(value)
end

function MultiShotParamsTest:TestSetIsShootingBackwards(multishotparams)
	local value = true
	multishotparams:SetIsShootingBackwards(value)
end

function MultiShotParamsTest:TestSetIsShootingSideways(multishotparams)
	local value = true
	multishotparams:SetIsShootingSideways(value)
end

function MultiShotParamsTest:TestSetMultiEyeAngle(multishotparams)
	local originalVal = multishotparams:GetMultiEyeAngle()
	for _, val in pairs(test.TestFloats) do
		multishotparams:SetMultiEyeAngle(val)
		test.AssertEquals(multishotparams:GetMultiEyeAngle(), val)
	end
	multishotparams:SetMultiEyeAngle(originalVal)
end

function MultiShotParamsTest:TestSetNumEyesActive(multishotparams)
	local originalVal = multishotparams:GetNumEyesActive()
	for _, val in pairs(test.TestInts) do
		multishotparams:SetNumEyesActive(val)
		test.AssertEquals(multishotparams:GetNumEyesActive(), val)
	end
	multishotparams:SetNumEyesActive(originalVal)
end

function MultiShotParamsTest:TestSetNumLanesPerEye(multishotparams)
	local originalVal = multishotparams:GetNumLanesPerEye()
	for _, val in pairs(test.TestInt16s) do
		multishotparams:SetNumLanesPerEye(val)
		test.AssertEquals(multishotparams:GetNumLanesPerEye(), val)
	end
	multishotparams:SetNumLanesPerEye(originalVal)
end

function MultiShotParamsTest:TestSetNumRandomDirTears(multishotparams)
	local originalVal = multishotparams:GetNumRandomDirTears()
	for _, val in pairs(test.TestInt16s) do
		multishotparams:SetNumRandomDirTears(val)
		test.AssertEquals(multishotparams:GetNumRandomDirTears(), val)
	end
	multishotparams:SetNumRandomDirTears(originalVal)
end

function MultiShotParamsTest:TestSetNumTears(multishotparams)
	local originalVal = multishotparams:GetNumTears()
	for _, val in pairs(test.TestInt16s) do
		multishotparams:SetNumTears(val)
		test.AssertEquals(multishotparams:GetNumTears(), val)
	end
	multishotparams:SetNumTears(originalVal)
end

function MultiShotParamsTest:TestSetSpreadAngle(multishotparams)
	local weapontype = 1
	local angle = 1
	multishotparams:SetSpreadAngle(weapontype, angle)
end


return MultiShotParamsTest
