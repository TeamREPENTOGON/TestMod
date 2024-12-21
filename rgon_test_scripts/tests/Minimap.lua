local test = REPENTOGON_TEST

local MinimapTest = {}

function MinimapTest:BeforeEach()
	
end

function MinimapTest:AfterEach()
	
end

----------

function MinimapTest:TestGetDisplayedSize()
	Minimap.GetDisplayedSize()
end

function MinimapTest:TestGetIconsSprite()
	Minimap.GetIconsSprite()
end

function MinimapTest:TestGetItemIconsSprite()
	Minimap.GetItemIconsSprite()
end

function MinimapTest:TestSetHoldTime()
	local originalVal = Minimap.GetHoldTime()
	for _, val in pairs(test.TestUnsignedInts) do
		Minimap.SetHoldTime(val)
		test.AssertEquals(Minimap.GetHoldTime(), val)
	end
	Minimap.SetHoldTime(originalVal)
end

function MinimapTest:TestSetShakeDuration()
	local originalVal = Minimap.GetShakeDuration()
	for _, val in pairs(test.TestInts) do
		Minimap.SetShakeDuration(val)
		test.AssertEquals(Minimap.GetShakeDuration(), val)
	end
	Minimap.SetShakeDuration(originalVal)
end

function MinimapTest:TestSetShakeOffset()
	local originalVal = Minimap.GetShakeOffset()
	for _, val in pairs(test.TestVectors) do
		Minimap.SetShakeOffset(val)
		test.AssertEquals(Minimap.GetShakeOffset(), val)
	end
	Minimap.SetShakeOffset(originalVal)
end

function MinimapTest:TestSetState()
	local originalVal = Minimap.GetState()
	for _, val in pairs(test.TestInts) do
		Minimap.SetState(val)
		test.AssertEquals(Minimap.GetState(), val)
	end
	Minimap.SetState(originalVal)
end


return MinimapTest
