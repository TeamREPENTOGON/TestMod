local test = REPENTOGON_TEST

local KColorTest = {}

function KColorTest:BeforeEach()
	return KColor(1,1,1,1)
end

function KColorTest:AfterEach(kcolor)
	
end

----------

function KColorTest:TestVarAlpha(kcolor)
	local originalVal = kcolor.Alpha
	for _, val in pairs(test.TestFloats) do
		kcolor.Alpha = val
		test.AssertEquals(kcolor.Alpha, val)
	end
	kcolor.Alpha = originalVal
end

function KColorTest:TestVarBlue(kcolor)
	local originalVal = kcolor.Blue
	for _, val in pairs(test.TestFloats) do
		kcolor.Blue = val
		test.AssertEquals(kcolor.Blue, val)
	end
	kcolor.Blue = originalVal
end

function KColorTest:TestVarGreen(kcolor)
	local originalVal = kcolor.Green
	for _, val in pairs(test.TestFloats) do
		kcolor.Green = val
		test.AssertEquals(kcolor.Green, val)
	end
	kcolor.Green = originalVal
end

function KColorTest:TestVarRed(kcolor)
	local originalVal = kcolor.Red
	for _, val in pairs(test.TestFloats) do
		kcolor.Red = val
		test.AssertEquals(kcolor.Red, val)
	end
	kcolor.Red = originalVal
end


return KColorTest
