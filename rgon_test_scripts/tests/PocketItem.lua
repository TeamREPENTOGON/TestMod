local test = REPENTOGON_TEST

local PocketItemTest = {}

function PocketItemTest:BeforeEach()
	return Isaac.GetPlayer():GetPocketItem(0)
end

function PocketItemTest:AfterEach(pocketitem)
	
end

----------

function PocketItemTest:TestGetSlot(pocketitem)
	pocketitem:GetSlot()
end

function PocketItemTest:TestGetType(pocketitem)
	pocketitem:GetType()
end


return PocketItemTest
