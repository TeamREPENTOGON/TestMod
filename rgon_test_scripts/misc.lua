-- Misc code like test item functionality not directly tied to unit tests.

local REVIVE_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST REVIVE")
local REVIVE_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL REVIVE")
local REVIVE_NULL_HIDDEN = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL HIDDEN REVIVE")
local REVIVE_TRINKET = Isaac.GetTrinketIdByName("REPENTOGON TEST TRINKET REVIVEEFFECT")

REPENTOGON_TEST:AddCallback(ModCallbacks.MC_PRE_TRIGGER_PLAYER_DEATH, function(_, player)
	if player:HasCollectible(REVIVE_ITEM) then
		player:RemoveCollectible(REVIVE_ITEM)
		return false
	end
	if player:GetEffects():HasNullEffect(REVIVE_NULL) then
		player:GetEffects():RemoveNullEffect(REVIVE_NULL)
		return false
	end
end)

REPENTOGON_TEST:AddCallback(ModCallbacks.MC_TRIGGER_PLAYER_DEATH_POST_CHECK_REVIVES, function(_, player)
	if player:GetEffects():HasTrinketEffect(REVIVE_TRINKET) then
		player:GetEffects():RemoveTrinketEffect(REVIVE_TRINKET)
		return false
	end
	if player:GetEffects():HasNullEffect(REVIVE_NULL_HIDDEN) then
		player:GetEffects():RemoveNullEffect(REVIVE_NULL_HIDDEN)
		return false
	end
end)


local TEST_FAMILIAR = Isaac.GetEntityVariantByName("Brother Bobentogon")

REPENTOGON_TEST:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, function(_, fam)
	fam:AddToFollowers()
	fam.Color = Color(1,0,0,1)
end, TEST_FAMILIAR)

REPENTOGON_TEST:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, function(_, fam)
	fam:FollowParent()
end, TEST_FAMILIAR)

REPENTOGON_TEST:AddCallback(ModCallbacks.MC_PRE_FAMILIAR_COLLISION, function(_, fam, collider)
	if collider:IsActiveEnemy() then
		return {Collide=true}
	end
end, TEST_FAMILIAR)