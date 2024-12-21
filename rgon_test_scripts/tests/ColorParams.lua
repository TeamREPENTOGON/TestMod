local test = REPENTOGON_TEST

local ColorParamsTest = {}

function ColorParamsTest:BeforeEach()
	return ColorParams(Color(1,0,0,1),255,150,false,false)
end

function ColorParamsTest:AfterEach(colorparams)
	
end

----------

function ColorParamsTest:TestGetFadeout(colorparams)
	colorparams:GetFadeout()
end

function ColorParamsTest:TestGetShared(colorparams)
	colorparams:GetShared()
end

function ColorParamsTest:TestSetColor(colorparams)
	local originalVal = colorparams:GetColor()
	for _, val in pairs(test.TestColors) do
		colorparams:SetColor(val)
		test.AssertEquals(colorparams:GetColor(), val)
	end
	colorparams:SetColor(originalVal)
end

function ColorParamsTest:TestSetDuration(colorparams)
	local originalVal = colorparams:GetDuration()
	for _, val in pairs(test.TestInts) do
		colorparams:SetDuration(val)
		test.AssertEquals(colorparams:GetDuration(), val)
	end
	colorparams:SetDuration(originalVal)
end

function ColorParamsTest:TestSetFadeout(colorparams)
	local value = true
	colorparams:SetFadeout(value)
end

function ColorParamsTest:TestSetLifespan(colorparams)
	local originalVal = colorparams:GetLifespan()
	for _, val in pairs(test.TestInts) do
		colorparams:SetLifespan(val)
		test.AssertEquals(colorparams:GetLifespan(), val)
	end
	colorparams:SetLifespan(originalVal)
end

function ColorParamsTest:TestSetPriority(colorparams)
	local originalVal = colorparams:GetPriority()
	for _, val in pairs(test.TestInts) do
		colorparams:SetPriority(val)
		test.AssertEquals(colorparams:GetPriority(), val)
	end
	colorparams:SetPriority(originalVal)
end

function ColorParamsTest:TestSetShared(colorparams)
	local value = true
	colorparams:SetShared(value)
end


return ColorParamsTest
