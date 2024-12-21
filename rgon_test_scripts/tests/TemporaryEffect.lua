local test = REPENTOGON_TEST

local TemporaryEffectTest = {}

function TemporaryEffectTest:BeforeEach()
	local effects = Isaac.GetPlayer():GetEffects()
	if not effects:GetCollectibleEffect(1) then
		effects:AddCollectibleEffect(1)
	end
	return effects:GetCollectibleEffect(1)
end

function TemporaryEffectTest:AfterEach(temporaryeffect)
	
end

----------

function TemporaryEffectTest:TestVarCooldown(temporaryeffect)
	local originalVal = temporaryeffect.Cooldown
	for _, val in pairs(test.TestInts) do
		temporaryeffect.Cooldown = val
		test.AssertEquals(temporaryeffect.Cooldown, val)
	end
	temporaryeffect.Cooldown = originalVal
end

function TemporaryEffectTest:TestVarCount(temporaryeffect)
	local originalVal = temporaryeffect.Count
	for _, val in pairs(test.TestInts) do
		temporaryeffect.Count = val
		test.AssertEquals(temporaryeffect.Count, val)
	end
	temporaryeffect.Count = originalVal
end

function TemporaryEffectTest:TestVarItem(temporaryeffect)
	local originalVal = temporaryeffect.Item
	temporaryeffect.Item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	temporaryeffect.Item = originalVal
end


return TemporaryEffectTest
