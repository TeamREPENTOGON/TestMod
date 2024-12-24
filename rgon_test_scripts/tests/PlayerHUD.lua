local test = REPENTOGON_TEST

local PlayerHUDTest = {}

function PlayerHUDTest:BeforeEach()
	return Game():GetHUD():GetPlayerHUD(0)
end

function PlayerHUDTest:AfterEach(playerhud)
	
end

----------

function PlayerHUDTest:TestGetHeartByIndex(playerhud)
	local index = 1
	playerhud:GetHeartByIndex(index)
end

function PlayerHUDTest:TestGetHearts(playerhud)
	playerhud:GetHearts()
end

function PlayerHUDTest:TestGetHUD(playerhud)
	playerhud:GetHUD()
end

function PlayerHUDTest:TestGetPlayer(playerhud)
	playerhud:GetPlayer()
end

function PlayerHUDTest:TestRenderActiveItem(playerhud)
	local firstPlayer = Isaac.GetPlayer()
	firstPlayer:AddCollectible(CollectibleType.COLLECTIBLE_D6)
	Game():GetHUD():PostUpdate()

	local testSlot = ActiveSlot.SLOT_PRIMARY
	local testPos = Vector(1, 2)
	local testAlpha = 0.6
	local testScale = 0.75

	local successfulCallbacks = 0

	local callback = function(_, player, slot, offset, alpha, scale, chargeBarOffset)
		test.AssertEquals(slot, testSlot)
		test.AssertEquals(GetPtrHash(player), GetPtrHash(firstPlayer))
		test.AssertEquals(offset, testPos)
		test.AssertEquals(alpha, testAlpha)
		test.AssertEquals(scale, testScale)
		test.AssertEquals(chargeBarOffset.X > 0 and chargeBarOffset.Y >= 0, true)
		successfulCallbacks = successfulCallbacks + 1
	end
	test:AddCallback(ModCallbacks.MC_PRE_PLAYERHUD_RENDER_ACTIVE_ITEM, callback)
	test:AddCallback(ModCallbacks.MC_POST_PLAYERHUD_RENDER_ACTIVE_ITEM, callback)

	playerhud:RenderActiveItem(testSlot, testPos, testAlpha, testScale)

	test:RemoveCallback(ModCallbacks.MC_PRE_PLAYERHUD_RENDER_ACTIVE_ITEM, callback)
	test:RemoveCallback(ModCallbacks.MC_POST_PLAYERHUD_RENDER_ACTIVE_ITEM, callback)

	test.AssertEquals(successfulCallbacks, 2)
end

function PlayerHUDTest:TestRenderTrinket(playerhud)
	local firstPlayer = Isaac.GetPlayer()
	firstPlayer:AddTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)
	Game():GetHUD():PostUpdate()

	local success = false

	local callback = function(_, slot, pos, scale, player, crop)
		if slot == 0 then
			test.AssertEquals(pos.X > 0 and pos.Y > 0, true)
			test.AssertEquals(scale, 1.0)
			test.AssertEquals(GetPtrHash(player), GetPtrHash(firstPlayer))
			test.AssertEquals(crop, Vector(0,0))
			success = true
		end
	end
	test:AddCallback(ModCallbacks.MC_PRE_PLAYERHUD_TRINKET_RENDER, callback)
	Game():GetHUD():Render()
	test:RemoveCallback(ModCallbacks.MC_PRE_PLAYERHUD_TRINKET_RENDER, callback)

	test.AssertTrue(success)
end


return PlayerHUDTest
