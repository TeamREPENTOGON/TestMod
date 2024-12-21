local test = REPENTOGON_TEST

local AnimationLayerTest = {}

function AnimationLayerTest:BeforeEach()
	return test.GetTestSprite():GetAnimationData("Happy"):GetLayer(12)
end

function AnimationLayerTest:AfterEach(animationlayer)
	
end

----------

function AnimationLayerTest:TestGetFrame(animationlayer)
	local frame = 1
	animationlayer:GetFrame(frame)
end

function AnimationLayerTest:TestGetLayerID(animationlayer)
	animationlayer:GetLayerID()
end

function AnimationLayerTest:TestIsVisible(animationlayer)
	animationlayer:IsVisible()
end


return AnimationLayerTest
