local test = REPENTOGON_TEST

local HistoryItemTest = {}

function HistoryItemTest:BeforeEach()
	local history = Isaac.GetPlayer():GetHistory()
	if not history:GetCollectiblesHistory()[1] then
		Isaac.GetPlayer():AddCollectible(1)
	end
	return history:GetCollectiblesHistory()[1]
end

function HistoryItemTest:AfterEach(historyitem)
	
end

----------

function HistoryItemTest:TestGetItemID(historyitem)
	historyitem:GetItemID()
end

function HistoryItemTest:TestGetItemPoolType(historyitem)
	historyitem:GetItemPoolType()
end

function HistoryItemTest:TestGetLevelStage(historyitem)
	historyitem:GetLevelStage()
end

function HistoryItemTest:TestGetRoomType(historyitem)
	historyitem:GetRoomType()
end

function HistoryItemTest:TestGetStageType(historyitem)
	historyitem:GetStageType()
end

function HistoryItemTest:TestGetTime(historyitem)
	historyitem:GetTime()
end

function HistoryItemTest:TestIsTrinket(historyitem)
	historyitem:IsTrinket()
end


return HistoryItemTest
