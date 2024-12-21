local test = REPENTOGON_TEST

local GridEntityTest = {}

function GridEntityTest:BeforeEach()
	return REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_ROCK)
end

function GridEntityTest:AfterEach(gridentity)
	REPENTOGON_TEST.RemoveGridEntity(gridentity)
end

----------

function GridEntityTest:TestDestroy(gridentity)
	local immediate = true
	gridentity:Destroy(immediate)
end

function GridEntityTest:TestGetGridIndex(gridentity)
	gridentity:GetGridIndex()
end

function GridEntityTest:TestGetRNG(gridentity)
	gridentity:GetRNG()
end

function GridEntityTest:TestGetSaveState(gridentity)
	gridentity:GetSaveState()
end

function GridEntityTest:TestGetSprite(gridentity)
	gridentity:GetSprite()
end

function GridEntityTest:TestHurt(gridentity)
	local damage = 1
	gridentity:Hurt(damage)
end

function GridEntityTest:TestInit(gridentity)
	local seed = 1
	gridentity:Init(seed)
end

function GridEntityTest:TestPostInit(gridentity)
	gridentity:PostInit()
end

function GridEntityTest:TestRender(gridentity)
	local offset = Vector(1,1)
	gridentity:Render(offset)
end

function GridEntityTest:TestSetType(gridentity)
	local originalVal = gridentity:GetType()
	for _, val in pairs(test.TestInts) do
		gridentity:SetType(val)
		test.AssertEquals(gridentity:GetType(), val)
	end
	gridentity:SetType(originalVal)
end

function GridEntityTest:TestSetVariant(gridentity)
	local originalVal = gridentity:GetVariant()
	for _, val in pairs(test.TestUnsignedInts) do
		gridentity:SetVariant(val)
		test.AssertEquals(gridentity:GetVariant(), val)
	end
	gridentity:SetVariant(originalVal)
end

function GridEntityTest:TestToDoor(gridentity)
	gridentity:ToDoor()
end

function GridEntityTest:TestToPit(gridentity)
	gridentity:ToPit()
end

function GridEntityTest:TestToPoop(gridentity)
	gridentity:ToPoop()
end

function GridEntityTest:TestToPressurePlate(gridentity)
	gridentity:ToPressurePlate()
end

function GridEntityTest:TestToRock(gridentity)
	gridentity:ToRock()
end

function GridEntityTest:TestToSpikes(gridentity)
	gridentity:ToSpikes()
end

function GridEntityTest:TestToTNT(gridentity)
	gridentity:ToTNT()
end

function GridEntityTest:TestUpdate(gridentity)
	gridentity:Update()
end

function GridEntityTest:TestGetRenderPosition(gridentity)
	gridentity:GetRenderPosition()
end

function GridEntityTest:TestHurtDamage(gridentity)
	local entity = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local playerdamage = 1
	local damageflags = 1
	local damage = 1
	local ignoregridcollision = true
	gridentity:HurtDamage(entity, playerdamage, damageflags, damage, ignoregridcollision)
	entity:Remove()
end

function GridEntityTest:TestIsBreakableRock(gridentity)
	gridentity:IsBreakableRock()
end

function GridEntityTest:TestToDecoration(gridentity)
	gridentity:ToDecoration()
end

function GridEntityTest:TestToFire(gridentity)
	gridentity:ToFire()
end

function GridEntityTest:TestToGravity(gridentity)
	gridentity:ToGravity()
end

function GridEntityTest:TestToLock(gridentity)
	gridentity:ToLock()
end

function GridEntityTest:TestToStairs(gridentity)
	gridentity:ToStairs()
end

function GridEntityTest:TestToStatue(gridentity)
	gridentity:ToStatue()
end

function GridEntityTest:TestToTeleporter(gridentity)
	gridentity:ToTeleporter()
end

function GridEntityTest:TestToTrapDoor(gridentity)
	gridentity:ToTrapDoor()
end

function GridEntityTest:TestToWall(gridentity)
	gridentity:ToWall()
end

function GridEntityTest:TestToWeb(gridentity)
	gridentity:ToWeb()
end

function GridEntityTest:TestVarCollisionClass(gridentity)
	local originalVal = gridentity.CollisionClass
	for _, val in pairs(test.TestInts) do
		gridentity.CollisionClass = val
		test.AssertEquals(gridentity.CollisionClass, val)
	end
	gridentity.CollisionClass = originalVal
end

function GridEntityTest:TestVarDesc(gridentity)
	local originalVal = gridentity.Desc
	gridentity.Desc = REPENTOGON_TEST.SpawnGridEntity(GridEntityType.GRID_ROCK).Desc
	gridentity.Desc = originalVal
end

function GridEntityTest:TestVarPosition(gridentity)
	local position = gridentity.Position
end

function GridEntityTest:TestVarState(gridentity)
	local originalVal = gridentity.State
	for _, val in pairs(test.TestUnsignedInts) do
		gridentity.State = val
		test.AssertEquals(gridentity.State, val)
	end
	gridentity.State = originalVal
end

function GridEntityTest:TestVarVarData(gridentity)
	local originalVal = gridentity.VarData
	for _, val in pairs(test.TestInts) do
		gridentity.VarData = val
		test.AssertEquals(gridentity.VarData, val)
	end
	gridentity.VarData = originalVal
end


return GridEntityTest
