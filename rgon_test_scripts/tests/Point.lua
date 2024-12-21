local test = REPENTOGON_TEST

local PointTest = {}

function PointTest:BeforeEach()
	return Point(Vector.One, 1.0)
end

function PointTest:AfterEach(point)
	
end

----------

function PointTest:TestGetIsWorldSpace(point)
	point:GetIsWorldSpace()
end

function PointTest:TestSetColor(point)
	local originalVal = point:GetColor()
	for _, val in pairs(test.TestColors) do
		point:SetColor(val)
		test.AssertEquals(point:GetColor(), val)
	end
	point:SetColor(originalVal)
end

function PointTest:TestSetIsWorldSpace(point)
	local value = true
	point:SetIsWorldSpace(value)
end

function PointTest:TestSetSpritesheetCoordinate(point)
	local originalVal = point:GetSpritesheetCoordinate()
	for _, val in pairs(test.TestFloats) do
		point:SetSpritesheetCoordinate(val)
		test.AssertEquals(point:GetSpritesheetCoordinate(), val)
	end
	point:SetSpritesheetCoordinate(originalVal)
end

function PointTest:TestSetWidth(point)
	local originalVal = point:GetWidth()
	for _, val in pairs(test.TestFloats) do
		point:SetWidth(val)
		test.AssertEquals(point:GetWidth(), val)
	end
	point:SetWidth(originalVal)
end

function PointTest:TestSetPosition(point)
	local originalVal = point:GetPosition()
	for _, val in pairs(test.TestVectors) do
		point:SetPosition(val)
		test.AssertEquals(point:GetPosition(), val)
	end
	point:SetPosition(originalVal)
end


return PointTest
