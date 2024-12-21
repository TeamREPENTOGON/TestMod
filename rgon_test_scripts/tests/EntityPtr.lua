local test = REPENTOGON_TEST

local EntityPtrTest = {}

function EntityPtrTest:BeforeEach()
	return EntityPtr(Isaac.GetPlayer())
end

function EntityPtrTest:AfterEach(entityptr)
	
end

----------

function EntityPtrTest:TestSetReference(entityptr)
	local ref = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	entityptr:SetReference(ref)
	ref:Remove()
end

function EntityPtrTest:TestVarRef(entityptr)
	local ref = entityptr.Ref
end


return EntityPtrTest
