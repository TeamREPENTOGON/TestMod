local test = REPENTOGON_TEST

local HUDTest = {}

function HUDTest:BeforeEach()
	return Game():GetHUD()
end

function HUDTest:AfterEach(hud)
	
end

----------

function HUDTest:TestAssignPlayerHUDs(hud)
	hud:AssignPlayerHUDs()
end

function HUDTest:TestFlashChargeBar(hud)
	local player = Isaac.GetPlayer()
	local activeslot = 1
	hud:FlashChargeBar(player, activeslot)
end

function HUDTest:TestInvalidateActiveItem(hud)
	local player = Isaac.GetPlayer()
	local activeslot = 1
	hud:InvalidateActiveItem(player, activeslot)
end

function HUDTest:TestInvalidateCraftingItem(hud)
	local player = Isaac.GetPlayer()
	hud:InvalidateCraftingItem(player)
end

function HUDTest:TestIsVisible(hud)
	hud:IsVisible()
end

function HUDTest:TestPostUpdate(hud)
	hud:PostUpdate()
end

function HUDTest:TestRender(hud)
	hud:Render()
end

function HUDTest:TestSetVisible(hud)
	local visible = true
	hud:SetVisible(visible)
end

function HUDTest:TestShowFortuneText(hud)
	local mainstring = "Test1"
	local secondarystring = "Test2"

	-- Test playing a fortune.
	hud:GetFortuneSprite():Stop()
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_FORTUNE_DISPLAY, function() end)
	hud:ShowFortuneText(mainstring, secondarystring)
	test.AssertTrue(hud:GetFortuneSprite():IsPlaying())

	-- Test canceling a fortune.
	hud:GetFortuneSprite():Stop()
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_FORTUNE_DISPLAY, function() return false end)
	hud:ShowFortuneText(mainstring, secondarystring)
	test.AssertFalse(hud:GetFortuneSprite():IsPlaying())
end

function HUDTest:TestShowItemText(hud)
	local player = Isaac.GetPlayer()
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local mainstring = "The Sad Onion"
	local secondarystring = "Tears up"

	local callbackFunc = function(_, title, subtitle, sticky, curse)
		test.AssertEquals(title, mainstring)
		test.AssertEquals(subtitle, secondarystring)
		test.AssertFalse(sticky)
		test.AssertFalse(curse)
	end

	-- Test displaying item text.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	hud:ShowItemText(player, item, false)
	test.AssertTrue(hud:GetStackedMessage(0):IsShowing())
	test.AssertEquals(hud:GetStackedMessage(0):GetMainText(), mainstring)
	test.AssertEquals(hud:GetStackedMessage(0):GetSubText(), secondarystring)

	-- Test stacking item text.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	hud:ShowItemText(player, item, false)
	test.AssertTrue(hud:GetStackedMessage(1):IsShowing())
	test.AssertEquals(hud:GetStackedMessage(1):GetMainText(), mainstring)
	test.AssertEquals(hud:GetStackedMessage(1):GetSubText(), secondarystring)

	-- Test canceling item text.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, function() return false end)
	hud:ShowItemText(player, item, false)
	test.AssertFalse(hud:GetStackedMessage(2):IsShowing())

	-- Test clearing the stack.
	hud:GetStackedMessage(0):Hide()
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	hud:ShowItemText(player, item, true)
	test.AssertTrue(hud:GetStackedMessage(0):IsShowing())
	test.AssertEquals(hud:GetStackedMessage(0):GetMainText(), mainstring)
	test.AssertEquals(hud:GetStackedMessage(0):GetSubText(), secondarystring)
	test.AssertFalse(hud:GetStackedMessage(1):IsShowing())

	hud:GetStackedMessage(0):Hide()
end

function HUDTest:TestShowCustomItemText(hud)
	local mainstring = "Test1"
	local secondarystring = "Test2"

	local useCurseDisplay = false

	local callbackFunc = function(_, title, subtitle, sticky, curse)
		test.AssertEquals(title, mainstring)
		test.AssertEquals(subtitle, secondarystring)
		test.AssertFalse(sticky)
		test.AssertEquals(curse, useCurseDisplay)
	end

	-- Test displaying item text.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	hud:ShowItemText(mainstring, secondarystring, useCurseDisplay, false)
	test.AssertTrue(hud:GetStackedMessage(0):IsShowing())
	test.AssertFalse(hud:GetStackedMessage(0):GetSprite():GetLayer(1):IsVisible())
	test.AssertEquals(hud:GetStackedMessage(0):GetMainText(), mainstring)
	test.AssertEquals(hud:GetStackedMessage(0):GetSubText(), secondarystring)

	-- Test stacking item text + curse display.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	useCurseDisplay = true
	hud:ShowItemText(mainstring, secondarystring, useCurseDisplay, false)
	useCurseDisplay = false
	test.AssertTrue(hud:GetStackedMessage(1):IsShowing())
	test.AssertTrue(hud:GetStackedMessage(1):GetSprite():GetLayer(1):IsVisible())
	test.AssertEquals(hud:GetStackedMessage(1):GetMainText(), mainstring)
	test.AssertEquals(hud:GetStackedMessage(1):GetSubText(), secondarystring)

	-- Test canceling item text.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, function() return false end)
	hud:ShowItemText(mainstring, secondarystring, useCurseDisplay, false)
	test.AssertFalse(hud:GetStackedMessage(2):IsShowing())

	-- Test clearing the stack.
	hud:GetStackedMessage(0):Hide()
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	hud:ShowItemText(mainstring, secondarystring, useCurseDisplay, true)
	test.AssertTrue(hud:GetStackedMessage(0):IsShowing())
	test.AssertEquals(hud:GetStackedMessage(0):GetMainText(), mainstring)
	test.AssertEquals(hud:GetStackedMessage(0):GetSubText(), secondarystring)
	test.AssertFalse(hud:GetStackedMessage(1):IsShowing())

	hud:GetStackedMessage(0):Hide()
end

function HUDTest:TestCoopShowItemText(hud)
	local mainPlayer = Isaac.GetPlayer(0)
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	local mainstring = "The Sad Onion"
	local secondarystring = "Tears up"

	local coPlayer1 = PlayerManager.SpawnCoPlayer2(PlayerType.PLAYER_MAGDALENE)
	local coPlayer2 = PlayerManager.SpawnCoPlayer2(PlayerType.PLAYER_CAIN)

	local callbackFunc = function(_, title, subtitle, sticky, curse)
		test.AssertEquals(title, mainstring)
		test.AssertEquals(subtitle, secondarystring)
		test.AssertFalse(sticky)
		test.AssertFalse(curse)
	end

	-- Test displaying item text.
	test:AddOneTimeCallback(ModCallbacks.MC_PRE_ITEM_TEXT_DISPLAY, callbackFunc)
	hud:ShowItemText(mainPlayer, item)

	PlayerManager.RemoveCoPlayer(coPlayer1)
	PlayerManager.RemoveCoPlayer(coPlayer2)

	test.AssertFalse(hud:GetStackedMessage(0):IsShowing())
	test.AssertTrue(hud:GetCoopPlayerMessage(0):IsShowing())
	test.AssertEquals(hud:GetCoopPlayerMessage(0):GetMainText(), mainstring)
	test.AssertEquals(hud:GetCoopPlayerMessage(0):GetSubText(), secondarystring)
end

function HUDTest:TestUpdate(hud)
	hud:Update()
end

function HUDTest:TestFlashRedHearts(hud)
	local player = Isaac.GetPlayer()
	hud:FlashRedHearts(player)
end

function HUDTest:TestGetCardsPillsSprite(hud)
	test.AssertEquals(hud:GetCardsPillsSprite():GetFilename(), "gfx/ui/ui_cardspills.anm2")
end

function HUDTest:TestGetChargeBarSprite(hud)
	test.AssertEquals(hud:GetChargeBarSprite():GetFilename(), "gfx/ui/ui_chargebar.anm2")
end

function HUDTest:TestGetCoopMenuSprite(hud)
	test.AssertEquals(hud:GetCoopMenuSprite():GetFilename(), "gfx/ui/coop menu.anm2")
end

function HUDTest:TestGetCraftingSprite(hud)
	test.AssertEquals(hud:GetCraftingSprite():GetFilename(), "gfx/ui/ui_crafting.anm2")
end

function HUDTest:TestGetFortuneSprite(hud)
	test.AssertEquals(hud:GetFortuneSprite():GetFilename(), "gfx/ui/ui_FortunePaper.anm2")
end

function HUDTest:TestGetHeartsSprite(hud)
	test.AssertEquals(hud:GetHeartsSprite():GetFilename(), "gfx/ui/ui_hearts.anm2")
end

function HUDTest:TestGetInventorySprite(hud)
	test.AssertEquals(hud:GetInventorySprite():GetFilename(), "gfx/ui/ui_inventory.anm2")
end

function HUDTest:TestGetPickupsHUDSprite(hud)
	test.AssertEquals(hud:GetPickupsHUDSprite():GetFilename(), "gfx/ui/hudpickups.anm2")
end

function HUDTest:TestGetPoopSpellSprite(hud)
	test.AssertEquals(hud:GetPoopSpellSprite():GetFilename(), "gfx/ui/ui_poops.anm2")
end

function HUDTest:TestGetPlayerHUD(hud)
	test.AssertEquals(hud:GetPlayerHUD(0):GetPlayer():GetName(), "Isaac")
end

function HUDTest:TestSetBossHPBarFill(hud)
	local originalVal = hud:GetBossHPBarFill()
	for _, val in pairs(test.TestFloats) do
		hud:SetBossHPBarFill(val)
		test.AssertEquals(hud:GetBossHPBarFill(), val)
	end
	hud:SetBossHPBarFill(originalVal)
end

function HUDTest:TestGetStreakSprite(hud)
	test.AssertEquals(GetPtrHash(hud:GetStreakSprite()), GetPtrHash(hud:GetMainMessage():GetSprite()))
end

function HUDTest:TestGetMainMessage(hud)
	test.AssertEquals(hud:GetMainMessage():GetSprite():GetFilename(), "gfx/ui/ui_streak.anm2")
end

function HUDTest:TestGetStackedMessage(hud)
	for i=0,5 do
		test.AssertEquals(hud:GetStackedMessage(i):GetSprite():GetFilename(), "gfx/ui/ui_streak.anm2")
	end
end

function HUDTest:TestGetCoopPlayerMessage(hud)
	for i=0,3 do
		test.AssertEquals(hud:GetCoopPlayerMessage(i):GetSprite():GetFilename(), "gfx/ui/ui_streak.anm2")
	end
end


return HUDTest
