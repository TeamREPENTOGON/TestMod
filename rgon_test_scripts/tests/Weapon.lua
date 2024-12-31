local test = REPENTOGON_TEST

local WeaponTest = {}

function WeaponTest:BeforeEach()
	return Isaac.GetPlayer():GetWeapon(1)
end

function WeaponTest:AfterEach(weapon)
	
end

----------

function WeaponTest:TestClearItemAnim(weapon)
	local itemid = 1
	weapon:ClearItemAnim(itemid)
end

function WeaponTest:TestGetDirection(weapon)
	weapon:GetDirection()
end

function WeaponTest:TestGetMaxFireDelay(weapon)
	weapon:GetMaxFireDelay()
end

function WeaponTest:TestGetNumFired(weapon)
	weapon:GetNumFired()
end

function WeaponTest:TestGetOwner(weapon)
	weapon:GetOwner()
end

function WeaponTest:TestGetWeaponType(weapon)
	weapon:GetWeaponType()
end

function WeaponTest:TestIsAxisAligned(weapon)
	weapon:IsAxisAligned()
end

function WeaponTest:TestIsItemAnimFinished(weapon)
	local itemid = 1
	weapon:IsItemAnimFinished(itemid)
end

function WeaponTest:TestPlayItemAnim(weapon)
	local itemid = 1
	local animdirection = 1
	local position = Vector(1,1)
	local charge = 1
	weapon:PlayItemAnim(itemid, animdirection, position, charge)
end

function WeaponTest:TestSetCharge(weapon)
	local originalVal = weapon:GetCharge()
	for _, val in pairs(test.TestFloats) do
		weapon:SetCharge(val)
		test.AssertEquals(weapon:GetCharge(), val)
	end
	weapon:SetCharge(originalVal)
end

function WeaponTest:TestSetFireDelay(weapon)
	local originalVal = weapon:GetFireDelay()
	for _, val in pairs(test.TestFloats) do
		weapon:SetFireDelay(val)
		test.AssertEquals(weapon:GetFireDelay(), val)
	end
	weapon:SetFireDelay(originalVal)
end

function WeaponTest:TestSetHeadLockTime(weapon)
	local t = 1
	weapon:SetHeadLockTime(t)
end

-- Looks like Weapon:SetModifiers or's the provided flags into the existing ones rather than overwriting them.
-- So there's no way to remove the flags once added?
-- Also, looks like the default modifiers value is `1`, despite the docs claiming that that value is used for chocolate milk.
-- ...Do these even DO anything?
function WeaponTest:TestSetModifiers(weapon)
	local originalVal = weapon:GetModifiers()
	for _, val in pairs(test.TestUnsignedInts) do
		weapon:SetModifiers(val)
		test.AssertEquals(weapon:GetModifiers(), val)
	end
	weapon:SetModifiers(originalVal)
end


return WeaponTest
