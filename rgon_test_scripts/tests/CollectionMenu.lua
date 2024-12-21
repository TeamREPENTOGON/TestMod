local test = REPENTOGON_TEST

local CollectionMenuTest = {}

function CollectionMenuTest:BeforeEach()
	
end

function CollectionMenuTest:AfterEach()
	
end

----------

function CollectionMenuTest:TestGetCollectionMenuSprite()
	CollectionMenu.GetCollectionMenuSprite()
end

function CollectionMenuTest:TestGetDeathScreenSprite()
	CollectionMenu.GetDeathScreenSprite()
end

function CollectionMenuTest:TestSetSelectedPage()
	local originalVal = CollectionMenu.GetSelectedPage()
	for _, val in pairs(test.TestInts) do
		CollectionMenu.SetSelectedPage(val)
		test.AssertEquals(CollectionMenu.GetSelectedPage(), val)
	end
	CollectionMenu.SetSelectedPage(originalVal)
end

function CollectionMenuTest:TestSetSelectedElement()
	local originalVal = CollectionMenu.GetSelectedElement()
	for _, val in pairs(test.TestInts) do
		CollectionMenu.SetSelectedElement(val)
		test.AssertEquals(CollectionMenu.GetSelectedElement(), val)
	end
	CollectionMenu.SetSelectedElement(originalVal)
end


return CollectionMenuTest
