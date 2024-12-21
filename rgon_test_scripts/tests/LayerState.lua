local test = REPENTOGON_TEST

local LayerStateTest = {}

function LayerStateTest:BeforeEach()
	return test.GetTestSprite():GetLayer(0)
end

function LayerStateTest:AfterEach(layerstate)
	
end

----------

-- Would need a shader available to test these, or for the functions to be able to read basegame shaders?
function LayerStateTest:TestSetCustomShader(layerstate)
	local shaderpath = "hello"
	--layerstate:SetCustomShader(shaderpath)
end

function LayerStateTest:TestSetCustomChampionShader(layerstate)
	local shaderpath = "hello"
	--layerstate:SetCustomChampionShader(shaderpath)
end

function LayerStateTest:TestHasCustomShader(layerstate)
	local shaderpath = "hello"
	layerstate:HasCustomShader(shaderpath)
end

function LayerStateTest:TestHasCustomChampionShader(layerstate)
	local shaderpath = "hello"
	layerstate:HasCustomChampionShader(shaderpath)
end

function LayerStateTest:TestClearCustomShader(layerstate)
	layerstate:ClearCustomShader()
end

function LayerStateTest:TestClearCustomChampionShader(layerstate)
	layerstate:ClearCustomChampionShader()
end

function LayerStateTest:TestGetBlendMode(layerstate)
	layerstate:GetBlendMode()
end

function LayerStateTest:TestGetDefaultSpritesheetPath(layerstate)
	layerstate:GetDefaultSpritesheetPath()
end

function LayerStateTest:TestGetFlipX(layerstate)
	layerstate:GetFlipX()
end

function LayerStateTest:TestGetFlipY(layerstate)
	layerstate:GetFlipY()
end

function LayerStateTest:TestGetLayerID(layerstate)
	layerstate:GetLayerID()
end

function LayerStateTest:TestGetName(layerstate)
	layerstate:GetName()
end

function LayerStateTest:TestGetSpritesheetPath(layerstate)
	layerstate:GetSpritesheetPath()
end

function LayerStateTest:TestIsVisible(layerstate)
	layerstate:IsVisible()
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
	local value = true
	layerstate:SetFlipX(value)
end

function LayerStateTest:TestSetFlipY(layerstate)
	local value = true
	layerstate:SetFlipY(value)
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

function LayerStateTest:TestSetVisible(layerstate)
	local visible = true
	layerstate:SetVisible(visible)
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
