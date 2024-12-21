local test = REPENTOGON_TEST

local EntityConfigTest = {}

function EntityConfigTest:BeforeEach()
	
end

function EntityConfigTest:AfterEach()
	
end

----------

function EntityConfigTest:TestGetBaby()
	local babysubtype = 1
	EntityConfig.GetBaby(babysubtype)
end

function EntityConfigTest:TestGetEntity()
	local entitytype = 1
	local variant = 1
	local subtype = 1
	EntityConfig.GetEntity(entitytype, variant, subtype)
end

function EntityConfigTest:TestGetMaxBabyID()
	EntityConfig.GetMaxBabyID()
end

function EntityConfigTest:TestGetMaxPlayerType()
	EntityConfig.GetMaxPlayerType()
end

function EntityConfigTest:TestGetPlayer()
	local playertype = 1
	EntityConfig.GetPlayer(playertype)
end


return EntityConfigTest
