local test = REPENTOGON_TEST

local SpecialSeedsMenuTest = {}

function SpecialSeedsMenuTest:BeforeEach()
	
end

function SpecialSeedsMenuTest:AfterEach()
	
end

----------

function SpecialSeedsMenuTest:TestGetSprite()
	SpecialSeedsMenu.GetSprite()
end

function SpecialSeedsMenuTest:TestSetSelectedElement()
	local originalVal = SpecialSeedsMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		SpecialSeedsMenu.SetSelectedElement(val)
		test.AssertEquals(SpecialSeedsMenu.GetSelectedElement(), val)
	end
	SpecialSeedsMenu.SetSelectedElement(originalVal)
end


return SpecialSeedsMenuTest
