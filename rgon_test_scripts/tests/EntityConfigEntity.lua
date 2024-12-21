local test = REPENTOGON_TEST

local EntityConfigEntityTest = {}

function EntityConfigEntityTest:BeforeEach()
	return EntityConfig.GetEntity(EntityType.ENTITY_GAPER)
end

function EntityConfigEntityTest:AfterEach(entityconfigentity)
	
end

----------

function EntityConfigEntityTest:TestCanBeChampion(entityconfigentity)
	entityconfigentity:CanBeChampion()
end

function EntityConfigEntityTest:TestCanBeRerolledInto(entityconfigentity)
	entityconfigentity:CanBeRerolledInto()
end

function EntityConfigEntityTest:TestCanShutDoors(entityconfigentity)
	entityconfigentity:CanShutDoors()
end

function EntityConfigEntityTest:TestGetBaseHP(entityconfigentity)
	entityconfigentity:GetBaseHP()
end

function EntityConfigEntityTest:TestGetBestiaryAnimation(entityconfigentity)
	entityconfigentity:GetBestiaryAnimation()
end

function EntityConfigEntityTest:TestGetBestiaryFloorAlt(entityconfigentity)
	entityconfigentity:GetBestiaryFloorAlt()
end

function EntityConfigEntityTest:TestGetBestiaryOffset(entityconfigentity)
	entityconfigentity:GetBestiaryOffset()
end

function EntityConfigEntityTest:TestGetBestiaryOverlay(entityconfigentity)
	entityconfigentity:GetBestiaryOverlay()
end

function EntityConfigEntityTest:TestGetBestiaryScale(entityconfigentity)
	entityconfigentity:GetBestiaryScale()
end

function EntityConfigEntityTest:TestGetBossID(entityconfigentity)
	entityconfigentity:GetBossID()
end

function EntityConfigEntityTest:TestGetCollisionDamage(entityconfigentity)
	entityconfigentity:GetCollisionDamage()
end

function EntityConfigEntityTest:TestGetCollisionInterval(entityconfigentity)
	entityconfigentity:GetCollisionInterval()
end

function EntityConfigEntityTest:TestGetCollisionRadius(entityconfigentity)
	entityconfigentity:GetCollisionRadius()
end

function EntityConfigEntityTest:TestGetCollisionRadiusMultiplier(entityconfigentity)
	entityconfigentity:GetCollisionRadiusMultiplier()
end

function EntityConfigEntityTest:TestGetCustomTags(entityconfigentity)
	entityconfigentity:GetCustomTags()
end

function EntityConfigEntityTest:TestGetEntityTags(entityconfigentity)
	entityconfigentity:GetEntityTags()
end

function EntityConfigEntityTest:TestGetFriction(entityconfigentity)
	entityconfigentity:GetFriction()
end

function EntityConfigEntityTest:TestGetGibFlags(entityconfigentity)
	entityconfigentity:GetGibFlags()
end

function EntityConfigEntityTest:TestGetGibsAmount(entityconfigentity)
	entityconfigentity:GetGibsAmount()
end

function EntityConfigEntityTest:TestGetGridCollisionPoints(entityconfigentity)
	entityconfigentity:GetGridCollisionPoints()
end

function EntityConfigEntityTest:TestGetMass(entityconfigentity)
	entityconfigentity:GetMass()
end

function EntityConfigEntityTest:TestGetModName(entityconfigentity)
	entityconfigentity:GetModName()
end

function EntityConfigEntityTest:TestGetName(entityconfigentity)
	entityconfigentity:GetName()
end

function EntityConfigEntityTest:TestGetPortraitID(entityconfigentity)
	entityconfigentity:GetPortraitID()
end

function EntityConfigEntityTest:TestGetShadowSize(entityconfigentity)
	entityconfigentity:GetShadowSize()
end

function EntityConfigEntityTest:TestGetShieldStrength(entityconfigentity)
	entityconfigentity:GetShieldStrength()
end

function EntityConfigEntityTest:TestGetStageHP(entityconfigentity)
	entityconfigentity:GetStageHP()
end

function EntityConfigEntityTest:TestGetSubType(entityconfigentity)
	entityconfigentity:GetSubType()
end

function EntityConfigEntityTest:TestGetType(entityconfigentity)
	entityconfigentity:GetType()
end

function EntityConfigEntityTest:TestGetVariant(entityconfigentity)
	entityconfigentity:GetVariant()
end

function EntityConfigEntityTest:TestHasCustomTag(entityconfigentity)
	local tag = "hello"
	entityconfigentity:HasCustomTag(tag)
end

function EntityConfigEntityTest:TestHasEntityTags(entityconfigentity)
	local tags = 1
	entityconfigentity:HasEntityTags(tags)
end

function EntityConfigEntityTest:TestHasFloorAlts(entityconfigentity)
	entityconfigentity:HasFloorAlts()
end

function EntityConfigEntityTest:TestHasGibFlags(entityconfigentity)
	local flags = 1
	entityconfigentity:HasGibFlags(flags)
end

function EntityConfigEntityTest:TestIsBoss(entityconfigentity)
	entityconfigentity:IsBoss()
end


return EntityConfigEntityTest
