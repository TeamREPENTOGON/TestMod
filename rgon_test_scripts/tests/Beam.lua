local test = REPENTOGON_TEST

local BeamTest = {}

function BeamTest:BeforeEach()
	local beam = Beam(test.GetTestSprite(), 1, false, false)
	beam:SetPoints({ Point(Vector(1,0), 1.0), Point(Vector(0,1), 1.0) })
	return beam
end

function BeamTest:AfterEach(beam)
	
end

----------

function BeamTest:TestAdd(beam)
	local point = Point(Vector.One, 1.0)
	beam:Add(point)
end

function BeamTest:TestGetPoints(beam)
	beam:GetPoints()
end

function BeamTest:TestGetSprite(beam)
	beam:GetSprite()
end

function BeamTest:TestGetUnkBool(beam)
	beam:GetUnkBool()
end

function BeamTest:TestGetUseOverlay(beam)
	beam:GetUseOverlay()
end

function BeamTest:TestRender(beam)
	local clearpoints = true
	beam:Render(clearpoints)
end

function BeamTest:TestSetLayer(beam)
	local originalVal = beam:GetLayer()
	beam:SetLayer(0)
	test.AssertEquals(beam:GetLayer(), 0)
	beam:SetLayer(1)
	test.AssertEquals(beam:GetLayer(), 1)
	beam:SetLayer(originalVal)
end

function BeamTest:TestSetPoints(beam)
	beam:SetPoints({ Point(Vector(1,0), 1.0), Point(Vector(0,1), 1.0) })
end

function BeamTest:TestSetSprite(beam)
	local sprite = test.GetTestSprite()
	local layerid = 1
	local useoverlay = true
	beam:SetSprite(sprite, layerid, useoverlay)
end

function BeamTest:TestSetUnkBool(beam)
	local unkbool = true
	beam:SetUnkBool(unkbool)
end

function BeamTest:TestSetUseOverlay(beam)
	local useoverlay = true
	beam:SetUseOverlay(useoverlay)
end


return BeamTest
