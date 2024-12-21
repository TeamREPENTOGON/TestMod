local test = REPENTOGON_TEST

local EntityPickupTest = include(REPENTOGON_TEST.TestsRoot .. "Entity")

function EntityPickupTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, 0, Vector.Zero, Vector.Zero, nil):ToPickup()
end

function EntityPickupTest:AfterEach(entitypickup)
	entitypickup:Remove()
end

----------

function EntityPickupTest:TestAppearFast(entitypickup)
	entitypickup:AppearFast()
end

function EntityPickupTest:TestCanReroll(entitypickup)
	entitypickup:CanReroll()
end

function EntityPickupTest:TestGetCoinValue(entitypickup)
	entitypickup:GetCoinValue()
end

function EntityPickupTest:TestIsShopItem(entitypickup)
	entitypickup:IsShopItem()
end

function EntityPickupTest:TestMorph(entitypickup)
	local keepprice = true
	local keepseed = true
	local ignoremodifiers = true
	entitypickup:Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, 0, keepprice, keepseed, ignoremodifiers)
end

function EntityPickupTest:TestPlayDropSound(entitypickup)
	entitypickup:PlayDropSound()
end

function EntityPickupTest:TestPlayPickupSound(entitypickup)
	entitypickup:PlayPickupSound()
end

function EntityPickupTest:TestTryOpenChest(entitypickup)
	local player = Isaac.GetPlayer()
	entitypickup:TryOpenChest(player)
end

function EntityPickupTest:TestAddCollectibleCycle(entitypickup)
	local id = 1
	entitypickup:AddCollectibleCycle(id)
end

function EntityPickupTest:TestGetCollectibleCycle(entitypickup)
	entitypickup:GetCollectibleCycle()
end

function EntityPickupTest:TestGetLootList(entitypickup)
	entitypickup:GetLootList()
end

function EntityPickupTest:TestGetMegaChestLeftCollectible(entitypickup)
	entitypickup:GetMegaChestLeftCollectible()
end

function EntityPickupTest:TestGetMegaChestRightCollectible(entitypickup)
	entitypickup:GetMegaChestRightCollectible()
end

function EntityPickupTest:TestGetPickupGhost(entitypickup)
	entitypickup:GetPickupGhost()
end

function EntityPickupTest:TestGetPriceSprite(entitypickup)
	entitypickup:GetPriceSprite()
end

function EntityPickupTest:TestGetRandomPickupVelocity(entitypickup)
	local position = Vector(1,1)
	local rng = RNG()
	local velocitytype = 1
	EntityPickup.GetRandomPickupVelocity(position, rng, velocitytype)
end

function EntityPickupTest:TestIsBlind(entitypickup)
	entitypickup:IsBlind()
end

function EntityPickupTest:TestMakeShopItem(entitypickup)
	local shopitemid = 1
	entitypickup:MakeShopItem(shopitemid)
end

function EntityPickupTest:TestRemoveCollectibleCycle(entitypickup)
	entitypickup:RemoveCollectibleCycle()
end

function EntityPickupTest:TestSetAlternatePedestal()
	local pedestal = Isaac.Spawn(EntityType.ENTITY_PICKUP, 100, 1, Game():GetRoom():GetCenterPos(), Vector.Zero, nil):ToPickup()
	pedestal:SetAlternatePedestal(0)
	test.AssertEquals(pedestal:GetAlternatePedestal(), 0)
	pedestal:SetAlternatePedestal(1)
	test.AssertEquals(pedestal:GetAlternatePedestal(), 1)
	pedestal:Remove()
end

function EntityPickupTest:TestSetDropDelay(entitypickup)
	local originalVal = entitypickup:GetDropDelay()
	for _, val in pairs(test.TestInts) do
		entitypickup:SetDropDelay(val)
		test.AssertEquals(entitypickup:GetDropDelay(), val)
	end
	entitypickup:SetDropDelay(originalVal)
end

function EntityPickupTest:TestSetForceBlind(entitypickup)
	local setblind = true
	entitypickup:SetForceBlind(setblind)
end

function EntityPickupTest:TestSetNewOptionsPickupIndex(entitypickup)
	entitypickup:SetNewOptionsPickupIndex()
end

function EntityPickupTest:TestSetVarData(entitypickup)
	local originalVal = entitypickup:GetVarData()
	for _, val in pairs(test.TestInts) do
		entitypickup:SetVarData(val)
		test.AssertEquals(entitypickup:GetVarData(), val)
	end
	entitypickup:SetVarData(originalVal)
end

function EntityPickupTest:TestTriggerTheresOptionsPickup(entitypickup)
	entitypickup:TriggerTheresOptionsPickup()
end

function EntityPickupTest:TestTryFlip(entitypickup)
	entitypickup:TryFlip()
end

function EntityPickupTest:TestTryInitOptionCycle(entitypickup)
	local numcycle = 1
	entitypickup:TryInitOptionCycle(numcycle)
end

function EntityPickupTest:TestTryRemoveCollectible(entitypickup)
	entitypickup:TryRemoveCollectible()
end

function EntityPickupTest:TestUpdatePickupGhosts(entitypickup)
	entitypickup:UpdatePickupGhosts()
end

function EntityPickupTest:TestVarAutoUpdatePrice(entitypickup)
	local originalVal = entitypickup.AutoUpdatePrice
	entitypickup.AutoUpdatePrice = true
	entitypickup.AutoUpdatePrice = originalVal
end

function EntityPickupTest:TestVarCharge(entitypickup)
	local originalVal = entitypickup.Charge
	for _, val in pairs(test.TestInts) do
		entitypickup.Charge = val
		test.AssertEquals(entitypickup.Charge, val)
	end
	entitypickup.Charge = originalVal
end

function EntityPickupTest:TestVarOptionsPickupIndex(entitypickup)
	local originalVal = entitypickup.OptionsPickupIndex
	for _, val in pairs(test.TestInts) do
		entitypickup.OptionsPickupIndex = val
		test.AssertEquals(entitypickup.OptionsPickupIndex, val)
	end
	entitypickup.OptionsPickupIndex = originalVal
end

function EntityPickupTest:TestVarPrice(entitypickup)
	local originalVal = entitypickup.Price
	for _, val in pairs(test.TestInts) do
		entitypickup.Price = val
		test.AssertEquals(entitypickup.Price, val)
	end
	entitypickup.Price = originalVal
end

function EntityPickupTest:TestVarShopItemId(entitypickup)
	local originalVal = entitypickup.ShopItemId
	for _, val in pairs(test.TestInts) do
		entitypickup.ShopItemId = val
		test.AssertEquals(entitypickup.ShopItemId, val)
	end
	entitypickup.ShopItemId = originalVal
end

function EntityPickupTest:TestVarState(entitypickup)
	local originalVal = entitypickup.State
	for _, val in pairs(test.TestUnsignedInts) do
		entitypickup.State = val
		test.AssertEquals(entitypickup.State, val)
	end
	entitypickup.State = originalVal
end

function EntityPickupTest:TestVarTimeout(entitypickup)
	local originalVal = entitypickup.Timeout
	for _, val in pairs(test.TestInts) do
		entitypickup.Timeout = val
		test.AssertEquals(entitypickup.Timeout, val)
	end
	entitypickup.Timeout = originalVal
end

function EntityPickupTest:TestVarTouched(entitypickup)
	local originalVal = entitypickup.Touched
	entitypickup.Touched = true
	entitypickup.Touched = originalVal
end

function EntityPickupTest:TestVarWait(entitypickup)
	local originalVal = entitypickup.Wait
	for _, val in pairs(test.TestInts) do
		entitypickup.Wait = val
		test.AssertEquals(entitypickup.Wait, val)
	end
	entitypickup.Wait = originalVal
end


return EntityPickupTest
