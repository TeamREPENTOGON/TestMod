-- Misc code like test item functionality not directly tied to single unit tests.
local mod = REPENTOGON_TEST

local REVIVE_ITEM = Isaac.GetItemIdByName("REPENTOGON TEST REVIVE")
local TEST_NULL = Isaac.GetNullItemIdByName("REPENTOGON TEST NULL")
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

local function GetNumTriggers(flip, i)
	local n = flip and { 3, 2, 0, 0 } or { 1, 2, 3, 0 }
	return n[(i % #n)+1]
end

function FuckTheBestiary()
	for t=10, 999 do
		for v=0, 4095 do
			UnitTests.SaveUtility.AddBestiaryTest(t, v)
		end
	end
end

function PopulateTestSaveData(flip)
	local data = Isaac.GetPersistentGameData()
	for i=1, EventCounter.NUM_EVENT_COUNTERS-1 do
		data:IncreaseEventCounter(i, GetNumTriggers(flip, i))
	end
	for i=13,1,-1 do
		local n = GetNumTriggers(flip, i)
		if n > 0 then
			Isaac.ExecuteCommand("stage " .. i)
			local gridIndex = Game():GetLevel():GetRooms():Get(Game():GetLevel():GetLastBossRoomListIndex()).GridIndex
			Game():ChangeRoom(gridIndex)
			for i=1,n do
				Game():GetRoom():SpawnClearAward()
			end
		end
	end
	Game():ChangeRoom(Game():GetLevel():GetStartingRoomIndex())
	for i=1, CollectibleType.COLLECTIBLE_MOMS_RING do
		if ItemConfig.Config.IsValidCollectible(i) then
			if i % 2 == (flip and 0 or 1) then
				Isaac.GetPlayer():AddCollectible(i)
				Isaac.GetPlayer():RemoveCollectible(i)
			end
		end
	end
	-- Minibosses?
	for i=1, BossType.CLUTCH do
		if i % 2 == (flip and 0 or 1) then
			data:AddBossKilled(i)
		end
	end
	for i=1, Challenge.CHALLENGE_DELETE_THIS do
		if i % 2 == (flip and 0 or 1) then
			Isaac.ClearChallenge(i)
		end
	end
	-- tainted/difficulty Settings are ignored
	-- Special Seeds, need to do manually, lol
	for t=EntityType.ENTITY_GAPER, EntityType.ENTITY_MR_MINE do
		for v=0,2 do
			if EntityConfig.GetEntity(t,v) and not EntityConfig.GetEntity(t,v):IsBoss() then
				for n=1,GetNumTriggers(flip, t) do
					local entity = Isaac.Spawn(t, v, 0, Vector.Zero, Vector.Zero, nil)
					entity:Update()
					entity:Kill()
					entity:Update()
					entity:Remove()
					--data:AddBestiaryKill(t)
				end
			end
		end
	end
	for i=2, 26 do
		if i % 2 == (flip and 0 or 1) then
			Isaac.PlayCutscene(i)
		end
	end
	for i=1, Achievement.ASCENT_DOOR do
		if i % 2 == (flip and 0 or 1) then
			data:TryUnlock(i, true)
		else
			Isaac.ExecuteCommand("lockachievement " .. i)
		end
	end
	Isaac.StartNewGame(PlayerType.PLAYER_ISAAC)
end

function GenerateSaves()
	local basepath = "REPENTOGON_testmod/resources/test_saves/"
	local filenames = {"abp1", "abp2", "rep+1", "rep+2"}
	for i=1, #filenames do
		for j=1, #filenames do
			if i ~= j then
				local filea = basepath .. filenames[i] .. ".dat"
				local fileb = basepath .. filenames[j] .. ".dat"
				if UnitTests.SaveUtility.CompareSaves(filea, fileb) then
					print("urnghn?")
					return
				end
				
				local syncedFilename = filenames[i] .. "_syncedwith_" .. filenames[j] .. ".dat"
				local syncedOut = basepath .. "synced/" .. syncedFilename
				local syncedExpected = basepath .. "expected/" .. syncedFilename
				if not UnitTests.SaveUtility.TestSync(filea, fileb, syncedOut, false) then
					print("SYNC FAILED")
					return
				end
				if not UnitTests.SaveUtility.CompareSaves(syncedOut, syncedExpected, false) then
					print("SYNC DIDNT MATCH")
					return
				end
				
				local overwriteFilename = filenames[i] .. "_overwrittenby_" .. filenames[j] .. ".dat"
				local overwriteOut = basepath .. "synced/" .. overwriteFilename
				local overwriteExpected = basepath .. "expected/" .. overwriteFilename
				if not UnitTests.SaveUtility.TestSync(filea, fileb, overwriteOut, true) then
					print("OVERWRITE FAILED")
					return
				end
				if not UnitTests.SaveUtility.CompareSaves(overwriteOut, overwriteExpected, false) then
					print("OVERWRITE DIDNT MATCH")
					return
				end
			end
		end
	end
end
--[[
mod:AddCallback(ModCallbacks.MC_PRE_APPLY_TEARFLAG_EFFECTS, function(_, entity, pos, flags, source, damage)
	if source then
		print(source.Type ..".".. source.Variant ..".".. source.SubType)
		if source.Parent then
			print("Parent: " .. source.Parent.Type)
		end
		if source.SpawnerEntity then
			print("SpawnerEntity: " .. source.SpawnerEntity.Type)
		end
	end
	--return { TearFlags = flags | TearFlags.TEAR_POISON }
end)

mod:AddCallback(ModCallbacks.MC_POST_KNIFE_UPDATE, function(_, knife)
	if knife.FrameCount == 1 then
		print("Parent: " .. (knife.Parent and knife.Parent.Type or "NONE"))
		print("SpawnerEntity: " .. (knife.SpawnerEntity and knife.SpawnerEntity.Type or "NONE"))
		print("HitboxParent: " .. (knife:GetHitboxParentKnife() and knife:GetHitboxParentKnife().Type or "NONE"))
		if knife:GetHitboxParentKnife() then
			print(knife:GetHitboxParentKnife().TearFlags)
		end
		--knife:SetHitboxParentKnife(Isaac.FindByType(EntityType.ENTITY_KNIFE)[1])
		--print("HitboxParent: " .. (knife:GetHitboxParentKnife() and knife:GetHitboxParentKnife().Type or "NONE"))
	end
end, KnifeSubType.CLUB_HITBOX)
]]
mod:AddCallback(ModCallbacks.MC_USE_ITEM, function()
	--print("HI")
	--return {ShowAnim=false}
end)

mod:AddCallback(ModCallbacks.MC_POST_BOMB_DAMAGE, function(_, pos, damage, radius, lineCheck, source, tearFlags, damageFlags, damageSource)
	--print("MC_POST_BOMB_DAMAGE: " .. source.Type)
	--print(damageSource)
end)

mod:AddCallback(ModCallbacks.MC_POST_BOMB_TEARFLAG_EFFECTS, function(_, pos, radius, tearFlags, source, radiusMult)
	--print("MC_POST_BOMB_TEARFLAG_EFFECTS: " .. source.Type)
end)

--mod:AddCallback(ModCallbacks.MC_PLAYER_GET_HEART_LIMIT, function(_, p, limit, isKeeper)
--	print(isKeeper)
--end)

--[[
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_TRIGGER_EFFECT_REMOVED, function(_, player, item)
	print("MC_POST_PLAYER_TRIGGER_EFFECT_REMOVED")
end)

mod:AddCallback(ModCallbacks.MC_POST_ROOM_TRIGGER_EFFECT_REMOVED, function(_, item)
	print("MC_POST_ROOM_TRIGGER_EFFECT_REMOVED")
end)

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_ADD_EFFECT, function(_, player, item)
	print("MC_POST_PLAYER_ADD_EFFECT")
end)

mod:AddCallback(ModCallbacks.MC_POST_ROOM_ADD_EFFECT, function(_, item)
	print("MC_POST_ROOM_ADD_EFFECT")
end)

mod:AddCallback(ModCallbacks.MC_EVALUATE_CUSTOM_CACHE, function(_, player, cache, value)
	print("MC_EVALUATE_CUSTOM_CACHE maxbombs")
end, "maxbombs")

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_ADD_EFFECT, function(_, player, item)
	print("MC_POST_PLAYER_ADD_EFFECT COLLECTIBLE_D6")
end, Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_D6))

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_TRIGGER_EFFECT_REMOVED, function(_, player, item)
	print("MC_POST_PLAYER_TRIGGER_EFFECT_REMOVED COLLECTIBLE_D6")
end, Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_D6))
]]
--[[
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, player)
	print("familiar cache triggered")
	if player:GetEffects():HasNullEffect(TEST_NULL) then
		print("HI")
		player:CheckFamiliar(mod.TEST_FAMILIAR, 1, player:GetCollectibleRNG(REVIVE_ITEM))
	end
end, CacheFlag.CACHE_FAMILIARS)
]]
mod:AddCallback(ModCallbacks.MC_POST_FIRE_SPLIT_TEAR, function(_, tear, source, sourceType, bbbb)
	--print("Tear: " .. tostring(tear:HasTearFlags(TearFlags.TEAR_SLOW)))
	--print("Laser: " .. tostring(source:ToLaser():HasTearFlags(TearFlags.TEAR_SLOW)))
	--print("-----")
	--print(tear.FallingSpeed)
	-- print(GetPtrHash(tear) .. " (" .. tear.Type .. "." .. tear.Variant .. ") fired by " .. GetPtrHash(source) .. " (" .. source.Type .. "." .. source.Variant .. "." .. source.SubType .. ")")
	--[[local tearFlags = (source:ToTear() or source:ToKnife() or source:ToLaser() or source).TearFlags or {l=0}
	for k,v in pairs(TearFlags) do
		if v > 0 and tearFlags.l & v == v then
			print(k)
		end
	end]]
end)

TEST_LUAROOMS = include("rgontestluarooms")

-- Isaac.AddCallback({Name="TEST"}, ModCallbacks.MC_GET_PILL_EFFECT, function(_, pillEffect, pillColor) print(pillEffect .."." .. pillColor) return PillEffect.PILLEFFECT_I_FOUND_PILLS end)

--[[
mod:AddCallback(ModCallbacks.MC_POST_LASER_UPDATE, function(_, laser)
	local player = laser.SpawnerEntity and laser.SpawnerEntity:ToPlayer()
	if player then
		local newtear = laser:FireSplitTear(laser:GetEndPoint(), RandomVector() * player.ShotSpeed * 10)
		newtear:AddTearFlags(TearFlags.TEAR_SLOW)
	end
end)

mod:AddCallback(ModCallbacks.MC_POST_KNIFE_UPDATE, function(_, knife)
	local player = knife.SpawnerEntity and knife.SpawnerEntity:ToPlayer()
	if player and knife:IsFlying() and knife.FrameCount % 5 == 0 then
		local newtear = knife:FireSplitTear(knife.Position, RandomVector() * player.ShotSpeed * 10)
		newtear:AddTearFlags(TearFlags.TEAR_SLOW)
	end
end)

mod:AddCallback(ModCallbacks.MC_POST_TEAR_DEATH, function(_, tear)
	--print(tear.FallingSpeed)
	--print(tear.FrameCount)
	if not tear:HasTearFlags(TearFlags.TEAR_SLOW) then
		local vec = RandomVector()
		for i=0,3 do
			local newtear = tear:FireSplitTear(tear.Position, vec:Rotated(i*90) * tear.Velocity:Length(), 0.5, 0.6, TearVariant.FETUS)
			newtear:AddTearFlags(TearFlags.TEAR_SLOW)
			newtear:AddTearFlags(TearFlags.TEAR_FETUS)
		end
		--newtear.Height = -7.5
		--newtear.FallingSpeed = 0
	end
end)
]]
--[[
local sprite = Sprite()
sprite:Load("gfx/001.000_player.anm2", true)
sprite:SetCustomShader("shaders/coloroffset_rgontest")

local n = 0
local ns = {}
local avg = 0

mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()
	local pos = Isaac.WorldToScreen(Game():GetRoom():GetCenterPos() - Vector(200,100))
	local t1 = os.clock()
	for i=1, 5000 do
		sprite:Render(pos + Vector(i*5, 0))
	end
	local t2 = os.clock()
	local t = t2-t1
	n = n + 1
	--avg = avg + (t - avg) / n
	--Isaac.RenderText("" .. avg, pos.X, pos.Y + 50, 1, 1, 1, 255)
	--Isaac.RenderText("" .. t, pos.X, pos.Y + 75, 1, 1, 1, 255)
	table.insert(ns, t)
	if #ns >= 120 then
		local sum = 0
		for k,v in ipairs(ns) do
			sum = sum + v
		end
		avg = sum / #ns
		ns = {}
	end
	Isaac.RenderText("" .. avg, pos.X, pos.Y + 50, 1, 1, 1, 255)
end)

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, function()
	if not sprite:IsPlaying("Happy") then
		sprite:Play("Happy", true)
	end
	sprite:Update()
end)
]]

-- Colorize modeling clay: 66FF183F 7811AB3E 6C059F3E  / 0.5976471, 0.33411765, 0.31058824
-- Tint error: 8584043F D2D0D03D D2D0D03D / 0.5176471, 0.10196079, 0.10196079
--[[
GetErrorTrinketID = function()
	local m = 4294967295 -- 0xFFFFFFFF
	local seed = Game():GetLevel():GetCurrentRoomDesc().SpawnSeed  -- 8D038566
	print(seed .. " vs " .. 0x8D038566)
	seed = (((seed >> 2) % m) ~ seed) % m  -- 2340E159 -> AE43643F
	print(seed .. " vs " .. 0xAE43643F)
	seed = (((seed << 7) % m) ~ seed) % m  -- 21B21F80 -> 8FF17BBF
	print(seed .. " vs " .. 0x8FF17BBF)
	seed = (((seed >> 25) % m) ~ seed) % m  -- 00000047 -> 8FF17BF8
	print(seed .. " vs " .. 0x8FF17BF8)
	local id = ((seed * 0x5ac056b1) % 189) + 1
	-- mul esi = CF9C0678 in eax and 33070B70 in edx, eax is ignored
	-- seed = seed - edx
	-- seed = seed >> 1
	-- seed = seed + edx
	-- seed = seed >> 7
	-- seed = seed * 0xBD
	-- seed = seed - eax + 1
	print(id)
	print(Isaac.GetItemConfig():GetTrinket(id).Name)
end

local testspr = Sprite()
testspr:Load("gfx/ui/rgontest_hud_item.anm2", true)
testspr:ReplaceSpritesheet(0, Isaac.GetItemConfig():GetCollectible(1).GfxFileName, true)
testspr:Play("HUD", true)
testspr.Color.A = 0.5
]]
--[[
mod:AddCallback(ModCallbacks.MC_PRE_RENDER_HISTORYHUD_COLLECTIBLE, function(_, item, pos, cropOffset, scale)
	--Isaac.RenderText("C", pos.X, pos.Y, 1, 1, 1, 255)
	if math.floor(Isaac.GetFrameCount() / 100) % 2 == 0 then
		testspr.Scale = Vector(scale, scale)
		testspr:ReplaceSpritesheet(0, Isaac.GetItemConfig():GetCollectible(1).GfxFileName, true)
		testspr.Color.A = 0.5
		testspr:Render(pos)
		return true
	else
		return {CropOffset=Vector(16, 0)}
	end
end)

mod:AddCallback(ModCallbacks.MC_PRE_RENDER_HISTORYHUD_TRINKET, function(_, item, pos, cropOffset, scale)
	--Isaac.RenderText("T", pos.X, pos.Y, 1, 1, 1, 255)
	if math.floor(Isaac.GetFrameCount() / 100) % 2 == 0 then
		testspr.Scale = Vector(scale, scale)
		testspr:ReplaceSpritesheet(0, Isaac.GetItemConfig():GetTrinket(1).GfxFileName, true)
		testspr.Color.A = 0.5
		testspr:Render(pos)
		return true
	else
		return {CropOffset=Vector(32, 0)}
	end
end)
]]
--[[
local itemConfig = Isaac.GetItemConfig()

local function IsNonActiveItem(id)
	local conf = itemConfig:GetCollectible(id)
	return conf ~= nil and conf.Type ~= ItemType.ITEM_ACTIVE
end

local smeltedTrinketsToRender

local function RefreshSmeltedTrinketsToRender()
	smeltedTrinketsToRender = {}

	local history = Isaac.GetPlayer():GetHistory():GetCollectiblesHistory()

	local i = #history
	local n = 0

	while history[i] do
		local historyItem = history[i]
		local t = historyItem:GetTime()
		local isTrinket = historyItem:IsTrinket()
		local id = historyItem:GetItemID()
		if (isTrinket or IsNonActiveItem(id)) and id == 1 then
			table.insert(smeltedTrinketsToRender, {
				Index = n,
			})
			n = n+1
		end
		i = i-1
	end
end

local function RenderOldMethod()
	if not Game():GetHUD():IsVisible() then return end

	local hudStyle = Options.ExtraHUDStyle

	if hudStyle <= 0 then  -- Off
		return
	end

	local columns, scale

	if Options.ExtraHUDStyle == 2 then  -- Mini
		columns = 4
		scale = 0.5
	else  -- Normal
		columns = 2
		scale = 1
	end

	if not smeltedTrinketsToRender then
		RefreshSmeltedTrinketsToRender()
	end
	if not smeltedTrinketsToRender[1] then return end

	local screenWidth = Isaac.GetScreenWidth()
	local screenHeight = Isaac.GetScreenHeight()
	local minimapHeight = Minimap.GetDisplayedSize().Y
	local hudOffset = 1-Options.HUDOffset
	local historyHudPos = Vector(screenWidth - 87 + hudOffset*24, hudOffset*-14 + minimapHeight + 32)
	local rows = math.ceil(((hudOffset * 14 + (screenHeight - 64)) - historyHudPos.Y) / (32 * scale))
	local numItems = columns*rows

	for _, render in ipairs(smeltedTrinketsToRender) do
		local n = render.Index
		if n < numItems then
			local offset = Vector((n%columns)*32, math.floor(n/columns)*32)*scale
			local pos = historyHudPos + offset
			--Isaac.RenderText("T", pos.X, pos.Y, 1, 1, 1, 255)
		end
	end
end

local testfunc = function(_, item, pos, cropOffset, scale)
	--Isaac.RenderText("T", pos.X, pos.Y, 1, 1, 1, 255)
end

local function Benchmark(name, func, n)
	local t1 = os.clock()
	for i=1,n do func() end
	local t2 = os.clock()
	print(name .. ": " .. string.format("%.3fs", t2-t1))
end

DO_TEST = false

mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()
	if DO_TEST then
		local hh = Game():GetHUD():GetHistoryHUD()
		Benchmark("Baseline", function()
			hh:Render()
		end, 1000)
		mod:AddCallback(ModCallbacks.MC_RENDER_HISTORYHUD_TEST, RenderOldMethod)
		Benchmark("Old Method (w/Update code)", function()
			RefreshSmeltedTrinketsToRender()
			hh:Render()
			hh:Render()
		end, 500)
		Benchmark("Old Method", function()
			hh:Render()
		end, 1000)
		mod:RemoveCallback(ModCallbacks.MC_RENDER_HISTORYHUD_TEST, RenderOldMethod)
		mod:AddCallback(ModCallbacks.MC_PRE_RENDER_HISTORYHUD_COLLECTIBLE, testfunc, 1)
		Benchmark("New Method", function()
			hh:Render()
		end, 1000)
		mod:RemoveCallback(ModCallbacks.MC_PRE_RENDER_HISTORYHUD_COLLECTIBLE, testfunc)
		DO_TEST = false
	end
end)
]]

local function createElement(elementId, createFunc, ...)
    if ImGui.ElementExists(elementId) then
        ImGui.RemoveElement(elementId)
    end

    createFunc(...)
end

local function createImgui(i)
    -- menu tab and setup
    ImGui.CreateMenu("SpintermissionMenu"..i, "\u{f70c} Spintermission")

    if ImGui.ElementExists("SpinSettings") then
        ImGui.RemoveWindow("SpinSettings")
    end

    if ImGui.ElementExists("SpintermissionMenuItemSettings") then
        ImGui.RemoveElement("SpintermissionMenuItemSettings")
    end
    ImGui.AddElement("SpintermissionMenu"..i, "SpintermissionMenuItemSettings", ImGuiElement.MenuItem, "\u{f70c} Settings")

    ImGui.CreateWindow("SpinSettings", "Spintermission Settings")
    ImGui.LinkWindowToElement("SpinSettings", "SpintermissionMenuItemSettings")


    createElement(
        "SpinHideText",
        ImGui.AddCheckbox ,
        "SpinSettings",
        "SpinHideText",
        "Hide Stage Text",
        function (new)
            SPINTERMISSION_REMOVE_TEXT = not SPINTERMISSION_REMOVE_TEXT
            saveManager:GetSaveData().HidingText = SPINTERMISSION_REMOVE_TEXT
            saveManager:StoreSaveData()
        end,
        SPINTERMISSION_REMOVE_TEXT
    )

    createElement(
        "SpinHideTextHelper",
        ImGui.SetHelpmarker,
        "SpinHideText", "Hide the name of the stage during stage transition, useful for using other languages where the characters aren't supposed by the font."
    )
end

function TESTIMGUIE()
    for i=0,10000 do
        createImgui(i)
    end

    for i=10000,0,-1 do
        ImGui.RemoveMenu("SpintermissionMenu"..i)
    end
end
