local test = REPENTOGON_TEST

local NullFrameTest = {}

function NullFrameTest:BeforeEach()
	return test.GetTestSprite():GetOverlayNullFrame("LeftEye")
end

function NullFrameTest:AfterEach(nullframe)
	
end

----------

function NullFrameTest:TestGetColor(nullframe)
	nullframe:GetColor()
end

function NullFrameTest:TestGetPos(nullframe)
	nullframe:GetPos()
end

function NullFrameTest:TestGetRotation(nullframe)
	nullframe:GetRotation()
end

function NullFrameTest:TestGetScale(nullframe)
	nullframe:GetScale()
end

function NullFrameTest:TestIsVisible(nullframe)
	nullframe:IsVisible()
end


return NullFrameTest
