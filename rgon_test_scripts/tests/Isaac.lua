local test = REPENTOGON_TEST

local IsaacTest = {}

function IsaacTest:BeforeEach()
	
end

function IsaacTest:AfterEach()
	
end

----------
--[[
function IsaacTest:TestAddCallback()
	local modref = {}
	local callbackid = 1
	local callbackfn = {}
	local entityid = 1
	Isaac.AddCallback(modref, callbackid, callbackfn, entityid)
end
]]
function IsaacTest:TestAddPillEffectToPool()
	local pilleffect = 1
	Isaac.AddPillEffectToPool(pilleffect)
end
--[[
function IsaacTest:TestAddPriorityCallback()
	local modref = {}
	local callbackid = 1
	local priority = 1
	local callbackfn = {}
	local entityid = 1
	Isaac.AddPriorityCallback(modref, callbackid, priority, callbackfn, entityid)
end
]]
function IsaacTest:TestConsoleOutput()
	local text = "This is a test!\n"
	Isaac.ConsoleOutput(text)
end

function IsaacTest:TestCountBosses()
	Isaac.CountBosses()
end

function IsaacTest:TestCountEnemies()
	Isaac.CountEnemies()
end

function IsaacTest:TestCountEntities()
	local spawner = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local entitytype = 1
	local variant = 1
	local subtype = 1
	Isaac.CountEntities(spawner, entitytype, variant, subtype)
	spawner:Remove()
end

function IsaacTest:TestDebugString()
	local str = "This is a test!"
	Isaac.DebugString(str)
end

function IsaacTest:TestExecuteCommand()
	local command = "This is a test!"
	Isaac.ExecuteCommand(command)
end

function IsaacTest:TestExplode()
	local pos = Vector(1,1)
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	local damage = 1
	Isaac.Explode(pos, source, damage)
	source:Remove()
end

function IsaacTest:TestFindByType()
	local entitytype = 1
	local variant = 1
	local subtype = 1
	local cache = true
	local ignorefriendly = true
	Isaac.FindByType(entitytype, variant, subtype, cache, ignorefriendly)
end

function IsaacTest:TestFindInRadius()
	local position = Vector(1,1)
	local radius = 1
	local partitions = 1
	Isaac.FindInRadius(position, radius, partitions)
end

function IsaacTest:TestGetBuiltInCallbackState()
	local callbackid = 1
	Isaac.GetBuiltInCallbackState(callbackid)
end
--[[
function IsaacTest:TestGetCallbacks()
	local callbackid = 1
	local createifmissing = true
	Isaac.GetCallbacks(callbackid, createifmissing)
end
]]
function IsaacTest:TestGetCardIdByName()
	local cardhudname = "hello"
	Isaac.GetCardIdByName(cardhudname)
end

function IsaacTest:TestGetChallenge()
	Isaac.GetChallenge()
end

function IsaacTest:TestGetChallengeIdByName()
	local challengename = "hello"
	Isaac.GetChallengeIdByName(challengename)
end

function IsaacTest:TestGetCostumeIdByPath()
	local path = "hello"
	Isaac.GetCostumeIdByPath(path)
end

function IsaacTest:TestGetCurseIdByName()
	local cursename = "hello"
	Isaac.GetCurseIdByName(cursename)
end

function IsaacTest:TestGetEntityTypeByName()
	local entityname = "hello"
	Isaac.GetEntityTypeByName(entityname)
end

function IsaacTest:TestGetEntityVariantByName()
	local entityname = "hello"
	Isaac.GetEntityVariantByName(entityname)
end

function IsaacTest:TestGetFrameCount()
	Isaac.GetFrameCount()
end

function IsaacTest:TestGetFreeNearPosition()
	local pos = Vector(1,1)
	local step = 1
	Isaac.GetFreeNearPosition(pos, step)
end

function IsaacTest:TestGetItemConfig()
	Isaac.GetItemConfig()
end

function IsaacTest:TestGetItemIdByName()
	local itemname = "hello"
	Isaac.GetItemIdByName(itemname)
end

function IsaacTest:TestGetMusicIdByName()
	local musicname = "hello"
	Isaac.GetMusicIdByName(musicname)
end

function IsaacTest:TestGetPillEffectByName()
	local pilleffect = "hello"
	Isaac.GetPillEffectByName(pilleffect)
end

function IsaacTest:TestGetPlayer()
	local playerid = 1
	Isaac.GetPlayer(playerid)
end

function IsaacTest:TestGetPlayerTypeByName()
	local playername = "hello"
	local tainted = true
	Isaac.GetPlayerTypeByName(playername, tainted)
end

function IsaacTest:TestGetRandomPosition()
	Isaac.GetRandomPosition()
end

function IsaacTest:TestGetRoomEntities()
	Isaac.GetRoomEntities()
end

function IsaacTest:TestGetScreenHeight()
	Isaac.GetScreenHeight()
end

function IsaacTest:TestGetScreenPointScale()
	Isaac.GetScreenPointScale()
end

function IsaacTest:TestGetScreenWidth()
	Isaac.GetScreenWidth()
end

function IsaacTest:TestGetSoundIdByName()
	local soundname = "hello"
	Isaac.GetSoundIdByName(soundname)
end

function IsaacTest:TestGetTextWidth()
	local str = "hello"
	Isaac.GetTextWidth(str)
end

function IsaacTest:TestGetTime()
	Isaac.GetTime()
end

function IsaacTest:TestGetTrinketIdByName()
	local trinketname = "hello"
	Isaac.GetTrinketIdByName(trinketname)
end
--[[
function IsaacTest:TestGridSpawn()
	local gridentitytype = 1
	local variant = 1
	local position = Vector(1,1)
	local forced = true
	Isaac.GridSpawn(gridentitytype, variant, position, forced)
end
]]--[[
function IsaacTest:TestHasModData()
	local modref = {}
	Isaac.HasModData(modref)
end
]]--[[
function IsaacTest:TestLoadModData()
	local modref = {}
	Isaac.LoadModData(modref)
end
]]
function IsaacTest:TestRegisterMod()
	local modref = {}
	local modname = "hello"
	local apiversion = 1
	Isaac.RegisterMod(modref, modname, apiversion)
end
--[[
function IsaacTest:TestRemoveCallback()
	local modref = {}
	local callbackid = 1
	local callbackfn = {}
	Isaac.RemoveCallback(modref, callbackid, callbackfn)
end
]]--[[
function IsaacTest:TestRemoveModData()
	local modref = {}
	Isaac.RemoveModData(modref)
end
]]
function IsaacTest:TestRenderScaledText()
	local str = "hello"
	local x = 1
	local y = 1
	local scalex = 1
	local scaley = 1
	local r = 1
	local g = 1
	local b = 1
	local a = 1
	Isaac.RenderScaledText(str, x, y, scalex, scaley, r, g, b, a)
end

function IsaacTest:TestRenderText()
	local str = "hello"
	local x = 1
	local y = 1
	local r = 1
	local g = 1
	local b = 1
	local a = 1
	Isaac.RenderText(str, x, y, r, g, b, a)
end
--[[
function IsaacTest:TestRunCallback()
	local callbackid = 1
	Isaac.RunCallback(callbackid)
end
]]--[[
function IsaacTest:TestRunCallbackWithParam()
	local callbackid = 1
	Isaac.RunCallbackWithParam(callbackid)
end
]]--[[
function IsaacTest:TestSaveModData()
	local modref = {}
	local data = "hello"
	Isaac.SaveModData(modref, data)
end
]]
function IsaacTest:TestScreenToWorld()
	local pos = Vector(1,1)
	Isaac.ScreenToWorld(pos)
end

function IsaacTest:TestScreenToWorldDistance()
	local pos = Vector(1,1)
	Isaac.ScreenToWorldDistance(pos)
end
--[[
function IsaacTest:TestSetBuiltInCallbackState()
	local callbackid = 1
	local state = true
	Isaac.SetBuiltInCallbackState(callbackid, state)
end
]]--[[
function IsaacTest:TestSpawn()
	local entitytype = 1
	local entityvariant = 1
	local entitysubtype = 1
	local position = Vector(1,1)
	local velocity = Vector(1,1)
	local spawner = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	Isaac.Spawn(entitytype, entityvariant, entitysubtype, position, velocity, spawner)
	spawner:Remove()
end
]]
function IsaacTest:TestWorldToRenderPosition()
	local pos = Vector(1,1)
	Isaac.WorldToRenderPosition(pos)
end

function IsaacTest:TestWorldToScreen()
	local pos = Vector(1,1)
	Isaac.WorldToScreen(pos)
end

function IsaacTest:TestWorldToScreenDistance()
	local pos = Vector(1,1)
	Isaac.WorldToScreenDistance(pos)
end

function IsaacTest:TestAllMarksFilled()
	local character = 1
	Isaac.AllMarksFilled(character)
end

function IsaacTest:TestAllTaintedCompletion()
	local character = 1
	local group = 1
	Isaac.AllTaintedCompletion(character, group)
end

function IsaacTest:TestCanStartTrueCoop()
	Isaac.CanStartTrueCoop()
end

function IsaacTest:TestCenterCursor()
	Isaac.CenterCursor()
end

--[[function IsaacTest:TestClearBossHazards()
	local ignorenpcs = true
	Isaac.ClearBossHazards(ignorenpcs)
end]]
--[[
function IsaacTest:TestClearChallenge()
	local challengeid = 1
	Isaac.ClearChallenge(challengeid)
end
]]--[[
function IsaacTest:TestClearCompletionMarks()
	local character = 1
	Isaac.ClearCompletionMarks(character)
end
]]
function IsaacTest:TestCreateTimer()
	local func = function() end
	local interval = 1
	local times = 1
	local persistent = true
	Isaac.CreateTimer(func, interval, times, persistent)
end

function IsaacTest:TestCreateWeapon()
	local weapontype = 1
	local owner = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	Isaac.CreateWeapon(weapontype, owner)
	owner:Remove()
end
--[[
function IsaacTest:TestDestroyWeapon()
	local weapon = Isaac.GetPlayer():GetWeapon(1)
	Isaac.DestroyWeapon(weapon)
end
]]
function IsaacTest:TestDrawLine()
	local startpos = Vector(1,1)
	local endpos = Vector(1,1)
	local startcolor = KColor(1,1,1,1)
	local endcolor = KColor(1,1,1,1)
	local thickness = 1
	Isaac.DrawLine(startpos, endpos, startcolor, endcolor, thickness)
end

function IsaacTest:TestDrawQuad()
	local topleftpos = Vector(1,1)
	local toprightpos = Vector(1,1)
	local bottomleftpos = Vector(1,1)
	local bottomrightpos = Vector(1,1)
	local color = KColor(1,1,1,1)
	local thickness = 1
	Isaac.DrawQuad(topleftpos, toprightpos, bottomleftpos, bottomrightpos, color, thickness)
end
--[[
function IsaacTest:TestFillCompletionMarks()
	local character = 1
	Isaac.FillCompletionMarks(character)
end
]]
function IsaacTest:TestFindInCapsule()
	local capsule = Isaac.GetPlayer():GetCollisionCapsule(Vector.Zero)
	local partitions = 1
	Isaac.FindInCapsule(capsule, partitions)
end

function IsaacTest:TestFindTargetPit()
	local position = Vector(1,1)
	local targetposition = Vector(1,1)
	local pitindex = 1
	Isaac.FindTargetPit(position, targetposition, pitindex)
end

function IsaacTest:TestGetAchievementIdByName()
	local name = "hello"
	Isaac.GetAchievementIdByName(name)
end

function IsaacTest:TestGetAxisAlignedUnitVectorFromDir()
	local direction = 1
	Isaac.GetAxisAlignedUnitVectorFromDir(direction)
end

function IsaacTest:TestGetBackdropIdByName()
	local backdropname = "hello"
	Isaac.GetBackdropIdByName(backdropname)
end

function IsaacTest:TestGetBossColorIdxByName()
	local name = "hello"
	Isaac.GetBossColorIdxByName(name)
end

function IsaacTest:TestGetClipboard()
	Isaac.GetClipboard()
end

function IsaacTest:TestGetCollectibleSpawnPosition()
	local position = Vector(1,1)
	Isaac.GetCollectibleSpawnPosition(position)
end

function IsaacTest:TestGetCompletionMark()
	local character = 1
	local mark = 1
	Isaac.GetCompletionMark(character, mark)
end

function IsaacTest:TestGetCompletionMarks()
	local character = 1
	Isaac.GetCompletionMarks(character)
end

function IsaacTest:TestGetCurrentStageConfigId()
	Isaac.GetCurrentStageConfigId()
end

function IsaacTest:TestGetCursorSprite()
	Isaac.GetCursorSprite()
end

function IsaacTest:TestGetCutsceneIdByName()
	local name = "hello"
	Isaac.GetCutsceneIdByName(name)
end

function IsaacTest:TestGetEntitySubTypeByName()
	local name = "hello"
	Isaac.GetEntitySubTypeByName(name)
end

function IsaacTest:TestGetGiantBookIdByName()
	local name = "hello"
	Isaac.GetGiantBookIdByName(name)
end

function IsaacTest:TestGetLoadedModules()
	Isaac.GetLoadedModules()
end

function IsaacTest:TestGetLocalizedString()
	local category = "hello"
	local key = "hello"
	local languagecode = "hello"
	Isaac.GetLocalizedString(category, key, languagecode)
end

function IsaacTest:TestGetModChallengeClearCount()
	local challengeid = 1
	Isaac.GetModChallengeClearCount(challengeid)
end

function IsaacTest:TestGetNullItemIdByName()
	local nullitemname = "hello"
	Isaac.GetNullItemIdByName(nullitemname)
end

function IsaacTest:TestGetPersistentGameData()
	Isaac.GetPersistentGameData()
end

function IsaacTest:TestGetPoolIdByName()
	local poolname = "hello"
	Isaac.GetPoolIdByName(poolname)
end

function IsaacTest:TestGetRenderPosition()
	local position = Vector(1,1)
	local scale = true
	Isaac.GetRenderPosition(position, scale)
end

function IsaacTest:TestGetString()
	local category = "hello"
	local key = "hello"
	Isaac.GetString(category, key)
end

function IsaacTest:TestIsChallengeDone()
	local challengeid = 1
	Isaac.IsChallengeDone(challengeid)
end

function IsaacTest:TestIsInGame()
	Isaac.IsInGame()
end

function IsaacTest:TestLevelGeneratorEntry()
	Isaac.LevelGeneratorEntry()
end
--[[
function IsaacTest:TestMarkChallengeAsNotDone()
	local challengeid = 1
	Isaac.MarkChallengeAsNotDone(challengeid)
end
]]--[[
function IsaacTest:TestPlayCutscene()
	local id = 1
	local cleargamestate = true
	Isaac.PlayCutscene(id, cleargamestate)
end
]]
function IsaacTest:TestSetClipboard()
	local clipboarddata = "hello"
	Isaac.SetClipboard(clipboarddata)
end
--[[
function IsaacTest:TestSetCompletionMark()
	local character = 1
	local mark = 1
	local value = 1
	Isaac.SetCompletionMark(character, mark, value)
end
]]--[[
function IsaacTest:TestSetCompletionMarks()
	local marks = {}
	Isaac.SetCompletionMarks(marks)
end
]]
function IsaacTest:TestSetCurrentFloorBackdrop()
	local backdropid = 1
	Isaac.SetCurrentFloorBackdrop(backdropid)
end

function IsaacTest:TestSetCurrentFloorMusic()
	local musicid = 1
	Isaac.SetCurrentFloorMusic(musicid)
end

function IsaacTest:TestSetCurrentFloorName()
	local name = "hello"
	Isaac.SetCurrentFloorName(name)
end

function IsaacTest:TestSetDwmWindowAttribute()
	local originalVal = Isaac.GetDwmWindowAttribute()
	
	Isaac.SetDwmWindowAttribute(DwmWindowAttribute.DWMWA_NCRENDERING_ENABLED)
	test.AssertEquals(Isaac.GetDwmWindowAttribute(), DwmWindowAttribute.DWMWA_NCRENDERING_ENABLED)
	
	Isaac.SetDwmWindowAttribute(DwmWindowAttribute.DWMWA_TRANSITIONS_FORCEDISABLED)
	test.AssertEquals(Isaac.GetDwmWindowAttribute(), DwmWindowAttribute.DWMWA_TRANSITIONS_FORCEDISABLED)
	
	Isaac.SetDwmWindowAttribute(originalVal)
end

function IsaacTest:TestSetIcon()
	Isaac.SetIcon(0, false)
	Isaac.SetIcon(1, false)
	Isaac.SetIcon("gfx/waaaawaa.ico", true)
	Isaac.SetIcon("gfx/waaaawaa.ico", false)
end

function IsaacTest:TestSetWindowTitle()
	local originalVal = Isaac.GetWindowTitle()
	for _, val in pairs(test.TestStrings) do
		Isaac.SetWindowTitle(val)
		test.AssertEquals(Isaac.GetWindowTitle(), val)
	end
	Isaac.SetWindowTitle(originalVal)
end
--[[
function IsaacTest:TestShowErrorDialog()
	local title = "hello"
	local text = "hello"
	local icon = 1
	local buttons = 1
	Isaac.ShowErrorDialog(title, text, icon, buttons)
end
]]--[[
function IsaacTest:TestStartNewGame()
	local character = 1
	local challenge = 1
	local mode = 1
	local seed = 1
	Isaac.StartNewGame(character, challenge, mode, seed)
end
]]
function IsaacTest:TestTriggerWindowResize()
	Isaac.TriggerWindowResize()
end
--[[
function IsaacTest:TestWorldToMenuPosition()
	local menuid = MainMenu
	local position = Vector(1,1)
	Isaac.WorldToMenuPosition(menuid, position)
end
]]

return IsaacTest
