local test = REPENTOGON_TEST

local FontRenderSettingsTest = {}

function FontRenderSettingsTest:BeforeEach()
	return FontRenderSettings()
end

function FontRenderSettingsTest:AfterEach(fontrendersettings)
	
end

----------

function FontRenderSettingsTest:TestEnableAutoWrap(fontrendersettings)
	local enabled = true
	fontrendersettings:EnableAutoWrap(enabled)
end

function FontRenderSettingsTest:TestEnableTruncation(fontrendersettings)
	local enabled = true
	fontrendersettings:EnableTruncation(enabled)
end

function FontRenderSettingsTest:TestIsAutoWrapEnabled(fontrendersettings)
	fontrendersettings:IsAutoWrapEnabled()
end

function FontRenderSettingsTest:TestIsTruncationEnabled(fontrendersettings)
	fontrendersettings:IsTruncationEnabled()
end

function FontRenderSettingsTest:TestSetAlignment(fontrendersettings)
	local originalVal = fontrendersettings:GetAlignment()
	for _, val in pairs(test.TestInts) do
		fontrendersettings:SetAlignment(val)
		test.AssertEquals(fontrendersettings:GetAlignment(), val)
	end
	fontrendersettings:SetAlignment(originalVal)
end

function FontRenderSettingsTest:TestSetLineHeightModifier(fontrendersettings)
	local originalVal = fontrendersettings:GetLineHeightModifier()
	for _, val in pairs(test.TestFloats) do
		fontrendersettings:SetLineHeightModifier(val)
		test.AssertEquals(fontrendersettings:GetLineHeightModifier(), val)
	end
	fontrendersettings:SetLineHeightModifier(originalVal)
end

function FontRenderSettingsTest:TestSetMaxCharacters(fontrendersettings)
	local originalVal = fontrendersettings:GetMaxCharacters()
	for _, val in pairs(test.TestInts) do
		fontrendersettings:SetMaxCharacters(val)
		test.AssertEquals(fontrendersettings:GetMaxCharacters(), val)
	end
	fontrendersettings:SetMaxCharacters(originalVal)
end

function FontRenderSettingsTest:TestSetMissingCharacterOverride(fontrendersettings)
	local originalVal = fontrendersettings:GetMissingCharacterOverride()
	for _, val in pairs(test.TestInts) do
		fontrendersettings:SetMissingCharacterOverride(val)
		test.AssertEquals(fontrendersettings:GetMissingCharacterOverride(), val)
	end
	fontrendersettings:SetMissingCharacterOverride(originalVal)
end


return FontRenderSettingsTest
