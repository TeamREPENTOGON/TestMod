local test = REPENTOGON_TEST

local SpriteTest = {}

function SpriteTest:BeforeEach()
	return test.GetTestSprite()
end

function SpriteTest:AfterEach(sprite)
	
end

----------

local TEST_SHADER = "shaders/coloroffset_rgontest"

function SpriteTest:TestSetCustomShader(sprite)
	test.AssertFalse(sprite:HasCustomShader())
	test.AssertFalse(sprite:HasCustomShader(TEST_SHADER))

	sprite:SetCustomShader(TEST_SHADER)

	test.AssertTrue(sprite:HasCustomShader())
	test.AssertTrue(sprite:HasCustomShader(TEST_SHADER))
	test.AssertFalse(sprite:HasCustomShader("notshader"))
	test.AssertFalse(sprite:HasCustomChampionShader())

	sprite:ClearCustomShader()

	test.AssertFalse(sprite:HasCustomShader())
	test.AssertFalse(sprite:HasCustomShader(TEST_SHADER))
end

function SpriteTest:TestSetCustomChampionShader(sprite)
	test.AssertFalse(sprite:HasCustomChampionShader())
	test.AssertFalse(sprite:HasCustomChampionShader(TEST_SHADER))

	sprite:SetCustomChampionShader(TEST_SHADER)

	test.AssertTrue(sprite:HasCustomChampionShader())
	test.AssertTrue(sprite:HasCustomChampionShader(TEST_SHADER))
	test.AssertFalse(sprite:HasCustomChampionShader("notshader"))
	test.AssertFalse(sprite:HasCustomShader())

	sprite:ClearCustomChampionShader()

	test.AssertFalse(sprite:HasCustomChampionShader())
	test.AssertFalse(sprite:HasCustomChampionShader(TEST_SHADER))
end

function SpriteTest:TestGetAnimation(sprite)
	sprite:GetAnimation()
end

function SpriteTest:TestGetDefaultAnimation(sprite)
	sprite:GetDefaultAnimation()
end

function SpriteTest:TestGetDefaultAnimationName(sprite)
	sprite:GetDefaultAnimationName()
end

function SpriteTest:TestGetFilename(sprite)
	sprite:GetFilename()
end

function SpriteTest:TestGetFrame(sprite)
	sprite:GetFrame()
end

function SpriteTest:TestGetLayerCount(sprite)
	sprite:GetLayerCount()
end

function SpriteTest:TestGetOverlayAnimation(sprite)
	sprite:GetOverlayAnimation()
end

function SpriteTest:TestGetTexel(sprite)
	local samplepos = Vector(1,1)
	local renderpos = Vector(1,1)
	local alphathreshold = 1
	local layerid = 1
	sprite:GetTexel(samplepos, renderpos, alphathreshold, layerid)
end

function SpriteTest:TestIsEventTriggered(sprite)
	local eventname = "hello"
	sprite:IsEventTriggered(eventname)
end

function SpriteTest:TestIsFinished(sprite)
	sprite:IsFinished()
end

function SpriteTest:TestIsLoaded(sprite)
	sprite:IsLoaded()
end

function SpriteTest:TestIsOverlayFinished(sprite)
	sprite:IsOverlayFinished()
end

function SpriteTest:TestIsOverlayPlaying(sprite)
	sprite:IsOverlayPlaying()
end

function SpriteTest:TestIsPlaying(sprite)
	sprite:IsPlaying()
end

function SpriteTest:TestLoad(sprite)
	local anm2path = "hello"
	local loadgraphics = true
	sprite:Load(anm2path, loadgraphics)
end

function SpriteTest:TestLoadGraphics(sprite)
	sprite:LoadGraphics()
end

function SpriteTest:TestPlay(sprite)
	local animationname = "hello"
	local force = true
	sprite:Play(animationname, force)
end

function SpriteTest:TestPlayOverlay(sprite)
	local animationname = "hello"
	local force = true
	sprite:PlayOverlay(animationname, force)
end

function SpriteTest:TestPlayRandom(sprite)
	local seed = 1
	sprite:PlayRandom(seed)
end

function SpriteTest:TestReload(sprite)
	sprite:Reload()
end

function SpriteTest:TestRemoveOverlay(sprite)
	sprite:RemoveOverlay()
end

function SpriteTest:TestRender(sprite)
	local position = Vector(1,1)
	local vector = Vector(1,1)
	local bottomrightclamp = Vector(1,1)
	sprite:Render(position, vector, bottomrightclamp)
end

function SpriteTest:TestRenderLayer(sprite)
	local layerid = 1
	local position = Vector(1,1)
	local topleftclamp = Vector(1,1)
	local bottomrightclamp = Vector(1,1)
	sprite:RenderLayer(layerid, position, topleftclamp, bottomrightclamp)
end

function SpriteTest:TestReplaceSpritesheet(sprite)
	local layerid = 1
	local pngfilename = "hello"
	local loadgraphics = true
	sprite:ReplaceSpritesheet(layerid, pngfilename, loadgraphics)
end

function SpriteTest:TestReset(sprite)
	sprite:Reset()
end

function SpriteTest:TestSetAnimation(sprite)
	local animationname = "hello"
	local reset = true
	sprite:SetAnimation(animationname, reset)
end

function SpriteTest:TestSetFrame(sprite)
	local animationname = "hello"
	local framenum = 1
	sprite:SetFrame(animationname, framenum)
end

function SpriteTest:TestSetLastFrame(sprite)
	sprite:SetLastFrame()
end

function SpriteTest:TestSetLayerFrame(sprite)
	local layerid = 1
	local framenum = 1
	sprite:SetLayerFrame(layerid, framenum)
end

function SpriteTest:TestSetOverlayAnimation(sprite)
	local animationname = "hello"
	local reset = true
	sprite:SetOverlayAnimation(animationname, reset)
end

function SpriteTest:TestSetOverlayFrame(sprite)
	sprite:SetOverlayFrame(0)
	test.AssertEquals(sprite:GetOverlayFrame(), 0)
	sprite:SetOverlayFrame(1)
	test.AssertEquals(sprite:GetOverlayFrame(), 1)
end

function SpriteTest:TestSetOverlayRenderPriority(sprite)
	local renderfirst = true
	sprite:SetOverlayRenderPriority(renderfirst)
end

function SpriteTest:TestStop(sprite)
	local stopoverlay = true
	sprite:Stop(stopoverlay)
end

function SpriteTest:TestUpdate(sprite)
	sprite:Update()
end

function SpriteTest:TestWasEventTriggered(sprite)
	local eventname = "hello"
	sprite:WasEventTriggered(eventname)
end

function SpriteTest:TestContinue(sprite)
	local continueoverlay = true
	sprite:Continue(continueoverlay)
end

function SpriteTest:TestContinueOverlay(sprite)
	sprite:ContinueOverlay()
end

function SpriteTest:TestGetAllAnimationData(sprite)
	sprite:GetAllAnimationData()
end

function SpriteTest:TestGetAllLayers(sprite)
	sprite:GetAllLayers()
end

function SpriteTest:TestGetAnimationData(sprite)
	local animationname = "hello"
	sprite:GetAnimationData(animationname)
end

function SpriteTest:TestGetCurrentAnimationData(sprite)
	sprite:GetCurrentAnimationData()
end

function SpriteTest:TestGetLayer(sprite)
	local layername = "hello"
	sprite:GetLayer(layername)
end

function SpriteTest:TestGetLayerFrameData(sprite)
	local layer = 1
	sprite:GetLayerFrameData(layer)
end

function SpriteTest:TestGetNullFrame(sprite)
	local layername = "hello"
	sprite:GetNullFrame(layername)
end

function SpriteTest:TestGetOverlayAnimationData(sprite)
	sprite:GetOverlayAnimationData()
end

function SpriteTest:TestGetOverlayLayerFrameData(sprite)
	local layer = 1
	sprite:GetOverlayLayerFrameData(layer)
end

function SpriteTest:TestGetOverlayNullFrame(sprite)
	local layername = "hello"
	sprite:GetOverlayNullFrame(layername)
end

function SpriteTest:TestIsOverlayEventTriggered(sprite)
	local eventname = "hello"
	sprite:IsOverlayEventTriggered(eventname)
end

function SpriteTest:TestSetOverlayLayerFrame(sprite)
	local layer = 1
	local frame = 1
	sprite:SetOverlayLayerFrame(layer, frame)
end

function SpriteTest:TestSetRenderFlags(sprite)
	local originalVal = sprite:GetRenderFlags()
	for _, val in pairs(test.TestUnsignedInts) do
		sprite:SetRenderFlags(val)
		test.AssertEquals(sprite:GetRenderFlags(), val)
	end
	sprite:SetRenderFlags(originalVal)
end

function SpriteTest:TestStopOverlay(sprite)
	sprite:StopOverlay()
end

function SpriteTest:TestWasOverlayEventTriggered(sprite)
	local eventname = "hello"
	sprite:WasOverlayEventTriggered(eventname)
end

function SpriteTest:TestVarColor(sprite)
	local originalVal = sprite.Color
	for _, val in pairs(test.TestColors) do
		sprite.Color = val
		test.AssertEquals(sprite.Color, val)
	end
	sprite.Color = originalVal
end

function SpriteTest:TestVarFlipX(sprite)
	local originalVal = sprite.FlipX
	sprite.FlipX = true
	sprite.FlipX = originalVal
end

function SpriteTest:TestVarFlipY(sprite)
	local originalVal = sprite.FlipY
	sprite.FlipY = true
	sprite.FlipY = originalVal
end

function SpriteTest:TestVarOffset(sprite)
	local originalVal = sprite.Offset
	for _, val in pairs(test.TestVectors) do
		sprite.Offset = val
		test.AssertEquals(sprite.Offset, val)
	end
	sprite.Offset = originalVal
end

function SpriteTest:TestVarPlaybackSpeed(sprite)
	local originalVal = sprite.PlaybackSpeed
	for _, val in pairs(test.TestFloats) do
		sprite.PlaybackSpeed = val
		test.AssertEquals(sprite.PlaybackSpeed, val)
	end
	sprite.PlaybackSpeed = originalVal
end

function SpriteTest:TestVarRotation(sprite)
	local originalVal = sprite.Rotation
	for _, val in pairs(test.TestFloats) do
		sprite.Rotation = val
		test.AssertEquals(sprite.Rotation, val)
	end
	sprite.Rotation = originalVal
end

function SpriteTest:TestVarScale(sprite)
	local originalVal = sprite.Scale
	for _, val in pairs(test.TestVectors) do
		sprite.Scale = val
		test.AssertEquals(sprite.Scale, val)
	end
	sprite.Scale = originalVal
end


return SpriteTest
