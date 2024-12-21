local test = REPENTOGON_TEST

local ItemConfigTest = {}

function ItemConfigTest:BeforeEach()
	return Isaac.GetItemConfig()
end

function ItemConfigTest:AfterEach(itemconfig)
	
end

----------

function ItemConfigTest:TestGetCard(itemconfig)
	local id = 1
	itemconfig:GetCard(id)
end

function ItemConfigTest:TestGetCards(itemconfig)
	itemconfig:GetCards()
end

function ItemConfigTest:TestGetCollectible(itemconfig)
	local id = 1
	itemconfig:GetCollectible(id)
end

function ItemConfigTest:TestGetCollectibles(itemconfig)
	itemconfig:GetCollectibles()
end

function ItemConfigTest:TestGetNullItem(itemconfig)
	local id = 1
	itemconfig:GetNullItem(id)
end

function ItemConfigTest:TestGetNullItems(itemconfig)
	itemconfig:GetNullItems()
end

function ItemConfigTest:TestGetPillEffect(itemconfig)
	local id = 1
	itemconfig:GetPillEffect(id)
end

function ItemConfigTest:TestGetPillEffects(itemconfig)
	itemconfig:GetPillEffects()
end

function ItemConfigTest:TestGetTrinket(itemconfig)
	local id = 1
	itemconfig:GetTrinket(id)
end

function ItemConfigTest:TestGetTrinkets(itemconfig)
	itemconfig:GetTrinkets()
end

function ItemConfigTest:TestIsValidCollectible(itemconfig)
	local id = 1
	ItemConfig.Config.IsValidCollectible(id)
end

function ItemConfigTest:TestShouldAddCostumeOnPickup(itemconfig)
	local config = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	ItemConfig.Config.ShouldAddCostumeOnPickup(config)
end

function ItemConfigTest:TestCanRerollCollectible(itemconfig)
	local id = 1
	itemconfig.CanRerollCollectible(id)
end

function ItemConfigTest:TestGetTaggedItems(itemconfig)
	local tags = 1
	itemconfig:GetTaggedItems(tags)
end


return ItemConfigTest
