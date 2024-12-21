local test = REPENTOGON_TEST

local WeightedOutcomePickerTest = {}

function WeightedOutcomePickerTest:BeforeEach()
	return WeightedOutcomePicker()
end

function WeightedOutcomePickerTest:AfterEach(weightedoutcomepicker)
	
end

----------

function WeightedOutcomePickerTest:TestAddOutcomeFloat(weightedoutcomepicker)
	local value = 1
	local weight = 1
	local scalefactor = 1
	weightedoutcomepicker:AddOutcomeFloat(value, weight, scalefactor)
end

function WeightedOutcomePickerTest:TestAddOutcomeWeight(weightedoutcomepicker)
	local value = 1
	local weight = 1
	weightedoutcomepicker:AddOutcomeWeight(value, weight)
end

function WeightedOutcomePickerTest:TestClearOutcomes(weightedoutcomepicker)
	weightedoutcomepicker:ClearOutcomes()
end

function WeightedOutcomePickerTest:TestGetNumOutcomes(weightedoutcomepicker)
	weightedoutcomepicker:GetNumOutcomes()
end

function WeightedOutcomePickerTest:TestGetOutcomes(weightedoutcomepicker)
	weightedoutcomepicker:GetOutcomes()
end

function WeightedOutcomePickerTest:TestPickOutcome(weightedoutcomepicker)
	local rng = RNG()
	weightedoutcomepicker:PickOutcome(rng)
end

function WeightedOutcomePickerTest:TestRemoveOutcome(weightedoutcomepicker)
	local value = 1
	weightedoutcomepicker:RemoveOutcome(value)
end


return WeightedOutcomePickerTest
