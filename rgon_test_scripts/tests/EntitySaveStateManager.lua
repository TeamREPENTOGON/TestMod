local test = REPENTOGON_TEST

local Module = {}

function Module:BeforeEach()
end

function Module:AfterEach()
end

----------

local function remove_all(entities)
	for i = 1, #entities, 1 do
		entities[i]:Remove()
	end
end

---@param player EntityPlayer
---@param contents EntitiesSaveStateVector
local function test_open_moving_box(player, contents)
	-- remove all pickups to guarantee test works
	local pickups = Isaac.FindByType(EntityType.ENTITY_PICKUP)
	remove_all(pickups)

	local game = Game()
	local room = game:GetRoom()

	local randomIntegers = {}

	for i = 1, 4, 1 do
		local seed = Random()
		seed = seed ~= 0 and seed or 1
		local position = room:FindFreePickupSpawnPosition(Vector(320, 280))

		local pickup = game:Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, position, Vector.Zero, nil, 0, seed)
		local data = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, pickup)

		local randomInt = Random()
		data.MyData = randomInt
		table.insert(randomIntegers, randomInt)
	end

	player:UseActiveItem(CollectibleType.COLLECTIBLE_MOVING_BOX)

	-- all of them should have been transferred
	for i = 1, 4, 1 do
		local saveState = contents:Get(i - 1)
		local data = EntitySaveStateManager.GetEntitySaveStateData(REPENTOGON_TEST, saveState)
		assert(data.MyData == randomIntegers[i], "Failed to transfer data from pickup to save state.")
	end
end

---@param player EntityPlayer
---@param contents EntitiesSaveStateVector
local function test_closed_moving_box(player, contents)
	-- remove all pickups to guarantee test works
	local pickups = Isaac.FindByType(EntityType.ENTITY_PICKUP)
	remove_all(pickups)

	local randomIntegers = {}

	for i = 1, 4, 1 do
		local saveState = contents:Get(i - 1)
		local data = EntitySaveStateManager.GetEntitySaveStateData(REPENTOGON_TEST, saveState)

		local randomInt = Random()
		data.MyData = randomInt
		table.insert(randomIntegers, randomInt)
	end

	player:UseActiveItem(CollectibleType.COLLECTIBLE_MOVING_BOX)

	pickups = Isaac.FindByType(EntityType.ENTITY_PICKUP)
	local current = 4
	for i = #pickups, 1, -1 do
		local data = EntitySaveStateManager.TryGetEntityData(REPENTOGON_TEST, pickups[i])
		if data and data.MyData then
			assert(data.MyData == randomIntegers[current], "Failed to transfer data from save state to pickup.")
			current = current - 1
			if current == 0 then
				break
			end
		end
	end

	assert(current == 0, "Failed to transfer data from save state to pickup.")
end

function Module:TestMovingBox()
	local player = Isaac.GetPlayer(0)
	local movingBoxContents = player:GetMovingBoxContents()
	local count = #movingBoxContents

	if count == 0 then
		test_open_moving_box(player, movingBoxContents)
		test_closed_moving_box(player, movingBoxContents)
	else
		test_closed_moving_box(player, movingBoxContents)
		test_open_moving_box(player, movingBoxContents)
	end
end

function Module:TestCollectibleFlip()
	local player = Isaac.GetPlayer(0)
	local game = Game()
	local room = game:GetRoom()

	local seed = Random()
	seed = seed ~= 0 and seed or 1
	local position = room:FindFreePickupSpawnPosition(Vector(320, 280))
	local pickup = game:Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, position, Vector.Zero, nil, 0, seed):ToPickup()

	pickup:InitFlipState(CollectibleType.COLLECTIBLE_SPOON_BENDER, true)
	local data = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, pickup)

	local randomNumber = Random()
	data.MyData = randomNumber

	player:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP, UseFlag.USE_OWNED)
	local flipData, flipExists = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, pickup)
	assert(not flipExists, "Data exists for new flip collectible")
	flipData.MyData = -randomNumber

	player:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP, UseFlag.USE_OWNED)
	data = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, pickup)
	assert(data, "Data does not exist for original collectible.")
	assert(data.MyData == randomNumber, "Data was not properly transferred on first collectible flip.")

	player:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP, UseFlag.USE_OWNED)
	flipData = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, pickup)
	assert(flipData.MyData == -randomNumber, "Data was not properly transferred on second collectible flip.")
end

function Module:TestTaintedLazarus()
	assert(false, "This test currently crashes the game due to a bug, cannot continue.")
	local taintedLaz = PlayerManager.FirstPlayerByType(PlayerType.PLAYER_LAZARUS_B)
	if not taintedLaz then
		-- assert(false, "Unable to get Tainted Lazarus. Test cannot continue.") -- game crashes on restart.
		Isaac.ExecuteCommand("addplayer 29")
		taintedLaz = PlayerManager.FirstPlayerByType(PlayerType.PLAYER_LAZARUS_B)
		assert(taintedLaz, "Unable to get Tainted Lazarus. Test cannot continue.")
	end

	assert(not taintedLaz:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT), "Tainted Laz has birthright. Test cannot continue.")

	-- setup moving box
	local movingBoxContents = taintedLaz:GetMovingBoxContents()
	movingBoxContents:Clear()

	test_open_moving_box(taintedLaz, movingBoxContents)
	local contentCount = #movingBoxContents
	local movingBoxData = {}

	for i = 1, contentCount, 1 do
		local saveState = movingBoxContents:Get(i - 1)
		local data = EntitySaveStateManager.GetEntitySaveStateData(REPENTOGON_TEST, saveState)
		table.insert(movingBoxData, data.MyData)
	end

	-- Setup Familiars
	taintedLaz:AddCollectible(CollectibleType.COLLECTIBLE_BROTHER_BOBBY)
	taintedLaz:AddCollectible(CollectibleType.COLLECTIBLE_BROTHER_BOBBY)

	local familiars = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BROTHER_BOBBY)
	local familiarData = {}

	for i = 1, #familiars, 1 do
		local familiar = familiars[i]
		if familiar.Parent and GetPtrHash(familiar.Parent) == GetPtrHash(taintedLaz) then
			local data = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, familiar)
			local randomNumber = Random()
			data.MyData = randomNumber
			table.insert(familiarData, randomNumber)
		end
	end

	-- Force Flip
	local deadTaintedLaz = taintedLaz:GetFlippedForm()
	assert(deadTaintedLaz, "Flipped form is nil. Test cannot continue.")
	taintedLaz:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP, UseFlag.USE_OWNED)
	assert(not taintedLaz:Exists(), "Tainted lazarus still exists post flip. Test cannot continue.")
	deadTaintedLaz:UseActiveItem(CollectibleType.COLLECTIBLE_FLIP, UseFlag.USE_OWNED)
	assert(taintedLaz:Exists(), "Tainted lazarus does not exist post 2nd flip. Test cannot continue.")

	-- Assert Moving Box
	assert(contentCount == #movingBoxContents, "Moving box contents is not the same post flip")
	contentCount = #movingBoxContents
	for i = 1, contentCount, 1 do
		local saveState = movingBoxContents:Get(i - 1)
		local data = EntitySaveStateManager.GetEntitySaveStateData(REPENTOGON_TEST, saveState)
		assert(movingBoxData[i] == data.MyData, "Moving box content was not properly transferred post flip.")
	end

	assert(#movingBoxData == contentCount, "Moving box content was not properly transferred post flip.")

	-- Assert Familiars
	familiars = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BROTHER_BOBBY)
	local currentFamiliar = 1

	for i = 1, #familiars, 1 do
		local familiar = familiars[i]
		if familiar.Parent and GetPtrHash(familiar.Parent) == GetPtrHash(taintedLaz) then
			local data = EntitySaveStateManager.GetEntityData(REPENTOGON_TEST, familiar)
			assert(familiarData[currentFamiliar] == data.MyData, "Familiar Data was not properly transferred post flip.")
			currentFamiliar = currentFamiliar + 1
		end
	end

	assert(currentFamiliar == #familiarData - 1, "Familiars were not properly transferred post flip.")
end

return Module