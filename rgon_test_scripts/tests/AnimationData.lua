local test = REPENTOGON_TEST

local AnimationDataTest = {}

function AnimationDataTest:BeforeEach()
	return test.GetTestSprite():GetAnimationData("Happy")
end

function AnimationDataTest:AfterEach(animationdata)
	
end

----------

function AnimationDataTest:TestGetAllLayers(animationdata)
	animationdata:GetAllLayers()
end

function AnimationDataTest:TestGetLayer(animationdata)
	local layerid = 1
	animationdata:GetLayer(layerid)
end

function AnimationDataTest:TestGetLength(animationdata)
	animationdata:GetLength()
end

function AnimationDataTest:TestGetName(animationdata)
	animationdata:GetName()
end

function AnimationDataTest:TestIsLoopingAnimation(animationdata)
	animationdata:IsLoopingAnimation()
end


return AnimationDataTest
