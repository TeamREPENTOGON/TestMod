local test = REPENTOGON_TEST

local GridEntityDoorTest = include(REPENTOGON_TEST.TestsRoot .. "GridEntity")

function GridEntityDoorTest:BeforeEach()
	return test.GetDoor()
end

function GridEntityDoorTest:AfterEach(gridentitydoor)
	
end

----------

function GridEntityDoorTest:TestBar(gridentitydoor)
	gridentitydoor:Bar()
end

function GridEntityDoorTest:TestCanBlowOpen(gridentitydoor)
	gridentitydoor:CanBlowOpen()
end

function GridEntityDoorTest:TestClose(gridentitydoor)
	local force = true
	gridentitydoor:Close(force)
end

function GridEntityDoorTest:TestGetSpriteOffset(gridentitydoor)
	gridentitydoor:GetSpriteOffset()
end

function GridEntityDoorTest:TestIsBusted(gridentitydoor)
	gridentitydoor:IsBusted()
end

function GridEntityDoorTest:TestIsKeyFamiliarTarget(gridentitydoor)
	gridentitydoor:IsKeyFamiliarTarget()
end

function GridEntityDoorTest:TestIsLocked(gridentitydoor)
	gridentitydoor:IsLocked()
end

function GridEntityDoorTest:TestIsOpen(gridentitydoor)
	gridentitydoor:IsOpen()
end

function GridEntityDoorTest:TestIsRoomType(gridentitydoor)
	local roomtype = 1
	gridentitydoor:IsRoomType(roomtype)
end

function GridEntityDoorTest:TestIsTargetRoomArcade(gridentitydoor)
	gridentitydoor:IsTargetRoomArcade()
end

function GridEntityDoorTest:TestOpen(gridentitydoor)
	gridentitydoor:Open()
end

function GridEntityDoorTest:TestSetLocked(gridentitydoor)
	local locked = true
	gridentitydoor:SetLocked(locked)
end

function GridEntityDoorTest:TestSetRoomTypes(gridentitydoor)
	local currentroomtype = 1
	local targetroomtype = 1
	gridentitydoor:SetRoomTypes(currentroomtype, targetroomtype)
end

function GridEntityDoorTest:TestSpawnDust(gridentitydoor)
	gridentitydoor:SpawnDust()
end

function GridEntityDoorTest:TestTryBlowOpen(gridentitydoor)
	local fromexplosion = true
	local source = Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, Game():GetRoom():GetCenterPos(), Vector.Zero, nil)
	gridentitydoor:TryBlowOpen(fromexplosion, source)
	source:Remove()
end

function GridEntityDoorTest:TestTryUnlock(gridentitydoor)
	local player = Isaac.GetPlayer()
	local force = true
	gridentitydoor:TryUnlock(player, force)
end

function GridEntityDoorTest:TestGetExtraSprite(gridentitydoor)
	gridentitydoor:GetExtraSprite()
end

function GridEntityDoorTest:TestPlayAnimation(gridentitydoor)
	gridentitydoor:PlayAnimation()
end

function GridEntityDoorTest:TestVarBusted(gridentitydoor)
	local originalVal = gridentitydoor.Busted
	gridentitydoor.Busted = true
	gridentitydoor.Busted = originalVal
end

function GridEntityDoorTest:TestVarCloseAnimation(gridentitydoor)
	local originalVal = gridentitydoor.CloseAnimation
	for _, val in pairs(test.TestStrings) do
		gridentitydoor.CloseAnimation = val
		test.AssertEquals(gridentitydoor.CloseAnimation, val)
	end
	gridentitydoor.CloseAnimation = originalVal
end

function GridEntityDoorTest:TestVarCurrentRoomType(gridentitydoor)
	local originalVal = gridentitydoor.CurrentRoomType
	for _, val in pairs(test.TestInts) do
		gridentitydoor.CurrentRoomType = val
		test.AssertEquals(gridentitydoor.CurrentRoomType, val)
	end
	gridentitydoor.CurrentRoomType = originalVal
end

function GridEntityDoorTest:TestVarDirection(gridentitydoor)
	local originalVal = gridentitydoor.Direction
	for _, val in pairs(test.TestInts) do
		gridentitydoor.Direction = val
		test.AssertEquals(gridentitydoor.Direction, val)
	end
	gridentitydoor.Direction = originalVal
end

function GridEntityDoorTest:TestVarExtraSprite(gridentitydoor)
	local originalVal = gridentitydoor.ExtraSprite
	gridentitydoor.ExtraSprite = test.GetTestSprite()
	gridentitydoor.ExtraSprite = originalVal
end

function GridEntityDoorTest:TestVarExtraVisible(gridentitydoor)
	local originalVal = gridentitydoor.ExtraVisible
	gridentitydoor.ExtraVisible = true
	gridentitydoor.ExtraVisible = originalVal
end

function GridEntityDoorTest:TestVarLockedAnimation(gridentitydoor)
	local originalVal = gridentitydoor.LockedAnimation
	for _, val in pairs(test.TestStrings) do
		gridentitydoor.LockedAnimation = val
		test.AssertEquals(gridentitydoor.LockedAnimation, val)
	end
	gridentitydoor.LockedAnimation = originalVal
end

function GridEntityDoorTest:TestVarOpenAnimation(gridentitydoor)
	local originalVal = gridentitydoor.OpenAnimation
	for _, val in pairs(test.TestStrings) do
		gridentitydoor.OpenAnimation = val
		test.AssertEquals(gridentitydoor.OpenAnimation, val)
	end
	gridentitydoor.OpenAnimation = originalVal
end

function GridEntityDoorTest:TestVarOpenLockedAnimation(gridentitydoor)
	local originalVal = gridentitydoor.OpenLockedAnimation
	for _, val in pairs(test.TestStrings) do
		gridentitydoor.OpenLockedAnimation = val
		test.AssertEquals(gridentitydoor.OpenLockedAnimation, val)
	end
	gridentitydoor.OpenLockedAnimation = originalVal
end

function GridEntityDoorTest:TestVarPreviousState(gridentitydoor)
	local originalVal = gridentitydoor.PreviousState
	for _, val in pairs(test.TestUnsignedInts) do
		gridentitydoor.PreviousState = val
		test.AssertEquals(gridentitydoor.PreviousState, val)
	end
	gridentitydoor.PreviousState = originalVal
end

function GridEntityDoorTest:TestVarPreviousVariant(gridentitydoor)
	local originalVal = gridentitydoor.PreviousVariant
	for _, val in pairs(test.TestUnsignedInts) do
		gridentitydoor.PreviousVariant = val
		test.AssertEquals(gridentitydoor.PreviousVariant, val)
	end
	gridentitydoor.PreviousVariant = originalVal
end

function GridEntityDoorTest:TestVarSlot(gridentitydoor)
	local originalVal = gridentitydoor.Slot
	for _, val in pairs(test.TestInts) do
		gridentitydoor.Slot = val
		test.AssertEquals(gridentitydoor.Slot, val)
	end
	gridentitydoor.Slot = originalVal
end

function GridEntityDoorTest:TestVarTargetRoomIndex(gridentitydoor)
	local originalVal = gridentitydoor.TargetRoomIndex
	for _, val in pairs(test.TestInts) do
		gridentitydoor.TargetRoomIndex = val
		test.AssertEquals(gridentitydoor.TargetRoomIndex, val)
	end
	gridentitydoor.TargetRoomIndex = originalVal
end

function GridEntityDoorTest:TestVarTargetRoomType(gridentitydoor)
	local originalVal = gridentitydoor.TargetRoomType
	for _, val in pairs(test.TestInts) do
		gridentitydoor.TargetRoomType = val
		test.AssertEquals(gridentitydoor.TargetRoomType, val)
	end
	gridentitydoor.TargetRoomType = originalVal
end


return GridEntityDoorTest
