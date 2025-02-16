local test = REPENTOGON_TEST

local MinimapTest = {}

function MinimapTest:BeforeEach()
	
end

function MinimapTest:AfterEach()
	
end

----------

function MinimapTest:TestGetDisplayedSize()
	test.AssertEquals(Minimap.GetDisplayedSize(), Vector(47,47))
end

function MinimapTest:TestGetIconsSprite()
	test.AssertEquals(Minimap.GetIconsSprite():GetFilename(), "gfx/ui/minimap_icons.anm2")
end

function MinimapTest:TestGetItemIconsSprite()
	test.AssertEquals(Minimap.GetItemIconsSprite():GetFilename(), "gfx/ui/mapitemicons.anm2")
end

function MinimapTest:TestSetHoldTime()
	local originalVal = Minimap.GetHoldTime()
	test.AssertEquals(originalVal, 0)
	for _, val in pairs(test.TestUnsignedInts) do
		Minimap.SetHoldTime(val)
		test.AssertEquals(Minimap.GetHoldTime(), val)
	end
	Minimap.SetHoldTime(originalVal)
end

function MinimapTest:TestSetShakeDuration()
	local originalVal = Minimap.GetShakeDuration()
	test.AssertEquals(originalVal, 0)
	for _, val in pairs(test.TestInts) do
		Minimap.SetShakeDuration(val)
		test.AssertEquals(Minimap.GetShakeDuration(), val)
	end
	Minimap.SetShakeDuration(originalVal)
end

function MinimapTest:TestSetShakeOffset()
	local originalVal = Minimap.GetShakeOffset()
	test.AssertEquals(originalVal, Vector(0,0))
	for _, val in pairs(test.TestVectors) do
		Minimap.SetShakeOffset(val)
		test.AssertEquals(Minimap.GetShakeOffset(), val)
	end
	Minimap.SetShakeOffset(originalVal)
end

function MinimapTest:TestSetState()
	local originalVal = Minimap.GetState()
	test.AssertTrue(originalVal >= 0 and originalVal <= 2)
	for _, val in pairs(test.TestInts) do
		Minimap.SetState(val)
		test.AssertEquals(Minimap.GetState(), val)
	end
	Minimap.SetState(originalVal)
end


return MinimapTest
