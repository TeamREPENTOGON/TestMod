local test = REPENTOGON_TEST

local ProceduralItemManagerTest = {}

function ProceduralItemManagerTest:BeforeEach()
	
end

function ProceduralItemManagerTest:AfterEach()
	
end

----------

function ProceduralItemManagerTest:TestCreateProceduralItem()
	local seed = 1
	local unknown = 1
	ProceduralItemManager.CreateProceduralItem(seed, unknown)
end

function ProceduralItemManagerTest:TestGetProceduralItem()
	local index = 1
	ProceduralItemManager.GetProceduralItem(index)
end

function ProceduralItemManagerTest:TestGetProceduralItemCount()
	ProceduralItemManager.GetProceduralItemCount()
end


return ProceduralItemManagerTest
