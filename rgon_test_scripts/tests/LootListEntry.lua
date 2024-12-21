local test = REPENTOGON_TEST

local LootListEntryTest = {}

function LootListEntryTest:BeforeEach()
	local chest = (Isaac.FindByType(5, 50, 1)[1] or Isaac.Spawn(EntityType.ENTITY_PICKUP, 50, 1, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)):ToPickup()
	return chest:GetLootList():GetEntries()[1]
end

function LootListEntryTest:AfterEach(lootlistentry)
	
end

----------

function LootListEntryTest:TestGetRNG(lootlistentry)
	lootlistentry:GetRNG()
end

function LootListEntryTest:TestGetSeed(lootlistentry)
	lootlistentry:GetSeed()
end

function LootListEntryTest:TestGetSubType(lootlistentry)
	lootlistentry:GetSubType()
end

function LootListEntryTest:TestGetType(lootlistentry)
	lootlistentry:GetType()
end

function LootListEntryTest:TestGetVariant(lootlistentry)
	lootlistentry:GetVariant()
end


return LootListEntryTest
