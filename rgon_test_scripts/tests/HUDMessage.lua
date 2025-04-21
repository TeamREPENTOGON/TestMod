local test = REPENTOGON_TEST

local HUDMessageTest = {}

function HUDMessageTest:BeforeEach()
	return Game():GetHUD():GetMainMessage()
end

function HUDMessageTest:AfterEach(message)
	message:Hide()
end

----------

function HUDMessageTest:TestGetSprite(message)
	test.AssertEquals(message:GetSprite():GetFilename(), "gfx/ui/ui_streak.anm2")
end

function HUDMessageTest:TestShowSetText(message)
	local mainText = "Main1"
	local subText = "Sub1"

	message:Hide()
	test.AssertFalse(message:IsShowing())
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, function(_, title, subtitle, sticky, curse)
		test.AssertEquals(title, mainText)
		test.AssertEquals(subtitle, subText)
		test.AssertFalse(sticky)
		test.AssertFalse(curse)
	end)
	message:Show(mainText, subText, false, false)
	test.AssertTrue(message:IsShowing())
	test.AssertEquals(message:GetMainText(), mainText)
	test.AssertEquals(message:GetSubText(), subText)

	local altMainText = "Main2"
	local altSubText = "Sub2"

	message:SetMainText(altMainText)
	test.AssertEquals(message:GetMainText(), altMainText)

	message:SetSubText(altSubText)
	test.AssertEquals(message:GetSubText(), altSubText)

	message:Hide()
	test.AssertFalse(message:IsShowing())
end


return HUDMessageTest
