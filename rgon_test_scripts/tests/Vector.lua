local test = REPENTOGON_TEST

local VectorTest = {}

function VectorTest:BeforeEach()
	return Vector(1,1)
end

function VectorTest:AfterEach(vector)
	
end

----------

function VectorTest:TestClamp(vector)
	local minx = 1
	local miny = 1
	local maxx = 1
	local maxy = 1
	vector:Clamp(minx, miny, maxx, maxy)
end

function VectorTest:TestClamped(vector)
	local minx = 1
	local miny = 1
	local maxx = 1
	local maxy = 1
	vector:Clamped(minx, miny, maxx, maxy)
end

function VectorTest:TestCross(vector)
	local second = Vector(1,1)
	vector:Cross(second)
end

function VectorTest:TestDistance(vector)
	local first = Vector(1,1)
	local second = Vector(1,1)
	vector:Distance(first, second)
end

function VectorTest:TestDistanceSquared(vector)
	local first = Vector(1,1)
	local second = Vector(1,1)
	vector:DistanceSquared(first, second)
end

function VectorTest:TestDot(vector)
	local second = Vector(1,1)
	vector:Dot(second)
end

function VectorTest:TestFromAngle(vector)
	local angle = 1
	Vector.FromAngle(angle)
end

function VectorTest:TestGetAngleDegrees(vector)
	vector:GetAngleDegrees()
end

function VectorTest:TestLength(vector)
	test.AssertEquals(Vector(1,0):Length(), 1.0)
end

function VectorTest:TestLengthSquared(vector)
	vector:LengthSquared()
end

function VectorTest:TestLerp(vector)
	local other = Vector(1,1)
	local t = 1
	vector:Lerp(other, t)
end

function VectorTest:TestNormalize(vector)
	vector:Normalize()
end

function VectorTest:TestNormalized(vector)
	vector:Normalized()
end

function VectorTest:TestResize(vector)
	local newlength = 1
	vector:Resize(newlength)
end

function VectorTest:TestResized(vector)
	local newlength = 1
	vector:Resized(newlength)
end

function VectorTest:TestRotated(vector)
	local angledegrees = 1
	vector:Rotated(angledegrees)
end

function VectorTest:TestVarX(vector)
	local originalVal = vector.X
	for _, val in pairs(test.TestFloats) do
		vector.X = val
		test.AssertEquals(vector.X, val)
	end
	vector.X = originalVal
end

function VectorTest:TestVarY(vector)
	local originalVal = vector.Y
	for _, val in pairs(test.TestFloats) do
		vector.Y = val
		test.AssertEquals(vector.Y, val)
	end
	vector.Y = originalVal
end


return VectorTest
