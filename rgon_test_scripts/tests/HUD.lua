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
	local mainstring = "hello"
	local secondarystring = "hello"

	test:AddOneTimeCallback(ModCallbacks.MC_PRE_FORTUNE_DISPLAY, function() end)

	hud:ShowFortuneText(mainstring, secondarystring)
end

function HUDTest:TestShowItemText(hud)
	local player = Isaac.GetPlayer()
	local item = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SAD_ONION)
	hud:ShowItemText(player, item)
end

function HUDTest:TestUpdate(hud)
	hud:Update()
end

function HUDTest:TestFlashRedHearts(hud)
	local player = Isaac.GetPlayer()
	hud:FlashRedHearts(player)
end

function HUDTest:TestGetCardsPillsSprite(hud)
	hud:GetCardsPillsSprite()
end

function HUDTest:TestGetChargeBarSprite(hud)
	hud:GetChargeBarSprite()
end

function HUDTest:TestGetCoopMenuSprite(hud)
	hud:GetCoopMenuSprite()
end

function HUDTest:TestGetCraftingSprite(hud)
	hud:GetCraftingSprite()
end

function HUDTest:TestGetFortuneSprite(hud)
	hud:GetFortuneSprite()
end

function HUDTest:TestGetHeartsSprite(hud)
	hud:GetHeartsSprite()
end

function HUDTest:TestGetInventorySprite(hud)
	hud:GetInventorySprite()
end

function HUDTest:TestGetPickupsHUDSprite(hud)
	hud:GetPickupsHUDSprite()
end

function HUDTest:TestGetPlayerHUD(hud)
	local index = 1
	hud:GetPlayerHUD(index)
end

function HUDTest:TestGetPoopSpellSprite(hud)
	hud:GetPoopSpellSprite()
end

function HUDTest:TestGetStreakSprite(hud)
	hud:GetStreakSprite()
end

function HUDTest:TestSetBossHPBarFill(hud)
	local originalVal = hud:GetBossHPBarFill()
	for _, val in pairs(test.TestFloats) do
		hud:SetBossHPBarFill(val)
		test.AssertEquals(hud:GetBossHPBarFill(), val)
	end
	hud:SetBossHPBarFill(originalVal)
end


return HUDTest
