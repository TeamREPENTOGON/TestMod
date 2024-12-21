local test = REPENTOGON_TEST

local XMLDataTest = {}

function XMLDataTest:BeforeEach()
	
end

function XMLDataTest:AfterEach()
	
end

----------

function XMLDataTest:TestGetBossColorByTypeVarSub()
	local entitytype = 1
	local variant = 1
	local subtype = 1
	XMLData.GetBossColorByTypeVarSub(entitytype, variant, subtype)
end

function XMLDataTest:TestGetEntityByTypeVarSub()
	local entitytype = 1
	local variant = 1
	local subtype = 1
	local strict = true
	XMLData.GetEntityByTypeVarSub(entitytype, variant, subtype, strict)
end

function XMLDataTest:TestGetEntryById()
	local nodetype = 1
	local idx = 1
	XMLData.GetEntryById(nodetype, idx)
end

function XMLDataTest:TestGetEntryByName()
	local nodetype = 1
	local name = "hello"
	XMLData.GetEntryByName(nodetype, name)
end

function XMLDataTest:TestGetEntryByOrder()
	local nodetype = 1
	local order = 1
	XMLData.GetEntryByOrder(nodetype, order)
end

function XMLDataTest:TestGetEntryFromEntity()
	local entity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local autoxmlpick = true
	local strict = true
	XMLData.GetEntryFromEntity(entity, autoxmlpick, strict)
	entity:Remove()
end

function XMLDataTest:TestGetModById()
	local modid = "hello"
	XMLData.GetModById(modid)
end

function XMLDataTest:TestGetNumEntries()
	local nodetype = 1
	XMLData.GetNumEntries(nodetype)
end


return XMLDataTest
