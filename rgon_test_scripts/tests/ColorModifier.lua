local test = REPENTOGON_TEST

local ColorModifierTest = {}

function ColorModifierTest:BeforeEach()
	return ColorModifier()
end

function ColorModifierTest:AfterEach(colormodifier)
	
end

----------

function ColorModifierTest:TestVarA(colormodifier)
	local originalVal = colormodifier.A
	for _, val in pairs(test.TestFloats) do
		colormodifier.A = val
		test.AssertEquals(colormodifier.A, val)
	end
	colormodifier.A = originalVal
end

function ColorModifierTest:TestVarB(colormodifier)
	local originalVal = colormodifier.B
	for _, val in pairs(test.TestFloats) do
		colormodifier.B = val
		test.AssertEquals(colormodifier.B, val)
	end
	colormodifier.B = originalVal
end

function ColorModifierTest:TestVarBrightness(colormodifier)
	local originalVal = colormodifier.Brightness
	for _, val in pairs(test.TestFloats) do
		colormodifier.Brightness = val
		test.AssertEquals(colormodifier.Brightness, val)
	end
	colormodifier.Brightness = originalVal
end

function ColorModifierTest:TestVarContrast(colormodifier)
	local originalVal = colormodifier.Contrast
	for _, val in pairs(test.TestFloats) do
		colormodifier.Contrast = val
		test.AssertEquals(colormodifier.Contrast, val)
	end
	colormodifier.Contrast = originalVal
end

function ColorModifierTest:TestVarG(colormodifier)
	local originalVal = colormodifier.G
	for _, val in pairs(test.TestFloats) do
		colormodifier.G = val
		test.AssertEquals(colormodifier.G, val)
	end
	colormodifier.G = originalVal
end

function ColorModifierTest:TestVarR(colormodifier)
	local originalVal = colormodifier.R
	for _, val in pairs(test.TestFloats) do
		colormodifier.R = val
		test.AssertEquals(colormodifier.R, val)
	end
	colormodifier.R = originalVal
end


return ColorModifierTest
