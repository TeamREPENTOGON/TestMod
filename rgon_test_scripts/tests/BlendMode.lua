local test = REPENTOGON_TEST

local BlendModeTest = {}

function BlendModeTest:BeforeEach()
	return test.GetTestSprite():GetLayer(0):GetBlendMode()
end

function BlendModeTest:AfterEach(blendmode)
	
end

----------

function BlendModeTest:TestSetMode(blendmode)
	local blendtype = 1
	blendmode:SetMode(blendtype)
end

function BlendModeTest:TestVarAlphaDestinationFactor(blendmode)
	local originalVal = blendmode.AlphaDestinationFactor
	for _, val in pairs(test.TestUnsignedInts) do
		blendmode.AlphaDestinationFactor = val
		test.AssertEquals(blendmode.AlphaDestinationFactor, val)
	end
	blendmode.AlphaDestinationFactor = originalVal
end

function BlendModeTest:TestVarAlphaSourceFactor(blendmode)
	local originalVal = blendmode.AlphaSourceFactor
	for _, val in pairs(test.TestUnsignedInts) do
		blendmode.AlphaSourceFactor = val
		test.AssertEquals(blendmode.AlphaSourceFactor, val)
	end
	blendmode.AlphaSourceFactor = originalVal
end

function BlendModeTest:TestVarRGBDestinationFactor(blendmode)
	local originalVal = blendmode.RGBDestinationFactor
	for _, val in pairs(test.TestUnsignedInts) do
		blendmode.RGBDestinationFactor = val
		test.AssertEquals(blendmode.RGBDestinationFactor, val)
	end
	blendmode.RGBDestinationFactor = originalVal
end

function BlendModeTest:TestVarRGBSourceFactor(blendmode)
	local originalVal = blendmode.RGBSourceFactor
	for _, val in pairs(test.TestUnsignedInts) do
		blendmode.RGBSourceFactor = val
		test.AssertEquals(blendmode.RGBSourceFactor, val)
	end
	blendmode.RGBSourceFactor = originalVal
end


return BlendModeTest
