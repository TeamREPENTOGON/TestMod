local test = REPENTOGON_TEST

local FontTest = {}

function FontTest:BeforeEach()
	return Font("font/terminus.fnt")
end

function FontTest:AfterEach(font)
	
end

----------

function FontTest:TestDrawString(font)
	local string = "hello"
	local positionx = 1
	local positiony = 1
	local rendercolor = KColor(1,1,1,1)
	local boxwidth = 1
	local center = true
	font:DrawString(string, positionx, positiony, rendercolor, boxwidth, center)
end

function FontTest:TestDrawStringScaled(font)
	local string = "hello"
	local positionx = 1
	local positiony = 1
	local scalex = 1
	local scaley = 1
	local rendercolor = KColor(1,1,1,1)
	local boxwidth = 1
	local center = true
	font:DrawStringScaled(string, positionx, positiony, scalex, scaley, rendercolor, boxwidth, center)
end

function FontTest:TestGetBaselineHeight(font)
	font:GetBaselineHeight()
end

function FontTest:TestGetCharacterWidth(font)
	local character = 1
	font:GetCharacterWidth(character)
end

function FontTest:TestGetLineHeight(font)
	font:GetLineHeight()
end

function FontTest:TestGetStringWidth(font)
	local string = "hello"
	font:GetStringWidth(string)
end

function FontTest:TestIsLoaded(font)
	font:IsLoaded()
end

function FontTest:TestLoad(font)
	local filepath = "hello"
	font:Load(filepath)
end

function FontTest:TestSetMissingCharacter(font)
	local missingcharacter = 1
	font:SetMissingCharacter(missingcharacter)
end

function FontTest:TestUnload(font)
	font:Unload()
end


return FontTest
