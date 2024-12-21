local test = REPENTOGON_TEST

local ItemConfigCardTest = {}

function ItemConfigCardTest:BeforeEach()
	return Isaac.GetItemConfig():GetCard(Card.CARD_FOOL)
end

function ItemConfigCardTest:AfterEach(itemconfigcard)
	
end

----------

function ItemConfigCardTest:TestIsAvailable(itemconfigcard)
	itemconfigcard:IsAvailable()
end

function ItemConfigCardTest:TestIsCard(itemconfigcard)
	itemconfigcard:IsCard()
end

function ItemConfigCardTest:TestIsRune(itemconfigcard)
	itemconfigcard:IsRune()
end

function ItemConfigCardTest:TestSetAvailabilityCondition(itemconfigcard)
	local availabilitycondition = function() end
	itemconfigcard:SetAvailabilityCondition(availabilitycondition)
end

function ItemConfigCardTest:TestClearAvailabilityCondition(itemconfigcard)
	itemconfigcard:ClearAvailabilityCondition()
end

function ItemConfigCardTest:TestGetAvailabilityCondition(itemconfigcard)
	itemconfigcard:GetAvailabilityCondition()
end

function ItemConfigCardTest:TestVarAchievementID(itemconfigcard)
	local originalVal = itemconfigcard.AchievementID
	for _, val in pairs(test.TestInts) do
		itemconfigcard.AchievementID = val
		test.AssertEquals(itemconfigcard.AchievementID, val)
	end
	itemconfigcard.AchievementID = originalVal
end

function ItemConfigCardTest:TestVarAnnouncerDelay(itemconfigcard)
	local originalVal = itemconfigcard.AnnouncerDelay
	for _, val in pairs(test.TestInts) do
		itemconfigcard.AnnouncerDelay = val
		test.AssertEquals(itemconfigcard.AnnouncerDelay, val)
	end
	itemconfigcard.AnnouncerDelay = originalVal
end

function ItemConfigCardTest:TestVarAnnouncerVoice(itemconfigcard)
	local originalVal = itemconfigcard.AnnouncerVoice
	for _, val in pairs(test.TestInts) do
		itemconfigcard.AnnouncerVoice = val
		test.AssertEquals(itemconfigcard.AnnouncerVoice, val)
	end
	itemconfigcard.AnnouncerVoice = originalVal
end

function ItemConfigCardTest:TestVarCardType(itemconfigcard)
	local originalVal = itemconfigcard.CardType
	for _, val in pairs(test.TestInts) do
		itemconfigcard.CardType = val
		test.AssertEquals(itemconfigcard.CardType, val)
	end
	itemconfigcard.CardType = originalVal
end

function ItemConfigCardTest:TestVarDescription(itemconfigcard)
	local originalVal = itemconfigcard.Description
	for _, val in pairs(test.TestStrings) do
		itemconfigcard.Description = val
		test.AssertEquals(itemconfigcard.Description, val)
	end
	itemconfigcard.Description = originalVal
end

function ItemConfigCardTest:TestVarGreedModeAllowed(itemconfigcard)
	local originalVal = itemconfigcard.GreedModeAllowed
	itemconfigcard.GreedModeAllowed = true
	itemconfigcard.GreedModeAllowed = originalVal
end

function ItemConfigCardTest:TestVarHudAnim(itemconfigcard)
	local originalVal = itemconfigcard.HudAnim
	for _, val in pairs(test.TestStrings) do
		itemconfigcard.HudAnim = val
		test.AssertEquals(itemconfigcard.HudAnim, val)
	end
	itemconfigcard.HudAnim = originalVal
end

function ItemConfigCardTest:TestVarID(itemconfigcard)
	local originalVal = itemconfigcard.ID
	for _, val in pairs(test.TestInts) do
		itemconfigcard.ID = val
		test.AssertEquals(itemconfigcard.ID, val)
	end
	itemconfigcard.ID = originalVal
end

function ItemConfigCardTest:TestVarMimicCharge(itemconfigcard)
	local originalVal = itemconfigcard.MimicCharge
	for _, val in pairs(test.TestInts) do
		itemconfigcard.MimicCharge = val
		test.AssertEquals(itemconfigcard.MimicCharge, val)
	end
	itemconfigcard.MimicCharge = originalVal
end

function ItemConfigCardTest:TestVarName(itemconfigcard)
	local originalVal = itemconfigcard.Name
	for _, val in pairs(test.TestStrings) do
		itemconfigcard.Name = val
		test.AssertEquals(itemconfigcard.Name, val)
	end
	itemconfigcard.Name = originalVal
end

function ItemConfigCardTest:TestVarPickupSubtype(itemconfigcard)
	local originalVal = itemconfigcard.PickupSubtype
	for _, val in pairs(test.TestUnsignedInts) do
		itemconfigcard.PickupSubtype = val
		test.AssertEquals(itemconfigcard.PickupSubtype, val)
	end
	itemconfigcard.PickupSubtype = originalVal
end

function ItemConfigCardTest:TestVarHidden(itemconfigcard)
	local hidden = itemconfigcard.Hidden
end

function ItemConfigCardTest:TestVarInitialWeight(itemconfigcard)
	local initialweight = itemconfigcard.InitialWeight
end

function ItemConfigCardTest:TestVarModdedCardFront(itemconfigcard)
	local moddedcardfront = itemconfigcard.ModdedCardFront
end

function ItemConfigCardTest:TestVarWeight(itemconfigcard)
	local originalVal = itemconfigcard.Weight
	for _, val in pairs(test.TestNonNegativeFloats) do
		itemconfigcard.Weight = val
		test.AssertEquals(itemconfigcard.Weight, val)
	end
	itemconfigcard.Weight = originalVal
end


return ItemConfigCardTest
