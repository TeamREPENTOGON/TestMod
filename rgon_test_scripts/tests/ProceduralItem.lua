local test = REPENTOGON_TEST

local ProceduralItemTest = {}

function ProceduralItemTest:BeforeEach()
	if not ProceduralItemManager.GetProceduralItem(0) then
		ProceduralItemManager.CreateProceduralItem(1234, 0)
	end
	return ProceduralItemManager.GetProceduralItem(0)
end

function ProceduralItemTest:AfterEach(proceduralitem)
	
end

----------

function ProceduralItemTest:TestGetDamage(proceduralitem)
	proceduralitem:GetDamage()
end

function ProceduralItemTest:TestGetEffect(proceduralitem)
	local index = 1
	proceduralitem:GetEffect(index)
end

function ProceduralItemTest:TestGetEffectCount(proceduralitem)
	proceduralitem:GetEffectCount()
end

function ProceduralItemTest:TestGetFireDelay(proceduralitem)
	proceduralitem:GetFireDelay()
end

function ProceduralItemTest:TestGetID(proceduralitem)
	proceduralitem:GetID()
end

function ProceduralItemTest:TestGetItem(proceduralitem)
	proceduralitem:GetItem()
end

function ProceduralItemTest:TestGetLuck(proceduralitem)
	proceduralitem:GetLuck()
end

function ProceduralItemTest:TestGetRange(proceduralitem)
	proceduralitem:GetRange()
end

function ProceduralItemTest:TestGetShotSpeed(proceduralitem)
	proceduralitem:GetShotSpeed()
end

function ProceduralItemTest:TestGetSpeed(proceduralitem)
	proceduralitem:GetSpeed()
end

function ProceduralItemTest:TestGetTargetItem(proceduralitem)
	proceduralitem:GetTargetItem()
end


return ProceduralItemTest
