local test = REPENTOGON_TEST

local FXParamsTest = {}

function FXParamsTest:BeforeEach()
	return Game():GetRoom():GetFXParams()
end

function FXParamsTest:AfterEach(fxparams)
	
end

----------

function FXParamsTest:TestVarColorModifier(fxparams)
	local originalVal = fxparams.ColorModifier
	fxparams.ColorModifier = ColorModifier()
	fxparams.ColorModifier = originalVal
end

function FXParamsTest:TestVarLightColor(fxparams)
	local originalVal = fxparams.LightColor
	fxparams.LightColor = KColor(1,1,1,1)
	fxparams.LightColor = originalVal
end

function FXParamsTest:TestVarShadowAlpha(fxparams)
	local originalVal = fxparams.ShadowAlpha
	for _, val in pairs(test.TestFloats) do
		fxparams.ShadowAlpha = val
		test.AssertEquals(fxparams.ShadowAlpha, val)
	end
	fxparams.ShadowAlpha = originalVal
end

function FXParamsTest:TestVarShadowColor(fxparams)
	local originalVal = fxparams.ShadowColor
	fxparams.ShadowColor = KColor(1,1,1,1)
	fxparams.ShadowColor = originalVal
end

function FXParamsTest:TestVarWaterColor(fxparams)
	local originalVal = fxparams.WaterColor
	fxparams.WaterColor = KColor(1,1,1,1)
	fxparams.WaterColor = originalVal
end

function FXParamsTest:TestVarWaterColorMultiplier(fxparams)
	local originalVal = fxparams.WaterColorMultiplier
	fxparams.WaterColorMultiplier = KColor(1,1,1,1)
	fxparams.WaterColorMultiplier = originalVal
end

function FXParamsTest:TestVarWaterEffectColor(fxparams)
	local originalVal = fxparams.WaterEffectColor
	for _, val in pairs(test.TestColors) do
		fxparams.WaterEffectColor = val
		test.AssertEquals(fxparams.WaterEffectColor, val)
	end
	fxparams.WaterEffectColor = originalVal
end


return FXParamsTest
