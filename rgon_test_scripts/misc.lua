-- Misc code like test item functionality not directly tied to single unit tests.
local mod = REPENTOGON_TEST

local REVIVE_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST REVIVE")
local REVIVE_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL REVIVE")
local REVIVE_NULL_HIDDEN = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL HIDDEN REVIVE")
local REVIVE_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST TRINKET REVIVEEFFECT")

mod:AddCallback(ModCallbacks.MC_PRE_TRIGGER_PLAYER_DEATH, function(_, player)
	if player:HasCollectible(REVIVE_ITEM) then
		player:RemoveCollectible(REVIVE_ITEM)
		return false
	end
	if player:GetEffects():HasNullEffect(REVIVE_NULL) then
		player:GetEffects():RemoveNullEffect(REVIVE_NULL)
		return false
	end
end)

mod:AddCallback(ModCallbacks.MC_TRIGGER_PLAYER_DEATH_POST_CHECK_REVIVES, function(_, player)
	if player:GetEffects():HasTrinketEffect(REVIVE_TRINKET) then
		player:GetEffects():RemoveTrinketEffect(REVIVE_TRINKET)
		return false
	end
	if player:GetEffects():HasNullEffect(REVIVE_NULL_HIDDEN) then
		player:GetEffects():RemoveNullEffect(REVIVE_NULL_HIDDEN)
		return false
	end
end)


mod:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, function(_, fam)
	fam:AddToFollowers()
	fam.Color = Color(1,0,0,1)
end, mod.TEST_FAMILIAR)

mod:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, function(_, fam)
	fam:FollowParent()
end, mod.TEST_FAMILIAR)

mod:AddCallback(ModCallbacks.MC_PRE_FAMILIAR_COLLISION, function(_, fam, collider)
	if collider:IsActiveEnemy() then
		return {Collide=true}
	end
end, mod.TEST_FAMILIAR)


local FAMILIAR_MULT_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST FAMILIAR MULT ITEM")

mod:AddCallback(ModCallbacks.MC_EVALUATE_FAMILIAR_MULTIPLIER, function(_, fam, mult, player)
	return mult + player:GetCollectibleNum(FAMILIAR_MULT_ITEM) + player:GetEffects():GetCollectibleEffectNum(FAMILIAR_MULT_ITEM)
end)


local TEARS_CAP_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST TEARS CAP ITEM")
local STAT_MULT_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST STAT MULT ITEM")
local HEALTHTYPE_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST HEALTH TYPE CHANGE ITEM")
local MAXCOINS_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST MAX COINS ITEM")
local MAXBOMBS_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST MAX BOMBS NULL")
local MAXKEYS_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST MAX KEYS TRINKET")

mod:AddPriorityCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, CallbackPriority.EARLY, function(_, player, cache, value)
	if player:HasCollectible(TEARS_CAP_ITEM) then
		return value+1
	end
end, "tearscap")

mod:AddPriorityCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, CallbackPriority.EARLY, function(_, player, cache, value)
	if player:HasCollectible(STAT_MULT_ITEM) then
		return value*0.75
	end
end, "statmultiplier")

mod:AddCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, player, cache, value)
	if player:HasCollectible(HEALTHTYPE_ITEM) then
		return HealthType.SOUL
	end
end, "healthtype")

if ModCallbacks.MC_PLAYER_HEALTH_TYPE_CHANGE then
	mod:AddCallback(ModCallbacks.MC_PLAYER_HEALTH_TYPE_CHANGE, function(_, player, newHealthType, oldHealthType)
		if player:HasCollectible(HEALTHTYPE_ITEM) and newHealthType == HealthType.SOUL and player:GetMaxHearts() > 0 then
			player:AddMaxHearts(-player:GetMaxHearts())
			if player:GetSoulHearts() == 0 then
				player:AddSoulHearts(1)
			end
		end
	end)
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, player, cache, value)
	if player:HasCollectible(MAXCOINS_ITEM) or player:GetEffects():HasCollectibleEffect(MAXCOINS_ITEM) then
		return 9
	end
end, "maxcoins")

mod:AddCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, player, cache, value)
	if player:GetEffects():HasNullEffect(MAXBOMBS_NULL) then
		return 9
	end
end, "maxbombs")

mod:AddCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, player, cache, value)
	if player:HasTrinket(MAXKEYS_TRINKET) or player:GetEffects():HasTrinketEffect(MAXKEYS_TRINKET) then
		return 9
	end
end, "maxkeys")


mod:AddCallback(ModCallbacks.MC_MAIN_MENU_RENDER, function()
	local frame = Isaac.GetFrameCount()
	local offset = 70 * (math.floor(frame / 2) % 5)
	EntityConfig.GetPlayer(mod.TEST_PLAYER):GetModdedMenuPortraitSprite():GetLayer(0):SetCropOffset(Vector(offset,0))
end)
