# REPENTOGON Test Mod
A test mod for The Binding of Isaac: Repentance used to create and execute tests for features of REPENTON as well as the base modding API, to help catch unintended behaviour or regressions.

Intended for REPENTOGON development use only. Having this be a mod instead of being part of REPENTOGON itself allows for dummy values to be added to XMLs and stuff to aid in testing.

> [!CAUTION]
> Since the purpose of these tests is to call as many API functions as possible, it is possible for a unit test to modify your save data somehow. In the initial batch of these tests, all functions/classes that could potentially modify save data were disabled, but this is still something to keep in mind both when writing and running these tests.

The majority of the tests initially populated in this repo are barebones tests automatically generated using a Python script. Most of these do nothing other than call a function to make sure it doesn't crash or error under basic circumstances. However, over time it should be encouraged to flesh out more of these tests as we go. For example, consider fleshing out or writing new tests while debugging/investigating an issue, and **especially** when implementing new REPENTOGON features!

## Writing Tests

Individual test files (located in `rgon_test_scripts/tests/`) return a table of test functions, as well as potentially some functions:

- BeforeEach: Runs before each test. The value returned by this function is passed to the test function itself, so this is a good place to initialize whatever is being tested.
- AfterEach: Runs after each test, typically to clean up whatever was created before the test.

The "actual" test functions must all have names that start with `Test` (this is to differentiate them easily from the above functions, and any others like it that could be supported in the future).

> [!NOTE]
> If your test function name starts with `TestRender`, the test will be executed on `MC_POST_RENDER`. This is important since running render functions outside of the render cycle can cause weird issues.

Here is an example of the structure of a single test file:

```lua
local test = REPENTOGON_TEST

local EntityTest = {}

function EntityTest:BeforeEach()
	return Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
end

function EntityTest:AfterEach(entity)
	entity:Remove()
end


function EntityTest:TestSize(entity)
	entity.Size = 10
	test.AssertEquals(entity.Size, 10)
	
	entity.Size = 100
	test.AssertEquals(entity.Size, 100)
end


return EntityTest
```

> [!NOTE]
> The testing infrastructure is set up to start a new run between each test **file** to minimize the risk of unexpected conflicts, so cleanup in `AfterEach` is mostly just for the sake of keeping things clean between tests in the same file.

New test files must be hooked into `rgon_test_scripts/get_all_tests.lua` in order to be run. 

## Test Utilities

- `REPENTOGON_TEST.AssertEquals(a, b)`: Triggers a lua error if a ~= b. Good for stopping a test and logging the test failure as well as the line where the Assert was called. 
- `REPENTOGON_TEST.AssertTrue/AssertFalse/AssertNil(val)`: Triggers a lua error if the provided value is not the intended value (true/false boolean or nil).
- `REPENTOGON_TEST:Add(Priority)Callback`: Callbacks added within tests are automatically removed after the test, regardless of if the test succeeds or fails.
- `REPENTOGON_TEST:AddOneTime(Priority)Callback`: Nifty drop-in replacement for Add(Priority)Callback where the callback automatically removes itself after executing once. If any of these callbacks have not run by the end of the test, the test fails.
- `REPENTOGON_TEST.TestInts`: A table of sample integers for testing purposes, including the int32 max/min values. Iterating over this table while testing something like a Setter+Getter isn't strictly necessary but can be useful for testing certain bounds, or finding out that extra large or negative values lead to unexpected results. There are various similar tables defined in the `main.lua`, such as `TestUnsignedInts`, `TestUInt16s`, `TestFloats`, `TestVectors`, etc.
- `REPENTOGON_TEST.GetTestSprite()`: Initializes an instance of a Sprite with the player anm2 loaded.

## Test Writing Tips

- Remember: Callbacks that you add during a test are automatically removed after the test completes! You don't need to remove them to clean up!
- Use `AddOneTimeCallback` to automatically fail a test if that callback never gets triggered!
- One of the primary purposes of these tests is to catch breakages or other issues that may come up from updates to REPENTOGON or the basegame. The more comprehensive coverage we get, the better! If anything changes or stops working under the hood, the test should fail!
- For value getters, try to be mindful of the possibility of a bug where a value being obtained is reading from the wrong place, or otherwise being broken. Validate you get the expected value by default and under different circumstances!
- When testing a getter for an object (such as a Sprite) you should also verify that some distinct attribute of that object is the expected value, such as testing `sprite:GetFilename()`. You need to make sure you obtained a valid reference to your expected object! This can help catch crashes following game updates.

## Running Tests

Tests can be executed in-game via the console using the REPENTOGON_TEST global.

Run all tests (main menu tests on the main menu, ingame tests ingame):
```
lua REPENTOGON_TEST:RunTests()
```

Run tests for a specific class:
```
lua REPENTOGON_TEST:RunTests("EntityPlayer")
```

Run one specific test (including the "Test" prefix of the actual function name isn't necessary):
```
lua REPENTOGON_TEST:RunTests("EntityPlayer", "GetHearts")
```
