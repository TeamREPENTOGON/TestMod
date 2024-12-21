local test = REPENTOGON_TEST

local StageTransitionTest = {}

function StageTransitionTest:BeforeEach()
	
end

function StageTransitionTest:AfterEach()
	
end

----------

function StageTransitionTest:TestGetSameStage()
	StageTransition.GetSameStage()
end

function StageTransitionTest:TestSetSameStage()
	local value = true
	StageTransition.SetSameStage(value)
end


return StageTransitionTest
