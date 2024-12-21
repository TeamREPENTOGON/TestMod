local test = REPENTOGON_TEST

local AnimationFrameTest = {}

function AnimationFrameTest:BeforeEach()
	return test.GetTestSprite():GetAnimationData("Happy"):GetLayer(12):GetFrame(0)
end

function AnimationFrameTest:AfterEach(animationframe)
	
end

----------

function AnimationFrameTest:TestGetColor(animationframe)
	animationframe:GetColor()
end

function AnimationFrameTest:TestGetCrop(animationframe)
	animationframe:GetCrop()
end

function AnimationFrameTest:TestGetEndFrame(animationframe)
	animationframe:GetEndFrame()
end

function AnimationFrameTest:TestGetHeight(animationframe)
	animationframe:GetHeight()
end

function AnimationFrameTest:TestGetPivot(animationframe)
	animationframe:GetPivot()
end

function AnimationFrameTest:TestGetPos(animationframe)
	animationframe:GetPos()
end

function AnimationFrameTest:TestGetRotation(animationframe)
	animationframe:GetRotation()
end

function AnimationFrameTest:TestGetScale(animationframe)
	animationframe:GetScale()
end

function AnimationFrameTest:TestGetStartFrame(animationframe)
	animationframe:GetStartFrame()
end

function AnimationFrameTest:TestGetWidth(animationframe)
	animationframe:GetWidth()
end

function AnimationFrameTest:TestIsInterpolated(animationframe)
	animationframe:IsInterpolated()
end

function AnimationFrameTest:TestIsVisible(animationframe)
	animationframe:IsVisible()
end


return AnimationFrameTest
