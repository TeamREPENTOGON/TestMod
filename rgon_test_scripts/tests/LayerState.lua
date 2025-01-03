local test = REPENTOGON_TEST

local LayerStateTest = {}

function LayerStateTest:BeforeEach()
	return test.GetTestSprite():GetLayer(1)
end

function LayerStateTest:AfterEach(layerstate)
	
end

----------

local TEST_SHADER = "shaders/coloroffset_gold_test"

function LayerStateTest:TestCustomShader(layerstate)
	test.AssertFalse(layerstate:HasCustomShader())
	test.AssertFalse(layerstate:HasCustomShader(TEST_SHADER))

	layerstate:SetCustomShader(TEST_SHADER)

	test.AssertTrue(layerstate:HasCustomShader())
	test.AssertTrue(layerstate:HasCustomShader(TEST_SHADER))
	test.AssertFalse(layerstate:HasCustomShader("notshader"))
	test.AssertFalse(layerstate:HasCustomChampionShader())

	layerstate:ClearCustomShader()

	test.AssertFalse(layerstate:HasCustomShader())
	test.AssertFalse(layerstate:HasCustomShader(TEST_SHADER))
end

function LayerStateTest:TestCustomChampionShader(layerstate)
	test.AssertFalse(layerstate:HasCustomChampionShader())
	test.AssertFalse(layerstate:HasCustomChampionShader(TEST_SHADER))

	layerstate:SetCustomChampionShader(TEST_SHADER)

	test.AssertTrue(layerstate:HasCustomChampionShader())
	test.AssertTrue(layerstate:HasCustomChampionShader(TEST_SHADER))
	test.AssertFalse(layerstate:HasCustomChampionShader("notshader"))
	test.AssertFalse(layerstate:HasCustomShader())

	layerstate:ClearCustomChampionShader()

	test.AssertFalse(layerstate:HasCustomChampionShader())
	test.AssertFalse(layerstate:HasCustomChampionShader(TEST_SHADER))
end

function LayerStateTest:TestGetBlendMode(layerstate)
	layerstate:GetBlendMode()
end

function LayerStateTest:TestGetDefaultSpritesheetPath(layerstate)
	layerstate:GetDefaultSpritesheetPath()
end

function LayerStateTest:TestGetLayerID(layerstate)
	test.AssertEquals(layerstate:GetLayerID(), 1)
end

function LayerStateTest:TestGetName(layerstate)
	test.AssertEquals(layerstate:GetName(), "body")
end

function LayerStateTest:TestGetSpritesheetPath(layerstate)
	test.AssertEquals(layerstate:GetSpritesheetPath():lower(), "gfx/characters/costumes/character_001_isaac.png")
end

function LayerStateTest:TestIsVisible(layerstate)
	layerstate:SetVisible(false)
	test.AssertFalse(layerstate:IsVisible())
	layerstate:SetVisible(true)
	test.AssertTrue(layerstate:IsVisible())
end

function LayerStateTest:TestSetColor(layerstate)
	local originalVal = layerstate:GetColor()
	for _, val in pairs(test.TestColors) do
		layerstate:SetColor(val)
		test.AssertEquals(layerstate:GetColor(), val)
	end
	layerstate:SetColor(originalVal)
end

function LayerStateTest:TestSetCropOffset(layerstate)
	local originalVal = layerstate:GetCropOffset()
	for _, val in pairs(test.TestVectors) do
		layerstate:SetCropOffset(val)
		test.AssertEquals(layerstate:GetCropOffset(), val)
	end
	layerstate:SetCropOffset(originalVal)
end

function LayerStateTest:TestSetFlipX(layerstate)
	layerstate:SetFlipX(true)
	test.AssertTrue(layerstate:GetFlipX())
	layerstate:SetFlipX(false)
	test.AssertFalse(layerstate:GetFlipX())
end

function LayerStateTest:TestSetFlipY(layerstate)
	layerstate:SetFlipY(true)
	test.AssertTrue(layerstate:GetFlipY())
	layerstate:SetFlipY(false)
	test.AssertFalse(layerstate:GetFlipY())
end

function LayerStateTest:TestSetPos(layerstate)
	local originalVal = layerstate:GetPos()
	for _, val in pairs(test.TestVectors) do
		layerstate:SetPos(val)
		test.AssertEquals(layerstate:GetPos(), val)
	end
	layerstate:SetPos(originalVal)
end

function LayerStateTest:TestSetRenderFlags(layerstate)
	local originalVal = layerstate:GetRenderFlags()
	for _, val in pairs(test.TestUnsignedInts) do
		layerstate:SetRenderFlags(val)
		test.AssertEquals(layerstate:GetRenderFlags(), val)
	end
	layerstate:SetRenderFlags(originalVal)
end

function LayerStateTest:TestSetRotation(layerstate)
	local originalVal = layerstate:GetRotation()
	for _, val in pairs(test.TestFloats) do
		layerstate:SetRotation(val)
		test.AssertEquals(layerstate:GetRotation(), val)
	end
	layerstate:SetRotation(originalVal)
end

function LayerStateTest:TestSetSize(layerstate)
	local originalVal = layerstate:GetSize()
	for _, val in pairs(test.TestVectors) do
		layerstate:SetSize(val)
		test.AssertEquals(layerstate:GetSize(), val)
	end
	layerstate:SetSize(originalVal)
end

function LayerStateTest:TestSetWrapSMode(layerstate)
	local originalVal = layerstate:GetWrapSMode()
	for _, val in pairs(test.TestUnsignedInts) do
		layerstate:SetWrapSMode(val)
		test.AssertEquals(layerstate:GetWrapSMode(), val)
	end
	layerstate:SetWrapSMode(originalVal)
end

function LayerStateTest:TestSetWrapTMode(layerstate)
	local originalVal = layerstate:GetWrapTMode()
	for _, val in pairs(test.TestUnsignedInts) do
		layerstate:SetWrapTMode(val)
		test.AssertEquals(layerstate:GetWrapTMode(), val)
	end
	layerstate:SetWrapTMode(originalVal)
end


return LayerStateTest
