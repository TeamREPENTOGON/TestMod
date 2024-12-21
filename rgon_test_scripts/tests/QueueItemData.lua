local test = REPENTOGON_TEST

local QueueItemDataTest = {}

function QueueItemDataTest:BeforeEach()
	return Isaac.GetPlayer().QueuedItem
end

function QueueItemDataTest:AfterEach(queueitemdata)
	
end

----------

function QueueItemDataTest:TestVarCharge(queueitemdata)
	local originalVal = queueitemdata.Charge
	for _, val in pairs(test.TestInts) do
		queueitemdata.Charge = val
		test.AssertEquals(queueitemdata.Charge, val)
	end
	queueitemdata.Charge = originalVal
end

function QueueItemDataTest:TestVarItem(queueitemdata)
	local originalVal = queueitemdata.Item
	queueitemdata.Item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	queueitemdata.Item = originalVal
end

function QueueItemDataTest:TestVarTouched(queueitemdata)
	local originalVal = queueitemdata.Touched
	queueitemdata.Touched = true
	queueitemdata.Touched = originalVal
end


return QueueItemDataTest
