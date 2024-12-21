local test = REPENTOGON_TEST

local LootListTest = {}

function LootListTest:BeforeEach()
	local chest = (Isaac.FindByType(5, 50, 1)[1] or Isaac.Spawn(EntityType.ENTITY_PICKUP, 50, 1, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)):ToPickup()
	return chest:GetLootList()
end

function LootListTest:AfterEach(lootlist)
	
end

----------

function LootListTest:TestGetEntries(lootlist)
	lootlist:GetEntries()
end
--[[
function LootListTest:TestPushEntry(lootlist)
	local seed = 1234
	local rng = RNG(seed)
	lootlist:PushEntry(5, 20, 0, seed, rng)
end
]]

return LootListTest
