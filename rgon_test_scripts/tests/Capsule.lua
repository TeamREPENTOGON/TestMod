local test = REPENTOGON_TEST

local CapsuleTest = {}

function CapsuleTest:BeforeEach()
	return Isaac.GetPlayer():GetCollisionCapsule(Vector.Zero)
end

function CapsuleTest:AfterEach(capsule)
	
end

----------

function CapsuleTest:TestCollide(capsule)
	local othercapsule = Isaac.GetPlayer():GetCollisionCapsule(Vector.Zero)
	local point = Vector(1,1)
	capsule:Collide(othercapsule, point)
end

function CapsuleTest:TestGetDirection(capsule)
	capsule:GetDirection()
end

function CapsuleTest:TestGetPosition(capsule)
	capsule:GetPosition()
end


return CapsuleTest
