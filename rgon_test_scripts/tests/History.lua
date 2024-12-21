local test = REPENTOGON_TEST

local HistoryTest = {}

function HistoryTest:BeforeEach()
	return Isaac.GetPlayer():GetHistory()
end

function HistoryTest:AfterEach(history)
	
end

----------

function HistoryTest:TestGetCollectiblesHistory(history)
	history:GetCollectiblesHistory()
end

function HistoryTest:TestRemoveHistoryItemByIndex(history)
	local index = 1
	history:RemoveHistoryItemByIndex(index)
end


return HistoryTest
