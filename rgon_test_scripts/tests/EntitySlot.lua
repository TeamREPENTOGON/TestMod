local test = REPENTOGON_TEST

local EntitySlotTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntitySlotTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_SLOT, SlotVariant.SLOT_MACHINE, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToSlot()
end

function EntitySlotTest:AfterEach(entityslot)
	entityslot:Remove()
end

----------

function EntitySlotTest:TestCreateDropsFromExplosion(entityslot)
	entityslot:CreateDropsFromExplosion()
end

function EntitySlotTest:TestRandomCoinJamAnim(entityslot)
	entityslot:RandomCoinJamAnim()
end

function EntitySlotTest:TestSetDonationValue(entityslot)
	local originalVal = entityslot:GetDonationValue()
	for _, val in pairs(test.TestInts) do
		entityslot:SetDonationValue(val)
		test.AssertEquals(entityslot:GetDonationValue(), val)
	end
	entityslot:SetDonationValue(originalVal)
end

function EntitySlotTest:TestSetPrizeCollectible(entityslot)
	local originalVal = entityslot:GetPrizeCollectible()
	for _, val in pairs(test.TestInts) do
		entityslot:SetPrizeCollectible(val)
		test.AssertEquals(entityslot:GetPrizeCollectible(), val)
	end
	entityslot:SetPrizeCollectible(originalVal)
end

function EntitySlotTest:TestSetPrizeType(entityslot)
	local originalVal = entityslot:GetPrizeType()
	for _, val in pairs(test.TestInts) do
		entityslot:SetPrizeType(val)
		test.AssertEquals(entityslot:GetPrizeType(), val)
	end
	entityslot:SetPrizeType(originalVal)
end

function EntitySlotTest:TestSetShellGameAnimationIndex(entityslot)
	local originalVal = entityslot:GetShellGameAnimationIndex()
	for _, val in pairs(test.TestInt16s) do
		entityslot:SetShellGameAnimationIndex(val)
		test.AssertEquals(entityslot:GetShellGameAnimationIndex(), val)
	end
	entityslot:SetShellGameAnimationIndex(originalVal)
end

function EntitySlotTest:TestSetState(entityslot)
	local originalVal = entityslot:GetState()
	for _, val in pairs(test.TestInts) do
		entityslot:SetState(val)
		test.AssertEquals(entityslot:GetState(), val)
	end
	entityslot:SetState(originalVal)
end

function EntitySlotTest:TestSetTimeout(entityslot)
	local originalVal = entityslot:GetTimeout()
	for _, val in pairs(test.TestInt16s) do
		entityslot:SetTimeout(val)
		test.AssertEquals(entityslot:GetTimeout(), val)
	end
	entityslot:SetTimeout(originalVal)
end

function EntitySlotTest:TestSetTouch(entityslot)
	local originalVal = entityslot:GetTouch()
	for _, val in pairs(test.TestUInt16s) do
		entityslot:SetTouch(val)
		test.AssertEquals(entityslot:GetTouch(), val)
	end
	entityslot:SetTouch(originalVal)
end

function EntitySlotTest:TestSetTriggerTimerNum(entityslot)
	local originalVal = entityslot:GetTriggerTimerNum()
	for _, val in pairs(test.TestUnsignedInts) do
		entityslot:SetTriggerTimerNum(val)
		test.AssertEquals(entityslot:GetTriggerTimerNum(), val)
	end
	entityslot:SetTriggerTimerNum(originalVal)
end


return EntitySlotTest
