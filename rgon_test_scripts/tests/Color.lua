local test = REPENTOGON_TEST

local ColorTest = {}

function ColorTest:BeforeEach()
	return Color(1,1,1,1)
end

function ColorTest:AfterEach(color)
	
end

----------

function ColorTest:TestLerp(color)
	local m1 = Color(1,1,1,1)
	local m2 = Color(1,1,1,1)
	local t = 1
	Color.Lerp(m1, m2, t)
end

function ColorTest:TestReset(color)
	color:Reset()
end

function ColorTest:TestSetColorize(color)
	local red = 1
	local green = 1
	local blue = 1
	local amount = 1
	color:SetColorize(red, green, blue, amount)
end

function ColorTest:TestSetOffset(color)
	local redoffset = 1
	local greenoffset = 1
	local blueoffset = 1
	color:SetOffset(redoffset, greenoffset, blueoffset)
end

function ColorTest:TestSetTint(color)
	local redtint = 1
	local greentint = 1
	local bluetint = 1
	local alphatint = 1
	color:SetTint(redtint, greentint, bluetint, alphatint)
end

function ColorTest:TestGetColorize(color)
	color:GetColorize()
end

function ColorTest:TestGetOffset(color)
	color:GetOffset()
end

function ColorTest:TestGetTint(color)
	color:GetTint()
end

function ColorTest:TestPrint(color)
	color:Print()
end

function ColorTest:TestVarA(color)
	local originalVal = color.A
	for _, val in pairs(test.TestFloats) do
		color.A = val
		test.AssertEquals(color.A, val)
	end
	color.A = originalVal
end

function ColorTest:TestVarB(color)
	local originalVal = color.B
	for _, val in pairs(test.TestFloats) do
		color.B = val
		test.AssertEquals(color.B, val)
	end
	color.B = originalVal
end

function ColorTest:TestVarBO(color)
	local originalVal = color.BO
	for _, val in pairs(test.TestFloats) do
		color.BO = val
		test.AssertEquals(color.BO, val)
	end
	color.BO = originalVal
end

function ColorTest:TestVarG(color)
	local originalVal = color.G
	for _, val in pairs(test.TestFloats) do
		color.G = val
		test.AssertEquals(color.G, val)
	end
	color.G = originalVal
end

function ColorTest:TestVarGO(color)
	local originalVal = color.GO
	for _, val in pairs(test.TestFloats) do
		color.GO = val
		test.AssertEquals(color.GO, val)
	end
	color.GO = originalVal
end

function ColorTest:TestVarR(color)
	local originalVal = color.R
	for _, val in pairs(test.TestFloats) do
		color.R = val
		test.AssertEquals(color.R, val)
	end
	color.R = originalVal
end

function ColorTest:TestVarRO(color)
	local originalVal = color.RO
	for _, val in pairs(test.TestFloats) do
		color.RO = val
		test.AssertEquals(color.RO, val)
	end
	color.RO = originalVal
end


return ColorTest
