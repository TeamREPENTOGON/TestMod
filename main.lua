REPENTOGON_TEST = RegisterMod("REPENTOGON Tests", 1)

REPENTOGON_TEST.Root = "rgon_test_scripts/"
REPENTOGON_TEST.TestsRoot = REPENTOGON_TEST.Root .. "tests/"

local BIG_FLOAT = 9999999  -- Precision issues start if you add another 9 here
local LONG_STRING = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"  -- Mostly just wanted something with >16 characters

-- Tables of test values for different types, for testing bounds or limits of a field or checking to see if large numbers lead to weird results.
-- Not required for use in tests, but can be useful for our purposes since we don't always know for sure what internal code will do with a number
-- passed from lua, especially if a signed integer gets converted to signed or vice versa.
REPENTOGON_TEST.TestInts = { 0, 1, -1, 2147483647, -2147483647 }
REPENTOGON_TEST.TestNonNegativeInts = { 0, 1, 2147483647 }
REPENTOGON_TEST.TestUnsignedInts = { 0, 1, 2147483647, 4294967295 }
REPENTOGON_TEST.TestInt8s = { 0, 1, -1, 127, -127 }
REPENTOGON_TEST.TestUInt8s = { 0, 1, 255 }
REPENTOGON_TEST.TestInt16s = { 0, 1, -1, 32767, -32767 }
REPENTOGON_TEST.TestUInt16s = { 0, 1, 65535 }
REPENTOGON_TEST.TestFloats = { 0.5, -0.5, 0, 1, -BIG_FLOAT, BIG_FLOAT }
REPENTOGON_TEST.TestNonNegativeFloats = { 0, 0.5, 1, BIG_FLOAT }
REPENTOGON_TEST.TestPositiveFloats = { 0.5, 1, BIG_FLOAT }
REPENTOGON_TEST.TestStrings = { "hello", "", LONG_STRING }
REPENTOGON_TEST.TestNonEmptyStrings = { "hello", LONG_STRING }
REPENTOGON_TEST.TestVectors = { Vector(0,0), Vector(1,1), Vector(BIG_FLOAT, BIG_FLOAT), Vector(-BIG_FLOAT, -BIG_FLOAT), Vector(0.5, -0.5) }
REPENTOGON_TEST.TestColors = {
	Color(1,1,1,1,1,1,1,1,1,1),
	Color(BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT, BIG_FLOAT),
	Color(-BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT, -BIG_FLOAT),
	Color(0.5,0.5,0.5,0.5,0.5,0.5,0.5),
	Color(0,0,0,0),
	Color(1,1,1,1),
}

REPENTOGON_TEST.TEST_PLAYER = Isaac.GetPlayerTypeByName("Testsaac")
REPENTOGON_TEST.TEST_FAMILIAR = Isaac.GetEntityVariantByName("Brother Bobentogon")

include(REPENTOGON_TEST.Root .. "misc")

local function Round(n, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	local x = (n*mult) % 1 >= 0.5 and math.ceil(n*mult) or math.floor(n*mult)
	return x / mult
end

-- Triggers a lua error if a ~= b. The error will log the line where AssertEquals was called from.
-- For userdata, supports Color and Vector.
function REPENTOGON_TEST.AssertEquals(a, b)
	if type(a) ~= type(b) then
		error("Expected " .. type(b) .. ", got " .. type(a), 2)
	end
	if type(b) == "number" then
		if math.floor(a) ~= a then
			a = Round(a, 4)
		end
		if math.floor(b) ~= b then
			b = Round(b, 4)
		end
	end
	if type(b) == "userdata" then
		local atype = getmetatable(a).__name
		local btype = getmetatable(b).__name
		if atype ~= btype then
			error("Expected " .. btype .. ", got " .. atype, 2)
		end
		-- TODO: Maybe make this less lazy, lol.
		if tostring(a) ~= tostring(b) then
			error("Expected " .. tostring(b) .. ", got " .. tostring(a), 2)
		end
	elseif a ~= b then
		error("Expected " .. tostring(b) .. ", got " .. tostring(a), 2)
	end
end

-- Triggers a lua error if the provided value is anything other than a TRUE boolean.
function REPENTOGON_TEST.AssertTrue(val)
	if type(val) ~= "boolean" or not val then
		error("Expected true, got " .. tostring(val), 2)
	end
end

-- Triggers a lua error if the provided value is anything other than a FALSE boolean.
function REPENTOGON_TEST.AssertFalse(val)
	if type(val) ~= "boolean" or val then
		error("Expected false, got " .. tostring(val), 2)
	end
end

-- Triggers a lua error if the provided value is non-nil.
function REPENTOGON_TEST.AssertNil(val)
	if val ~= nil then
		error("Expected nil, got " .. tostring(val), 2)
	end
end
REPENTOGON_TEST.AssertNull = REPENTOGON_TEST.AssertNil  -- lol

-- Callbacks added during tests.
local testCallbacks = {}

function REPENTOGON_TEST:ClearTestCallbacks()
	for callbackid, tab in pairs(testCallbacks) do
		for _, func in ipairs(tab) do
			REPENTOGON_TEST:RemoveCallback(callbackid, func)
		end
	end

	testCallbacks = {}
end

REPENTOGON_TEST.OriginalAddPriorityCallback = REPENTOGON_TEST.AddPriorityCallback

function REPENTOGON_TEST:AddPriorityCallback(callbackid, priority, func, param)
	if REPENTOGON_TEST.RunningTest then
		if not testCallbacks[callbackid] then
			testCallbacks[callbackid] = {}
		end
		table.insert(testCallbacks[callbackid], func)
	end
	return REPENTOGON_TEST:OriginalAddPriorityCallback(callbackid, priority, func, param)
end

function REPENTOGON_TEST:AddCallback(callbackid, func, param)
	return REPENTOGON_TEST:AddPriorityCallback(callbackid, CallbackPriority.DEFAULT, func, param)
end

-- Track one-time callbacks that were added so we can find ones that did not run.
local oneTimeCallbacks = {}

-- Stores tracked callbacks that should never fire to be removed.
local unexpectedCallbacks = {}
local unexpectedCallbacksFired = 0

function REPENTOGON_TEST:ClearOneTimeCallbacks()
	local found = 0

	for callbackid, tab in pairs(oneTimeCallbacks) do
		for _, func in ipairs(tab) do
			found = found + 1
			REPENTOGON_TEST:RemoveCallback(callbackid, func)
		end
	end

	oneTimeCallbacks = {}

	return found
end

-- Add a callback that removes itself when it runs.
function REPENTOGON_TEST:AddOneTimePriorityCallback(callbackid, priority, func, param)
	local wrapper
	wrapper = function(...)
		REPENTOGON_TEST:RemoveCallback(callbackid, wrapper)
		local tab = oneTimeCallbacks[callbackid] or {}
		for i, v in ipairs(tab) do
			if v == wrapper then
				table.remove(tab, i)
			end
		end
		return func(...)
	end
	if not oneTimeCallbacks[callbackid] then
		oneTimeCallbacks[callbackid] = {}
	end
	table.insert(oneTimeCallbacks[callbackid], wrapper)
	REPENTOGON_TEST:AddPriorityCallback(callbackid, priority, wrapper, param)
end

function REPENTOGON_TEST:AddUnexpectedPriorityCallback(callbackid, priority)
	local wrapper
	wrapper = function(...)
		REPENTOGON_TEST:RemoveCallback(callbackid, wrapper)
		unexpectedCallbacksFired = unexpectedCallbacksFired + 1
	end

	table.insert(unexpectedCallbacks, {callbackid, wrapper})
	REPENTOGON_TEST:AddPriorityCallback(callbackid, priority, wrapper)
end

function REPENTOGON_TEST:AddOneTimeCallback(callbackid, func, param)
	REPENTOGON_TEST:AddOneTimePriorityCallback(callbackid, CallbackPriority.DEFAULT, func, param)
end

function REPENTOGON_TEST:AddUnexpectedCallback(callbackid)
	REPENTOGON_TEST:AddUnexpectedPriorityCallback(callbackid, CallbackPriority.DEFAULT)
end

function REPENTOGON_TEST.GetTestSprite()
	local sprite = Sprite("gfx/001.000_player.anm2", true)
	sprite:Play("WalkDown", true)
	sprite:PlayOverlay("HeadDown", true)
	return sprite
end

function REPENTOGON_TEST.GetDoor()
	local room = Game():GetRoom()
	for i=0,3 do
		if room:GetDoor(i) then
			return room:GetDoor(i)
		end
	end
end

function REPENTOGON_TEST.SpawnGridEntity(gridType, gridVar)
	local grid = nil
	local idx = 0
	while idx <= Game():GetRoom():GetGridSize() do
		if not Game():GetRoom():GetGridEntity(idx) then
			Game():GetRoom():SpawnGridEntity(idx, gridType or GridEntityType.GRID_ROCK, gridVar or 0, 1234, 0)
			if Game():GetRoom():GetGridEntity(idx) then
				return Game():GetRoom():GetGridEntity(idx)
			end
		end
		idx = idx + 1
	end
end

function REPENTOGON_TEST.RemoveGridEntity(gridentity)
	local idx = gridentity:GetGridIndex()
	Game():GetRoom():RemoveGridEntity(idx, 0, false)
	Game():GetRoom():Update()
end

-- A new run is started between each test FILE to ensure a clean state.
-- We need to wait for MC_POST_GAME_STARTED to run again for things to be initialized properly,
-- so doing this between each TEST would be too slow, but between each FILE is a good comprimise.
-- Greed Mode is used to minimize the time wasted on level generation.
local function ResetRun()
	Isaac.StartNewGame(PlayerType.PLAYER_ISAAC, Challenge.CHALLENGE_NULL, Difficulty.DIFFICULTY_GREED, 4)
end

local function Log(str, toConsole)
	if toConsole then
		print(str)
	end
	Isaac.DebugString(str)
end

local function LogFailure(className, funcName, errStr)
	errStr = "Test " .. className.."."..funcName .. " FAILED:\n\t" .. errStr
	Console.PrintError(errStr)
	Isaac.DebugString("ERROR: " .. errStr)
end

local TESTS_RAN = 0
local TEST_FAILURES = 0
local TEST_QUEUE = {}

local function LogTestsFinished()
	Log("All tests complete! Ran " .. TESTS_RAN .. " tests with " .. TEST_FAILURES .. " failures.", true)
	TESTS_RAN = 0
	TEST_FAILURES = 0
end

-- Returns a table of unit test files.
-- Only returns InGame tests while in-game, and only InMenu tests while in the main menu.
function REPENTOGON_TEST:GetUnitTests(menu)
	local alltests = REPENTOGON_TEST.Tests
	if menu == false or Isaac.IsInGame() then
		return alltests.InGame
	end
	return alltests.InMenu
end

-- Run tests only on MC_POST_GAME_STARTED to ensure things are initialized. We trigger a new run when we need to move to the next test file.
function REPENTOGON_TEST:UpdateTests()
	local currentClass = TEST_QUEUE[#TEST_QUEUE]

	if not currentClass then return end

	if not currentClass.Started then
		Log("Running tests for " .. currentClass.Name .. "...")
		currentClass.Started = true
	end

	while #currentClass.UpdateTests > 0 do
		local test = table.remove(currentClass.UpdateTests)
		test()
	end
end
REPENTOGON_TEST:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, REPENTOGON_TEST.UpdateTests)

-- Tests for functions that start with "Render" are only run on render callbacks to avoid weird issues.
function REPENTOGON_TEST:RenderTests()
	local currentClass = TEST_QUEUE[#TEST_QUEUE]

	if not currentClass then return end

	if #currentClass.UpdateTests > 0 or not currentClass.Started then
		return
	end

	Log("Running render tests for " .. currentClass.Name .. "...")

	while #currentClass.RenderTests > 0 do
		local test = table.remove(currentClass.RenderTests)
		test()
	end

	Log("Finished all tests for " .. currentClass.Name .. "! Starting a new run...")

	-- Reset the game between test classes
	table.remove(TEST_QUEUE)
	
	if #TEST_QUEUE == 0 then
		LogTestsFinished()
	end

	ResetRun()
end
REPENTOGON_TEST:AddCallback(ModCallbacks.MC_POST_RENDER, REPENTOGON_TEST.RenderTests)

local function RunTestsForClass(className, classTests, functionToTest)
	local testsToRun = {
		Name = className,
		--Class = classTests,
		UpdateTests = {},
		RenderTests = {},
	}

	-- Sort tests by name for the sake of determinism.
	local sortedTests = {}
	for funcName, func in pairs(classTests) do
		if funcName:match("^Test") and (not functionToTest or funcName:match(functionToTest .. "$"))
				and not (className == "FontRenderSettings" and not REPENTANCE_PLUS) then
			table.insert(sortedTests, {Name = funcName, Func = func})
		end
	end
	table.sort(sortedTests, function(a, b)
		return a.Name < b.Name
	end)

	local beforeFunc = classTests.BeforeEach or function() end
	local afterFunc = classTests.AfterEach or function() end
	for _, test in ipairs(sortedTests) do
		local funcName = test.Name
		local func = test.Func

		local runtest = function()
			Log("Running test: " .. className ..".".. funcName .. "...")
			TESTS_RAN = TESTS_RAN + 1
			REPENTOGON_TEST.RunningTest = true
			local success, ret = pcall(function()
				local input = beforeFunc(classTests)
				func(classTests, input)
				afterFunc(classTests, input)
			end)
			REPENTOGON_TEST.RunningTest = false
			REPENTOGON_TEST:ClearTestCallbacks()
			local unrunCallbacks = REPENTOGON_TEST:ClearOneTimeCallbacks()
			if unrunCallbacks > 0 then
				local err = "- Found " .. unrunCallbacks .. " one-time callbacks that did not run!"
				if success then
					success = false
					ret = err
				else
					ret = ret .. "\n\t" .. err
				end
			end

			if unexpectedCallbacksFired > 0 then
				local err = "- Found " .. unexpectedCallbacksFired .. " unexpected callbacks that ran!"
				if success then
					success = false
					ret = err
				else
					ret = ret .. "\n\t" .. err
				end
			end

			for _, v in pairs(unexpectedCallbacks) do
				REPENTOGON_TEST:RemoveCallback(v[1], v[2])
			end

			unexpectedCallbacks = {}
			unexpectedCallbacksFired = 0
			
			if not success then
				LogFailure(className, funcName, ret)
				TEST_FAILURES = TEST_FAILURES + 1
			else
				Log("...finished!")
			end
			return
		end

		-- Menu tests can be run immediately. Others are queued up to execute during callbacks.
		if not Isaac.IsInGame() then
			runtest()
		elseif funcName:match("^TestRender") then
			table.insert(testsToRun.RenderTests, runtest)
		else
			table.insert(testsToRun.UpdateTests, runtest)
		end
	end

	if Isaac.IsInGame() then
		table.insert(TEST_QUEUE, testsToRun)
	end
end

function REPENTOGON_TEST:RunTests(classToTest, functionToTest)
	local tests = REPENTOGON_TEST:GetUnitTests()

	TESTS_RAN = 0
	TEST_FAILURES = 0

	Log("Running tests...", true)

	if classToTest then
		RunTestsForClass(classToTest, tests[classToTest], functionToTest)
	else
		for className, classTests in pairs(tests) do
			RunTestsForClass(className, classTests)
		end
	end

	if Isaac.IsInGame() then
		table.sort(TEST_QUEUE, function(a, b)
			return a.Name < b.Name
		end)
		ResetRun()
	else
		LogTestsFinished()
	end
end

REPENTOGON_TEST.Tests = include(REPENTOGON_TEST.Root .. "get_all_tests")
