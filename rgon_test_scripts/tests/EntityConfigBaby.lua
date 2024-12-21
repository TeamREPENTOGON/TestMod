local test = REPENTOGON_TEST

local EntityConfigBabyTest = {}

function EntityConfigBabyTest:BeforeEach()
	return EntityConfig.GetBaby(0)
end

function EntityConfigBabyTest:AfterEach(entityconfigbaby)
	
end

----------

function EntityConfigBabyTest:TestGetAchievementID(entityconfigbaby)
	entityconfigbaby:GetAchievementID()
end

function EntityConfigBabyTest:TestGetID(entityconfigbaby)
	entityconfigbaby:GetID()
end

function EntityConfigBabyTest:TestGetName(entityconfigbaby)
	entityconfigbaby:GetName()
end

function EntityConfigBabyTest:TestGetSpritesheetPath(entityconfigbaby)
	entityconfigbaby:GetSpritesheetPath()
end


return EntityConfigBabyTest
