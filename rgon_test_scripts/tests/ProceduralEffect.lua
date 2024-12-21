local test = REPENTOGON_TEST

local ProceduralEffectTest = {}

function ProceduralEffectTest:BeforeEach()
	if not ProceduralItemManager.GetProceduralItem(0) then
		ProceduralItemManager.CreateProceduralItem(1234, 0)
	end
	return ProceduralItemManager.GetProceduralItem(0):GetEffect(0)
end

function ProceduralEffectTest:AfterEach(proceduraleffect)
	
end

----------

function ProceduralEffectTest:TestGetActionProperty(proceduraleffect)
	proceduraleffect:GetActionProperty()
end

function ProceduralEffectTest:TestGetActionType(proceduraleffect)
	proceduraleffect:GetActionType()
end

function ProceduralEffectTest:TestGetConditionProperty(proceduraleffect)
	proceduraleffect:GetConditionProperty()
end

function ProceduralEffectTest:TestGetConditionType(proceduraleffect)
	proceduraleffect:GetConditionType()
end

function ProceduralEffectTest:TestGetTriggerChance(proceduraleffect)
	proceduraleffect:GetTriggerChance()
end


return ProceduralEffectTest
