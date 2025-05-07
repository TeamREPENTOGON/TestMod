local test = REPENTOGON_TEST

local TitleMenuTest = {}

function TitleMenuTest:BeforeEach()
	
end

function TitleMenuTest:AfterEach()
	
end

----------

function TitleMenuTest:TestGetSprite()
	test.AssertEquals(TitleMenu.GetSprite():GetFilename(), "gfx/ui/main menu/TitleMenu.anm2")
end


return TitleMenuTest
