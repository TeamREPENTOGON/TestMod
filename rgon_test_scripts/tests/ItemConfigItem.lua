local test = REPENTOGON_TEST

local ItemConfigItemTest = {}

function ItemConfigItemTest:BeforeEach()
	return Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
end

function ItemConfigItemTest:AfterEach(itemconfigitem)
	
end

----------

function ItemConfigItemTest:TestHasTags(itemconfigitem)
	local tags = 1
	itemconfigitem:HasTags(tags)
end

function ItemConfigItemTest:TestIsAvailable(itemconfigitem)
	itemconfigitem:IsAvailable()
end

function ItemConfigItemTest:TestIsCollectible(itemconfigitem)
	itemconfigitem:IsCollectible()
end

function ItemConfigItemTest:TestIsNull(itemconfigitem)
	itemconfigitem:IsNull()
end

function ItemConfigItemTest:TestIsTrinket(itemconfigitem)
	itemconfigitem:IsTrinket()
end

function ItemConfigItemTest:TestGetCustomCacheTags(itemconfigitem)
	itemconfigitem:GetCustomCacheTags()
end

function ItemConfigItemTest:TestGetCustomTags(itemconfigitem)
	itemconfigitem:GetCustomTags()
end

function ItemConfigItemTest:TestHasCustomCacheTag(itemconfigitem)
	local tag = "hello"
	itemconfigitem:HasCustomCacheTag(tag)
end

function ItemConfigItemTest:TestHasCustomTag(itemconfigitem)
	local tag = "hello"
	itemconfigitem:HasCustomTag(tag)
end

function ItemConfigItemTest:TestVarAchievementID(itemconfigitem)
	local originalVal = itemconfigitem.AchievementID
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AchievementID = val
		test.AssertEquals(itemconfigitem.AchievementID, val)
	end
	itemconfigitem.AchievementID = originalVal
end

function ItemConfigItemTest:TestVarAddBlackHearts(itemconfigitem)
	local originalVal = itemconfigitem.AddBlackHearts
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddBlackHearts = val
		test.AssertEquals(itemconfigitem.AddBlackHearts, val)
	end
	itemconfigitem.AddBlackHearts = originalVal
end

function ItemConfigItemTest:TestVarAddBombs(itemconfigitem)
	local originalVal = itemconfigitem.AddBombs
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddBombs = val
		test.AssertEquals(itemconfigitem.AddBombs, val)
	end
	itemconfigitem.AddBombs = originalVal
end

function ItemConfigItemTest:TestVarAddCoins(itemconfigitem)
	local originalVal = itemconfigitem.AddCoins
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddCoins = val
		test.AssertEquals(itemconfigitem.AddCoins, val)
	end
	itemconfigitem.AddCoins = originalVal
end

function ItemConfigItemTest:TestVarAddCostumeOnPickup(itemconfigitem)
	local originalVal = itemconfigitem.AddCostumeOnPickup
	itemconfigitem.AddCostumeOnPickup = true
	itemconfigitem.AddCostumeOnPickup = originalVal
end

function ItemConfigItemTest:TestVarAddHearts(itemconfigitem)
	local originalVal = itemconfigitem.AddHearts
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddHearts = val
		test.AssertEquals(itemconfigitem.AddHearts, val)
	end
	itemconfigitem.AddHearts = originalVal
end

function ItemConfigItemTest:TestVarAddKeys(itemconfigitem)
	local originalVal = itemconfigitem.AddKeys
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddKeys = val
		test.AssertEquals(itemconfigitem.AddKeys, val)
	end
	itemconfigitem.AddKeys = originalVal
end

function ItemConfigItemTest:TestVarAddMaxHearts(itemconfigitem)
	local originalVal = itemconfigitem.AddMaxHearts
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddMaxHearts = val
		test.AssertEquals(itemconfigitem.AddMaxHearts, val)
	end
	itemconfigitem.AddMaxHearts = originalVal
end

function ItemConfigItemTest:TestVarAddSoulHearts(itemconfigitem)
	local originalVal = itemconfigitem.AddSoulHearts
	for _, val in pairs(test.TestInts) do
		itemconfigitem.AddSoulHearts = val
		test.AssertEquals(itemconfigitem.AddSoulHearts, val)
	end
	itemconfigitem.AddSoulHearts = originalVal
end

function ItemConfigItemTest:TestVarCacheFlags(itemconfigitem)
	local originalVal = itemconfigitem.CacheFlags
	for _, val in pairs(test.TestUnsignedInts) do
		itemconfigitem.CacheFlags = val
		test.AssertEquals(itemconfigitem.CacheFlags, val)
	end
	itemconfigitem.CacheFlags = originalVal
end

function ItemConfigItemTest:TestVarChargeType(itemconfigitem)
	local originalVal = itemconfigitem.ChargeType
	for _, val in pairs(test.TestInts) do
		itemconfigitem.ChargeType = val
		test.AssertEquals(itemconfigitem.ChargeType, val)
	end
	itemconfigitem.ChargeType = originalVal
end

function ItemConfigItemTest:TestVarClearEffectsOnRemove(itemconfigitem)
	local originalVal = itemconfigitem.ClearEffectsOnRemove
	itemconfigitem.ClearEffectsOnRemove = true
	itemconfigitem.ClearEffectsOnRemove = originalVal
end

function ItemConfigItemTest:TestVarCostume(itemconfigitem)
	local costume = itemconfigitem.Costume
end

function ItemConfigItemTest:TestVarCraftingQuality(itemconfigitem)
	local originalVal = itemconfigitem.CraftingQuality
	for _, val in pairs(test.TestInts) do
		itemconfigitem.CraftingQuality = val
		test.AssertEquals(itemconfigitem.CraftingQuality, val)
	end
	itemconfigitem.CraftingQuality = originalVal
end

function ItemConfigItemTest:TestVarDescription(itemconfigitem)
	local originalVal = itemconfigitem.Description
	for _, val in pairs(test.TestStrings) do
		itemconfigitem.Description = val
		test.AssertEquals(itemconfigitem.Description, val)
	end
	itemconfigitem.Description = originalVal
end

function ItemConfigItemTest:TestVarDevilPrice(itemconfigitem)
	local originalVal = itemconfigitem.DevilPrice
	for _, val in pairs(test.TestInt16s) do
		itemconfigitem.DevilPrice = val
		test.AssertEquals(itemconfigitem.DevilPrice, val)
	end
	itemconfigitem.DevilPrice = originalVal
end

function ItemConfigItemTest:TestVarGfxFileName(itemconfigitem)
	local originalVal = itemconfigitem.GfxFileName
	for _, val in pairs(test.TestStrings) do
		itemconfigitem.GfxFileName = val
		test.AssertEquals(itemconfigitem.GfxFileName, val)
	end
	itemconfigitem.GfxFileName = originalVal
end

function ItemConfigItemTest:TestVarHidden(itemconfigitem)
	local originalVal = itemconfigitem.Hidden
	itemconfigitem.Hidden = true
	itemconfigitem.Hidden = originalVal
end

function ItemConfigItemTest:TestVarID(itemconfigitem)
	local originalVal = itemconfigitem.ID
	for _, val in pairs(test.TestInts) do
		itemconfigitem.ID = val
		test.AssertEquals(itemconfigitem.ID, val)
	end
	itemconfigitem.ID = originalVal
end

function ItemConfigItemTest:TestVarInitCharge(itemconfigitem)
	local originalVal = itemconfigitem.InitCharge
	for _, val in pairs(test.TestInts) do
		itemconfigitem.InitCharge = val
		test.AssertEquals(itemconfigitem.InitCharge, val)
	end
	itemconfigitem.InitCharge = originalVal
end

function ItemConfigItemTest:TestVarMaxCharges(itemconfigitem)
	local originalVal = itemconfigitem.MaxCharges
	for _, val in pairs(test.TestInts) do
		itemconfigitem.MaxCharges = val
		test.AssertEquals(itemconfigitem.MaxCharges, val)
	end
	itemconfigitem.MaxCharges = originalVal
end

function ItemConfigItemTest:TestVarMaxCooldown(itemconfigitem)
	local originalVal = itemconfigitem.MaxCooldown
	for _, val in pairs(test.TestInts) do
		itemconfigitem.MaxCooldown = val
		test.AssertEquals(itemconfigitem.MaxCooldown, val)
	end
	itemconfigitem.MaxCooldown = originalVal
end

function ItemConfigItemTest:TestVarName(itemconfigitem)
	local originalVal = itemconfigitem.Name
	for _, val in pairs(test.TestStrings) do
		itemconfigitem.Name = val
		test.AssertEquals(itemconfigitem.Name, val)
	end
	itemconfigitem.Name = originalVal
end

function ItemConfigItemTest:TestVarPassiveCache(itemconfigitem)
	local originalVal = itemconfigitem.PassiveCache
	itemconfigitem.PassiveCache = true
	itemconfigitem.PassiveCache = originalVal
end

function ItemConfigItemTest:TestVarPersistentEffect(itemconfigitem)
	local originalVal = itemconfigitem.PersistentEffect
	itemconfigitem.PersistentEffect = true
	itemconfigitem.PersistentEffect = originalVal
end

function ItemConfigItemTest:TestVarQuality(itemconfigitem)
	local originalVal = itemconfigitem.Quality
	for _, val in pairs(test.TestInts) do
		itemconfigitem.Quality = val
		test.AssertEquals(itemconfigitem.Quality, val)
	end
	itemconfigitem.Quality = originalVal
end

function ItemConfigItemTest:TestVarShopPrice(itemconfigitem)
	local originalVal = itemconfigitem.ShopPrice
	for _, val in pairs(test.TestInt16s) do
		itemconfigitem.ShopPrice = val
		test.AssertEquals(itemconfigitem.ShopPrice, val)
	end
	itemconfigitem.ShopPrice = originalVal
end

function ItemConfigItemTest:TestVarSpecial(itemconfigitem)
	local originalVal = itemconfigitem.Special
	itemconfigitem.Special = true
	itemconfigitem.Special = originalVal
end

function ItemConfigItemTest:TestVarTags(itemconfigitem)
	local originalVal = itemconfigitem.Tags
	for _, val in pairs(test.TestInts) do
		itemconfigitem.Tags = val
		test.AssertEquals(itemconfigitem.Tags, val)
	end
	itemconfigitem.Tags = originalVal
end

function ItemConfigItemTest:TestVarType(itemconfigitem)
	local originalVal = itemconfigitem.Type
	for _, val in pairs(test.TestInts) do
		itemconfigitem.Type = val
		test.AssertEquals(itemconfigitem.Type, val)
	end
	itemconfigitem.Type = originalVal
end


return ItemConfigItemTest
