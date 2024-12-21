local test = REPENTOGON_TEST

local ItemConfigCostumeTest = {}

function ItemConfigCostumeTest:BeforeEach()
	return Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION).Costume
end

function ItemConfigCostumeTest:AfterEach(itemconfigcostume)
	
end

----------

function ItemConfigCostumeTest:TestVarHasOverlay(itemconfigcostume)
	local originalVal = itemconfigcostume.HasOverlay
	itemconfigcostume.HasOverlay = true
	itemconfigcostume.HasOverlay = originalVal
end

function ItemConfigCostumeTest:TestVarHasSkinAlt(itemconfigcostume)
	local originalVal = itemconfigcostume.HasSkinAlt
	itemconfigcostume.HasSkinAlt = true
	itemconfigcostume.HasSkinAlt = originalVal
end

function ItemConfigCostumeTest:TestVarID(itemconfigcostume)
	local originalVal = itemconfigcostume.ID
	for _, val in pairs(test.TestInts) do
		itemconfigcostume.ID = val
		test.AssertEquals(itemconfigcostume.ID, val)
	end
	itemconfigcostume.ID = originalVal
end

function ItemConfigCostumeTest:TestVarIsFlying(itemconfigcostume)
	local originalVal = itemconfigcostume.IsFlying
	itemconfigcostume.IsFlying = true
	itemconfigcostume.IsFlying = originalVal
end

function ItemConfigCostumeTest:TestVarOverwriteColor(itemconfigcostume)
	local originalVal = itemconfigcostume.OverwriteColor
	itemconfigcostume.OverwriteColor = true
	itemconfigcostume.OverwriteColor = originalVal
end

function ItemConfigCostumeTest:TestVarPriority(itemconfigcostume)
	local originalVal = itemconfigcostume.Priority
	for _, val in pairs(test.TestInts) do
		itemconfigcostume.Priority = val
		test.AssertEquals(itemconfigcostume.Priority, val)
	end
	itemconfigcostume.Priority = originalVal
end

-- There is no setter for this implemented, so its effectively const, except trying to change it errors with "Costume expected, got number", which is odd.
-- It probably shouldn't be const?
-- Also, this is undocumented!
function ItemConfigCostumeTest:TestVarSkinColor(itemconfigcostume)
	local originalVal = itemconfigcostume.SkinColor
	for _, val in pairs(test.TestInts) do
		itemconfigcostume.SkinColor = val
		test.AssertEquals(itemconfigcostume.SkinColor, val)
	end
	itemconfigcostume.SkinColor = originalVal
end


return ItemConfigCostumeTest
