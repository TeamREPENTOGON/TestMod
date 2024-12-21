local test = REPENTOGON_TEST

local ScoreSheetTest = {}

function ScoreSheetTest:BeforeEach()
	
end

function ScoreSheetTest:AfterEach()
	
end

----------

function ScoreSheetTest:TestAddFinishedStage()
	local stage = 1
	local stagetype = 1
	local time = 1
	ScoreSheet.AddFinishedStage(stage, stagetype, time)
end

function ScoreSheetTest:TestCalculate()
	ScoreSheet.Calculate()
end

function ScoreSheetTest:TestGetBlueBabyBonus()
	ScoreSheet.GetBlueBabyBonus()
end

function ScoreSheetTest:TestGetDamagePenalty()
	ScoreSheet.GetDamagePenalty()
end

function ScoreSheetTest:TestGetExplorationBonus()
	ScoreSheet.GetExplorationBonus()
end

function ScoreSheetTest:TestGetItemPenalty()
	ScoreSheet.GetItemPenalty()
end

function ScoreSheetTest:TestGetLambBonus()
	ScoreSheet.GetLambBonus()
end

function ScoreSheetTest:TestGetMegaSatanBonus()
	ScoreSheet.GetMegaSatanBonus()
end

function ScoreSheetTest:TestGetRunTime()
	ScoreSheet.GetRunTime()
end

function ScoreSheetTest:TestGetRunTimeLevel()
	ScoreSheet.GetRunTimeLevel()
end

function ScoreSheetTest:TestGetRunTimeLevelType()
	ScoreSheet.GetRunTimeLevelType()
end

function ScoreSheetTest:TestGetRushBonus()
	ScoreSheet.GetRushBonus()
end

function ScoreSheetTest:TestGetSchwagBonus()
	ScoreSheet.GetSchwagBonus()
end

function ScoreSheetTest:TestGetStageBonus()
	ScoreSheet.GetStageBonus()
end

function ScoreSheetTest:TestGetTimePenalty()
	ScoreSheet.GetTimePenalty()
end

function ScoreSheetTest:TestGetTotalScore()
	ScoreSheet.GetTotalScore()
end

function ScoreSheetTest:TestSetRunEnding()
	local originalVal = ScoreSheet.GetRunEnding()
	for _, val in pairs(test.TestInts) do
		ScoreSheet.SetRunEnding(val)
		test.AssertEquals(ScoreSheet.GetRunEnding(), val)
	end
	ScoreSheet.SetRunEnding(originalVal)
end


return ScoreSheetTest
